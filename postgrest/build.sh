#!/bin/bash
# Output directories
mkdir $GITHUB_WORKSPACE/postgrest/bin
mkdir $GITHUB_WORKSPACE/postgrest/lib

# Copy binaries
cp /tmp/postgrest/bin/postgrest $GITHUB_WORKSPACE/postgrest/bin

# Copy required libs to /lib
cp /usr/lib64/libpq.so* $GITHUB_WORKSPACE/postgrest/lib
cp /usr/lib64/libpgtypes.so* $GITHUB_WORKSPACE/postgrest/lib
cp /usr/lib64/libecpg.so* $GITHUB_WORKSPACE/postgrest/lib
cp /usr/lib64/libecpg_compat.so* $GITHUB_WORKSPACE/postgrest/lib
cp /usr/lib64/libldap_r* $GITHUB_WORKSPACE/postgrest/lib
cp /usr/lib64/liblber* $GITHUB_WORKSPACE/postgrest/lib
cp /usr/lib64/libsasl2* $GITHUB_WORKSPACE/postgrest/lib
cp /usr/lib64/libssl3* $GITHUB_WORKSPACE/postgrest/lib
cp /usr/lib64/libsmime3* $GITHUB_WORKSPACE/postgrest/lib
cp /usr/lib64/libnss3* $GITHUB_WORKSPACE/postgrest/lib

# Create tarball
cd $GITHUB_WORKSPACE/postgrest
tar -czvf postgrest.tar.gz bin lib

echo "::set-output name=tarball::postgrest/postgrest.tar.gz"
