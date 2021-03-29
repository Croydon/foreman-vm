# Packer.io Files for VirtualBox images.

Files to automatically create the BS/VS VirtualBox image using [packer.io](https://www.packer.io). 

## Installing Packer

Packer is easy to use and automates the creation of any type of machine image. It embraces modern configuration management by encouraging you to use automated scripts to install and configure the software within your Packer-made images. You may download Packer from [packer.io -> downloads](https://www.packer.io/downloads.html). The Zip-files contain pre-compiled images including all libraries that can be executed immediatly.

## Additional Requirements

Our packer.io scripts build VirtualBox images. Thus you have to have VirtualBox installed on your system. You may download the current VirtualBox application at [virtualbox.org](https://www.virtualbox.org/).

## Using Packer

A detailed description and documentation on how to use Packer may be found at [packer.io -> docs](https://www.packer.io/docs/index.html). However, please find brief summery on how to build the BS/VS VirtualBox image below:

```
 $ packer build ubuntu_1804.json
```

This builds a Ubuntu 18.04 LTS server image as defined in the configuration file, i.e. ubuntu_1804.json.