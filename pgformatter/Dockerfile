FROM lambci/lambda:build-nodejs12.x

RUN yum install -y perl perl-core perl-devel cpanminus
RUN curl -o /tmp/pgFormatter.tar.gz -sSL https://github.com/darold/pgFormatter/archive/v4.3.tar.gz
RUN mkdir /tmp/pgformatter
WORKDIR /tmp/pgformatter
RUN tar -zxf /tmp/pgFormatter.tar.gz
WORKDIR /tmp/pgformatter/pgFormatter-4.3
RUN cpanm pp
RUN mv pg_format pg_format.pl
RUN pp -M=pgFormatter::CLI -M=pgFormatter::Beautify --lib=lib -u -o pg_format pg_format.pl

COPY build.sh /build.sh

ENTRYPOINT ["/build.sh"]
