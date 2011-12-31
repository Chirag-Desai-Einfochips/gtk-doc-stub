include Makefile.inc

bin_programs = gtkdocize

gtkdocize: $(srcdir)/gtkdocize.in
	sed -e "s,@sysconfdir\@,$(sysconfdir)," \
	    -e "s,@prefix\@,$(prefix)," \
	    -e "s,@datadir\@,$(datadir)," \
	    -e "s,@datarootdir\@,$(datarootdir)," \
	    -e "s,@VERSIONS\@,$(VERSIONS)," \
	    $< > $@.tmp && mv $@.tmp $@

all: $(bin_programs)

install: $(bin_programs)
	mkdir -p $(DESTDIR)$(bindir)
	for prog in $(bin_programs); do \
		install -m 0755 $$prog $(DESTDIR)$(bindir)/$$prog; \
	done

	mkdir -p $(datarootdir)/gtk-doc/data
	touch $(datarootdir)/gtk-doc/data/gtk-doc.make
