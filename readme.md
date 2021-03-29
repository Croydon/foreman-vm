# Ubuntu 18.04 VM with a Foreman installation


These scripts help to build an Ubuntu 18.04 / Foreman 2.1 VirtualBox VM image.

It builds upon [Packer.io](https://www.packer.io) which you first have to manually install.

After you have installed Packer.io and cloned this repository, you can execute

```
    cd packer
    packer build ubuntu_1804.json
```


## Credits

The content of the `packer/` directory is derived from code for an Ubuntu 16.04 image for the [computer science faculty](https://fbi.h-da.de) of the [University Of Applied Sciences Darmstadt](https://h-da.de) and is licensed under the Apache 2.0 license. All scripts in the root directory are written by me.


## License

This repository is licensed under the terms of the Apache 2.0 license.
