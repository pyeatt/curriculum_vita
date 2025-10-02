

SUFFIXES = .tex .ps .bbl .aux .pdf
.SUFFIXES: $(SUFFIXES)


BIBFILES = LarryPubs.bib
#MAIN = vita2pa
MAIN = vita
#MAIN = vita_industry
#MAIN = vita_4_alan
#MAIN = vita_review
#MAIN = research
#MAIN = teaching
MAINTEX=${MAIN}.tex
MAINDVI=${MAIN}.dvi
MAINAUX=${MAIN}.aux
MAINLOG=${MAIN}.log
MAINPS=${MAIN}.ps
MAINPDF=${MAIN}.pdf
TEXFILES = $(wildcard *.tex)

#BIBAUX = $(wildcard ${MAIN}.*.aux)
BIBAUX = $(wildcard bu*.aux)
BIBS = $(subst .aux,.bbl,${BIBAUX})

.aux.bbl: ${BIBAUX}  ${BIBFILES} ${MAINTEX}
	bibtex $(subst .aux,,$<)

${MAINPDF}: ${MAINTEX} ${BIBFILES} ${BIBS}
	pdflatex ${MAIN}
	$(eval BIBAUX = $(wildcard bu*.aux))
	for i in ${BIBAUX}; do echo $$i ; bibtex $$i ; done
	pdflatex ${MAIN}
	pdflatex ${MAIN}

clean:
	rm -f *.bbl *.aux *.blg ${MAINPS} ${MAINPDF} *.dvi *.blg *.log *~

cover:
	latex cover_letter
	dvips -o cover_letter.ps cover_letter
	ps2pdf cover_letter.ps


install: ${MAINPDF}
	mv ${MAINPS} ${MAINPDF} ../public_html/papers
	chmod a+r ../public_html/papers/${MAINPS} ../public_html/papers/${MAINPDF}





