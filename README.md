# Docker build image #

This image install some useful commands to the [Ubuntu official image](https://hub.docker.com/_/ubuntu), that make it easier to use as base image for Gitlab CI/CD runners.

The following packages are installed:

* git;
* nodejs and npm;
* docker;
* docker-compose.

The following `npm` modules are installed, globally:

* uglifyjs: JS minifier;
* csso: a semantic CSS minifier.
