
# eRum2020 CovidR Contest

**CovidR** is an [e-Rum2020](https://2020.erum.io/) **pre-conference
event** featuring a contest of R contributions around the topic of the
[COVID-19
pandemic](https://www.who.int/emergencies/diseases/novel-coronavirus-2019).

Contributions can be submitted **until May 22nd**, and the online
e-Rum2020 pre-conference event will be held on **May 29th**. Selected
contributors will be invited to present their work to the community at
the event, where the CovidR contest winner(s) will be announced and will
receive their e-prizes. Finally, the best overall contribution will also
be invited to present at the main e-Rum2020 conference (June 17th-20th).

**How to participate to CovidR**

  - Provide us with your contribution by May 22nd using the GitHub
    repository, following the instructions in the
    [‘Submit’](#submit-a-contribution) section.
  - A GitHub account is needed in order to submit a contribution.

**What you will get** by participating to CovidR

  - All contribution will be featured in the [CovidR
    Gallery](https://milano-r.github.io/erum2020-covidr-contest)
    website, allowing the community to browse through, vote for your
    contribution, and provide feedback.
  - Each participant will get a CovidR badge to include in their
    repository.
  - We will share contributions on our social media.
  - Selected contributions will be invited to present at the eRum2020
    pre-conference event on May 29th.
  - Winner(s) will be awarded with e-prizes.
  - The ultimate contest winner will be invited to present at
    [e-Rum2020](https://2020.erum.io/).

**How to win**

An internal jury will pick the winner(s) by evaluating:

  - technical quality of the work;
  - popularity of the work among the community - based on thumbs up in
    the CovidR Gallery.

The winner(s) will be announced during the pre-conference event on May
29th.

**Participation rules**

  - Any work or analysis must be performed starting from official data
    (governmental, institutional, national or international), providing
    complete reference to sources.
  - Data used can directly refer to the SARS-CoV-2 outbreak (official
    number of cases, tests performed, viral genome sequences, …) or to
    different metrics that can affect the course of the infection if put
    in the context of the outbreak (demography, population density,
    census, geographic distributions, movements, …).
  - Work can refer to a single specific country, a group of countries or
    the whole globe.
  - Work or analyses must wholly or at least for a relevant part rely on
    R-based analytics.
  - Data and source code must be open sourced and available through an
    open repository.
  - Work can be of any kind, from original data analyses, models, to
    interactive dashboards or infographics.

If you have general questions you can always contact us at
<covidrcontest@erum.io>, otherwise we recommend using the [Issue / Pull
Request submission mechanism](#submit-a-contribution) as a channel for
discussing how you can submit your contribution.

## Submit a contribution

Each participant is requested to provide the following information in
YAML format, which will allow the contribution to be integrated and
visible in the [CovidR
Gallery](https://milano-r.github.io/erum2020-covidr-contest)

``` yaml
# Contribution's title, author, abstract
title: An Awesome COVID-19 Contribution
author: The Author
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
# For a Shiny app:
type: shiny
content: URL of your Shiny app, e.g. https://user.shinyapps.io/my-app
# For a general online-published resource (e.g. a website / report):
type: webpage
content: URL of the webpage, e.g. https://user.github.io/my-analysis
# For more complex / heterogeneous contributions, you can create a GitHub
# Gist (https://gist.github.com/) with the relevant information and pointers:
type: gist
content: <script...> # place here what you get from the "Embed" button
```

If you are not sure about some of the fields, we encourage you to still
open a Pull Request or a New Issue as described below, as part of which
we will discuss and take care of the remaining details.

### How to submit

You can submit your contribution **until May 22nd** using one of the
following methods

1.  **Pull Request**
      - [**Fork the
        repository**](https://github.com/Milano-R/erum2020-covidr-contest/fork)
        and create a **new `.yml` file** under
        [`contest/contributions`](https://github.com/Milano-R/erum2020-covidr-contest/tree/master/contest/contributions),
        containing the information above for your contribution.
          - The file-name should somehow identify your contribution, we
            recommend using something like `name-short-title.yml`.
      - Create a **Pull Request**, making sure you “Allow edits from
        maintainers”.
      - Send us an email at <covidrcontest@erum.io> with the link to the
        Pull Request.
      - You can also preview the integration of your contribution in the
        [CovidR
        Gallery](https://milano-r.github.io/erum2020-covidr-contest)
        from a local clone of your fork via
          - `remotes::install_deps()`
          - `browseURL(file.path("contest",
            rmarkdown::render_site("contest")))`
2.  **Create an Issue**
      - [**Submit the contribution as new
        Issue**](https://github.com/riccardoporreca/test-github-community/issues/new/choose)
        **\!\!\!CHANGE BEFORE MERGING TO MASTER\!\!\!** to provide the
        required information.
      - We will follow up by creating the relevant `.yml` file and
        corresponding pull request.
      - Send us an email at <covidrcontest@erum.io> with the link to the
        Issue.

Your submission will be officially accepted once the corresponding Pull
Request is reviewed, approved, and merged. Your contribution will then
appear in the [CovidR
Gallery](https://milano-r.github.io/erum2020-covidr-contest).

If you have any problems you can also contact us at:
<covidrcontest@erum.io>.

-----

## Code of Conduct

This project is governed by [eRum2020 Code of
Conduct](https://2020.erum.io/about/code-of-conduct). By participating,
you are expected to uphold this code.

This code of conduct is adapted from the ESO workshop & conference code
of conduct, which was derived from original Creative Commons documents
by PyCon and Geek Feminism. It is released under a CC-0 license for
reuse.
