# MAIN é o arquivo principal para ser chamado (sem a extensão do arquivo)
MAIN=respostas

# Comando para remover arquivos
RM=rm -f

# Adiciona pastas aos diretórios de busca do LaTeX
export TEXINPUTS=$(shell kpsepath tex):$(shell pwd)/

# Padrão: gerar o PDF na pasta local
default: all

all: main

main: $(MAIN) cleanout

$(MAIN):
	pdflatex $(MAIN)
	pdflatex $(MAIN)

bibliografia:
	pdflatex $(MAIN)
	bibtex $(MAIN)

# Remover todos os arquivos gerados pelo LaTeX,
# exceto o PDF.
cleanout:
	$(RM) *.aux
	$(RM) *.bbl
	$(RM) *.blg
	$(RM) *.dvi
	$(RM) *.log
	$(RM) *.nav
	$(RM) *.out
	$(RM) *.snm
	$(RM) *.toc
	$(RM) *.vrb

# Remover PDF e arquivos gerados pelo LaTeX.
clean: cleanout
	$(RM) *.pdf
