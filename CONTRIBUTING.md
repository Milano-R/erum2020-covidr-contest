# Submit a contribution

Each participant is requested to provide the following information in YAML format, which will allow the contribution to be integrated and be visible in the [CovidR Gallery](https://milano-r.github.io/erum2020-covidr-contest)

``` yaml
# Contribution's title, author, abstract
title: An Awesome COVID-19 Contribution # title case
author: An Author, Another Author # comma-separated
abstract: |
  Provide a short abstract with a brief description of your contribution and its
  main features (max 800 characters, including spaces). The usage of publicly
  available data should be explictly mentioned.
  The text can be broken across multiple lines, each indented with two spaces.

# Short name to be used in the website Gallery menu (can be the same as title)
menu_entry: Short title
# URL of the public source code repository
repository: https://github.com/user/repo
# Type of contribution and how it can be featured as gallery content
# Keep only the type and content relevant to your contribution
# For a Shiny app, provide its URL:
type: shiny
content: https://user.shinyapps.io/my-app # e.g. my-app on shinyapps.io
# For a general online-published resource (e.g. a website / report):
type: webpage
content: https://user.github.io/my-analysis # URL of the webpage
# For more complex / heterogeneous contributions, you can create a GitHub
# Gist (https://gist.github.com/) with the relevant information and pointers:
type: gist
content: <script...> # place here what you get from the "Embed" button
```

If you are not sure about some of the fields, we encourage you to still open a Pull Request or a New Issue as described below, as part of which we will discuss and take care of the remaining details.

### How to submit

You can submit your contribution **until May 22nd** using one of the following methods

1. **Pull Request**
    - [**Fork the repository**](https://github.com/Milano-R/erum2020-covidr-contest/fork) and create a **new `.yml` file** under [`contest/contributions`](https://github.com/Milano-R/erum2020-covidr-contest/tree/master/contest/contributions), containing the information above for your contribution.
        - The example above is available as [`.example.yml`](https://github.com/Milano-R/erum2020-covidr-contest/tree/master/contest/contributions/.example.yml) and can be used as a starting point.
        - The file-name should somehow identify your contribution, we recommend using something like `name-short-title.yml`.
    - Create a **Pull Request**, making sure you "Allow edits from maintainers".
    - Send us an email at [covidrcontest@erum.io](mailto:covidrcontest@erum.io) with the link to the Pull Request.
    - You can also preview the integration of your contribution in the [CovidR Gallery](https://milano-r.github.io/erum2020-covidr-contest) from a local clone of your fork via
      - `remotes::install_deps()`
      - `browseURL(file.path("contest", rmarkdown::render_site("contest")))`

2. **Create an Issue**
    - [**Submit the contribution as new Issue**](https://github.com/Milano-R/erum2020-covidr-contest/issues/new/choose) to provide the required information.
    - We will follow up by creating the relevant `.yml` file and corresponding pull request.
    - Send us an email at [covidrcontest@erum.io](mailto:covidrcontest@erum.io) with the link to the Issue.

Your submission will be officially accepted once the corresponding Pull Request is reviewed, approved, and merged. Your contribution will then appear in the [CovidR Gallery](https://milano-r.github.io/erum2020-covidr-contest).

We have prepared a [video tutorial](https://youtu.be/pqrcxRL7AtU) illustrating the submission process described above.

If you have any problems you can also contact us at: [covidrcontest@erum.io](mailto:covidrcontest@erum.io).
