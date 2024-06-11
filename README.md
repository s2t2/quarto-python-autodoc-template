# quarto-python-autodoc-template

How to generate auto-documentation for a Python package, using [quarto](https://quarto.org) and [quartodoc](https://machow.github.io/quartodoc/get-started/overview.html).


## Prerequisites

### Quarto

We need to install Quarto onto your local machine. You can [download](https://quarto.org/docs/get-started/), or [install via homebrew](https://formulae.brew.sh/cask/quarto) (if you like that kind of thing):

```sh
brew install --cask quarto
```


If you use VS Code, you can also consider installing the [Quarto Extension](https://marketplace.visualstudio.com/items?itemName=quarto.quarto).

### Setup

Make a copy of this template repo. Clone your copy onto your computer and navigate to it from the command line.

Setup virtual environment:

```sh
conda create -n quarto-env python=3.10
conda activate quarto-env
```

Install package dependencies:

```sh
pip install -r requirements.txt
pip install -r docs/requirements.txt
```

## Python Package

See ["my_project" directory](/my_project/) for an example Python package code.

With corresponding tests in the ["test" directory](/test/).

We use the top-level ["requirements.txt" file](/requirements.txt) to list dependencies of our Python package, including `pytest` for running tests.

## Auto Documentation

In the ["_quarto.yml" config file](/docs/_quarto.yml), we specify in the `quartodoc` section that our site should display "references/index.qmd", which will act as the entrypoint into the package auto-documentation.

Use quartodoc to automatically generate docstring content into the "references" directory:

```sh
quartodoc build --config docs/_quarto.yml --verbose
```

After the documentation pages have been generated, then we can preview and build the site.


## Building


Previewing the site (runs like a local webserver):

```sh
quarto preview docs/
```


Rendering the site (writes local HTML files to the "docs/_build" directory, which is ignored from version control):

```sh
quarto render docs/ --verbose
```


## GitHub Actions Workflows

### Continuous Integration

We are using the ["python-app.yml" workflow configuration file](/.github/workflows/python-app.yml) to run tests for the example python package code (see "test" directory).

### Website Publishing

We are using the ["quarto-pages.yml" workflow configuration file](/.github/workflows/quarto-pages.yml) to deploy the site to GitHub Pages when new commits are pushed to the main branch.

In order for this to work, you first need to configure your GitHub Pages repo settings to publish via GitHub Actions.
