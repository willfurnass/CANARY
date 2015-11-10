<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xd="http://schemas.microsoft.com/office/infopath/2003" xmlns:my="http://schemas.microsoft.com/office/infopath/2003/myXSD/2010-09-24T21:30:38" version="1.0">
	<xsl:output encoding="UTF-8" method="xml"/>
	<xsl:template match="/">
		<xsl:copy-of select="processing-instruction() | comment()"/>
		<xsl:choose>
			<xsl:when test="canary">
				<xsl:apply-templates select="canary" mode="_0"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:variable name="var">
					<xsl:element name="canary"/>
				</xsl:variable>
				<xsl:apply-templates select="msxsl:node-set($var)/*" mode="_0"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="datasource" mode="_1">
		<xsl:copy>
			<xsl:attribute name="short-id">
				<xsl:value-of select="@short-id"/>
			</xsl:attribute>
			<xsl:attribute name="state">
				<xsl:choose>
					<xsl:when test="@state">
						<xsl:value-of select="@state"/>
					</xsl:when>
					<xsl:otherwise>enabled</xsl:otherwise>
				</xsl:choose>
			</xsl:attribute>
			<xsl:attribute name="type">
				<xsl:value-of select="@type"/>
			</xsl:attribute>
			<xsl:attribute name="input-type">
				<xsl:value-of select="@input-type"/>
			</xsl:attribute>
			<xsl:attribute name="output-type">
				<xsl:value-of select="@output-type"/>
			</xsl:attribute>
			<xsl:if test="location">
				<xsl:element name="location">
					<xsl:copy-of select="location/text()[1]"/>
				</xsl:element>
			</xsl:if>
			<xsl:if test="ipaddress">
				<xsl:element name="ipaddress">
					<xsl:copy-of select="ipaddress/text()[1]"/>
				</xsl:element>
			</xsl:if>
			<xsl:if test="port">
				<xsl:element name="port">
					<xsl:copy-of select="port/text()[1]"/>
				</xsl:element>
			</xsl:if>
			<xsl:if test="url-type">
				<xsl:element name="url-type">
					<xsl:copy-of select="url-type/text()[1]"/>
				</xsl:element>
			</xsl:if>
			<xsl:if test="datasource-class">
				<xsl:element name="datasource-class">
					<xsl:copy-of select="datasource-class/text()[1]"/>
				</xsl:element>
			</xsl:if>
			<xsl:if test="driver-config">
				<xsl:element name="driver-config">
					<xsl:copy-of select="driver-config/text()[1]"/>
				</xsl:element>
			</xsl:if>
			<xsl:if test="input-table">
				<xsl:element name="input-table">
					<xsl:copy-of select="input-table/text()[1]"/>
				</xsl:element>
			</xsl:if>
			<xsl:if test="output-table">
				<xsl:element name="output-table">
					<xsl:copy-of select="output-table/text()[1]"/>
				</xsl:element>
			</xsl:if>
			<xsl:if test="timestep-field">
				<xsl:element name="timestep-field">
					<xsl:copy-of select="timestep-field/text()[1]"/>
				</xsl:element>
			</xsl:if>
			<xsl:if test="to-date-func">
				<xsl:element name="to-date-func">
					<xsl:copy-of select="to-date-func/text()[1]"/>
				</xsl:element>
			</xsl:if>
			<xsl:if test="to-date-fmt">
				<xsl:element name="to-date-fmt">
					<xsl:copy-of select="to-date-fmt/text()[1]"/>
				</xsl:element>
			</xsl:if>
			<xsl:if test="username">
				<xsl:element name="username">
					<xsl:copy-of select="username/text()[1]"/>
				</xsl:element>
			</xsl:if>
			<xsl:if test="password">
				<xsl:element name="password">
					<xsl:copy-of select="password/text()[1]"/>
				</xsl:element>
			</xsl:if>
			<xsl:if test="interactive-login">
				<xsl:element name="interactive-login">
					<xsl:copy-of select="interactive-login/@xsi:nil"/>
					<xsl:copy-of select="interactive-login/text()[1]"/>
				</xsl:element>
			</xsl:if>
			<xsl:if test="canary-id">
				<xsl:element name="canary-id">
					<xsl:copy-of select="canary-id/text()[1]"/>
				</xsl:element>
			</xsl:if>
		</xsl:copy>
	</xsl:template>
	<xsl:template match="messaging" mode="_2">
		<xsl:copy>
			<xsl:attribute name="type">
				<xsl:choose>
					<xsl:when test="@type">
						<xsl:value-of select="@type"/>
					</xsl:when>
					<xsl:otherwise>INTERNAL</xsl:otherwise>
				</xsl:choose>
			</xsl:attribute>
			<xsl:attribute name="use-id">
				<xsl:value-of select="@use-id"/>
			</xsl:attribute>
		</xsl:copy>
	</xsl:template>
	<xsl:template match="timing-options" mode="_3">
		<xsl:copy>
			<xsl:attribute name="data-interval">
				<xsl:value-of select="@data-interval"/>
			</xsl:attribute>
			<xsl:attribute name="poll-interval">
				<xsl:choose>
					<xsl:when test="@poll-interval">
						<xsl:value-of select="@poll-interval"/>
					</xsl:when>
					<xsl:otherwise>00:00:01</xsl:otherwise>
				</xsl:choose>
			</xsl:attribute>
			<xsl:attribute name="start-date">
				<xsl:value-of select="@start-date"/>
			</xsl:attribute>
			<xsl:attribute name="end-date">
				<xsl:value-of select="@end-date"/>
			</xsl:attribute>
			<xsl:attribute name="datetime-format">
				<xsl:choose>
					<xsl:when test="@datetime-format">
						<xsl:value-of select="@datetime-format"/>
					</xsl:when>
					<xsl:otherwise>yyyy-mm-ddTHH:MM:SS</xsl:otherwise>
				</xsl:choose>
			</xsl:attribute>
			<xsl:attribute name="dynamic-start">
				<xsl:choose>
					<xsl:when test="@dynamic-start">
						<xsl:value-of select="@dynamic-start"/>
					</xsl:when>
					<xsl:otherwise>false</xsl:otherwise>
				</xsl:choose>
			</xsl:attribute>
		</xsl:copy>
	</xsl:template>
	<xsl:template match="DataType" mode="_6">
		<xsl:copy>
			<xsl:attribute name="precision">
				<xsl:value-of select="@precision"/>
			</xsl:attribute>
			<xsl:attribute name="units">
				<xsl:value-of select="@units"/>
			</xsl:attribute>
			<xsl:attribute name="data-min">
				<xsl:value-of select="@data-min"/>
			</xsl:attribute>
			<xsl:attribute name="data-max">
				<xsl:value-of select="@data-max"/>
			</xsl:attribute>
			<xsl:attribute name="set-point-min">
				<xsl:value-of select="@set-point-min"/>
			</xsl:attribute>
			<xsl:attribute name="set-point-max">
				<xsl:value-of select="@set-point-max"/>
			</xsl:attribute>
		</xsl:copy>
	</xsl:template>
	<xsl:template match="AlarmType" mode="_7">
		<xsl:copy>
			<xsl:attribute name="alarm-scope">
				<xsl:value-of select="@alarm-scope"/>
			</xsl:attribute>
			<xsl:attribute name="active">
				<xsl:value-of select="@active"/>
			</xsl:attribute>
			<xsl:attribute name="tracking-lag">
				<xsl:value-of select="@tracking-lag"/>
			</xsl:attribute>
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Entry" mode="_9">
		<xsl:copy>
			<xsl:attribute name="var">
				<xsl:value-of select="@var"/>
			</xsl:attribute>
			<xsl:attribute name="shift">
				<xsl:value-of select="@shift"/>
			</xsl:attribute>
			<xsl:attribute name="const">
				<xsl:value-of select="@const"/>
			</xsl:attribute>
			<xsl:attribute name="cmd">
				<xsl:value-of select="@cmd"/>
			</xsl:attribute>
			<xsl:copy-of select="./text()[1]"/>
		</xsl:copy>
	</xsl:template>
	<xsl:template match="CompositeSignal" mode="_8">
		<xsl:copy>
			<xsl:apply-templates select="Entry" mode="_9"/>
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Signal" mode="_5">
		<xsl:copy>
			<xsl:attribute name="name">
				<xsl:value-of select="@name"/>
			</xsl:attribute>
			<xsl:attribute name="scada-tag">
				<xsl:value-of select="@scada-tag"/>
			</xsl:attribute>
			<xsl:attribute name="signal-type">
				<xsl:value-of select="@signal-type"/>
			</xsl:attribute>
			<xsl:attribute name="parameter">
				<xsl:value-of select="@parameter"/>
			</xsl:attribute>
			<xsl:attribute name="ignore-changes">
				<xsl:value-of select="@ignore-changes"/>
			</xsl:attribute>
			<xsl:apply-templates select="DataType[1]" mode="_6"/>
			<xsl:apply-templates select="AlarmType[1]" mode="_7"/>
			<xsl:apply-templates select="CompositeSignal[1]" mode="_8"/>
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Signals" mode="_4">
		<xsl:copy>
			<xsl:apply-templates select="Signal" mode="_5"/>
		</xsl:copy>
	</xsl:template>
	<xsl:template match="BED" mode="_12">
		<xsl:copy>
			<xsl:attribute name="bed-window-TS">
				<xsl:value-of select="@bed-window-TS"/>
			</xsl:attribute>
			<xsl:attribute name="bed-P-outlier">
				<xsl:value-of select="@bed-P-outlier"/>
			</xsl:attribute>
		</xsl:copy>
	</xsl:template>
	<xsl:template match="UseAlgorithm" mode="_13">
		<xsl:copy>
			<xsl:attribute name="name">
				<xsl:value-of select="@name"/>
			</xsl:attribute>
		</xsl:copy>
	</xsl:template>
	<xsl:template match="ExternalAlgorithm" mode="_14">
		<xsl:copy>
			<xsl:attribute name="class">
				<xsl:value-of select="@class"/>
			</xsl:attribute>
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Clustering" mode="_15">
		<xsl:copy>
			<xsl:attribute name="load-from-file">
				<xsl:value-of select="@load-from-file"/>
			</xsl:attribute>
			<xsl:attribute name="cluster-at-P">
				<xsl:value-of select="@cluster-at-P"/>
			</xsl:attribute>
			<xsl:attribute name="cluster-order-N">
				<xsl:value-of select="@cluster-order-N"/>
			</xsl:attribute>
			<xsl:attribute name="cluster-window-size-TS">
				<xsl:value-of select="@cluster-window-size-TS"/>
			</xsl:attribute>
			<xsl:attribute name="cluster-fit-threshold-P">
				<xsl:value-of select="@cluster-fit-threshold-P"/>
			</xsl:attribute>
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Algorithm" mode="_11">
		<xsl:copy>
			<xsl:attribute name="name">
				<xsl:value-of select="@name"/>
			</xsl:attribute>
			<xsl:attribute name="type">
				<xsl:value-of select="@type"/>
			</xsl:attribute>
			<xsl:attribute name="history-window-TS">
				<xsl:value-of select="@history-window-TS"/>
			</xsl:attribute>
			<xsl:attribute name="outlier-threshold-SD">
				<xsl:value-of select="@outlier-threshold-SD"/>
			</xsl:attribute>
			<xsl:attribute name="event-threshold-P">
				<xsl:value-of select="@event-threshold-P"/>
			</xsl:attribute>
			<xsl:attribute name="event-timeout-TS">
				<xsl:value-of select="@event-timeout-TS"/>
			</xsl:attribute>
			<xsl:apply-templates select="BED[1]" mode="_12"/>
			<xsl:apply-templates select="UseAlgorithm" mode="_13"/>
			<xsl:apply-templates select="ExternalAlgorithm[1]" mode="_14"/>
			<xsl:apply-templates select="Clustering[1]" mode="_15"/>
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Algorithms" mode="_10">
		<xsl:copy>
			<xsl:apply-templates select="Algorithm" mode="_11"/>
		</xsl:copy>
	</xsl:template>
	<xsl:template match="use-input" mode="_18">
		<xsl:copy>
			<xsl:attribute name="id">
				<xsl:value-of select="@id"/>
			</xsl:attribute>
		</xsl:copy>
	</xsl:template>
	<xsl:template match="use-output" mode="_19">
		<xsl:copy>
			<xsl:attribute name="id">
				<xsl:value-of select="@id"/>
			</xsl:attribute>
		</xsl:copy>
	</xsl:template>
	<xsl:template match="use-signal" mode="_20">
		<xsl:copy>
			<xsl:attribute name="id">
				<xsl:value-of select="@id"/>
			</xsl:attribute>
			<xsl:attribute name="no-cluster">
				<xsl:choose>
					<xsl:when test="@no-cluster">
						<xsl:value-of select="@no-cluster"/>
					</xsl:when>
					<xsl:otherwise>false</xsl:otherwise>
				</xsl:choose>
			</xsl:attribute>
		</xsl:copy>
	</xsl:template>
	<xsl:template match="use-algorithm" mode="_21">
		<xsl:copy>
			<xsl:attribute name="id">
				<xsl:value-of select="@id"/>
			</xsl:attribute>
		</xsl:copy>
	</xsl:template>
	<xsl:template match="Station" mode="_17">
		<xsl:copy>
			<xsl:attribute name="scada-id">
				<xsl:value-of select="@scada-id"/>
			</xsl:attribute>
			<xsl:attribute name="output_Station">
				<xsl:value-of select="@output_Station"/>
			</xsl:attribute>
			<xsl:attribute name="output_TagName">
				<xsl:value-of select="@output_TagName"/>
			</xsl:attribute>
			<xsl:attribute name="output_PointNr">
				<xsl:value-of select="@output_PointNr"/>
			</xsl:attribute>
			<xsl:attribute name="state">
				<xsl:value-of select="@state"/>
			</xsl:attribute>
			<xsl:attribute name="patListDir">
				<xsl:value-of select="@patListDir"/>
			</xsl:attribute>
			<xsl:attribute name="patGraphicsDir">
				<xsl:value-of select="@patGraphicsDir"/>
			</xsl:attribute>
			<xsl:apply-templates select="use-input" mode="_18"/>
			<xsl:apply-templates select="use-output" mode="_19"/>
			<xsl:apply-templates select="use-signal" mode="_20"/>
			<xsl:apply-templates select="use-algorithm" mode="_21"/>
		</xsl:copy>
	</xsl:template>
	<xsl:template match="AlgorithmsFile" mode="_22">
		<xsl:copy>
			<xsl:attribute name="name">
				<xsl:value-of select="@name"/>
			</xsl:attribute>
		</xsl:copy>
	</xsl:template>
	<xsl:template match="SignalsFile" mode="_23">
		<xsl:copy>
			<xsl:attribute name="name">
				<xsl:value-of select="@name"/>
			</xsl:attribute>
		</xsl:copy>
	</xsl:template>
	<xsl:template match="general-settings" mode="_16">
		<xsl:copy>
			<xsl:apply-templates select="Station" mode="_17"/>
			<xsl:apply-templates select="AlgorithmsFile[1]" mode="_22"/>
			<xsl:apply-templates select="SignalsFile[1]" mode="_23"/>
		</xsl:copy>
	</xsl:template>
	<xsl:template match="classpath" mode="_24">
		<xsl:copy>
			<xsl:copy-of select="./text()[1]"/>
		</xsl:copy>
	</xsl:template>
	<xsl:template match="canary" mode="_0">
		<xsl:copy>
			<xsl:if test="run-mode">
				<xsl:element name="run-mode">
					<xsl:copy-of select="run-mode/text()[1]"/>
				</xsl:element>
			</xsl:if>
			<xsl:if test="data-dir">
				<xsl:element name="data-dir">
					<xsl:copy-of select="data-dir/text()[1]"/>
				</xsl:element>
			</xsl:if>
			<xsl:if test="debug">
				<xsl:element name="debug">
					<xsl:copy-of select="debug/@xsi:nil"/>
					<xsl:copy-of select="debug/text()[1]"/>
				</xsl:element>
			</xsl:if>
			<xsl:apply-templates select="datasource" mode="_1"/>
			<xsl:apply-templates select="messaging[1]" mode="_2"/>
			<xsl:apply-templates select="timing-options[1]" mode="_3"/>
			<xsl:apply-templates select="Signals[1]" mode="_4"/>
			<xsl:apply-templates select="Algorithms[1]" mode="_10"/>
			<xsl:apply-templates select="general-settings[1]" mode="_16"/>
			<xsl:apply-templates select="classpath" mode="_24"/>
		</xsl:copy>
	</xsl:template>
</xsl:stylesheet>