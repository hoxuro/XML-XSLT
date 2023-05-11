<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="almacen">
        <html>
            <head>
                <title>Document</title>
                <style>
                    @import
        url("https://fonts.googleapis.com/css2?family=Rubik:wght@400;500;600;700&amp;display=swap");
        *{
                    box-sizing:border-box;
                    margin: 0;
                    padding: 0;
                    }

                    h2{
                    margin: 30px 0;
                    }

                    body {
                    width: 80%;
                    margin: 0 auto;
                    font-family: "Rubik", sans-serif;
                    }

                    table {
                    border-collapse: collapse;
                    border: 6px solid slateblue;
                    }

                    .table-main {
                    width: 100%;
                    }

                    .table-sec {
                    float: right;
                    border-top: none;
                    }

                    td,
                    th {
                    border: 1px solid black;
                    padding: 10px 20px;
                    }

                    th {
                    font-size: 20px;
                    background-color: rgba(47, 47, 187, 0.338);
                    }

                    .bold{
                    font-weight: 700;
                    }

                    .no-border-top{
                        border-top: none;
                    }
                </style>
            </head>
            <body>
                <div class="container">
                    <h2> Fecha: <xsl:value-of select="factura/fechafact/@dia" /> de <xsl:value-of
                            select="factura/fechafact/@mes" /> de <xsl:value-of
                            select="factura/fechafact/@año" />
                    </h2>
                    <p>Factura Simplificada <span class="bold">
                            <xsl:value-of select="factura/@idfact" />
                        </span></p>
                    <table class="table-main">
                        <tr>
                            <th>Concepto</th>
                            <th>PVP</th>
                            <th>Unidades</th>
                            <th>Total</th>
                        </tr>
                        <xsl:for-each select="factura/lineafact">
                            <xsl:variable name="idprodfactura" select="@idprodfact" />
                        <tr>
                                <td>
                                    <xsl:value-of
                                        select="../../producto[@idprod=$idprodfactura]/nombreprod" />
                                </td>
                                <td>
                                    <xsl:value-of
                                        select="../../producto[@idprod=$idprodfactura]/pvpprod" />
                                </td>
                                <td>
                                    <xsl:value-of select="@cantidadfact" />
                                </td>
                                <td>
                                    <xsl:value-of select="@total" />
                                </td>
                            </tr>

                        </xsl:for-each>
                    </table>

                    <table class="table-sec">
                        <tr class="no-border-top">
                            <th class="no-border-top">Subtotal</th>
                            <td class="no-border-top">
                                <xsl:value-of select="factura/subtotalfact" />
                            </td>
                        </tr>
                        <tr>
                            <th>I.V.A 21%</th>
                            <td>
                                <xsl:value-of select="factura/ivafact" />
                            </td>
                        </tr>
                        <tr>
                            <th>Importe</th>
                            <td>
                                <xsl:value-of select="factura/importefact" />
                            </td>
                        </tr>
                    </table>
                </div>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>