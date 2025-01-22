#!/bin/env bash

set -e  # exit on error

[ -d "${CEPH_BUILD_DIR}/ceph" ] && rm -r "${CEPH_BUILD_DIR}/ceph"

echo "Extracting the Ceph ${CEPH_VERSION} source code to build directory ${CEPH_BUILD_DIR}..."
tar -C "${CEPH_BUILD_DIR}" -xzf "${CEPH_SRC_DIR}/ceph-${CEPH_VERSION}.tar.gz"
mkdir -p "${CEPH_BUILD_DIR}"
cd "${CEPH_BUILD_DIR}/ceph-${CEPH_VERSION}/"

echo "Running hooks..."
for hook in ${CEPH_HOOKS_DIR}/*.sh; do
    if [ -x "${hook}" ]; then
        echo "Running hook ${hook}..."
        bash "${hook}"
    fi
done

echo "Building the Ceph ${CEPH_VERSION} source code..."
if [ -z "${CEPH_PROD}" ] && [ "${CEPH_PROD}" == "1" ]; then 
    ./do_cmake.sh -DCMAKE_BUILD_TYPE=RelWithDebInfo
else
    ./do_cmake.sh
fi

echo "Completing build with Ninja (Ceph 17+)..."
cd build
ninja