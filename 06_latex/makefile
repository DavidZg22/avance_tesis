# Makefile para compilar la tesis en LaTeX

all: tesis.pdf

tesis.pdf: tesis.tex
    pdflatex tesis.tex
    bibtex tesis
    pdflatex tesis.tex
    pdflatex tesis.tex

clean:
    rm -f *.aux *.log *.toc *.out *.bbl *.blg *.pdf


