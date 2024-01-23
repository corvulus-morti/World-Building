INPUTDIR = Vallonia/Lore
BUILDDIR = build

all: pdf html

pdf:
	mkdir $(BUILDDIR) -p  # Creates the BUILDDIR if it doesn't already exist.
	pandoc $(wildcard $(INPUTDIR)/*.md) \
	-d def_pdf.yml \
	--output=$(BUILDDIR)/Lore.pdf

html:
	mkdir $(BUILDDIR) -p  # Creates the BUILDDIR if it doesn't already exist.
	pandoc $(FILENAME).md \
	-d def_html.yml \
	--output=$(BUILDDIR)/$(FILENAME).html

clean:
	rm ./build -rf