# Construct a GitHub API function for the given owner and repo
gh_wrapper <- function(owner, repo) {
  function(subpath, ..., method = "GET") {
    gh::gh(
      sprintf("/repos/:owner/:repo/%s", subpath),
      owner = owner,
      repo = repo,
      .method = method, ...
    )
  }
}

get_utterances_issues <- function(gh) {
  issues <- gh("issues", state = "all", labels = ":+1:", per_page = 100)
  names(issues) <- basename(vapply(issues, `[[`, "title", FUN.VALUE = ""))
  issues
}

get_issue_votes <- function(issue) {
  vote_comment <- gh::gh(issue$comments_url, .accept = "application/vnd.github.squirrel-girl-preview")[[1L]]
  stopifnot(vote_comment$user$type == "Bot")
  reactions <- gh::gh(
    vote_comment$reactions$url,
    .accept = "application/vnd.github.squirrel-girl-preview",
    per_page = 100
  )
  # +1 reactions from non-bot users (to exclude the +1 from the vote comment
  # creation and potentially other bots)
  vote_reactions <- reactions[
    vapply(reactions, function(x) x$content == "+1" && x$user$type != "Bot", FUN.VALUE = FALSE)
    ]
  vapply(vote_reactions, `[[`, c("user", "login"), FUN.VALUE = "")
}

tidy_votes <- function(votes) {
  do.call(
    "rbind",
    lapply(names(votes), function(x) {
      if (length(votes[[x]]) > 0L) {
        data.frame(page_name = x, vote = votes[[x]])
      }
    })
  )
}

get_utterances_votes <- function(meta, owner, repo) {
  gh <- gh_wrapper(owner, repo)
  utterances_issues <- get_utterances_issues(gh)
  stopifnot(all(names(meta) %in% names(utterances_issues)))
  utterances_issues <- utterances_issues[names(meta)]
  votes <- lapply(utterances_issues, get_issue_votes)
  votes_tidy <- tidy_votes(vote)
  votes_tidy
}
# meta <- rmdgallery::gallery_site_config("contest")$gallery$meta
# votes <- get_utterances_votes(meta, "Milano-R", "erum2020-covidr-contest")
# sort(table(votes$vote))
# sort(table(votes$page_name))


# Create utterances issues for the gallery pages based on their `meta`data.
# Issues are created for gallery pages of the given `site` URL, and feature an
# optional initial `comment` with a `reaction`
create_utterances_issues <- function(meta, owner, repo,
                                     site = sprintf("https://%s.github.io/%s", owner, repo),
                                     comment = NULL, reaction = NULL) {

  # utils ----

  gh <- gh_wrapper(owner, repo)

  issue_title <- function(page_name) {
    sprintf("%s/%s", basename(site), page_name)
  }
  issue_body <- function(page_name) {
    paste0(
      sprintf("# %s", meta[[page_name]]$title), "\n", "\n",
      sprintf("%s/%s.html", site, page_name)
    )
  }
  create_utterances_issue <- function(page_name) {
    message(page_name, ": ", meta[[page_name]]$title)
    # create the issue
    issue <- gh(
      method = "POST",
      "issues",
      title = issue_title(page_name),
      body = issue_body(page_name),
      labels = list(":+1:")
    )
    message("> issue #", issue$number)
    # close the issue so that it does not show up in the list
    # (comments / reactions are still enabled for closed issues)
    issue <- gh(
      method = "PATCH",
      sprintf("issues/%d", issue$number),
      state = "closed"
    )
    message("> issue #", issue$number, " is ", issue$state)
    if (!is.null(comment)) {
      # create an initial standard comment
      comment <-   gh(
        method = "POST",
        sprintf("issues/%d/comments", issue$number),
        body = paste(comment, collapse = "\n")
      )
      message("> comment id: ", comment$id)
      if (!is.null(reaction)) {
        # create an initial comment reaction
        reaction <- gh(
          method = "POST",
          sprintf("issues/comments/%d/reactions", comment$id),
          content = reaction,
          .accept = "application/vnd.github.squirrel-girl-preview+json" # Beta feature!
        )
        message("> reaction id: ", reaction$id)
      }
    }
    invisible(list(
      issue = issue,
      comment = comment,
      reaction = reaction
    ))
  }

  existing_titles <- vapply(
    get_utterances_issues(gh),
    `[[`, "title", FUN.VALUE = ""
  )

  missing_meta <- meta[!issue_title(names(meta)) %in% existing_titles]

  created <- sapply(
    names(missing_meta), create_utterances_issue,
    simplify = FALSE
  )

  invisible(created)
}


# Notify about / cleanup extra comments to voting issues.
cleanup_utterances_comments <- function(owner, repo,
                                        site = sprintf("https://%s.github.io/%s", owner, repo),
                                        dry_run = FALSE) {

  # GitHub API for the given owner and repo
  gh <- gh_wrapper(owner, repo)

  # returns additional comments comments until the first notification comment
  # (notified = TRUE), or after the last one (notified = FALSE)
  get_issue_comments <- function(id, notified) {
    comments <- gh("issues/:issue/comments", issue = id)
    # ignore automatically-generated top comment
    stopifnot(comments[[1L]]$user$type == "Bot")
    comments <- comments[-1L]
    notification_idx <- grep(
      "clean-up additional comments",
      vapply(comments, `[[`, "body", FUN.VALUE = "")
    )
    if (notified) {
      comments <- if (length(notification_idx) > 0L) {
        suppressWarnings(head(comments, min(notification_idx)))
      } else {
        list()
      }
    } else {
      comments <- suppressWarnings(tail(comments, -max(notification_idx)))
    }
    comments
  }

  get_comments_user <- function(comments) {
    vapply(comments, `[[`, c("user", "login"), FUN.VALUE = "")
  }

  users_delete_comment <- function(issue) {
    title <- issue$title
    page_url <- sprintf("%s/%s.html", site, basename(title))
    comments <- get_issue_comments(issue$number, notified = FALSE)
    users <- unique(get_comments_user(comments))
    if (length(users) > 0L) {
      message("> found unnotified comments by users ", toString(users))
      paste0(
        toString(sprintf("@%s", users)), ", ",
        "please make sure you have provided your :+1: as a reaction to the top comment at ", page_url,
        ", which is how we collect votes.\n",
        "We will regularly clean-up additional comments to keep the voting \"system\" clean and as intended.\n\n",
        "Thanks for your engagement in providing community feedback about CovidR contributions!"
      )
    }
  }

  cleanup_issue <- function(issue) {
    message("Processing issue #", issue$number, " (", issue$title, ")")

    # delete notified comments
    notified_comments <- get_issue_comments(issue$number, notified = TRUE)
    if (length(notified_comments) > 0L) {
      users <- unique(get_comments_user(notified_comments))
      message("> found ", length(notified_comments), " notified comments by users ", toString(users))
      lapply(notified_comments, function(comment) {
        message("  > delete comment ", comment$id, " by user ", comment$user$login)
        if (!dry_run) {
          gh(
            method = "DELETE",
            sprintf("issues/comments/%s", comment$id)
          )
        }
      })
    }

    # notification for new comments
    notification_comment <- users_delete_comment(issue)
    if (!is.null(notification_comment)) {
      message("  | ", gsub("\n", "\n  | ", notification_comment))
      if (!dry_run) {
        comment <- gh(
          method = "POST",
          sprintf("issues/%d/comments", issue$number),
          body = notification_comment
        )
        message("> created comment with id: ", comment$id)
      }
    }
    invisible(NULL)

  }

  utterances_issues <- get_utterances_issues(gh)
  lapply(utterances_issues, cleanup_issue)
  invisible(NULL)

}


# Lock voting issues and returns the votes
lock_utterances_issues <- function(owner, repo, dry_run = FALSE) {

  # GitHub API for the given owner and repo
  gh <- gh_wrapper(owner, repo)

  lock_issue <- function(issue) {
    message("Processing issue #", issue$number, " (", issue$title, ")")
    if (!isTRUE(dry_run)) {
      gh(
        method = "PUT", "issues/:issue_number/lock",
        issue_number = issues,
        .accept = "application/vnd.github.sailor-v-preview+json"
      )
    }
    # return the votes
    votes <- get_issue_votes(issue)
    message("> ", length(votes), " vote(s)")
    votes
  }

  utterances_issues <- get_utterances_issues(gh)
  votes <- tidy_votes(lapply(utterances_issues, lock_issue))

  invisible(votes)
}
