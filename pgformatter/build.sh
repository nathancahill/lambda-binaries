#!/bin/bash
# Output directories
mkdir $GITHUB_WORKSPACE/pgformatter/bin

# Copy binaries
cp /tmp/pgformatter/pgFormatter-4.3/pg_format $GITHUB_WORKSPACE/postgrest/bin

# Create tarball
cd $GITHUB_WORKSPACE/pgformatter
tar -czvf pgformatter.tar.gz bin

echo "::set-output name=tarball::pgformatter/pgformatter.tar.gz"
