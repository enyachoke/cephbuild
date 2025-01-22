# Build containers for Ceph

These containers allow to build Ceph. They predownload the ceph source code and setup all dependencies within the container to build Ceph.

No longer do you need to setup a VM and or complex build system to compile Ceph.

## Build the container and prepare the environment

### Rocky Linux 8

``` docker build -t ceph-16-build --build-arg CEPH_VERSION=16.2.14 -f Dockerfile.rocky ```

### Debian 12 (Bookworm)

``` docker buildx build  --load -t ceph-19-build-debian --build-arg CEPH_VERSION=19.2.0 -f Dockerfile.debian . ```

## Build Ceph

As a default, build container creates a debug build. If you want to get an optimized production build, run with ``` -e CEPH_PROD=1 ```

Run the container with ``` docker run -v /tmp/ceph:/build ceph-16-build ```

Keep in mind that the build process takes a while and can take around 40 GBs of HDD space.
