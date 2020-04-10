{{
  htmltools::tagList(
    htmltools::tags$script(src = "assets/main.js"),
    htmltools::div(
      class = "row",
      htmltools::h3(title, style = htmltools::css(display = "inline")),
      htmltools::tags$em("by", author),
      htmltools::tags$sup(
        "[", htmltools::a("repository", href = repository, target = "_blank", .noWS = "outside"), "]"
      ),
      htmltools::span(
        class = "like",
        htmltools::HTML('
              <button class="btn btn-primary" data-toggle="collapse" data-target="#utterances">
                <span class="fa fa-thumbs-up"></span> Like this contribution!
              </button>
              <div class="collapse" id="utterances">
                !!!CHANGE BEFORE MERGING TO MASTER!!!
                <script src="https://utteranc.es/client.js"
                        repo="riccardoporreca/test-utterances"
                        issue-term="pathname" label=":+1:"
                        theme="github-light"
                        crossorigin="anonymous" async>
                </script>
              </div>
            ')
      ),
      htmltools::hr()
    )
  )
}}
