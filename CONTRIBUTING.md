# Submit a contribution

Each participant is requested to provide the following information, which will be consolidated in YAML format under the [`contributions`](contributions) directory, so that the contribution can be integrated in the [CovidR Gallery](https://milano-r.github.io/erum2020-covidr-contest)

``` yaml
# Contribution's title and author.
title: An Awesome COVID-19 Contribution
author: The Autor
# Short name to be used in the website Gallery menu. Can be the same as title.
menu_entry: Short title
# URL of the public source code repository
repository: https://github.com/user/repo
# The type of contribution and how it can be featured as gallery content. Pick one type.
# For a shiny app:
type: shiny
content: URL of the your shiny web app, e.g. https://user.shinyapps.io/my-app
# For a general online-published resource (e.g. a website / report):
type: webpage
content: URL of the webpage, e.g. https://user.github.io/my-analysis
# For more complex / heterogeneous contributions, you can create a GitHub
# Gist (https://gist.github.com/) with the relevant information and pointers
type: gist
content: <script...> # you can place here what you get from the "Embed" button
```

### How to submit

You can submit your contribution with one of the following methods

1. **Pull Request**
    - **Fork** this repository, fill the information above for your contribution in a **new `.yml` file** under the `contributions` directory.
      - The file-name should somehow identify your contribution, we recommend using something like `name-short-title.yml`.
    - You can preview your contribution in the [CovidR Gallery](https://milano-r.github.io/erum2020-covidr-contest) from a local clone of your fork via
      - `remotes::install_deps()`
      - `browseURL(rmarkdown::render_site())`
    - Create a **Pull Request**, making sure you "Allow edits from maintainers".
    - Send us an email at [covidrcontest@erum.io](mailto:covidrcontest@erum.io) with the link to the Pull Request.

2. **Create an Issue**
    - You can open a [**New issue**](https://github.com/riccardoporreca/test-github-community/issues/new/choose) (**WiP link**) to provide the required information.
    - We will follow up and create the relevant `.yml` file and corresponding Pull Request.
    - Send us an email at [covidrcontest@erum.io](mailto:covidrcontest@erum.io) with the link to the Issue.

Your submission will be officially accepted once the corresponding Pull Request is approved and merged. Your contribution will then appear in the [CovidR Gallery](https://milano-r.github.io/erum2020-covidr-contest).

If you are not sure about some of the fields, we encourage you to open a Pull Request or a New Issue, as part of which we will discuss and take care of the remaining details.

If you have any problems you can also contact us at: [covidrcontest@erum.io](mailto:covidrcontest@erum.io)
