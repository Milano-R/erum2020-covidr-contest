{{

  utterances_repo <- "Milano-R/erum2020-covidr-contest"
  tags <- htmltools::tags
  `%>%` <- bsplus::`%>%`

  # dynamic badge via shield.io enpoint https://runkit.com/erum2020-covidr/shield
  # https://img.shields.io/endpoint?url=https://runkit.io/erum2020-covidr/shield/branches/master/<page>
  # => slow and often unresponsive
  # dynamic badge via badgen.net enpoint https://runkit.com/erum2020-covidr/badge
  # https://badgen.net/https/runkit.io/erum2020-covidr/badge/branches/master/<page>?cache=300
  # => we need to reduce the cache to 300s (the minimum), as it defaults to 24h
  badge_url <- sprintf(
    "https://badgen.net/https/runkit.io/erum2020-covidr/badge/branches/master/%s?cache=300",
    page_name
  )
  badge_alt <- "eRum2020::CovidR"
  badge_modal <- function(id, url) {
    page_url <- sprintf(
      "https://milano-r.github.io/erum2020-covidr-contest/%s.html",
      page_name
    )
    badge_md <- sprintf("[![%s](%s)](%s)", badge_alt, url, page_url)
    badge_html <- gsub(
      "</?p>", "", # the code is wrapped inside <p></p> by markdownToHTML
      markdown::markdownToHTML(text = badge_md, fragment.only = TRUE)
    )
    bsplus::bs_modal(
      id = id, footer = NULL,
      title = paste("Include the badge for ", page_name),
      body = htmltools::tagList(
        tags$p(htmltools::HTML(badge_html)),
        tags$p("Markdown"),
        tags$pre(tags$code(badge_md, .noWS = "outside"), .noWS = "outside"),
        tags$p("HTML"),
        tags$pre(tags$code(badge_html, .noWS = "outside"), .noWS = "outside")
      )
    )
  }
  badge_button <- function(..., class = character(0)) {
    htmltools::tag(
      "button", list(
        class = c("btn btn-badge", class),
        ...
      )
    )
  }

  htmltools::tagList(
    # style fine-tunining specific to gallery pages
    tags$script(src = "assets/main.js"),
    tags$div(
      class = "row",
      tags$h3(title, style = htmltools::css(display = "inline")),
      "by", tags$em(author),
      tags$sup(
        "[", tags$a("repository", href = repository, target = "_blank", .noWS = "outside"), "]"
      )
    ),
    tags$div(
      class = "row badges",
      badge_button(
        "Abstract"
      ) %>% bsplus::bs_attach_modal(., "abstract"),
      badge_button(
        tags$span(class = "fa fa-thumbs-up"), "Like this contribution!"
      ) %>% bsplus::bs_attach_modal(., "utterances"),
      tags$a(
        href = "#",
        # use eRum2020 color for the label just on the gallery page
        tags$img(alt = badge_alt, src = sprintf("%s&labelColor=2b3990", badge_url), .noWS = "outside")
      ) %>% bsplus::bs_attach_modal(., "badge-modal"),
    ),
    bsplus::bs_modal(
      id = "abstract", footer = NULL,
      title = title,
      body = htmltools::tagList(
        tags$p(tags$em(author)),
        htmltools::HTML(markdown::markdownToHTML(text = abstract, fragment.only = TRUE))
      )
    ),
    bsplus::bs_modal(
      id = "utterances", footer = NULL,
      title = sprintf('Vote for "%s"', title),
      body =  htmltools::tagList(
        tags$p(
          "Like this contribution to see it presented and awarded at the e-Rum2020",
          tags$a(href = "about.html", "CovidR contest"),
          "pre-conference event"
        ),
        tags$script(
          src = "https://utteranc.es/client.js",
          repo = utterances_repo, `issue-term` = "pathname", label = ":+1:",
          theme = "github-light", crossorigin = "anonymous", async = NA
        ),
      )
    ),
    badge_modal(id = "badge-modal", badge_url),
    tags$hr()
  )

}}
