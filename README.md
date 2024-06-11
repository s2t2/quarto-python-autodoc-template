# quarto-python-autodoc-template

How to generate auto-documentation for a Python package, using [quarto](https://quarto.org) and [quartodoc](https://machow.github.io/quartodoc/get-started/overview.html).


## Prerequisites

### Quarto

We need to install Quarto on your local machine. You can [download](https://quarto.org/docs/get-started/), or [install via homebrew](https://formulae.brew.sh/cask/quarto) (if you like that kind of thing):

```sh
brew install --cask quarto
```


If you use VS Code, you can also consider installing the [Quarto Extension](https://marketplace.visualstudio.com/items?itemName=quarto.quarto).

### Setup

Make a copy of the template repo. Clone your copy onto your computer and navigate to it from the command line.

If you are using IPYNB notebooks, as exemplified in this repo, you will need to install packages that those notebooks require (currently listed in "docs/requirements.txt"). In which case you probably want to setup a virtual environment as well (if you like that kind of thing):

```sh
conda create -n quarto-env python=3.10
conda activate quarto-env

pip install docs/requirements.txt
```

## Python Package

See ["my_project" directory](/my_project/) for an example Python package code.

And corresponding tests in the ["test" directory](/test/).

We use the top-level ["requirements.txt" file](/requirements.txt) to list dependencies of our Python package, including `pytest` for running tests.

## Auto Documentation

In the "quarto.yml" config file, we specified that our site should display "references/index.qmd", which will act as the entrypoint into the package documentation.

Use quartodoc to automatically generate content into the "references" directory:

```sh
quartodoc build --config docs/_quarto.yml --verbose
```

After the documentation pages have been generated, then we can preview and build the site.


## Building


Previewing (runs like a local webserver):

```sh
quarto preview docs/
```


Rendering a doc (performs a build and writes local HTML files to "__build_", as configured):

```sh
quarto render docs/ --verbose
```




## Deploying

We are using the "quarto-deploy.yml" file to deploy the site to GitHub Pages when new commits are pushed to the main branch.

In order for this to work, you first need to configure your GitHub Pages repo settings to publish via GitHub Actions.

This workflow uses the [quarto publish action](https://github.com/quarto-dev/quarto-actions/blob/main/examples/quarto-publish-example.yml).

Need to run `quarto publish gh-pages` first? Manual deploy?
