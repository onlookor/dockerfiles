<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:fo="http://www.w3.org/1999/XSL/Format"
xmlns:doc="http://nwalsh.com/xsl/documentation/1.0"
exclude-result-prefixes="doc"
version="1.0">
<xsl:import href="profile-docbook.xsl"/>
<xsl:param name="body.font.family">SourceHanSerifCN-Regular</xsl:param>
<xsl:param name="body.font.master">12</xsl:param>
<xsl:param name="monospace.font.family">SourceHanSansCN-Regular</xsl:param>
<xsl:param name="title.font.family">SourceHanSansCN-Medium</xsl:param>
<xsl:param name="page.margin.inner">2cm</xsl:param>
<xsl:param name="page.margin.outer">2cm</xsl:param>
<xsl:param name="hyphenate">false</xsl:param>
<xsl:param name="paper.type" select="'A4'"/>
<xsl:param name="draft.mode" select="'no'"/>
</xsl:stylesheet>
