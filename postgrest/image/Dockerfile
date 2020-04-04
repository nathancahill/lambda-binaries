FROM lambci/lambda:build-nodejs12.x

RUN yum install -y perl make automake gcc gmp-devel libffi zlib xz tar gzip git gnupg postgresql-devel
RUN curl -o /get-stack.sh -sSL https://get.haskellstack.org/
RUN chmod +x /get-stack.sh
RUN /get-stack.sh

RUN mkdir $HOME/.stack
RUN git clone https://github.com/PostgREST/postgrest.git /tmp/postgrest
WORKDIR /tmp/postgrest
RUN git fetch --tags
RUN git checkout tags/v7.0.0
RUN mkdir bin
RUN stack build --install-ghc --copy-bins --local-bin-path /tmp/postgrest/bin