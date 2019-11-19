include $(BASE_DIR)/global_rule.make
include kernel_rule.make


all: err
	@$(MAKE) -C $(KERNEL_DIR) ARCH=$(ARCH)
	@$(CP) $(KERNEL_DIR)/arch/x86/boot/bzImage $(BASE_DIR)/$(KIMAGE)

config:
	@test -f $(KERNEL_DIR).tar.xz || \
        wget https://mirrors.edge.kernel.org/pub/linux/kernel/v2.6/$(KERNEL_DIR).tar.xz
	@test -d $(KERNEL_DIR) || tar xJvf $(KERNEL_DIR).tar.xz
	@$(CP) $(KERNEL_CONF) $(KERNEL_DIR)/arch/x86/configs/mini_defconfig
	@$(MAKE) -C $(KERNEL_DIR) ARCH=$(ARCH) mini_defconfig

clean:
	@$(RM) -r $(KERNEL_DIR)

err:
	@test -d $(KERNEL_DIR) || (echo "Please \"make config\" first"; exit 1)

.PHONY: all config clean
