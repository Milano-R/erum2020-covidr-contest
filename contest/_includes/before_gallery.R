{{

  # !!!CHANGE BEFORE MERGING TO MASTER!!!
  utterances_repo <- "Milano-R/erum2020-covidr-contest"
  utterances_repo <- "riccardoporreca/test-utterances"
  tags <- htmltools::tags
  `%>%` <- bsplus::`%>%`

  badge_shield <- sprintf(
    "https://img.shields.io/endpoint?url=https://runkit.io/riccardoporreca/erum2020-covidr-shield/branches/master/%s",
    page_name
  )
  badge_alt <- "eRum2020::CovidR"
  page_url <- sprintf(
    "https://tinyurl.com/erum2020-covidr/%s.html",
    page_name
  )
  badge_md <- sprintf("[![%s](%s)](%s)", badge_alt, badge_shield, page_url)
  badge_html <- gsub(
    "</?p>", "",
    markdown::markdownToHTML(text = badge_md, fragment.only = TRUE)
  )
  htmltools::tagList(
    tags$script(src = "assets/main.js"),
    tags$div(
      class = "row",
      tags$h3(title, style = htmltools::css(display = "inline")),
      tags$em("by", author),
      tags$sup(
        "[", tags$a("repository", href = repository, target = "_blank", .noWS = "outside"), "]"
      )
    ),
    bsplus::bs_modal(
      id = "badge-modal", title = paste("Include the badge for ", page_name),
      body = htmltools::tagList(
        tags$p(htmltools::HTML(badge_html)),
        tags$p("Markdown"),
        tags$pre(tags$code(badge_md, .noWS = "outside"), .noWS = "outside"),
        tags$p("HTML"),
        tags$pre(tags$code(badge_html, .noWS = "outside"), .noWS = "outside")
      )
    ),
    tags$div(
      class = "row badges",
      htmltools::tag(
        "button", list(
          class = "btn btn-badge",
          tags$span(class = "fa fa-thumbs-up"), "Like this contribution!"
        )
      ) %>% bsplus::bs_attach_collapse(., "utterances"),
      tags$a(
        href = "#",
        tags$img(alt = badge_alt, src = badge_shield, .noWS = "outside")
      ) %>% bsplus::bs_attach_modal(., "badge-modal")
    ),
    tags$div(
      class = "collapse", id = "utterances",
      tags$script(
        repo = utterances_repo, `issue-term` = "pathname", label = ":+1:",
        theme = "github-light", crossorigin = "anonymous", async = NA
      ),
    ),
    tags$hr()
  )

}}
