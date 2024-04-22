PACKAGE = dlut-thesis

SOURCES = $(PACKAGE).ins $(PACKAGE).dtx
CLSFILE = $(PACKAGE).cls

all: cls doc

cls: $(CLSFILE)

doc: $(PACKAGE).pdf

$(CLSFILE): $(SOURCES)
	xelatex $(PACKAGE).ins

$(PACKAGE).pdf: $(SOURCES)
	xelatex $(PACKAGE).dtx

clean:
	-rm -rf *.aux *.cls *.glo *.hd *.idx *.log *.out *.pdf

.PHONY: all cls doc clean
