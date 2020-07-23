FROM adoptopenjdk:11-jre-hotspot as forbuild
ARG AOZORA_EPUB3=AozoraEpub3-1.1.0b46.zip
ARG KINDLEGEN=kindlegen_linux_2.6_i386_v2_9.tar.gz

RUN apt-get update
RUN apt-get install -y unzip
RUN mkdir -p /work /app/AozoraEpub3
COPY $KINDLEGEN /work
COPY $AOZORA_EPUB3 /work
RUN cd /work && \
    tar xzf $KINDLEGEN && \
    cp kindlegen /app/kindlegen && \
    cd /app/AozoraEpub3 && \
    unzip /work/$AOZORA_EPUB3

FROM adoptopenjdk:11-jre-hotspot
RUN apt-get update && \
    apt-get install -y xvfb libxrender1 libxtst6 libxi6 && \
    apt-get clean
COPY --from=forbuild /app /app
COPY ./AozoraEpub3.ini /app/AozoraEpub3
COPY entrypoint.sh /
RUN chmod a+x /entrypoint.sh

WORKDIR /work

ENTRYPOINT ["/entrypoint.sh"]
