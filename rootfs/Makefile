include $(BASE_DIR)/global_rule.make

all:
	@test -d $(BASE_DIR)/$(ROOTFS_DIR) || \
        sudo tar xzf $(ROOTFS_DIR).tgz -C $(BASE_DIR)/
	@test -d $(BASE_DIR)/$(ROOTFS_DIR) && \
        sudo tar xzf driver-$(KERNEL_VER).tgz -C $(BASE_DIR)/$(ROOTFS_DIR)/
	@test -d $(BASE_DIR)/$(CDIMAGE_DIR) || \
        tar xzf $(CDIMAGE_DIR).tgz -C $(BASE_DIR)/

.PHONY: all
