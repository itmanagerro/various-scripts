<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="text" encoding="iso-8859-1" />
<xsl:strip-space elements="*" />
<xsl:template match="product">
        <xsl:if  test="combin and vlastnosti" >
                <xsl:variable name="notValidChars">+, </xsl:variable>
                <xsl:variable name="parent" select="parent" />
                <xsl:variable name="itemid" select="parameters/item[@id = '25' or @id = '26']/@name" />
                <!-- <xsl:variable name="itemvalue" select="parameters/item[@id = '25' or @id = '26']/." /> -->
                <xsl:variable  name="itemvalue" select="translate(substring(combin,4,20), '_', '')" />
                <xsl:variable name="vlastnost" select="vlastnosti/vlastnost/@name" />
                <xsl:variable name="kod" select="kod" />
                <xsl:variable name="image" select="images/image/." />
                <xsl:for-each select="vlastnosti/vlastnost/hodnota">
                        <xsl:value-of select="$parent" /><xsl:text>|</xsl:text> <!-- Product ID* -->
                        <xsl:value-of select="$itemid" /><xsl:text>:select:0</xsl:text><xsl:text>@</xsl:text><xsl:value-of select="$vlastnost" /><xsl:text>:select:1|</xsl:text> <!-- Attribute (Name:Type:Position)* -->
                        <xsl:value-of select="$itemvalue" /><xsl:text>:0@</xsl:text><xsl:value-of select="@name" /><xsl:text>:1|</xsl:text> <!-- Value (Value:Position)* -->
                        <xsl:value-of select="$kod" /><xsl:text>|</xsl:text> <!-- Supplier reference -->
                        <xsl:value-of select="$kod" /><xsl:text> </xsl:text><xsl:value-of select="concat(translate(substring(@name, 1, 1), 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'), substring(@name, 2))" /><xsl:text>|</xsl:text> <!-- Reference -->
                        <xsl:text>|</xsl:text><!-- EAN13 -->
                        <xsl:text>|</xsl:text><!-- UPC -->
                        <xsl:text>|</xsl:text><!-- Wholesale price -->
                        <xsl:text>|</xsl:text><!-- Impact on price -->
                        <xsl:text>|</xsl:text><!-- Ecotax -->
                        <xsl:text>999</xsl:text><xsl:text>|</xsl:text><!-- Quantity -->
                        <xsl:text>|</xsl:text><!-- Minimal quantity -->
                        <xsl:text>|</xsl:text><!-- Impact on weight -->
                        <xsl:text>|</xsl:text><!-- Default (0 = No, 1 = Yes) -->
                        <xsl:text>|</xsl:text><!-- Image position -->
                        <xsl:value-of select="$image" /><xsl:text>|</xsl:text><!-- Image URL -->
                        <xsl:text>|</xsl:text><!-- Delete existing images (0 = No, 1 = Yes). -->
                        <xsl:text>|</xsl:text><!-- ID / Name of shop -->
                        <xsl:text>|</xsl:text><!-- Advanced Stock Management -->
                        <xsl:text>|</xsl:text><!-- Depends on stock -->
                        <xsl:text>|</xsl:text><!-- Warehouse -->
                        <xsl:text>&#10;</xsl:text><!-- Newline -->
                </xsl:for-each>
        </xsl:if>
</xsl:template>

</xsl:stylesheet>
