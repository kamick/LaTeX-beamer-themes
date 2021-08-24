default: 00format-gscop.pdf 01mapsp2015-lemaire.pdf clean

%.pdf: %.tex
	pdflatex $<
	pdflatex $<


.PHONY: clean

clean:
	$(RM) *.log *.dvi *.out *.aux *.toc *.nav *.snm *.lof *.synctex.* *.ans

cleaner: clean
	$(RM) -r auto *~ 00format-gscop.pdf 01mapsp2015-lemaire.pdf

