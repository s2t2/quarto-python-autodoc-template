

build:
	quartodoc build --config docs/_quarto.yml
	quarto render docs/
	open docs/_build/index.html

autodoc:
	quartodoc build --config docs/_quarto.yml

preview:
	quarto preview docs/

render:
	quarto render docs/

open:
	open docs/_build/index.html
