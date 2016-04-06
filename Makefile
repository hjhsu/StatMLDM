all : README.md
	$(MAKE) -C slide

README.md : README-src.md
	Rscript get_note.R
