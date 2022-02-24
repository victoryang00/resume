all: clean en zh

en: resume.tex
	xelatex resume.tex

zh: resume-zh
	xelatex resume-zh.tex

resume-zh: resume.tex
        wget https://github.com/chrissimpkins/codeface/raw/master/cjk-fonts/source-han-sans-HWSC/SourceHanSansHWSC-Regular.otf
	cat resume.tex | sed 's/zh}\[1\]{}/zh}\[1\]{#1}/g' | sed 's/en}\[1\]{#1}/en}\[1\]{}/g' > resume-zh.tex

clean:
	rm -f *.log *.aux *.bbl *.blg *.synctex.gz *.out *.toc *.lof *.idx *.ilg *.ind *.cut resume-zh.tex
