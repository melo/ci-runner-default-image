# Docker build image #

This image install some useful commands to the [Ubuntu official image](https://hub.docker.com/_/ubuntu), that make it easier to use as base image for Gitlab CI/CD runners.

The following packages are installed:

* git;
* curl;
* nodejs and npm;
* perl;
* docker;
* docker-compose;
* redis client;
* mysql client.

The following `npm` modules are installed, globally:

* uglifyjs: JS minifier;
* csso: a semantic CSS minifier.

The following Perl modules are installed, globally:

* App::cpanminus;
* Carton.

There is also a command available, `cmd-retry`, that executes the command given as parameter while
a specific string shows up in the output. For example:

    cmd-retry "502 Bad Gateway" docker login -u gitlab-ci-token -p $CI_BUILD_TOKEN $CI_REGISTRY

This will retry the `docker login` command while the `502 Bad gateway` shows in the command output.
The command will pause 5 seconds between retries and will retry at most 60 seconds.

