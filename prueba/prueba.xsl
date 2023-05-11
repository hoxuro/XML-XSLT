<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <!-- DOCUMENTO DE SALIDA -->
    <xsl:output method="html" indent="yes" />

    <!-- CONTENIDO -->
    <xsl:template match="biblioteca">
        <html>
            <head>
                <title>Mi biblioteca</title>
                <style>
                    h2{
                    color: crimson;
                    }
                </style>
            </head>
            <body>
            <table>
                
            
            
            </table>
                <xsl:for-each select="libro">
                    <xsl:if test="fechaPublicacion/@año = '1973'">
                        <h2>
                            <xsl:value-of select="titulo" />
                        </h2>
                    <h3>
                            <xsl:value-of select="fechaPublicacion/@año" />
                        </h3>
                    <ul>
                            <li>
                                <xsl:value-of select="autor" />
                            </li>
                        </ul>
                    </xsl:if>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>