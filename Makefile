include global_rule.make


all: build

config:
	@test -d $(ROOTFS_DIR) || sudo tar xzf $(ROOTFS_DIR).tgz -C .
	@$(CHMOD) +x *.sh

build: config
	@echo "Enter your password to get the root privilege."
	@sudo echo dummy > /dev/null || \
        (echo "Get root privilege failure! Plz Ctrl-C."; exit 1) && \
        (echo "Get root privilege success."; sleep 1)
	@./mkrootfs.sh || exit 1

iso: config
	@./make-iso.sh || exit 1

clean:
	sudo $(RM) -r $(ROOTFS_DIR)
	$(RM) -r cdimage
	$(RM) $(RIMAGE)
	$(RM) $(ISO)

help:
	@$(ECHO) "ARCH          = $(ARCH) (32-bit)"
	@$(ECHO) "Compile       = `which gcc`"
	@$(ECHO) "Kernel Image  = $(KIMAGE)"
	@$(ECHO) "Root-FS Image = $(RIMAGE)"
	@$(ECHO) "ISO Image     = $(ISO)"
	@$(ECHO)

.PHONY: build config clean
