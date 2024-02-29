# Build hooks

This folder can be used to add build hooks and patches to ceph before the build.
Any script that is executable and ends with ``` .sh ``` will be run before initial compilation steps.

To reference the build folder use ``` $CEPH_BUILD_DIR/ceph ``` in the scripts.

This folder can either be used when building the docker container by adding scripts here before running docker build or you can mount your own hocks directory with ``` docker run ... -v your-hooks:/hooks ```.
