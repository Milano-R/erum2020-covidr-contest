vote_modal <- function(id, title, repo, site, page_name) {
  tags <- htmltools::tags
  bsplus::bs_modal(
    id = id, footer = NULL,
    title = tags$div(
      id = "vote-modal-title",
      vote_title(title)
    ),
    body =  htmltools::tagList(
      tags$p(
        "Like this contribution to see it presented and awarded at the e-Rum2020",
        tags$a(href = "about.html", "CovidR contest"),
        "pre-conference event"
      ),
      tags$div(
        id = "vote-modal-utterances",
        if (!is.null(repo)) {
          vote_utterances(repo, site, page_name)
        }
      ),
    )
  )
}

vote_title <- function(title) {
  sprintf('Vote for "%s"', title)
}

vote_utterances <- function(repo, site, page_name) {
  tags <- htmltools::tags
  tags$script(
    src = "https://utteranc.es/client.js",
    repo = repo,
    `issue-term` = sprintf("%s/%s", site, page_name),
    label = ":+1:",
    theme = "github-light",
    crossorigin = "anonymous",
    async = NA
  )
}
