all: zh en

en: resume.tex
	"C:\Program Files\MiKTeX\miktex\bin\x64\xelatex.exe" resume.tex

zh: resume-zh
	"C:\Program Files\MiKTeX\miktex\bin\x64\xelatex.exe" resume-zh.tex
	
resume-zh: resume.tex
	cat resume.tex | sed 's/zh}\[1\]{}/zh}\[1\]{#1}/g' | sed 's/en}\[1\]{#1}/en}\[1\]{}/g' > resume-zh.tex

clean:
	rm -f *.log *.aux *.bbl *.blg *.synctex.gz *.out *.toc *.lof *.idx *.ilg *.ind *.cut resume-zh.tex
