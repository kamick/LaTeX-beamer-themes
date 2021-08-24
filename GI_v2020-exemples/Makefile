default: 00format-gi.pdf 01regression_lineaire.pdf clean

%.pdf: %.tex
	pdflatex $<
	pdflatex $<


.PHONY: clean

clean:
	$(RM) *.toc *.log *.nav *.out *.aux *.snm


