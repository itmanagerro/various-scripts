<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="text" encoding="iso-8859-1" />
<xsl:strip-space elements="*" />
<xsl:template match="product">
	<xsl:if test="combin and not(vlastnosti)">
		<xsl:value-of select="parent" /><xsl:text>|</xsl:text><!-- Product ID* -->
		<xsl:value-of select="parameters/item[@id = '25' or @id = '26']/@name" /><xsl:text>:select:0</xsl:text><xsl:text>|</xsl:text><!-- Attribute (Name:Type:Position)* -->
	        <xsl:value-of select="translate(substring(combin,4,20), '_', '')" /><xsl:text>:0</xsl:text><xsl:text>|</xsl:text><!-- Value (Value:Position)* -->
		<xsl:value-of select="kod" /><xsl:text>|</xsl:text><!-- Supplier reference -->
		<xsl:value-of select="kod" /><xsl:text>|</xsl:text><!-- Reference -->
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
		<xsl:value-of select="image" /><xsl:text>|</xsl:text><!-- Image URL -->
		<xsl:text>|</xsl:text><!-- Delete existing images (0 = No, 1 = Yes). -->
		<xsl:text>|</xsl:text><!-- ID / Name of shop -->
		<xsl:text>|</xsl:text><!-- Advanced Stock Management -->
		<xsl:text>|</xsl:text><!-- Depends on stock -->
		<xsl:text>|</xsl:text><!-- Warehouse -->
		<xsl:text>&#10;</xsl:text><!-- Newline -->
	        <xsl:apply-templates select="product" />
	</xsl:if>
</xsl:template>
<!-- etc -->

</xsl:stylesheet>
