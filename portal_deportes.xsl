<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <html lang="es">
      <head>
        <meta charset="UTF-8"/>
        <title><xsl:value-of select="portal/cabecera/titulo"/></title>
        <link rel="stylesheet" href="styles2.css"/>
      </head>
      <body>
        <!-- Cabecera -->
        <header>
          <h1><xsl:value-of select="portal/cabecera/titulo"/></h1>
          <nav>
            <ul>
              <xsl:for-each select="portal/cabecera/menu/item">
                <li><a href="{@href}"><xsl:value-of select="."/></a></li>
              </xsl:for-each>
            </ul>
          </nav>
        </header>

        <!-- Inicio -->
        <section id="inicio">
          <h2><xsl:value-of select="portal/inicio/titulo"/></h2>
          <p><xsl:value-of select="portal/inicio/descripcion"/></p>
          <figure>
            <img>
              <xsl:attribute name="src">
                <xsl:value-of select="portal/inicio/imagen/@src"/>
              </xsl:attribute>
              <xsl:attribute name="alt">
                <xsl:value-of select="portal/inicio/imagen/@alt"/>
              </xsl:attribute>
            </img>
            <figcaption><xsl:value-of select="portal/inicio/imagen"/></figcaption>
          </figure>
        </section>

        <!-- Entrenamientos -->
        <section id="entrenamientos">
          <h2><xsl:value-of select="portal/entrenamientos/titulo"/></h2>
          <xsl:for-each select="portal/entrenamientos/plan">
            <article>
              <h3><xsl:value-of select="nombre"/></h3>
              <p><xsl:value-of select="descripcion"/></p>
            </article>
          </xsl:for-each>

          <table>
            <caption>Comparativa de Entrenamientos</caption>
            <thead>
              <tr>
                <th>Entrenamiento</th>
                <th>Duración</th>
                <th>Modalidad</th>
              </tr>
            </thead>
            <tbody>
              <xsl:for-each select="portal/entrenamientos/comparativa/entrenamiento">
                <tr>
                  <td><xsl:value-of select="@tipo"/></td>
                  <td><xsl:value-of select="@duracion"/></td>
                  <td><xsl:value-of select="@modalidad"/></td>
                </tr>
              </xsl:for-each>
            </tbody>
          </table>
        </section>

        <!-- Noticias -->
        <section id="noticias">
          <h2><xsl:value-of select="portal/noticias/titulo"/></h2>
          <xsl:for-each select="portal/noticias/noticia">
            <article>
              <h3><xsl:value-of select="titulo"/></h3>
              <p><xsl:value-of select="contenido"/></p>
            </article>
          </xsl:for-each>
        </section>

        <!-- Multimedia -->
        <section id="multimedia">
          <h2>Video de Entrenamiento</h2>
          <video controls>
            <source>
              <xsl:attribute name="src"><xsl:value-of select="portal/multimedia/video/@src"/></xsl:attribute>
              <xsl:attribute name="type">video/mp4</xsl:attribute>
            </source>
          </video>
        </section>

        <!-- Contacto -->
        <section id="contacto">
          <h2>Contacto</h2>
          <form action="enviar.php" method="POST">
            <xsl:for-each select="portal/contacto/formulario/campo">
              <label><xsl:value-of select="@nombre"/>:</label>
              <xsl:choose>
                <xsl:when test="@tipo='textarea'">
                  <textarea name="{@nombre}" required="required" rows="4"></textarea>
                </xsl:when>
                <xsl:otherwise>
                  <input type="{@tipo}" name="{@nombre}" required="required"/>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:for-each>
            <button type="submit">Enviar</button>
          </form>
        </section>

        <!-- FAQ -->
        <section id="faq">
          <h2>Preguntas Frecuentes</h2>
          <xsl:for-each select="portal/faq/pregunta">
            <details>
              <summary><xsl:value-of select="q"/></summary>
              <p><xsl:value-of select="a"/></p>
            </details>
          </xsl:for-each>
        </section>

        <!-- Recursos -->
        <aside>
          <h2>Recursos Adicionales</h2>
          <ul>
            <xsl:for-each select="portal/recursos/enlace">
              <li><a href="{@href}" target="_blank"><xsl:value-of select="."/></a></li>
            </xsl:for-each>
          </ul>
        </aside>

        <!-- Footer -->
        <footer>
          <p><xsl:value-of select="portal/footer/texto"/></p>
          <nav>
            <ul>
              <xsl:for-each select="portal/footer/menu/item">
                <li><a href="{@href}"><xsl:value-of select="."/></a></li>
              </xsl:for-each>
            </ul>
          </nav>
        </footer>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
