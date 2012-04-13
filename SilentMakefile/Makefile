# Makefile padrão para projetos LaTeX
# Autor: Paulo Roberto Urio (paulourio gmail com)
# Licença: FreeBSD

# Nome do arquivo principal do seu projeto
# Não coloque com a extensão do arquivo. Se for "trab.tex": MAIN=trab
MAIN=main
# Nome completo do arquivo de referências (com a extensão).  Pode ser utilizado
# caminho relativo como BIB=../../bibliografia.bib
BIB=referencias.bib
# Comportamento padrão para o comando make sem argumentos.
# Possibilidades: 
#   try_all     Tenta gerar com bibliografia.  Se o arquivo não
#               existir o alvo será redirecionado para 'pdf'
#   pdf         Executa apenas o alvo PDF por padrão.
# Veja 'make help' para mais opções de alvos.
default: try_all

#-------------------------------------------------------------------------------

LATEX=pdflatex -interaction=nonstopmode
BIBTEX=bibtex
MAKEFLAGS += --no-print-directory
V=0
.PHONY += default pdf $(MAIN) $(BIB) bib distclean clean _main help all try_all

ERRO=\033[1m[\033[31;1mErro\033[0;1m]\033[0m
AVISO=\033[1m[\033[33;1mAviso\033[0;1m]\033[0m
INFO=\033[1m[\033[34;1mDebug\033[0;1m]\033[0m

try_all:
	@if [ -e $(BIB) ]; then \
		make all; \
	else \
		echo "$(AVISO) Arquivo $(BIB)"\
			 "não encontrado: executando apenas alvo pdf";\
		make pdf;\
	fi

debug:
	@echo "$(INFO) 0% - Gerando PDF"
	@sleep 1
	@make LATEX=pdflatex V=1 _main
	@echo "$(INFO) 25% - Gerando bibliografia"
	@if [ -e $(BIB) ]; then \
		@sleep 1;\
		@make LATEX=pdflatex V=1 bib;\
	else \
		echo "$(AVISO) Arquivo $(BIB)"\
			 "não encontrado. Ignorando...";\
		sleep 2;\
	fi	
	@echo "$(INFO) 50% - Gerando PDF"
	@sleep 1
	@make LATEX=pdflatex V=1 _main
	@echo "$(INFO) 75% - Gerando PDF e limpando"
	@sleep 1
	@make LATEX=pdflatex V=1 pdf

all: bib pdf
	@echo "\033[32;1mOK\033[0m"

pdf: _main clean

_main: $(MAIN)

$(MAIN):
ifeq ($(V),0)
	@if [ ! -f $(MAIN).tex ]; then \
		echo "$(ERRO) Arquivo $(MAIN).tex não existe.";\
		echo "Edite o início do Makefile para definir o nome do"\
			 "arquivo TeX principal.";\
		false;\
	fi;
	@echo "PDF"
	@$(LATEX) $(MAIN) > /dev/null || (echo "$(ERRO) Falhou ao gerar PDF:"\
						"re-executando...\033[0m" && make debug && false)
else
	$(LATEX) $(MAIN)
endif

$(BIB):
	@echo "$(ERRO) Arquivo $(BIB) não encontrado.\033[0m"
	@make help
	@false

bib: $(BIB) _main
ifeq ($(V),0)
	@echo "Bibliografia"
	@$(BIBTEX) $(MAIN) > /dev/null || (echo "$(ERRO)  Erro ao gerar "\
		"bibliografia: re-execute com \`make debug\`\033[0m" && false)
	@make _main
	@make _main
else
	$(BIBTEX) $(MAIN)
endif

distclean: clean
	@$(RM) *.pdf

clean:
	@echo "Limpando"
	@$(RM) *.aux *.bbl *.blg *.dat *.dvi *.gnuplot *.log *.nav
	@$(RM) *.out *.snm *.toc *.vrb

help:
	@echo "Comandos:"
	@echo "    make            Gerar PDF com bibliografia"
	@echo "    make all        Gerar PDF com bibliografia"
	@echo "    make debug      Gerar PDF com bibliografia no modo interativo"
	@echo "    make pdf        Gerar apenas o PDF"
	@echo "    make clean      Apagar arquivos gerados"
	@echo "    make distclean  clean + apagar PDF gerado"
	@echo "Configuração:"
	@echo "    Este Makefile trabalha com apenas um arquivo .tex e um .bib"
	@echo "    Você precisa editar o arquivo Makefile para definir estes arquivos."

