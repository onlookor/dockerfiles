FROM alpine

RUN apk --no-cache add ca-certificates wget tzdata libxslt docbook-xsl openjdk17-jre \
    && wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub \
    && wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.35-r0/glibc-2.35-r0.apk \
    && wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.35-r0/glibc-bin-2.35-r0.apk \
    && wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.35-r0/glibc-i18n-2.35-r0.apk \
    && apk add glibc-bin-2.35-r0.apk glibc-i18n-2.35-r0.apk glibc-2.35-r0.apk \
    && rm -rfv glibc-bin-2.35-r0.apk glibc-i18n-2.35-r0.apk glibc-2.35-r0.apk \
    && /usr/glibc-compat/bin/localedef -i zh_CN -c -f UTF-8 zh_CN.UTF-8 \
    && wget http://ftp.download-by.net/apache/xmlgraphics/fop/binaries/fop-2.7-bin.tar.gz \
    && tar -xvzf fop-2.7-bin.tar.gz -C /usr/local \
    && rm  fop-2.7-bin.tar.gz \

#COPY ./locale.md /locale.md

#RUN cat locale.md | xargs -i /usr/glibc-compat/bin/localedef -i {} -f UTF-8 {}.UTF-8 \
#    && rm -rfv locale.md

COPY fop/conf/fop.conf /usr/local/fop-2.7/fop/conf/
COPY fop/fonts/ /usr/local/fop-2.7/fop/fonts/

ENV LANG zh_CN.utf8
ENV LANGUAGE zh_CN:zh
ENV LC_ALL zh_CN.utf8
ENV TZ Asia/Shanghai
ENV XML_CATALOG_FILES /etc/xml/catalog
ENV PATH "$PATH:/usr/local/fop-2.7/fop"

#ENTRYPOINT ["xsltproc","--xinclude"]

#CMD ["-version"]

