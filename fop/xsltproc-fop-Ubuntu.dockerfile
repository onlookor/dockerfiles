FROM ubuntu

COPY fop/conf/fop.conf /usr/local/fop-2.7/fop/conf/
COPY fop/fonts/ /usr/local/fop-2.7/fop/fonts/
COPY docbook-xsl-1.79.2/ /docbook-xsl-1.79.2/

RUN apt-get update && apt-get install -y default-jre \
    && apt-get install -y locales \
    && apt-get install -y xsltproc \
    && apt-get install -y wget \
    && wget http://ftp.download-by.net/apache/xmlgraphics/fop/binaries/fop-2.7-bin.tar.gz \
    && tar -xvzf fop-2.7-bin.tar.gz -C /usr/local \
    && rm  fop-2.7-bin.tar.gz \
    && mkdir /etc/xml \
    && rm -rf /var/lib/apt/lists/* \
    && localedef -i zh_CN -c -f UTF-8 -A /usr/share/locale/locale.alias zh_CN.UTF-8

ENV LANG zh_CN.utf8
ENV LANGUAGE zh_CN:zh
ENV LC_ALL zh_CN.utf8
ENV TZ Asia/Shanghai
ENV XML_CATALOG_FILES /etc/xml/catalog
ENV PATH "$PATH:/usr/local/fop-2.7/fop"

#ENTRYPOINT ["xsltproc","--xinclude"]

#CMD ["-version"]

