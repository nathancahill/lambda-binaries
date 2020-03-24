FROM lambci/lambda:build-nodejs12.x

RUN echo $(ls -1 /github/home)
RUN echo $(ls -1 /github/workflow)
RUN echo $(ls -1 /github/workspace)

ENTRYPOINT ["/github/home/postgrest/build.sh"]
