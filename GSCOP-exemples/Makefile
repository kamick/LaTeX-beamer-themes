default: 00format-gscop.pdf 01mapsp2015-lemaire.pdf clean

%.pdf: %.tex
	pdflatex $<
	pdflatex $<


.PHONY: clean

clean:
	$(RM) *.toc *.log *.nav *.out *.aux *.snm


