<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
  <?xml version="1.0" encoding="UTF-8"?>
  <Route>
    <GUID>5CD6E9AA-96B0-1A5F-4C14-A8B6F00761C7</GUID>
    <modificationDate>1539014644167</modificationDate>
    <latitudeStart><xsl:value-of select="(/gpx/trk/trkseg/trkpt)[1]/@lat"/></latitudeStart>
    <longitudeStart><xsl:value-of select="(/gpx/trk/trkseg/trkpt)[1]/@lon"/></longitudeStart>
    <latitudeEnd><xsl:value-of select="(/gpx/trk/trkseg/trkpt)[last()]/@lat"/></latitudeEnd>
    <longitudeEnd><xsl:value-of select="(/gpx/trk/trkseg/trkpt)[last()]/@lon"/></longitudeEnd>
    <name>
        <xsl:value-of select='./gpx/trk/name' />
    </name>
    <description>

    </description>
    <distance>0</distance>
    <altitudeDifferencesUphill>0</altitudeDifferencesUphill>
    <altitudeDifferencesDownhill>0</altitudeDifferencesDownhill>
    <rating>0</rating>
    <autor>

    </autor>
    <webPortalId/>
    <downloadId>0</downloadId>
    <ghostData/>
    <isCircuit>0</isCircuit>
    <creationTimestamp>Mon Oct 8 18:04:04 GMT+0200 2018</creationTimestamp>
    <trackStatus>none</trackStatus>

    <RoutePoints>
      <xsl:for-each select="/gpx/trk/trkseg/trkpt">
        <RoutePoint>
          <latitude><xsl:value-of select="./@lat"/></latitude>
          <longitude><xsl:value-of select="./@lon"/></longitude>
          <altitude>0</altitude>
          <userPoint>1</userPoint>
          <routingType>imported</routingType>
          <direction>0</direction>
          <street></street>
          <useForTrack>1</useForTrack>
        </RoutePoint>
      </xsl:for-each>
    </Routepoints>

    <RoutePOIs>
      <xsl:for-each select="/gpx/wpt">
        <POI>
          <latitude><xsl:value-of select="./@lat"/></latitude>
          <longitude><xsl:value-of select="./@lon"/></longitude>
          <altitude>0</altitude>
          <name>
            <![CDATA[
            <xsl:value-of select="./name"/>
            ]]>

          </name>
          <description></description>
          <type/>
        </POI>
      </xsl:for-each>
    </RoutePOIs>
  </Route>
</xsl:template>
</xsl:stylesheet>
