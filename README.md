# anduril-base

[Anduril](http://www.anduril.org/anduril/site/) workflow engine (version 1.2) docker image built on top of Debian Wheezy.

## Installation

### Via Dockerhub

A pre-built version of this image can be installed from [Dockerhub](https://registry.hub.docker.com/u/cfrech/anduril-base/) via:

    docker pull cfrech/anduril-base
    
Total image size is ~7 Gb, so download may take a while.

### Via Dockerfile

    git clone https://github.com/Gig77/anduril-base/
    cd anduril-base
    docker build -t cfrech/anduril-base .

Installation via Dockerfile takes 2-3 hours due to many Debian and R packages being installed.

### Test

    docker run --rm -u anduril cfrech/anduril-base anduril --version

## Bundles

* Installed: `Microarray` `Tools` `Sequencing`
* Not installed: `Anima` `GROK` `CookBook` `TCGA`
* Not installed: `Moksiskaan` (coming soon as derived image)

## Configuration

* Anduril 1.2.23
* Debian 7.8
* R 3.2.0 (2015-04-16)
* Bioconductor 3.1 (BiocInstaller 1.18.2)
* Locale `en_US.UTF-8`

## Features

* Password-less login with user `anduril` (sudoer)

