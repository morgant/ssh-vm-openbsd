PING_PROG = ping-vm
SCP_PROG = scp-vm
SSH_PROG = ssh-vm
TRACEROUTE_PROG = traceroute-vm
PROG_LIB = libsshvm
SECTION = 1

PREFIX ?= /usr/local
LIBDIR = $(DESTDIR)$(PREFIX)/lib
BINDIR = $(DESTDIR)$(PREFIX)/bin
MANDIR = $(DESTDIR)$(PREFIX)/man/man$(SECTION)

install:
	install -d $(LIBDIR)
	install -m 755 lib/$(PROG_LIB) $(LIBDIR)
	install -d $(BINDIR)
	install -m 755 bin/$(PING_PROG) $(BINDIR)
	sed -i 's@^\. \./lib/@. $(LIBDIR)/@g' $(BINDIR)/$(PING_PROG)
	install -m 755 bin/$(SCP_PROG) $(BINDIR)
	sed -i 's@^\. \./lib/@. $(LIBDIR)/@g' $(BINDIR)/$(SCP_PROG)
	install -m 755 bin/$(SSH_PROG) $(BINDIR)
	sed -i 's@^\. \./lib/@. $(LIBDIR)/@g' $(BINDIR)/$(SSH_PROG)
	install -m 755 bin/$(TRACEROUTE_PROG) $(BINDIR)
	sed -i 's@^\. \./lib/@. $(LIBDIR)/@g' $(BINDIR)/$(TRACEROUTE_PROG)
	# install -d $(MANDIR)
	# install -m 644 man/$(SSH_PROG).$(SECTION) $(MANDIR)

uninstall:
	rm \
		$(BINDIR)/$(PING_PROG) \
		$(BINDIR)/$(SCP_PROG) \
		$(BINDIR)/$(SSH_PROG) \
		$(BINDIR)/$(TRACEROUTE_PROG) \
		$(LIBDIR)/$(PROG_LIB)
	# rm $(MANDIR)/$(SSH_PROG).$(SECTION)
