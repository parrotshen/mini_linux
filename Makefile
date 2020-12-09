include global_rule.make


all: err
	@echo "Enter your password to get the root privilege."
	@sudo echo dummy > /dev/null || \
        (echo "Get root privilege failure! Plz Ctrl-C."; exit 1) && \
        (echo "Get root privilege success."; sleep 1)
	@./mkrootfs.sh || exit 1

err:
	@test -n $(BASE_DIR) || \
        (echo "Please \"source setup.mini_linux\" first !!"; exit 1)
	@test -d $(ROOTFS_DIR) || \
        (echo "Please \"make config\" first !!"; exit 1)

config:
	@$(MAKE) -C rootfs
	@$(CHMOD) +x *.sh

iso:
	@./make-iso.sh || exit 1

vmdk:
	@./make-vmdk.sh || exit 1

clean:
	sudo $(RM) -r $(ROOTFS_DIR)
	$(RM) -r $(CDIMAGE_DIR)
	$(RM) ./boot/$(RIMAGE)
	$(RM) ./boot/$(ISO)

help:
	@$(ECHO)
	@$(ECHO) "ARCH          = [1;35m$(ARCH)[0m ([1;36m$(MSIZE)[0m-bit)"
	@$(ECHO) "Compile       = $(shell which gcc)"
	@$(ECHO) "Kernel Image  = $(KIMAGE)"
	@$(ECHO) "Root-FS Image = $(RIMAGE)"
	@$(ECHO) "ISO Image     = $(ISO)"
	@$(ECHO) "ROOTFS_TYPE   = [1;32m$(ROOTFS_TYPE)[0m"
	@$(ECHO)

.PHONY: config iso vmdk clean help
