<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="text" encoding="iso-8859-1" />
<xsl:strip-space elements="*" />
<xsl:template match="product">
	<xsl:if test="not(combin)">
	<xsl:value-of select="id" /><xsl:text>|</xsl:text><!-- ID -->
	<xsl:value-of select="stav" /><xsl:text>|</xsl:text><!-- Active (0/1) -->
	<xsl:value-of select="normalize-space(translate(nazev, '&#8211;', ''))" /><xsl:text> (</xsl:text><xsl:value-of select="id" /><xsl:text>)</xsl:text><xsl:text>|</xsl:text><!-- Name * -->
        <xsl:for-each select="categories/category"><xsl:value-of select="." /><xsl:text>@</xsl:text></xsl:for-each><xsl:text>|</xsl:text><!-- Categories (x@y@z...) -->
	<xsl:variable name="kod" select="kod" /><xsl:value-of select="document('../in/export_client.xml')//item[@kod=$kod]/@price * 1.25" /><xsl:text>|</xsl:text><!-- Price tax excluded or Price tax included -->
	<xsl:text>|</xsl:text><!-- Tax rules ID -->
	<xsl:text>|</xsl:text><!-- Wholesale price -->
	<xsl:text>|</xsl:text><!-- On sale (0/1) -->
	<xsl:text>|</xsl:text><!-- Discount amount -->
	<xsl:text>|</xsl:text><!-- Discount percent -->
	<xsl:text>|</xsl:text><!-- Discount from (yyyy-mm-dd) -->
	<xsl:text>|</xsl:text><!-- Discount to (yyyy-mm-dd) -->
	<xsl:value-of select="kod" /><xsl:text>|</xsl:text><!-- Reference # -->
	<xsl:value-of select="kod" /><xsl:text>|</xsl:text><!-- Supplier reference # -->
	<xsl:text>|</xsl:text><!-- Supplier -->
	<xsl:text>|</xsl:text><!-- Manufacturer -->
	<xsl:value-of select="prodean" /><xsl:text>|</xsl:text><!-- EAN13 -->
	<xsl:text>|</xsl:text><!-- UPC -->
	<xsl:text>|</xsl:text><!-- Ecotax -->
	<xsl:text>|</xsl:text><!-- Width -->
	<xsl:text>|</xsl:text><!-- Height -->
	<xsl:text>|</xsl:text><!-- Depth -->
	<xsl:value-of select="weight" /><xsl:text>|</xsl:text><!-- Weight -->
	<xsl:text>999</xsl:text><xsl:text>|</xsl:text><!-- Quantity -->
	<xsl:text>|</xsl:text><!-- Minimal quantity -->
	<xsl:text>|</xsl:text><!-- Visibility -->
	<xsl:text>|</xsl:text><!-- Additional shipping cost -->
	<xsl:text>|</xsl:text><!-- Unity -->
	<xsl:text>|</xsl:text><!-- Unit price ratio -->
	<xsl:value-of select="normalize-space(translate(translate(popis, '&lt;p&gt;', ''), '&lt;/p&gt;', ''))" /><xsl:text>|</xsl:text><!-- Short description -->
	<xsl:value-of select="normalize-space(translate(translate(popis, '&lt;p&gt;', ''), '&lt;/p&gt;', ''))" /><xsl:text>|</xsl:text><!-- Description -->
	<xsl:text>|</xsl:text><!-- Tags (x@y@z...) -->
	<xsl:value-of select="nazev" /><xsl:text> (</xsl:text><xsl:value-of select="id" /><xsl:text>)</xsl:text><xsl:text>|</xsl:text><!-- Meta title -->
	<xsl:text>|</xsl:text><!-- Meta keywords -->
	<xsl:value-of select="normalize-space(translate(translate(substring(popis,1,255), '&lt;p&gt;', ''), '&lt;/p&gt;', ''))"/><xsl:text>|</xsl:text><!-- Meta description -->
	<xsl:value-of select="translate(substring(url,25,500), '/', '')" /><xsl:text>|</xsl:text><!-- URL rewritten -->
	<xsl:text>|</xsl:text><!-- Text when in stock -->
	<xsl:text>|</xsl:text><!-- Text when backorder allowed -->
	<xsl:text>|</xsl:text><!-- Available for order (0 = No@ 1 = Yes) -->
	<xsl:text>|</xsl:text><!-- Product available date -->
	<xsl:text>|</xsl:text><!-- Product creation date -->
	<xsl:text>|</xsl:text><!-- Show price (0 = No@ 1 = Yes) -->
	<xsl:value-of select="image" /><xsl:choose><xsl:when test="images/image"><xsl:text>@</xsl:text></xsl:when></xsl:choose><xsl:for-each select="images/image"><xsl:value-of select="." /><xsl:choose><xsl:when test="position() != last()">@</xsl:when></xsl:choose></xsl:for-each><xsl:text>|</xsl:text><!-- Image URLs (x,y,z...) -->
	<xsl:text>|</xsl:text><!-- Delete existing images (0 = No@ 1 = Yes) -->
        <xsl:for-each select="parameters/item"><xsl:value-of select="@name" /><xsl:text>:</xsl:text><xsl:value-of select="." /><xsl:text>::</xsl:text><xsl:text>@</xsl:text></xsl:for-each><xsl:text>|</xsl:text><!-- Feature(Name:Value:Position:Customized) -->
	<xsl:text>|</xsl:text><!-- Available online only (0 = No@ 1 = Yes) -->
	<xsl:text>|</xsl:text><!-- Condition -->
	<xsl:text>|</xsl:text><!-- Customizable (0 = No@ 1 = Yes) -->
	<xsl:text>|</xsl:text><!-- Uploadable files (0 = No@ 1 = Yes) -->
	<xsl:text>|</xsl:text><!-- Text fields (0 = No@ 1 = Yes) -->
	<xsl:text>|</xsl:text><!-- Action when out of stock -->
	<xsl:text>|</xsl:text><!-- ID / Name of shop  -->
	<xsl:text>|</xsl:text><!-- Advanced Stock Management  -->
	<xsl:text>|</xsl:text><!-- Depends on stock  -->
	<xsl:text>|</xsl:text><!-- Warehouse -->
	<xsl:text>&#10;</xsl:text><!-- Newline -->
        <xsl:apply-templates select="product" />
	</xsl:if>
</xsl:template>
<!-- etc -->
</xsl:stylesheet>
