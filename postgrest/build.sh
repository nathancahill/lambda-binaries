#!/bin/bash
yum install -y perl make automake gcc gmp-devel libffi zlib xz tar gzip git gnupg postgresql-devel
curl -sSL https://get.haskellstack.org/ | sh

# Output directories
mkdir $GITHUB_WORKSPACE/postgrest/bin
mkdir $GITHUB_WORKSPACE/postgrest/lib

# Build from source to /bin
git clone https://github.com/PostgREST/postgrest.git /tmp/postgrest
cd /tmp/postgrest
mkdir $HOME/.stack
stack build --install-ghc --copy-bins --local-bin-path $GITHUB_WORKSPACE/postgrest/bin

# Copy required libs to /lib
cp /usr/lib64/libpq.so* $GITHUB_WORKSPACE/postgrest/lib
cp /usr/lib64/libpgtypes.so* $GITHUB_WORKSPACE/postgrest/lib
cp /usr/lib64/libecpg.so* $GITHUB_WORKSPACE/postgrest/lib
cp /usr/lib64/libecpg_compat.so* $GITHUB_WORKSPACE/postgrest/lib
cp /usr/lib64/libldap_r* $GITHUB_WORKSPACE/postgrest/lib
cp /usr/lib64/liblber* $GITHUB_WORKSPACE/postgrest/lib

# Create tarball
cd $GITHUB_WORKSPACE/postgrest
tar -czvf postgrest.tar.gz bin lib

echo "::set-output name=tarball::postgrest/postgrest.tar.gz"
