# Create utterances issues for the gallery pages based on their `meta`data.
# Issues are created for gallery pages of the given `site` URL, and feature an
# optional initial `comment` with a `reaction`
create_utterances_issues <- function(meta, owner, repo,
                                     site = sprintf("https://%s.github.io/%s", owner, repo),
                                     comment = NULL, reaction = NULL) {
  # utils ----
  gh <- function(subpath, ..., method = "GET") {
    gh::gh(
      sprintf("/repos/:owner/:repo/%s", subpath),
      owner = owner,
      repo = repo,
      .method = method, ...
    )
  }
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
    gh("issues"), FUN.VALUE = "",
    `[[`, "title"
  )

  missing_meta <- meta[!issue_title(names(meta)) %in% existing_titles]

  created <- sapply(
    names(missing_meta), create_utterances_issue,
    simplify = FALSE
  )

  invisible(created)
}
