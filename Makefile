MAIN=exercicios
BIB=../referencias.bib
LATEX=pdflatex -interaction=nonstopmode

default: bib pdf
	@echo "\033[32;1mOK\033[0m"

pdf: $(MAIN) clean

$(MAIN):
	$(LATEX) $(MAIN)
	$(LATEX) $(MAIN)

$(BIB):
	@echo "\033[31;1mArquivo $(BIB) não encontrado\033[0m"
	@false

bib: $(BIB)
	$(LATEX) $(MAIN)
	bibtex $(MAIN)

distclean: clean
	$(RM) *.pdf

clean:
	$(RM) *.aux *.bbl *.blg *.dat *.dvi *.gnuplot *.log *.nav
	$(RM) *.out *.snm *.toc *.vrb

