{{

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
    htmltools::tags$script(src = "assets/main.js"),
    htmltools::div(
      class = "row",
      htmltools::h3(title, style = htmltools::css(display = "inline")),
      htmltools::tags$em("by", author),
      htmltools::tags$sup(
        "[", htmltools::a("repository", href = repository, target = "_blank", .noWS = "outside"), "]"
      )
    ),
    bsplus::bs_modal(
      id = "badge-modal", title = paste("Include the badge for ", page_name),
      body = htmltools::tagList(
        htmltools::p(htmltools::HTML(badge_html)),
        htmltools::p("Markdown"),
        htmltools::pre(htmltools::code(badge_md, .noWS = "outside"), .noWS = "outside"),
        htmltools::p("HTML"),
        htmltools::pre(htmltools::code(badge_html, .noWS = "outside"), .noWS = "outside")
      )
    ),
    htmltools::div(
      class = "row badges",
      htmltools::tag(
        "button", list(
          class = "btn btn-badge",
          htmltools::span(class = "fa fa-thumbs-up"), "Like this contribution!"
        )
      ) %>% bsplus::bs_attach_collapse(., "utterances"),
      htmltools::a(
        href = "#",
        htmltools::img(alt = badge_alt, src = badge_shield, .noWS = "outside")
      ) %>% bsplus::bs_attach_modal(., "badge-modal")
    ),
    htmltools::div(
      class = "collapse", id = "utterances",
      htmltools::HTML('
              !!!CHANGE BEFORE MERGING TO MASTER!!!
              <script src="https://utteranc.es/client.js"
                repo="riccardoporreca/test-utterances"
                issue-term="pathname"
                label=":+1:"
                theme="github-light"
                crossorigin="anonymous" async>
              </script>'),
    ),
    htmltools::hr()
  )

}}
