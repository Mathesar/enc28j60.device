# enc28j60.device

SANA-II network driver for the ENC28J60 Ethernet controller on the [a500-sd-plus-controller](https://github.com/Mathesar/a500-sd-plus-controller).

* [Supported hardware](#supported-hardware)
* [Downloads](#downloads)  
* [Limitations](#limitations)
* [Building / Development](#building-development)
* [Acknowledgements](#acknowledgements)

# Supported hardware
This driver supports the following device:
* [a500-sd-plus-controller](https://github.com/Mathesar/a500-sd-plus-controller)

# Downloads
Device downloads are available under [releases](https://github.com/Mathesar/enc28j60.device/releases)

# Limitations
This driver currently uses a hard-coded MAC address. Therefore only one Amiga using this driver can be active on a single network.

# Building-Development
Building this code will require the following
* [VBCC](http://phoenix.owl.de/vbcc/current/vbcc_bin_amigaos68k.lha)
* [VBCC m68k-amigaos target](http://phoenix.owl.de/vbcc/current/vbcc_target_m68k-amigaos.lha)
* sana2.h which is copyrighed. I took mine from the AmigaOS3.5 Developer CD V2.1.

Building needs to be done on a real or emulated Amiga by running the build_net Amiga script.

# Acknowledgements
This driver is based upon previous work by [Mike Sterling](https://github.com/mikestir/k1208-drivers). 
