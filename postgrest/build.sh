#!/bin/bash
yum install -y perl make automake gcc gmp-devel libffi zlib xz tar gzip git gnupg postgresql-devel
curl -sSL https://get.haskellstack.org/ | sh

# Output directories
mkdir /github/home/postgrest/bin
mkdir /github/home/postgrest/lib

# Build from source to /bin
git clone https://github.com/PostgREST/postgrest.git /tmp/postgrest
cd /tmp/postgrest
stack build --install-ghc --copy-bins --local-bin-path /github/home/postgrest/bin

# Copy required libs to /lib
cp /usr/lib64/libpq.so* /github/home/postgrest/lib
cp /usr/lib64/libpgtypes.so* /github/home/postgrest/lib
cp /usr/lib64/libecpg.so* /github/home/postgrest/lib
cp /usr/lib64/libecpg_compat.so* /github/home/postgrest/lib

# Create tarball
cd /github/home/postgrest
tar -czvf postgrest.tar.gz bin lib

echo "::set-output name=tarbar::postgrest/postgrest.tar.gz"
