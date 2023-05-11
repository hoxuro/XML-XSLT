<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="recetas">

        <html>
            <head>
                <title>RECETAS</title>
                <style>
                    body {
                    width: 80%;
                    margin: 0 auto;
                    font-family: Arial, Helvetica, sans-serif;
                    }

                    table {
                    margin: 20px 0;
                    width: 100%;
                    border: 3px solid teal;
                    border-collapse: collapse;
                    }

                    .no-padding {
                    padding: 0px !important;
                    }

                    .txt-center {
                    text-align: center;
                    }

                    th,
                    td {
                    padding: 10px 20px;
                    border: 1px solid grey;
                    }

                    th {
                    background-color: teal;
                    color: #fff;
                    }
                </style>
            </head>
            <body>

                <xsl:for-each select="receta">
                    <table>
                        <tr>
                            <th class="no-padding" colspan="6">Recetas de cocina</th>
                        </tr>
                        <tr>
                            <th>Nombre:</th>
                            <td class="txt-center">
                                <xsl:value-of select="nombre" />
                            </td>
                            <th>Tipo:</th>
                            <td class="txt-center">
                                <xsl:value-of select="tipo/@definicion" />
                            </td>
                            <th>Dificultad</th>
                            <td class="txt-center">
                                <xsl:if test="dificultad='Fácil'">
                                    <img
                                        src="https://cdn-icons-png.flaticon.com/512/2177/2177012.png"
                                        alt="fácil" width="50px" height="50px" />
                                </xsl:if>
                                <xsl:if test="dificultad='Media'">
                                    <img
                                        src="https://cdn-icons-png.flaticon.com/512/4334/4334580.png"
                                        alt="Media" width="50px" height="50px" />
                                </xsl:if>
                                <xsl:if test="dificultad='Difícil'">
                                    <img
                                        src="https://cdn-icons-png.flaticon.com/512/4501/4501263.png"
                                        alt="Difícil" width="50px" height="50px" />
                                </xsl:if>
                            </td>
                        </tr>
                        <tr>
                            <th>Ingredientes</th>
                            <td colspan="5">

                                <ul>
                                    <xsl:for-each select="ingredientes/ingrediente">
                                        <li>
                                            <xsl:value-of select="@nombre" /> - <xsl:value-of
                                                select="@cantidad" />
                                        </li>
                                    </xsl:for-each>
                                </ul>


                            </td>
                        </tr>
                        <tr>
                            <th>Pasos:</th>
                            <td colspan="5">
                                <ol>
                                    <xsl:for-each select="pasos/paso">
                                        <xsl:sort select="orden" />
                                        <li>
                                            <xsl:value-of select="." />
                                        </li>
                                    </xsl:for-each>
                                </ol>
                            </td>
                        </tr>
                        <tr>
                            <th class="no-padding">Elaboración:</th>
                            <td class="no-padding txt-center">
                                <xsl:value-of select="elaboracion" />
                            </td>
                            <th class="no-padding">Tiempo:</th>
                            <td class="no-padding txt-center">
                                <xsl:value-of select="tiempo" />
                            </td>
                            <th class="no-padding">Calorias</th>
                            <td class="no-padding txt-center">
                                <xsl:value-of select="calorias" />
                            </td>
                        </tr>
                    </table>
                </xsl:for-each>
            </body>
        </html>

    </xsl:template>

</xsl:stylesheet>