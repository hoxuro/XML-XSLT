<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="universidad">
        <html>
            <head>
                <title>Universidad</title>
                <style>
                @import url('https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&amp;display=swap');
                
                    body {
                    width: 80%;
                    margin: auto auto;
                    font-family: 'Roboto', sans-serif;
                    }

                    table {
                    border: 4px solid green;
                    width: 80%;
                    margin: 0 auto;
                    table-layout: fixed;
                    border-collapse: collapse;
                    margin-bottom: 40px;
                    }

                    th,
                    td {
                    border: 1px solid grey;
                    }

                    th{
                        text-align: right;
                        padding-right: 20px;
                    }
                    
                    td{
                        padding-left:20px;
                        text-align: left;
                    }

                    .nombre-asignatura {
                    font-weight: 600;
                    }

                    .centrar{
                        text-align: center;
                    }

                </style>
            </head>
            <body>
                <xsl:for-each select="alumnos/alumno">
                <xsl:variable name="cod_carrera" select="estudios/carrera/@codigo" />
                    <table>
                        <tr>
                            
                            <xsl:choose>
                            <xsl:when test="@beca='si'">
                                <th style="width: 25%">Alumno</th>
                                <td style="width: 60%;">
                                    <xsl:value-of select="nombre" />,
                                    <xsl:value-of select="apellido1" />&#160;
                                    <xsl:value-of select="apellido2" />
                                </td>
                                <td style="width: 15%">
                                    <div class="centrar">
                                    <img
                                        src="https://cdn-icons-png.flaticon.com/512/6926/6926264.png"
                                        width="50px"
                                        height="50px"
                                    />
                                    </div>
                                </td>
                            </xsl:when>
                            <xsl:otherwise>
                                <th style="width: 25%">Alumno</th>
                                <td style="width: 75%" colspan="2">
                                    <xsl:value-of select="nombre" />,
                                    <xsl:value-of select="apellido1" />&#160;
                                    <xsl:value-of select="apellido2" />
                                </td>
                            </xsl:otherwise>
                            </xsl:choose>
                        </tr>
                        <tr>
                            <th>Titulación</th>
                            <td colspan="2"><xsl:value-of select="../../carreras/carrera[@id=$cod_carrera]/nombre" /></td>
                        </tr>
                        <tr>
                            <th>Asignaturas que cursa</th>
                            <td colspan="2">
                                <div>
                                        <xsl:for-each select="estudios/asignaturas/asignatura" >
                                        <xsl:variable name="cod_asignatura" select="@codigo" />
                                        
                                        <!-- Yo hubiera seleccionado las asignaturas de la titulacion pero para que salga como en el ejemplo es asi -->
                                        <p class="nombre-asignatura">
                                            <xsl:value-of select="../../../../../asignaturas/asignatura[@id=$cod_asignatura]/nombre" />
                                        </p>
                                                <ul>
                                                    <li>Creditos teoricos: <xsl:value-of select="../../../../../asignaturas/asignatura[@id=$cod_asignatura]/creditos_teoricos" /></li>
                                                    <li>Creditos practicos: <xsl:value-of select="../../../../../asignaturas/asignatura[@id=$cod_asignatura]/creditos_practicos" /></li>
                                                </ul> 
                                        </xsl:for-each>                    
                                </div>
                            </td>
                        </tr>
                    </table>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>