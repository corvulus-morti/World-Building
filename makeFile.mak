BUILDDIR=build
FILENAME=test

pdf:
    mkdir $(BUILDDIR) -p  # Creates the BUILDDIR if it doesn't already exist.
    pandoc $(FILENAME).md \
    --filter pandoc-citeproc \
    --from=markdown+tex_math_single_backslash+tex_math_dollars+raw_tex \
    --to=latex \
    --output=$(BUILDDIR)/$(FILENAME).pdf \
    --pdf-engine=xelatex

html:
    mkdir $(BUILDDIR) -p  # Creates the BUILDDIR if it doesn't already exist.
    pandoc $(FILENAME).md \
    --filter pandoc-citeproc \
    --from=markdown+tex_math_single_backslash+tex_math_dollars \
    --to=html5 \
    --output=$(BUILDDIR)/$(FILENAME).html \
    --mathjax \
    --self-contained

epub:
    mkdir $(BUILDDIR) -p  # Creates the BUILDDIR if it doesn't already exist.
    pandoc $(FILENAME).md \
    --filter pandoc-citeproc \
    --from=markdown+tex_math_single_backslash+tex_math_dollars \
    --to=epub \
    --output=$(BUILDDIR)/$(FILENAME).epub \
    --epub-cover-image=<cover-image> \
    --toc
