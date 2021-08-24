default: 00format-gi.pdf 01regression_lineaire.pdf clean

%.pdf: %.tex
	pdflatex $<
	pdflatex $<


.PHONY: clean

clean:
	$(RM) *.log *.dvi *.out *.aux *.toc *.nav *.snm *.lof *.synctex.* *.ans

cleaner: clean
	$(RM) -r auto *~ 00format-gi.pdf 01regression_lineaire.pdf

