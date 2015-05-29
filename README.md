# anduril-base

Dockerfile and build context for Anduril 1.2.23 on top of Debian Wheezy (7.8).

## Installation

    git clone https://github.com/Gig77/anduril-base/
    cd anduril-base
    bash ./build.sh

Note that installation via Dockerfile takes several hours, mostly due to _many_ R packages being installed. A pre-built image is availabe at Dockerhub, which can be installed faster using `docker pull cfrech/anduril-base`.

## Bundles

* Installed: `Microarray` `Tools` `Sequencing`
* Not installed: `Anima` `GROK` `CookBook`
* Not installed: `Moksiskaan` (use [anduril-moksiskaan](https://github.com/Gig77/anduril-moksiskaan) instead)

## Additional features

* R version 3.2.0 (2015-04-16)
* Bioconductor version 3.1 (BiocInstaller 1.18.2)
* Locale `en_US.UTF-8`
* Passwordless login with user `anduril` (sudoer)

