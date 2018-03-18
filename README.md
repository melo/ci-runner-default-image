# Docker build image #

This image install some useful commands to the [Ubuntu official image](https://hub.docker.com/_/ubuntu), that make it easier to use as base image for Gitlab CI/CD runners.

The following packages are installed:

* git;
* curl;
* jq;
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


# Helper commands

We also include some helpers for common CI tasks.

## `cmd-retry`

The `cmd-retry` helper will repeat the execution of the command given as parameter while a specific
string shows up in the output. For example:

    cmd-retry "502 Bad Gateway" docker login -u gitlab-ci-token -p $CI_BUILD_TOKEN $CI_REGISTRY

This will retry the `docker login` command while the `502 Bad gateway` shows in the command output.
The command will pause 5 seconds between retries and will retry at most 60 seconds.

## `ci-bootstrap`

This command, usually used on `before_script` blocks, will output several pieces of information
that might be useful to diagnose issues with your jobs.

It will also login into the Gitlab Registry using the environment variable `CI_BUILD_TOKEN`.

In particular:

* Gitlab Registry information;
* Dump of all environment variables that end in `_IMAGE`: we tipically use a `variables` block with
  `BUILD_IMAGE` and `RELEASE_IMAGE` entries to be reused on multiple jobs;
* The version of some utilities: `git`, `docker`, and `docker-compose`;
* If a Perl project is detected, we will also output the `perl` version and list the `cpanfile*` files. 


## `docker-push-retry`

This is just a small wrapper script that will accept all of `docker push` arguments and wrap it
with a `cmd-retr '502 Bad Gateway'` to work around some unstable Docker Registries.
