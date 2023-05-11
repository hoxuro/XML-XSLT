<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="arboles">
        <!-- mi xml de arboles estaba mal hecho con el tema
         de las hojas y he tenido que 'arreglar en producción' pero he aprendido
         xsl -->
        <html>
            <head>
                <style>
                    @import url('https://fonts.googleapis.com/css2?family=Updock&amp;display=swap');
        body{
                    width:80%;
                    margin: 0 auto;

                    }

                    .updock{
                    font-family: 'Updock', cursive;
                    color: green;
                    }

                    .tema{
                    font-weight:600;
                    }

                    .container{
                    display:flex;
                    flex-direction: column;
                    align-items: center;
                    }

                    td{
                    border: 1px solid grey;
                    }

                    .tabla{
                    width: 500px;
                    border-collapse:collapse;
                    border: 3px solid green;
                    margin-bottom: 30px;
                    }

                    .txt-primavera{
                    color:green;
                    }

                    .txt-otonio{
                    color: orange;
                    }

                </style>
            </head>
            <body>
                <img src="arboles.jpg" />
                <h1 class="updock">Mi Colección de árboles</h1>
                <div class="container">
                    <xsl:for-each select="arbol">
                        <table class="tabla">
                            <tr>
                                <td class="tema">Nombre Científico:</td>
                                <td>
                                    <xsl:value-of select="@nombreCientifico" />
                                </td>
                            </tr>
                            <tr>
                                <td class="tema">Nombre comun:</td>
                                <td>
                                    <xsl:for-each select="nombreComun">
                                        <ul>
                                            <li>
                                                <xsl:value-of select="." />
                                            </li>
                                        </ul>
                                    </xsl:for-each>
                                </td>
                            </tr>
                            <tr>
                                <td class="tema">Vegetación</td>
                                <td>
                                    <xsl:value-of select="@vegetacion" />
                                </td>
                            </tr>
                            <tr>
                                <td class="tema">Altura</td>
                                <td>
                                    <xsl:value-of select="altura" />
                                </td>
                            </tr>
                            <tr>
                                <td class="tema">Forma y estructura</td>
                                <td>
                                    <ul>
                                        <li>
                                            <span class="sp">copa:</span>
                                            <xsl:value-of select="formaYEstructura/copa" />
                                        </li>
                                        <li>
                                            <span class="sp">tronco:</span>
                                            <xsl:value-of select="formaYEstructura/tronco" />
                                        </li>
                                        <li>
                                            <span class="sp">ramaje:</span>
                                            <xsl:value-of select="formaYEstructura/ramaje" />
                                        </li>
                                    </ul>
                                </td>
                            </tr>
                            <tr>
                                <td class="tema">Color</td>
                                <td>
                                    <xsl:if test="color/primavera">
                                        <p class="txt-primavera">Primavera</p>
                                                <ul>
                                            <li> Haz:<xsl:value-of
                                                    select="color/primavera/haz/hojasJovenes" />
                                            </li>
                                            <li>Enves:<xsl:value-of
                                                    select="color/primavera/enves/hojasJovenes" /></li>
                                        </ul>
                                    </xsl:if>
                                    <xsl:if test="color/otonio">
                                        <p class="txt-otonio">Otoño</p>
                                                <ul>
                                            <li> Haz:<xsl:value-of
                                                    select="color/otonio/haz/hojasViejas" />
                                            </li>
                                            <li>Enves:<xsl:value-of
                                                    select="color/otonio/enves/hojasViejas" /></li>
                                        </ul>
                                    </xsl:if>
                                </td>
                            </tr>
                        </table>
                    </xsl:for-each>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>

<!-- <table class="bordeTabla">


tengo q saber el evento borrado all
actializar e insertar new
                                <tr>
                                    <td>Nombre científico</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>Nombre común</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>Vegetación</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>Altura</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>Forma y estructura</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>Color</td>
                                    <td></td>
                                </tr>
                            </table> -->