<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<html>
<head>
    <title>RTMP Statistics</title>
    <style>
        body { font-family: sans-serif; background: #222; color: #eee; }
        table { border-collapse: collapse; width: 100%; margin-bottom: 20px; }
        th, td { padding: 8px; border: 1px solid #444; text-align: left; }
        th { background: #333; }
        tr:nth-child(even) { background: #2a2a2a; }
    </style>
</head>
<body>
    <h1>RTMP Statistics</h1>
    <xsl:for-each select="rtmp/server/application">
        <h2>Application: <xsl:value-of select="name"/></h2>
        <table>
            <tr><th>Stream</th><th>Clients</th><th>In Bitrate</th><th>Out Bitrate</th><th>Status</th></tr>
            <xsl:for-each select="live/stream">
                <tr>
                    <td><xsl:value-of select="name"/></td>
                    <td><xsl:value-of select="nclients"/></td>
                    <td><xsl:value-of select="round(bw_in div 1024)"/> kbps</td>
                    <td><xsl:value-of select="round(bw_out div 1024)"/> kbps</td>
                    <td>Streaming</td>
                </tr>
            </xsl:for-each>
        </table>
    </xsl:for-each>
</body>
</html>
</xsl:template>
</xsl:stylesheet>
