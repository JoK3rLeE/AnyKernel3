### AnyKernel3 - Xiaomi Cepheus
## Kernel installer configuration
## Based on the AnyKernel3 framework by osm0sis @ xda-developers

### AnyKernel setup
properties() { '
kernel.string=InfiniR Kernel for Xiaomi Cepheus
do.devicecheck=1
do.modules=0
do.systemless=0
do.cleanup=1
do.cleanuponabort=0
device.name1=cepheus
device.name2=
device.name3=
device.name4=
device.name5=
supported.versions=16
supported.patchlevels=
supported.vendorpatchlevels=
'; } # end properties


### AnyKernel install
## boot files attributes
boot_attributes() {
  set_perm_recursive 0 0 755 644 $RAMDISK/*;
  set_perm_recursive 0 0 750 750 $RAMDISK/init* $RAMDISK/sbin;
} # end attributes

# Xiaomi Cepheus uses a single, non-A/B boot partition.
# The device tree defines the partition as /dev/block/bootdevice/by-name/boot.
BLOCK=/dev/block/bootdevice/by-name/boot;
IS_SLOT_DEVICE=0;
RAMDISK_COMPRESSION=auto;
PATCH_VBMETA_FLAG=auto;

# import functions/variables and setup patching - see for reference (DO NOT REMOVE)
. tools/ak3-core.sh;

# Dump and unpack the existing Cepheus boot image.
dump_boot;

# No ramdisk modifications are required.
# The kernel payload is supplied by the build workflow (Image-dtb/Image.gz-dtb).
write_boot;
## end boot install
