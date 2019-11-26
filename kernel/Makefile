include $(BASE_DIR)/global_rule.make


all: err
	@$(MAKE) -C $(KERNEL_SRC) ARCH=$(ARCH)
	@$(CP) $(KERNEL_SRC)/arch/x86/boot/bzImage $(BASE_DIR)/boot/$(KIMAGE)

menuconfig: err
	@$(MAKE) -C $(KERNEL_SRC) ARCH=$(ARCH) menuconfig

config:
	@test -f $(KERNEL_SRC).tar.xz || \
        wget https://mirrors.edge.kernel.org/pub/linux/kernel/v2.6/$(KERNEL_SRC).tar.xz
	@test -d $(KERNEL_SRC) || tar xJvf $(KERNEL_SRC).tar.xz
	@$(MAKE) -C $(KERNEL_SRC) ARCH=$(ARCH) i386_defconfig

patch:
	@$(CP) $(KERNEL_CONF) $(KERNEL_SRC)/arch/x86/configs/mini_defconfig
	@$(MAKE) -C $(KERNEL_SRC) ARCH=$(ARCH) mini_defconfig

clean:
	@$(RM) -r $(KERNEL_SRC)

err:
	@test -d $(KERNEL_SRC) || (echo "Please \"make config\" first !!"; exit 1)

.PHONY: all config patch clean
