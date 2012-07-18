include Makefile.inc

bin_programs = gtkdocize

gtkdocize: $(srcdir)/gtkdocize.in Makefile
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

	mkdir -p $(DESTDIR)$(datarootdir)/gtk-doc-devel
	install -m 0644 $(srcdir)/gtk-doc.make $(DESTDIR)$(datarootdir)/gtk-doc-devel/gtk-doc.make

	mkdir -p $(DESTDIR)$(datarootdir)/aclocal/
	install -m 0644 $(srcdir)/gtk-doc.m4 $(DESTDIR)$(datarootdir)/aclocal/gtk-doc.m4

	mkdir -p $(DESTDIR)$(datarootdir)/gobject-introspection-1.0
	install -m 0644 $(srcdir)/Makefile.introspection $(DESTDIR)$(datarootdir)/gobject-introspection-1.0/Makefile.introspection
	install -m 0644 $(srcdir)/introspection.m4 $(DESTDIR)$(datarootdir)/aclocal/introspection.m4
