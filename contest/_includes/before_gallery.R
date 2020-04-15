{{

  # !!!CHANGE BEFORE MERGING TO MASTER!!!
  utterances_repo <- "Milano-R/erum2020-covidr-contest"
  utterances_repo <- "riccardoporreca/test-utterances"
  tags <- htmltools::tags
  `%>%` <- bsplus::`%>%`

  # dymanic badge via shield.io enpoint https://runkit.com/erum2020-covidr/shield
  # Consider https://tinyurl.com/erum2020-covidr-shield => https://runkit.io/erum2020-covidr/shield/branches/master
  badge_shield <- sprintf(
    "https://img.shields.io/endpoint?url=https://runkit.io/erum2020-covidr/shield/branches/master/%s",
    page_name
  )
  # dymanic badge via badgen.net enpoint https://runkit.com/erum2020-covidr/badge
  # Consider https://tinyurl.com/erum2020-covidr-badge => https://runkit.io/erum2020-covidr/madge/branches/master
  badgen <- sprintf(
    "https://badgen.net/https/runkit.io/erum2020-covidr/badge/branches/master/%s?cache=300",
    page_name
  )
  badge_alt <- "eRum2020::CovidR"
  badge_modal <- function(id, badge) {
    page_url <- sprintf(
      "https://milano-r.github.io/erum2020-covidr-contest/%s.html",
      page_name
    )
    badge_md <- sprintf("[![%s](%s)](%s)", badge_alt, badge, page_url)
    badge_html <- gsub(
      "</?p>", "",
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
        tags$img(alt = badge_alt, src = sprintf("%s&labelColor=2b3990", badgen), .noWS = "outside")
      ) %>% bsplus::bs_attach_modal(., "badge-modal"),
      tags$a(
        href = "#",
        tags$img(alt = badge_alt, src = sprintf("%s&labelColor=2b3990", badge_shield), .noWS = "outside")
      ) %>% bsplus::bs_attach_modal(., "shield-modal")
    ),
    bsplus::bs_modal(
      id = "abstract", footer = NULL,
      title = title,
      body = htmltools::tagList(
        tags$p(tags$em(author)),
        tags$p(abstract)
      )
    ),
    bsplus::bs_modal(
      id = "utterances", footer = NULL,
      title = sprintf('Vote for "%s"', title),
      body =  htmltools::tagList(
        "!!!CHANGE BEFORE MERGING TO MASTER: Test",
        tags$script(
          src = "https://utteranc.es/client.js",
          repo = utterances_repo, `issue-term` = "pathname", label = ":+1:",
          theme = "github-light", crossorigin = "anonymous", async = NA
        ),
      )
    ),
    badge_modal(id = "shield-modal", badge_shield),
    badge_modal(id = "badge-modal", badgen),
    tags$hr()
  )

}}
