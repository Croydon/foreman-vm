# Ubuntu 18.04 VM with a Foreman installation


These scripts help to build an Ubuntu 18.04 / Foreman 2.1 VirtualBox VM image.

It builds upon [Packer.io](https://www.packer.io) which you first have to manually install.

Before you start, please note, that these scripts were written for a very specific use case, and they probably need changing in several places if they are used by someone else. This applies particular for values inside `variables.sh` and most parts of `init.sh`.

After you have installed Packer.io and cloned this repository, you can execute

```
    cd packer
    packer build ubuntu_1804.json
```

Once Packer.io is finished, you should have `.ova` file which you can import in VirtualBox.

The default user credentials for the Ubuntu **AND** Foreman instance are `pilab`/`pilab`.

Some steps can not be done automatically. Once you have started the VM, execute inside the VM the following script **as the pilab user** to fully install and enable Foreman.

```
    ~/Desktop/pilab/install.sh
```

For the Pilab project, you might want to also execute `~/Desktop/pilab/config.sh` to create some initial configuration inside of Foreman. For other projects, this file is probably irrelevant.



## FAQ

Questions people did actual ask and questions people might ask based on my imagination.

### Why using Ubuntu instead of a distro from the Red Hat family?

Foreman is mainly sponsored by Red Hat and part of their commercial Red Hat Satellite product. Hence, using a Linux distro from the Red Hat family might be an actual better choice for a Foreman instance.

That said, this project did start out very different as where it did end up. Neither VirtualBox nor a VM at all were part of the initial plans. Fedora versions have a too short lifespan, so they are not a viable option. RHEL can not be used without creating legal headaches. We tried using CentOS before (but not in VirtualBox) and it did not work out for some unknown issue, and we moved on due to time pressure. When this project started, CentOS might have been a good choice theoretically, now, where their distribution model changes, it might not be a good choice any longer.

Ubuntu seemed to be the next best choice and it works (more or less).


### Why not Ubuntu 20.04 instead of 18.04?

At the time when these scripts were created (and still at the time of writing this FAQ), Foreman did not offer `.deb` packages for Ubuntu 20.04, hence 18.04 is the next best choice.



## Credits

The content of the `packer/` directory is derived from code for an Ubuntu 16.04 image for the [computer science faculty](https://fbi.h-da.de) of the [University Of Applied Sciences Darmstadt](https://h-da.de) and is licensed under the Apache 2.0 license. All scripts in the root directory are written by me.


## License

This repository is licensed under the terms of the Apache 2.0 license.
