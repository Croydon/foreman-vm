# Ubuntu 18.04 VM with a Foreman installation


These scripts help to build an Ubuntu 18.04 / Foreman 2.1 VirtualBox VM image.

It builds upon [Packer.io](https://www.packer.io) which you first have to manually install.

Before you start, please note, that these scripts were written with a very specific use case, and they probably need changing in several places if they are used by someone else. This applies particular for values inside `variables.sh` and most parts of `init.sh`.

After you have installed Packer.io and cloned this repository, you can execute

```
    cd packer
    packer build ubuntu_1804.json
```

Once Packer.io is finished, you should have `.ova` file which you can import in VirtualBox.

The default user credentials for the Ubuntu **AND** Foreman instance are `pilab`/`pilab`.

Some steps can not be done automatically. Once you have started the VM, execute inside the VM the following script to fully install and enable Foreman.

```
    ~/Desktop/pilab/install.sh
```

For the Pilab project, you might want to also execute `~/Desktop/pilab/config.sh` to create some initial configuration inside of Foreman. For other projects, this file is probably irrelevant.


## Credits

The content of the `packer/` directory is derived from code for an Ubuntu 16.04 image for the [computer science faculty](https://fbi.h-da.de) of the [University Of Applied Sciences Darmstadt](https://h-da.de) and is licensed under the Apache 2.0 license. All scripts in the root directory are written by me.


## License

This repository is licensed under the terms of the Apache 2.0 license.
