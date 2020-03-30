# eRum2020 CovidR contest

[eRum2020](https://2020.erum.io/) is launching the “CovidR” contest: any work done with R around the topic of the COVID-19 pandemic is welcome and the best one will be invited to present at eRum2020. Contributions can be submitted **until May 25**. The winner will be announced on **June 15**.

**How to participate to CovidR**

- Provide us with your contribution before May 25th directly on this GitHub repository, following the instructions in the ['Submit'](#submit-a-contribution) section below.
- A GitHub account is needed in order to submit a contribution.

**What will you get** by participating to CovidR

- We will feature all contributions in a dedicated gallery website, which will allow the community to enjoy them and provide feedback.
- We will post contributions on our social media.
- The winner of the contest will be invited to present at [eRum2020](https://2020.erum.io/)

**How to win**

- An internal jury will pick the winner by evaluating:
  - technical quality of the work;
  - popularity of the work among the community - based on thumbs up on our gallery.
- The winner will be announced on June 15th. 

**Participation rules**

- Any work or analysis must be performed starting from official data (governmental, institutional, national or international), providing complete reference to sources.
- Data used can directly refer to the SARS-CoV-2 outbreak (official number of cases, tests performed, viral genome sequences, ...) or to different metrics that can affect the course of the infection if put in the context of the outbreak (demography, population density, census, geographic distributions, movements, ...).
- Work can refer to a single specific country, a group of countries or the whole globe.
- Work or analyses must wholly or at least for a relevant part rely on R-based analytics. 
- Data and source code must be open sourced and available through an open repository.
- Work can be of any kind, from original data analyses, models, to interactive dashboards or infographics. 

If you have general questions you can always contact us at [covidrcontest@erum.io](mailto:covidrcontest@erum.io), otherwise we recommend using the Issue/Pull Request submission mechanism as a channel for discussing how you can submit your contribution.

## Submit a contribution

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

2. **Create an Issue**
  - You can open a [**New issue**](https://github.com/riccardoporreca/test-github-community/issues/new/choose) (**WiP link**) to provide the required information.
  - We will follow up and create the relevant `.yml` file and corresponding pull request.

Your submission will be officially accepted once the corresponding pull request is approved and merged. Your contribution will then appear in the [CovidR Gallery](https://milano-r.github.io/erum2020-covidr-contest).

If you are not sure about some of the fields, we encourage you to open a Pull Request or a New Issue, as part of which we will discuss and take care of the remaining details.

If you have any problems you can also contact us at: [covidrcontest@erum.io](mailto:covidrcontest@erum.io)

--- 

## Code of Conduct

This project and everyone participating in it is governed by [eRum2020 Code of Conduct](https://2020.erum.io/about/code-of-conduct). By participating, you are expected to uphold this code.
