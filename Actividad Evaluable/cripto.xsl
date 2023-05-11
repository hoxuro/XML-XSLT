<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="crypto_data">

        <html>
            <head>
                <title>Criptomonedas</title>
                <style>
        @importurl('https://fonts.googleapis.com/css2?family=Rubik:wght@400;500;600&amp;display=swap');
        *{
                    box-sizing: border-box;
                    margin:0;
                    padding: 0;
                    }

                    body{
                    font-size: 28px;
                    font-family: 'Rubik', sans-serif;

                    }

                    h1{
                    text-align: center;
                    font-size: 3.2rem;
                    margin-bottom: 20px;
                    }

                    table{
                    width: 100%;
                    margin: auto auto;
                    border-collapse: collapse;
                    table-layout: fixed;
                    text-align: left;
                    }

                    td{
                    padding:10px;
                    border-bottom: 1px solid black;
                    }

                    tr{
                    padding: 10px;
                    border-bottom: 1px solid black;
                    }

                    .t-header{
                    font-weight: 600;
                    font-size: 32px;
                    }

                    .bg-verde{
                    background-color: lightgreen !important;
                    }

                    .bg-blue{
                    background-color: lightblue;
                    }

                    .bold{
                    font-weight:600;
                    }
                </style>
            </head>
            <body>
                <h1>
                    Principales Criptomonedas
                </h1>
                <table>
                    <tr>
                        <td class="t-header">Nombre</td>
                        <td class="t-header">Símbolo</td>
                        <td class="t-header">Precio</td>
                        <td class="t-header">Market Cap</td>
                        <td class="t-header">Logo</td>
                    </tr>
                    <xsl:for-each select="cryptocurrency">
                        <xsl:sort select="name" />

                        <xsl:choose>
                            <xsl:when test="price>10000">
                                <tr>
                                    <td class="bg-verde">
                                        <p class="bold">
                                            <xsl:value-of select="name" />
                                        </p>
                                    </td>

                                    <td>
                                        <p>
                                            <xsl:value-of select="symbol" />
                                        </p>
                                    </td>

                                    <td>
                                        <p>
                                            <xsl:value-of select="price" />
                                        </p>
                                    </td>

                                    <td>
                                        <p>
                                            <xsl:value-of select="market_cap" />
                                        </p>
                                    </td>

                                    <td>
                                        <img width="50px" height="50px">
                                            <xsl:attribute name="src"><xsl:value-of
                                                    select="logo_url" /></xsl:attribute>
                                            <xsl:attribute name="alt"><xsl:value-of select="name" /></xsl:attribute>
                                        </img>
                                    </td>
                                </tr>
                            </xsl:when>
                            <xsl:otherwise>
                                <tr class="bg-blue">
                                    <td>
                                        <p>
                                            <xsl:value-of select="name" />
                                        </p>
                                    </td>

                                    <td>
                                        <p>
                                            <xsl:value-of select="symbol" />
                                        </p>
                                    </td>

                                    <td>
                                        <p>
                                            <xsl:value-of select="price" />
                                        </p>
                                    </td>

                                    <td>
                                        <p>
                                            <xsl:value-of select="market_cap" />
                                        </p>
                                    </td>

                                    <td>
                                        <img width="50px" height="50px">
                                            <xsl:attribute name="src"><xsl:value-of
                                                    select="logo_url" /></xsl:attribute>
                                            <xsl:attribute name="alt"><xsl:value-of select="name" /></xsl:attribute>
                                        </img>
                                    </td>
                                </tr>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>