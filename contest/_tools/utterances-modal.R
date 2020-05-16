utterances_modal <- function(id, repo, site, title, page_name) {
  tags <- htmltools::tags
  bsplus::bs_modal(
    id = id, footer = NULL,
    title = sprintf('Vote for "%s"', title),
    body =  htmltools::tagList(
      tags$p(
        "Like this contribution to see it presented and awarded at the e-Rum2020",
        tags$a(href = "about.html", "CovidR contest"),
        "pre-conference event"
      ),
      tags$script(
        src = "https://utteranc.es/client.js",
        repo = repo,
        `issue-term` = sprintf("%s/%s", site, page_name),
        label = ":+1:",
        theme = "github-light",
        crossorigin = "anonymous",
        async = NA
      ),
    )
  )
}
