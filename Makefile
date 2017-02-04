EXECUTABLE = mkgpx
ARCHIVE = $(EXECUTABLE).tar.gz

PREFIX ?= /usr/local/bin
SRC = $(wildcard Sources/*.swift)

.PHONY: archive clean install uninstall

$(EXECUTABLE): $(SRC)
	swiftc \
		-static-stdlib \
		-O -whole-module-optimization \
		-o $(EXECUTABLE) \
		-sdk $(shell xcrun --sdk macosx --show-sdk-path) \
		-target x86_64-macosx10.10 \
		$(SRC)

install: $(EXECUTABLE)
	install $(EXECUTABLE) "$(PREFIX)"

archive: $(EXECUTABLE)
	tar --create --preserve-permissions --gzip --file $(ARCHIVE) $(EXECUTABLE)
	@shasum -a 256 $(EXECUTABLE)
	@shasum -a 256 $(ARCHIVE)

clean:
	rm -rf $(EXECUTABLE) $(ARCHIVE)

uninstall:
	rm "$(PREFIX)/$(EXECUTABLE)"
