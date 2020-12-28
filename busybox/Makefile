include $(BASE_DIR)/global_rule.make

BUSYBOX_URL  = https://busybox.net/downloads
BUSYBOX_VER  = 1.26.2
BUSYBOX_SRC  = busybox-$(BUSYBOX_VER)
BUSYBOX_CONF = defconfig-$(BUSYBOX_VER)


all: err
	@$(MAKE) -C $(BUSYBOX_SRC)
	@$(MAKE) -C $(BUSYBOX_SRC) install

menuconfig: err
	@$(MAKE) -C $(BUSYBOX_SRC) menuconfig

config:
	@test -f $(BUSYBOX_SRC).tar.bz2 || \
        wget --no-check-certificate $(BUSYBOX_URL)/$(BUSYBOX_SRC).tar.bz2
	@test -d $(BUSYBOX_SRC) || tar xjvf $(BUSYBOX_SRC).tar.bz2
	@$(CP) $(BUSYBOX_CONF) $(BUSYBOX_SRC)/.config

clean:
	@$(RM) -r $(BUSYBOX_SRC)

err:
	@test -d $(BUSYBOX_SRC) || (echo "Please \"make config\" first !!"; exit 1)

.PHONY: all config clean
