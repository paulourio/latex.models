MAIN=main
BIB=referencias.bib
LATEX=pdflatex -interaction=nonstopmode
MAKEFLAGS += --no-print-directory
V=0

PHONY += default pdf $(MAIN) $(BIB) bib distclean clean _main

default: all

debug:
	@make LATEX=pdflatex V=1 all 

all: bib pdf
	@echo "\033[32;1mOK\033[0m"

pdf: _main clean

_main: $(MAIN)

$(MAIN):
ifeq ($(V),0)
		@echo "PDF"
		@$(LATEX) $(MAIN) > /dev/null || (echo "\033[31;1mErro ao gerar PDF:"\
							"reexecutando...\033[0m" && make debug && false)
else
	    $(LATEX) $(MAIN)
endif

$(BIB):
	@echo "\033[31;1mArquivo $(BIB) não encontrado.\033[0m"
	@echo "Ajuda:"
	@make help
	@false

bib: $(BIB) _main
ifeq ($(V),0)
	@echo "Bibliografia"
	@bibtex $(MAIN) > /dev/null || (echo "\033[31;1mErro ao gerar bibliografia: "\
								"reexecute com \`make debug\`\033[0m" && false)
	@make _main
	@make _main
else
	bibtex $(MAIN)
endif

distclean: clean
	@$(RM) *.pdf

clean:
	@echo "clean"
	@$(RM) *.aux *.bbl *.blg *.dat *.dvi *.gnuplot *.log *.nav
	@$(RM) *.out *.snm *.toc *.vrb

help:
	@echo "\tmake\t\tGerar PDF com bibliografia"
	@echo "\tmake all\tGerar PDF com bibliografia"
	@echo "\tmake debug\tGerar PDF com bibliografia no modo interativo"
	@echo "\tmake pdf\tGerar apenas o PDF"
	@echo "\tmake clean\tApagar arquivos gerados"
	@echo "\tmake distclean\tclean + apagar PDF gerado"

