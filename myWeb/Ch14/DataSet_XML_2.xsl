<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template match="/">
    <HTML>
      <HEAD>
        <STYLE>
          .HDR { background-color:bisque;font-weight:bold }
        </STYLE>
      </HEAD>
      <BODY>
        <TABLE>
          <COLGROUP WIDTH="50" ALIGN="CENTER"></COLGROUP>
          <COLGROUP WIDTH="100" ALIGN="LEFT"></COLGROUP>
          <COLGROUP WIDTH="200" ALIGN="LEFT"></COLGROUP>
          <COLGROUP WIDTH="100" ALIGN="LEFT"></COLGROUP>
          <TD CLASS="HDR">ID</TD>
          <TD CLASS="HDR">Time</TD>
          <TD CLASS="HDR">Title</TD>
          <TD CLASS="HDR">Author</TD>
          <xsl:for-each select="NewDataSet/test">
            <TR>
              <TD><xsl:value-of select="id"/></TD>
              <TD><xsl:value-of select="test_time"/></TD>
              <TD><xsl:value-of select="title"/></TD>
              <TD><xsl:value-of select="author"/></TD>
            </TR>
          </xsl:for-each>
        </TABLE>
      </BODY>
    </HTML>
  </xsl:template>
</xsl:stylesheet>