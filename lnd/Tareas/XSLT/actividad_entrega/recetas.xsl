<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/recetas">
        <html>
            <head>
                <title>Recetas de cocina canaria</title>
                <link rel="stylesheet" type="text/css" href="style.css">
            </head>
            <body>
                <header>
                    <h1>Transformación con XSLT</h1>
                    <h5>XML-HTML (a traves de xsd)</h5>
                </header>
                <div id="cabeceradescrip">
                    <h3>Mis recetas de cocina canaria</h3>
                    <p>Listado de mis recetas de cocina favoritas, características y modo de elaboración, ordenado alfabeticamente</p>
                </div>
                <xsl:apply-templates />
            </body>
        </html>
    </xsl:template>

    <xsl:template match="receta">
        <div>
            <h3>Nombre de la receta: <xsl:value-of select="nombre"/></h3>
            <p>Tipo de receta: <xsl:value-of select="tipo/@definicion"/></p>
            <p>Dificultad: <xsl:value-of select="dificultad"/></p>
            <p>Tiempo de elaboración: <xsl:value-of select="tiempo"/></p>
            <p>Calorías: <xsl:value-of select="calorias"/></p>
            <p>Esta receta puedes elaborarla en un/a: <xsl:value-of select="elaboracion"/></p>
            <table>
                <caption>Listado de ingredientes de <xsl:value-of select="nombre"/></caption>
                <tr>
                    <th>Nombre del ingrediente</th>
                    <th>Cantidad necesaria</th>
                </tr>
                <xsl:apply-templates select="ingredientes/ingrediente"/>
            </table>
            <h3>Pasos necesarios:</h3>
            <ol>
                <xsl:apply-templates select="pasos/paso"/>
            </ol>
        </div>
    </xsl:template>

    <xsl:template match="ingrediente">
        <tr>
            <td><xsl:value-of select="@nombre"/></td>
            <td><xsl:value-of select="@cantidad"/></td>
        </tr>
    </xsl:template>

    <xsl:template match="paso">
        <li><xsl:value-of select="."/></li>
    </xsl:template>
</xsl:stylesheet>
