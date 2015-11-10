<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:my="http://schemas.microsoft.com/office/infopath/2003/myXSD/2010-09-24T21:30:38" xmlns:xd="http://schemas.microsoft.com/office/infopath/2003" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns:xdExtension="http://schemas.microsoft.com/office/infopath/2003/xslt/extension" xmlns:xdXDocument="http://schemas.microsoft.com/office/infopath/2003/xslt/xDocument" xmlns:xdSolution="http://schemas.microsoft.com/office/infopath/2003/xslt/solution" xmlns:xdFormatting="http://schemas.microsoft.com/office/infopath/2003/xslt/formatting" xmlns:xdImage="http://schemas.microsoft.com/office/infopath/2003/xslt/xImage" xmlns:xdUtil="http://schemas.microsoft.com/office/infopath/2003/xslt/Util" xmlns:xdMath="http://schemas.microsoft.com/office/infopath/2003/xslt/Math" xmlns:xdDate="http://schemas.microsoft.com/office/infopath/2003/xslt/Date" xmlns:sig="http://www.w3.org/2000/09/xmldsig#" xmlns:xdSignatureProperties="http://schemas.microsoft.com/office/infopath/2003/SignatureProperties" xmlns:ipApp="http://schemas.microsoft.com/office/infopath/2006/XPathExtension/ipApp" xmlns:xdEnvironment="http://schemas.microsoft.com/office/infopath/2006/xslt/environment" xmlns:xdUser="http://schemas.microsoft.com/office/infopath/2006/xslt/User">
	<xsl:output method="html" indent="no"/>
	<xsl:template match="canary">
		<html>
			<head>
				<meta http-equiv="Content-Type" content="text/html"></meta>
				<style controlStyle="controlStyle">@media screen 			{ 			BODY{margin-left:21px;background-position:21px 0px;} 			} 		BODY{color:windowtext;background-color:window;layout-grid:none;} 		.xdListItem {display:inline-block;width:100%;vertical-align:text-top;} 		.xdListBox,.xdComboBox{margin:1px;} 		.xdInlinePicture{margin:1px; BEHAVIOR: url(#default#urn::xdPicture) } 		.xdLinkedPicture{margin:1px; BEHAVIOR: url(#default#urn::xdPicture) url(#default#urn::controls/Binder) } 		.xdSection{border:1pt solid #FFFFFF;margin:6px 0px 6px 0px;padding:1px 1px 1px 5px;} 		.xdRepeatingSection{border:1pt solid #FFFFFF;margin:6px 0px 6px 0px;padding:1px 1px 1px 5px;} 		.xdMultiSelectList{margin:1px;display:inline-block; border:1pt solid #dcdcdc; padding:1px 1px 1px 5px; text-indent:0; color:windowtext; background-color:window; overflow:auto; behavior: url(#default#DataBindingUI) url(#default#urn::controls/Binder) url(#default#MultiSelectHelper) url(#default#ScrollableRegion);} 		.xdMultiSelectListItem{display:block;white-space:nowrap}		.xdMultiSelectFillIn{display:inline-block;white-space:nowrap;text-overflow:ellipsis;;padding:1px;margin:1px;border: 1pt solid #dcdcdc;overflow:hidden;text-align:left;}		.xdBehavior_Formatting {BEHAVIOR: url(#default#urn::controls/Binder) url(#default#Formatting);} 	 .xdBehavior_FormattingNoBUI{BEHAVIOR: url(#default#CalPopup) url(#default#urn::controls/Binder) url(#default#Formatting);} 	.xdExpressionBox{margin: 1px;padding:1px;word-wrap: break-word;text-overflow: ellipsis;overflow-x:hidden;}.xdBehavior_GhostedText,.xdBehavior_GhostedTextNoBUI{BEHAVIOR: url(#default#urn::controls/Binder) url(#default#TextField) url(#default#GhostedText);}	.xdBehavior_GTFormatting{BEHAVIOR: url(#default#urn::controls/Binder) url(#default#Formatting) url(#default#GhostedText);}	.xdBehavior_GTFormattingNoBUI{BEHAVIOR: url(#default#CalPopup) url(#default#urn::controls/Binder) url(#default#Formatting) url(#default#GhostedText);}	.xdBehavior_Boolean{BEHAVIOR: url(#default#urn::controls/Binder) url(#default#BooleanHelper);}	.xdBehavior_Select{BEHAVIOR: url(#default#urn::controls/Binder) url(#default#SelectHelper);}	.xdBehavior_ComboBox{BEHAVIOR: url(#default#ComboBox)} 	.xdBehavior_ComboBoxTextField{BEHAVIOR: url(#default#ComboBoxTextField);} 	.xdRepeatingTable{BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: none; BORDER-COLLAPSE: collapse; WORD-WRAP: break-word;}.xdScrollableRegion{BEHAVIOR: url(#default#ScrollableRegion);} 		.xdLayoutRegion{display:inline-block;} 		.xdMaster{BEHAVIOR: url(#default#MasterHelper);} 		.xdActiveX{margin:1px; BEHAVIOR: url(#default#ActiveX);} 		.xdFileAttachment{display:inline-block;margin:1px;BEHAVIOR:url(#default#urn::xdFileAttachment);} 		.xdPageBreak{display: none;}BODY{margin-right:21px;} 		.xdTextBoxRTL{display:inline-block;white-space:nowrap;text-overflow:ellipsis;;padding:1px;margin:1px;border: 1pt solid #dcdcdc;color:windowtext;background-color:window;overflow:hidden;text-align:right;word-wrap:normal;} 		.xdRichTextBoxRTL{display:inline-block;;padding:1px;margin:1px;border: 1pt solid #dcdcdc;color:windowtext;background-color:window;overflow-x:hidden;word-wrap:break-word;text-overflow:ellipsis;text-align:right;font-weight:normal;font-style:normal;text-decoration:none;vertical-align:baseline;} 		.xdDTTextRTL{height:100%;width:100%;margin-left:22px;overflow:hidden;padding:0px;white-space:nowrap;} 		.xdDTButtonRTL{margin-right:-21px;height:18px;width:20px;behavior: url(#default#DTPicker);} 		.xdMultiSelectFillinRTL{display:inline-block;white-space:nowrap;text-overflow:ellipsis;;padding:1px;margin:1px;border: 1pt solid #dcdcdc;overflow:hidden;text-align:right;}.xdTextBox{display:inline-block;white-space:nowrap;text-overflow:ellipsis;;padding:1px;margin:1px;border: 1pt solid #dcdcdc;color:windowtext;background-color:window;overflow:hidden;text-align:left;word-wrap:normal;} 		.xdRichTextBox{display:inline-block;;padding:1px;margin:1px;border: 1pt solid #dcdcdc;color:windowtext;background-color:window;overflow-x:hidden;word-wrap:break-word;text-overflow:ellipsis;text-align:left;font-weight:normal;font-style:normal;text-decoration:none;vertical-align:baseline;} 		.xdDTPicker{;display:inline;margin:1px;margin-bottom: 2px;border: 1pt solid #dcdcdc;color:windowtext;background-color:window;overflow:hidden;text-indent:0} 		.xdDTText{height:100%;width:100%;margin-right:22px;overflow:hidden;padding:0px;white-space:nowrap;} 		.xdDTButton{margin-left:-21px;height:18px;width:20px;behavior: url(#default#DTPicker);} 		.xdRepeatingTable TD {VERTICAL-ALIGN: top;}</style>
				<style tableEditor="TableStyleRulesID">TABLE.xdLayout TD {
	BORDER-RIGHT: medium none; BORDER-TOP: medium none; BORDER-LEFT: medium none; BORDER-BOTTOM: medium none
}
TABLE.msoUcTable TD {
	BORDER-RIGHT: 1pt solid; BORDER-TOP: 1pt solid; BORDER-LEFT: 1pt solid; BORDER-BOTTOM: 1pt solid
}
TABLE {
	BEHAVIOR: url (#default#urn::tables/NDTable)
}
</style>
				<style languageStyle="languageStyle">BODY {
	FONT-SIZE: 10pt; FONT-FAMILY: Verdana
}
TABLE {
	FONT-SIZE: 10pt; FONT-FAMILY: Verdana
}
SELECT {
	FONT-SIZE: 10pt; FONT-FAMILY: Verdana
}
.optionalPlaceholder {
	PADDING-LEFT: 20px; FONT-WEIGHT: normal; FONT-SIZE: xx-small; BEHAVIOR: url(#default#xOptional); COLOR: #333333; FONT-STYLE: normal; FONT-FAMILY: Verdana; TEXT-DECORATION: none
}
.langFont {
	FONT-FAMILY: Verdana
}
.defaultInDocUI {
	FONT-SIZE: xx-small; FONT-FAMILY: Verdana
}
.optionalPlaceholder {
	PADDING-RIGHT: 20px
}
</style>
				<style themeStyle="urn:office.microsoft.com:themeBrightBlue">BODY {
	COLOR: black; BACKGROUND-COLOR: white
}
TABLE {
	BORDER-RIGHT: medium none; BORDER-TOP: medium none; BORDER-LEFT: medium none; BORDER-BOTTOM: medium none; BORDER-COLLAPSE: collapse
}
TD {
	BORDER-LEFT-COLOR: #408ce8; BORDER-BOTTOM-COLOR: #408ce8; BORDER-TOP-COLOR: #408ce8; BORDER-RIGHT-COLOR: #408ce8
}
TH {
	BORDER-LEFT-COLOR: #408ce8; BORDER-BOTTOM-COLOR: #408ce8; COLOR: black; BORDER-TOP-COLOR: #408ce8; BACKGROUND-COLOR: #d3e5fa; BORDER-RIGHT-COLOR: #408ce8
}
.xdTableHeader {
	COLOR: black; BACKGROUND-COLOR: #f5f3eb
}
P {
	MARGIN-TOP: 0px
}
H1 {
	MARGIN-TOP: 0px; MARGIN-BOTTOM: 0px; COLOR: #134fc7
}
H2 {
	MARGIN-TOP: 0px; MARGIN-BOTTOM: 0px; COLOR: #134fc7
}
H3 {
	MARGIN-TOP: 0px; MARGIN-BOTTOM: 0px; COLOR: #134fc7
}
H4 {
	MARGIN-TOP: 0px; MARGIN-BOTTOM: 0px; COLOR: #134fc7
}
H5 {
	MARGIN-TOP: 0px; MARGIN-BOTTOM: 0px; COLOR: #408ce8
}
H6 {
	MARGIN-TOP: 0px; MARGIN-BOTTOM: 0px; COLOR: #f5f3eb
}
.primaryVeryDark {
	COLOR: #f5f3eb; BACKGROUND-COLOR: #134fc7
}
.primaryDark {
	COLOR: white; BACKGROUND-COLOR: #408ce8
}
.primaryMedium {
	COLOR: black; BACKGROUND-COLOR: #d3e5fa
}
.primaryLight {
	COLOR: black; BACKGROUND-COLOR: #f5f3eb
}
.accentDark {
	COLOR: white; BACKGROUND-COLOR: #ff8716
}
.accentLight {
	COLOR: black; BACKGROUND-COLOR: #ffd991
}
</style>
			</head>
			<body style="COLOR: #000000">
				<div>
					<img style="WIDTH: 130px; HEIGHT: 50px" src="94AEC0E5.png"/>
				</div>
				<div>
					<table class="xdFormLayout xdLayout" style="TABLE-LAYOUT: fixed; WIDTH: 651px; BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-COLLAPSE: collapse; WORD-WRAP: break-word; BORDER-BOTTOM-STYLE: none" border="1">
						<colgroup>
							<col style="WIDTH: 651px"></col>
						</colgroup>
						<tbody vAlign="top">
							<tr class="primaryVeryDark" style="MIN-HEIGHT: 28px">
								<td style="BORDER-TOP-STYLE: none; BORDER-BOTTOM: 5pt solid; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none">
									<div align="right">
										<font size="4">Configuration Editor for CANARY 4.3</font>
									</div>
								</td>
							</tr>
							<tr class="primarylight" style="MIN-HEIGHT: 0.313in">
								<td vAlign="top" style="BORDER-TOP: 5pt solid; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; TEXT-ALIGN: left; BORDER-BOTTOM-STYLE: none">
									<div>
										<font size="2"></font> </div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div> </div>
				<div>
					<table class="xdFormLayout xdLayout" style="TABLE-LAYOUT: fixed; WIDTH: 649px; BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-COLLAPSE: collapse; WORD-WRAP: break-word; BORDER-BOTTOM-STYLE: none" border="1">
						<colgroup>
							<col style="WIDTH: 516px"></col>
							<col style="WIDTH: 133px"></col>
						</colgroup>
						<tbody vAlign="top">
							<tr style="MIN-HEIGHT: 0.26in">
								<td colSpan="2" style="BORDER-RIGHT: #000000 1pt solid; BORDER-TOP: #000000 1pt solid; BORDER-LEFT: #000000 1pt solid; BORDER-BOTTOM: #000000 1pt solid; BACKGROUND-COLOR: #408ce8">
									<div>
										<font color="#ffffff" size="4">
											<strong>General Settings</strong>
										</font>
									</div>
								</td>
							</tr>
							<tr style="MIN-HEIGHT: 0.208in">
								<td style="BORDER-RIGHT: #000000 1pt solid; BORDER-TOP: #000000 1pt solid; BORDER-LEFT: #000000 1pt solid; BORDER-BOTTOM: #000000 1pt solid">
									<div>Run Mode: <select class="xdComboBox xdBehavior_Select" title="" size="1" tabIndex="0" xd:boundProp="value" xd:binding="run-mode" xd:CtrlId="CTRL2" xd:xctname="dropdown" style="WIDTH: 94px">
											<xsl:attribute name="value">
												<xsl:value-of select="run-mode"/>
											</xsl:attribute>
											<option value="BATCH">
												<xsl:if test="run-mode=&quot;BATCH&quot;">
													<xsl:attribute name="selected">selected</xsl:attribute>
												</xsl:if>BATCH</option>
											<option value="REALTIME">
												<xsl:if test="run-mode=&quot;REALTIME&quot;">
													<xsl:attribute name="selected">selected</xsl:attribute>
												</xsl:if>REALTIME</option>
											<option value="EDDIES">
												<xsl:if test="run-mode=&quot;EDDIES&quot;">
													<xsl:attribute name="selected">selected</xsl:attribute>
												</xsl:if>EDDIES</option>
											<option value="TRAINING">
												<xsl:if test="run-mode=&quot;TRAINING&quot;">
													<xsl:attribute name="selected">selected</xsl:attribute>
												</xsl:if>TRAINING</option>
											<option value="SAVEONLY">
												<xsl:if test="run-mode=&quot;SAVEONLY&quot;">
													<xsl:attribute name="selected">selected</xsl:attribute>
												</xsl:if>SAVEONLY</option>
										</select>
									</div>
								</td>
								<td style="BORDER-RIGHT: #000000 1pt solid; BORDER-TOP: #000000 1pt solid; BORDER-LEFT: #000000 1pt solid; BORDER-BOTTOM: #000000 1pt solid">
									<div><input class="xdBehavior_Boolean" title="" type="checkbox" tabIndex="0" xd:boundProp="xd:value" xd:binding="debug" xd:CtrlId="CTRL4" xd:xctname="CheckBox" xd:onValue="true" xd:offValue="false">
											<xsl:attribute name="xd:value">
												<xsl:value-of select="debug"/>
											</xsl:attribute>
											<xsl:if test="debug=&quot;true&quot;">
												<xsl:attribute name="CHECKED">CHECKED</xsl:attribute>
											</xsl:if>
										</input>Debug Active?</div>
								</td>
							</tr>
							<tr style="MIN-HEIGHT: 0.281in">
								<td colSpan="2" style="BORDER-RIGHT: #000000 1pt solid; BORDER-TOP: #000000 1pt solid; BORDER-LEFT: #000000 1pt solid; BORDER-BOTTOM: #000000 1pt solid">
									<div>Data Directory<span class="xdTextBox xdBehavior_GhostedText" hideFocus="1" title="" contentEditable="true" tabIndex="0" xd:binding="data-dir" xd:CtrlId="CTRL3" xd:xctname="PlainText" style="WIDTH: 100%; WHITE-SPACE: nowrap">
											<xsl:choose>
												<xsl:when test="not(string(data-dir))">
													<xsl:attribute name="xd:ghosted">true</xsl:attribute>Full path or path relative to configuration file</xsl:when>
												<xsl:otherwise>
													<xsl:value-of select="data-dir"/>
												</xsl:otherwise>
											</xsl:choose>
										</span>
									</div>
								</td>
							</tr>
							<tr style="MIN-HEIGHT: 0.281in">
								<td colSpan="2" style="BORDER-RIGHT: #000000 1pt solid; BORDER-TOP: #000000 1pt solid; BORDER-LEFT: #000000 1pt solid; BORDER-BOTTOM: #000000 1pt solid">
									<div>
										<table class="xdRepeatingTable msoUcTable" title="" style="TABLE-LAYOUT: fixed; WIDTH: 640px; BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-COLLAPSE: collapse; WORD-WRAP: break-word; BORDER-BOTTOM-STYLE: none" border="1" xd:CtrlId="CTRL5">
											<colgroup>
												<col style="WIDTH: 640px"></col>
											</colgroup>
											<tbody class="xdTableHeader">
												<tr style="MIN-HEIGHT: 67px">
													<td>
														<div>Extra Java CLASSPATH entries </div>
														<div style="PADDING-LEFT: 50px">
															<em>Enter the full path the .jar file to be included.</em>
														</div>
														<div style="PADDING-LEFT: 50px">
															<em>CANARY automatically includes .jar files located in the directory specified by the CANARY_LIB environment variable.</em>
														</div>
													</td>
												</tr>
											</tbody><tbody xd:xctname="RepeatingTable">
												<xsl:for-each select="classpath">
													<tr>
														<td><span class="xdTextBox xdBehavior_GhostedText" hideFocus="1" title="" contentEditable="true" tabIndex="0" xd:binding="." xd:CtrlId="CTRL6" xd:xctname="PlainText" style="WIDTH: 100%; WHITE-SPACE: nowrap">
																<xsl:choose>
																	<xsl:when test="not(string(.))">
																		<xsl:attribute name="xd:ghosted">true</xsl:attribute>Leave blank if no additional JAR files need to be added.</xsl:when>
																	<xsl:otherwise>
																		<xsl:value-of select="."/>
																	</xsl:otherwise>
																</xsl:choose>
															</span>
														</td>
													</tr>
												</xsl:for-each>
											</tbody>
										</table>
										<div class="optionalPlaceholder" xd:xmlToEdit="classpath_1" tabIndex="0" xd:action="xCollection::insert" style="WIDTH: 640px">Add another CLASSPATH entry</div>
									</div>
								</td>
							</tr>
							<tr style="MIN-HEIGHT: 0.281in">
								<td colSpan="2" style="BORDER-RIGHT: #000000 1pt solid; BORDER-TOP: #000000 1pt solid; BORDER-LEFT: #000000 1pt solid; BORDER-BOTTOM: #000000 1pt solid">
									<div><xsl:choose>
											<xsl:when test="general-settings/AlgorithmsFile">
												<xsl:apply-templates select="general-settings/AlgorithmsFile" mode="_1"/>
											</xsl:when>
											<xsl:otherwise>
												<div class="optionalPlaceholder" xd:xmlToEdit="AlgorithmsFile_2" tabIndex="0" align="left" style="WIDTH: 643px">Use external Algorithm definition file</div>
											</xsl:otherwise>
										</xsl:choose>
									</div>
								</td>
							</tr>
							<tr style="MIN-HEIGHT: 0.281in">
								<td colSpan="2" style="BORDER-RIGHT: #000000 1pt solid; BORDER-TOP: #000000 1pt solid; BORDER-LEFT: #000000 1pt solid; BORDER-BOTTOM: #000000 1pt solid">
									<div>
										<div><xsl:choose>
												<xsl:when test="general-settings/SignalsFile">
													<xsl:apply-templates select="general-settings/SignalsFile" mode="_2"/>
												</xsl:when>
												<xsl:otherwise>
													<div class="optionalPlaceholder" xd:xmlToEdit="SignalsFile_3" tabIndex="0" align="left" style="WIDTH: 100%">Use external Signals definition file</div>
												</xsl:otherwise>
											</xsl:choose>
										</div>
									</div>
								</td>
							</tr>
							<tr style="MIN-HEIGHT: 0.281in">
								<td colSpan="2" style="BORDER-RIGHT: #000000 1pt solid; BORDER-TOP: #000000 1pt solid; BORDER-LEFT: #000000 1pt solid; BORDER-BOTTOM: #000000 1pt solid">
									<div>
										<div>
											<div>
												<table class="xdLayout" style="BORDER-RIGHT: medium none; TABLE-LAYOUT: fixed; BORDER-TOP: medium none; BORDER-LEFT: medium none; WIDTH: 644px; BORDER-BOTTOM: medium none; BORDER-COLLAPSE: collapse; WORD-WRAP: break-word" borderColor="buttontext" border="1">
													<colgroup>
														<col style="WIDTH: 105px"></col>
														<col style="WIDTH: 95px"></col>
														<col style="WIDTH: 212px"></col>
														<col style="WIDTH: 232px"></col>
													</colgroup>
													<tbody vAlign="top">
														<tr style="MIN-HEIGHT: 42px">
															<td>
																<div>
																	<font face="Verdana" size="2">Data Interval: <span class="xdTextBox xdBehavior_GhostedText" hideFocus="1" title="" contentEditable="true" tabIndex="0" xd:binding="timing-options/@data-interval" xd:CtrlId="CTRL18" xd:xctname="PlainText" style="WIDTH: 100%; WHITE-SPACE: nowrap">
																			<xsl:choose>
																				<xsl:when test="not(string(timing-options/@data-interval))">
																					<xsl:attribute name="xd:ghosted">true</xsl:attribute>HH:MM:SS</xsl:when>
																				<xsl:otherwise>
																					<xsl:value-of select="timing-options/@data-interval"/>
																				</xsl:otherwise>
																			</xsl:choose>
																		</span>
																	</font>
																</div>
															</td>
															<td>
																<div>
																	<font face="Verdana" size="2">Poll Interval: <span class="xdTextBox xdBehavior_GhostedText" hideFocus="1" title="" contentEditable="true" tabIndex="0" xd:binding="timing-options/@poll-interval" xd:CtrlId="CTRL19" xd:xctname="PlainText" style="WIDTH: 100%; WHITE-SPACE: nowrap">
																			<xsl:choose>
																				<xsl:when test="not(string(timing-options/@poll-interval))">
																					<xsl:attribute name="xd:ghosted">true</xsl:attribute>HH:MM:SS</xsl:when>
																				<xsl:otherwise>
																					<xsl:value-of select="timing-options/@poll-interval"/>
																				</xsl:otherwise>
																			</xsl:choose>
																		</span>
																	</font>
																</div>
															</td>
															<td>
																<div>
																	<font face="Verdana" size="2">Start Date: 
<div class="xdDTPicker" title="" style="WIDTH: 100%" noWrap="1" xd:CtrlId="CTRL20" xd:xctname="DTPicker"><span class="xdDTText xdBehavior_NoBUI" hideFocus="1" tabIndex="0" xd:binding="timing-options/@start-date" xd:xctname="DTPicker_DTText" xd:innerCtrl="_DTText">
																				<xsl:value-of select="timing-options/@start-date"/>
																			</span>
																			<button class="xdDTButton" xd:xctname="DTPicker_DTButton" xd:innerCtrl="_DTButton" tabIndex="-1">
																				<img src="res://infopath.exe/calendar.gif"/>
																			</button>
																		</div>
																	</font>
																</div>
															</td>
															<td>
																<div>
																	<font face="Verdana" size="2">End Date: 
<div class="xdDTPicker" title="" style="WIDTH: 100%" noWrap="1" xd:CtrlId="CTRL21" xd:xctname="DTPicker"><span class="xdDTText xdBehavior_NoBUI" hideFocus="1" tabIndex="0" xd:binding="timing-options/@end-date" xd:xctname="DTPicker_DTText" xd:innerCtrl="_DTText">
																				<xsl:value-of select="timing-options/@end-date"/>
																			</span>
																			<button class="xdDTButton" xd:xctname="DTPicker_DTButton" xd:innerCtrl="_DTButton" tabIndex="-1">
																				<img src="res://infopath.exe/calendar.gif"/>
																			</button>
																		</div>
																	</font>
																</div>
															</td>
														</tr>
														<tr style="MIN-HEIGHT: 4px">
															<td colSpan="3">
																<div>
																	<font face="Verdana" size="2">DateTime Format: <span class="xdTextBox" hideFocus="1" title="" contentEditable="true" tabIndex="0" xd:binding="timing-options/@datetime-format" xd:CtrlId="CTRL23" xd:xctname="PlainText" style="WIDTH: 279px; WHITE-SPACE: nowrap">
																			<xsl:value-of select="timing-options/@datetime-format"/>
																		</span>
																	</font>
																</div>
															</td>
															<td>
																<div>
																	<font face="Verdana" size="2"><input class="xdBehavior_Boolean" title="" type="checkbox" tabIndex="0" xd:boundProp="xd:value" xd:binding="timing-options/@dynamic-start" xd:CtrlId="CTRL22" xd:xctname="CheckBox" xd:onValue="true" xd:offValue="false">
																			<xsl:attribute name="xd:value">
																				<xsl:value-of select="timing-options/@dynamic-start"/>
																			</xsl:attribute>
																			<xsl:if test="timing-options/@dynamic-start=&quot;true&quot;">
																				<xsl:attribute name="CHECKED">CHECKED</xsl:attribute>
																			</xsl:if>
																		</input> Dynamic Start and End dates</font>
																</div>
															</td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
									</div>
								</td>
							</tr>
							<tr style="MIN-HEIGHT: 0.281in">
								<td colSpan="2" style="BORDER-RIGHT: #000000 1pt solid; BORDER-TOP: #000000 1pt solid; BORDER-LEFT: #000000 1pt solid; BORDER-BOTTOM: #000000 1pt solid">
									<div>
										<div>
											<div>
												<strong>Messaging Options</strong>
											</div>
											<div>
												<table class="xdLayout" style="BORDER-RIGHT: medium none; TABLE-LAYOUT: fixed; BORDER-TOP: medium none; BORDER-LEFT: medium none; WIDTH: 646px; BORDER-BOTTOM: medium none; BORDER-COLLAPSE: collapse; WORD-WRAP: break-word" borderColor="buttontext" border="1">
													<colgroup>
														<col style="WIDTH: 263px"></col>
														<col style="WIDTH: 383px"></col>
													</colgroup>
													<tbody vAlign="top">
														<tr>
															<td>
																<div>
																	<font face="Verdana" size="2">Messenger Type: <select class="xdComboBox xdBehavior_Select" title="" size="1" tabIndex="0" xd:boundProp="value" xd:binding="messaging/@type" xd:CtrlId="CTRL28" xd:xctname="dropdown" style="WIDTH: 100%">
																			<xsl:attribute name="value">
																				<xsl:value-of select="messaging/@type"/>
																			</xsl:attribute>
																			<option value="INTERNAL">
																				<xsl:if test="messaging/@type=&quot;INTERNAL&quot;">
																					<xsl:attribute name="selected">selected</xsl:attribute>
																				</xsl:if>INTERNAL</option>
																			<option value="EXTERNAL">
																				<xsl:if test="messaging/@type=&quot;EXTERNAL&quot;">
																					<xsl:attribute name="selected">selected</xsl:attribute>
																				</xsl:if>EXTERNAL</option>
																			<option value="EDDIES">
																				<xsl:if test="messaging/@type=&quot;EDDIES&quot;">
																					<xsl:attribute name="selected">selected</xsl:attribute>
																				</xsl:if>EDDIES</option>
																		</select>
																	</font>
																</div>
															</td>
															<td>
																<div>
																	<font face="Verdana" size="2">Connect messenger to datasource (<em>blank for internal</em>): <select class="xdComboBox xdBehavior_Select" title="" style="WIDTH: 100%" size="1" value="" xd:boundProp="value" xd:binding="messaging/@use-id" xd:CtrlId="CTRL29" xd:xctname="dropdown" tabIndex="0">
																			<xsl:attribute name="value">
																				<xsl:value-of select="messaging/@use-id"/>
																			</xsl:attribute>
																			<xsl:choose>
																				<xsl:when test="function-available('xdXDocument:GetDOM')">
																					<option/>
																					<xsl:variable name="val" select="messaging/@use-id"/>
																					<xsl:if test="not(datasource/@short-id[.=$val] or $val='')">
																						<option selected="selected">
																							<xsl:attribute name="value">
																								<xsl:value-of select="$val"/>
																							</xsl:attribute>
																							<xsl:value-of select="$val"/>
																						</option>
																					</xsl:if>
																					<xsl:for-each select="datasource/@short-id">
																						<option>
																							<xsl:attribute name="value">
																								<xsl:value-of select="."/>
																							</xsl:attribute>
																							<xsl:if test="$val=.">
																								<xsl:attribute name="selected">selected</xsl:attribute>
																							</xsl:if>
																							<xsl:value-of select="."/>
																						</option>
																					</xsl:for-each>
																				</xsl:when>
																				<xsl:otherwise>
																					<option>
																						<xsl:value-of select="messaging/@use-id"/>
																					</option>
																				</xsl:otherwise>
																			</xsl:choose>
																		</select>
																	</font>
																</div>
															</td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
									</div>
									<div> </div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div>
					<div contentEditable="false" style="PAGE-BREAK-AFTER: always">
						<br/>
						<span class="xdPageBreak" unselectable="on">
							<br/>
						</span>
					</div>
				</div>
				<div>
					<table class="xdFormLayout xdLayout" style="TABLE-LAYOUT: fixed; WIDTH: 651px; BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-COLLAPSE: collapse; WORD-WRAP: break-word; BORDER-BOTTOM-STYLE: none" border="1">
						<colgroup>
							<col style="WIDTH: 651px"></col>
						</colgroup>
						<tbody vAlign="top">
							<tr style="MIN-HEIGHT: 0.26in">
								<td style="BORDER-RIGHT: #000000 1pt solid; BORDER-TOP: #000000 1pt solid; BORDER-LEFT: #000000 1pt solid; BORDER-BOTTOM: #000000 1pt solid; BACKGROUND-COLOR: #408ce8">
									<div>
										<font color="#ffffff" size="4">
											<strong>Datasource Definitions</strong>
										</font>
									</div>
								</td>
							</tr>
							<tr style="MIN-HEIGHT: 0.052in">
								<td style="BORDER-RIGHT: #000000 1pt solid; BORDER-TOP: #000000 1pt solid; BORDER-LEFT: #000000 1pt solid; BORDER-BOTTOM: #000000 1pt solid">
									<div>
										<table class="xdRepeatingTable msoUcTable xdMaster" title="" style="TABLE-LAYOUT: fixed; WIDTH: 643px; BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-COLLAPSE: collapse; WORD-WRAP: break-word; BORDER-BOTTOM-STYLE: none" border="1" xd:CtrlId="CTRL79_5" xd:masterID="CTRL79_5">
											<colgroup>
												<col style="WIDTH: 101px"></col>
												<col style="WIDTH: 56px"></col>
												<col style="WIDTH: 84px"></col>
												<col style="WIDTH: 313px"></col>
												<col style="WIDTH: 89px"></col>
											</colgroup>
											<tbody class="xdTableHeader">
												<tr style="MIN-HEIGHT: 35px">
													<td>
														<div>
															<strong>Short Id</strong>
														</div>
													</td>
													<td>
														<div>
															<strong>Enable</strong>
														</div>
													</td>
													<td>
														<div>
															<strong>Type</strong>
														</div>
													</td>
													<td>
														<div>
															<strong>Location</strong>
														</div>
													</td>
													<td>
														<div>
															<strong>Interactive Login?</strong>
														</div>
													</td>
												</tr>
											</tbody><tbody xd:xctname="RepeatingTable" xd:masterName="CTRL79_5">
												<xsl:for-each select="datasource">
													<tr>
														<td><span class="xdTextBox xdBehavior_GhostedText" hideFocus="1" title="" contentEditable="true" tabIndex="0" xd:binding="@short-id" xd:CtrlId="CTRL80" xd:xctname="PlainText" style="WIDTH: 100%; WHITE-SPACE: nowrap">
																<xsl:choose>
																	<xsl:when test="not(string(@short-id))">
																		<xsl:attribute name="xd:ghosted">true</xsl:attribute>Datasource ID</xsl:when>
																	<xsl:otherwise>
																		<xsl:value-of select="@short-id"/>
																	</xsl:otherwise>
																</xsl:choose>
															</span>
														</td>
														<td><input class="xdBehavior_Boolean" title="" type="checkbox" tabIndex="0" xd:boundProp="xd:value" xd:binding="@state" xd:CtrlId="CTRL121" xd:xctname="CheckBox" xd:onValue="enabled" xd:offValue="disabled">
																<xsl:attribute name="xd:value">
																	<xsl:value-of select="@state"/>
																</xsl:attribute>
																<xsl:if test="@state=&quot;enabled&quot;">
																	<xsl:attribute name="CHECKED">CHECKED</xsl:attribute>
																</xsl:if>
															</input>
														</td>
														<td><select class="xdComboBox xdBehavior_Select" title="" size="1" tabIndex="0" xd:boundProp="value" xd:binding="@type" xd:CtrlId="CTRL126" xd:xctname="dropdown" style="WIDTH: 100%">
																<xsl:attribute name="value">
																	<xsl:value-of select="@type"/>
																</xsl:attribute>
																<option value="CSV">
																	<xsl:if test="@type=&quot;CSV&quot;">
																		<xsl:attribute name="selected">selected</xsl:attribute>
																	</xsl:if>CSV</option>
																<option value="JDBC">
																	<xsl:if test="@type=&quot;JDBC&quot;">
																		<xsl:attribute name="selected">selected</xsl:attribute>
																	</xsl:if>JDBC</option>
																<option value="EDDIES">
																	<xsl:if test="@type=&quot;EDDIES&quot;">
																		<xsl:attribute name="selected">selected</xsl:attribute>
																	</xsl:if>EDDIES</option>
																<option value="XML">
																	<xsl:if test="@type=&quot;XML&quot;">
																		<xsl:attribute name="selected">selected</xsl:attribute>
																	</xsl:if>XML</option>
															</select>
														</td>
														<td><span class="xdTextBox xdBehavior_GhostedText" hideFocus="1" title="" contentEditable="true" tabIndex="0" xd:binding="location" xd:CtrlId="CTRL85" xd:xctname="PlainText" style="WIDTH: 100%; WHITE-SPACE: nowrap">
																<xsl:choose>
																	<xsl:when test="not(string(location))">
																		<xsl:attribute name="xd:ghosted">true</xsl:attribute>Filename, Complete URL, or Database ID</xsl:when>
																	<xsl:otherwise>
																		<xsl:value-of select="location"/>
																	</xsl:otherwise>
																</xsl:choose>
															</span>
														</td>
														<td><input class="xdBehavior_Boolean" title="" type="checkbox" tabIndex="0" xd:boundProp="xd:value" xd:binding="interactive-login" xd:CtrlId="CTRL98" xd:xctname="CheckBox" xd:onValue="true" xd:offValue="false">
																<xsl:attribute name="xd:value">
																	<xsl:value-of select="interactive-login"/>
																</xsl:attribute>
																<xsl:if test="interactive-login=&quot;true&quot;">
																	<xsl:attribute name="CHECKED">CHECKED</xsl:attribute>
																</xsl:if>
															</input>
														</td>
													</tr>
												</xsl:for-each>
											</tbody>
										</table>
										<div class="optionalPlaceholder" xd:xmlToEdit="datasource_58" tabIndex="0" xd:action="xCollection::insert" style="WIDTH: 643px">Insert item</div>
									</div>
									<div><xsl:if test="function-available('xdXDocument:GetDOM')">
											<xsl:variable name="masterPosCTRL100" select="xdXDocument:GetNamedNodeProperty(/canary, 'CTRL79_5', 1)"/>
											<xsl:apply-templates select="datasource [ (position() = $masterPosCTRL100) ] " mode="_9"/>
											<div class="optionalPlaceholder" xd:xmlToEdit="datasource_64" tabIndex="0" xd:action="xCollection::insert" align="left" style="WIDTH: 651px">Insert item</div>
										</xsl:if>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div>
					<div contentEditable="false" style="PAGE-BREAK-AFTER: always">
						<br/>
						<span class="xdPageBreak" unselectable="on">
							<br/>
						</span>
					</div>
				</div>
				<div>
					<table class="xdFormLayout xdLayout" style="TABLE-LAYOUT: fixed; WIDTH: 651px; BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-COLLAPSE: collapse; WORD-WRAP: break-word; BORDER-BOTTOM-STYLE: none" border="1">
						<colgroup>
							<col style="WIDTH: 651px"></col>
						</colgroup>
						<tbody vAlign="top">
							<tr style="MIN-HEIGHT: 0.26in">
								<td style="BORDER-RIGHT: #000000 1pt solid; BORDER-TOP: #000000 1pt solid; BORDER-LEFT: #000000 1pt solid; BORDER-BOTTOM: #000000 1pt solid; BACKGROUND-COLOR: #408ce8">
									<div>
										<font color="#ffffff" size="4">
											<strong>Signal Definitions</strong>
										</font>
									</div>
								</td>
							</tr>
							<tr style="MIN-HEIGHT: 0.042in">
								<td style="BORDER-RIGHT: #000000 1pt solid; BORDER-TOP: #000000 1pt solid; BORDER-LEFT: #000000 1pt solid; BORDER-BOTTOM: #000000 1pt solid">
									<div>
										<table class="xdRepeatingTable msoUcTable xdMaster" title="" style="TABLE-LAYOUT: fixed; WIDTH: 643px; BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-COLLAPSE: collapse; WORD-WRAP: break-word; BORDER-BOTTOM-STYLE: none" border="1" xd:CtrlId="CTRL127_5" xd:masterID="CTRL127_5">
											<colgroup>
												<col style="WIDTH: 180px"></col>
												<col style="WIDTH: 252px"></col>
												<col style="WIDTH: 88px"></col>
												<col style="WIDTH: 123px"></col>
											</colgroup>
											<tbody class="xdTableHeader">
												<tr>
													<td>
														<div>
															<strong>Short Name</strong>
														</div>
													</td>
													<td>
														<div>
															<strong>SCADA Tag</strong>
														</div>
													</td>
													<td>
														<div>
															<strong>Signal Type</strong>
														</div>
													</td>
													<td>
														<div>
															<strong>Parameter Type</strong>
														</div>
													</td>
												</tr>
											</tbody><tbody xd:xctname="RepeatingTable" xd:masterName="CTRL127_5">
												<xsl:for-each select="Signals/Signal">
													<tr style="MIN-HEIGHT: 26px">
														<td><span class="xdTextBox" hideFocus="1" title="" tabIndex="0" xd:binding="@name" xd:CtrlId="CTRL128" xd:xctname="PlainText" style="WIDTH: 100%">
																<xsl:value-of select="@name"/>
															</span>
														</td>
														<td><span class="xdTextBox" hideFocus="1" title="" tabIndex="0" xd:binding="@scada-tag" xd:CtrlId="CTRL129" xd:xctname="PlainText" style="WIDTH: 100%">
																<xsl:value-of select="@scada-tag"/>
															</span>
														</td>
														<td><select class="xdComboBox xdBehavior_Select" title="" size="1" tabIndex="0" xd:boundProp="value" xd:binding="@signal-type" xd:CtrlId="CTRL166" xd:xctname="dropdown" style="WIDTH: 100%">
																<xsl:attribute name="value">
																	<xsl:value-of select="@signal-type"/>
																</xsl:attribute>
																<option value="WQ">
																	<xsl:if test="@signal-type=&quot;WQ&quot;">
																		<xsl:attribute name="selected">selected</xsl:attribute>
																	</xsl:if>WQ</option>
																<option value="OP">
																	<xsl:if test="@signal-type=&quot;OP&quot;">
																		<xsl:attribute name="selected">selected</xsl:attribute>
																	</xsl:if>OP</option>
																<option value="ALM">
																	<xsl:if test="@signal-type=&quot;ALM&quot;">
																		<xsl:attribute name="selected">selected</xsl:attribute>
																	</xsl:if>ALM</option>
																<option value="CAL">
																	<xsl:if test="@signal-type=&quot;CAL&quot;">
																		<xsl:attribute name="selected">selected</xsl:attribute>
																	</xsl:if>CAL</option>
																<option value="INFO">
																	<xsl:if test="@signal-type=&quot;INFO&quot;">
																		<xsl:attribute name="selected">selected</xsl:attribute>
																	</xsl:if>INFO</option>
															</select>
														</td>
														<td><span class="xdTextBox" hideFocus="1" title="" tabIndex="0" xd:binding="@parameter" xd:CtrlId="CTRL131" xd:xctname="PlainText" style="WIDTH: 100%">
																<xsl:value-of select="@parameter"/>
															</span>
														</td>
													</tr>
												</xsl:for-each>
											</tbody>
										</table>
										<div class="optionalPlaceholder" xd:xmlToEdit="Signal_91" tabIndex="0" xd:action="xCollection::insert" style="WIDTH: 643px">Insert item</div>
									</div>
									<div><xsl:if test="function-available('xdXDocument:GetDOM')">
											<xsl:variable name="masterPosCTRL146" select="xdXDocument:GetNamedNodeProperty(/canary/Signals, 'CTRL127_5', 1)"/>
											<xsl:apply-templates select="Signals/Signal [ (position() = $masterPosCTRL146) ] " mode="_13"/>
											<div class="optionalPlaceholder" xd:xmlToEdit="Signal_96" tabIndex="0" xd:action="xCollection::insert" align="left" style="WIDTH: 644px">Insert item</div>
										</xsl:if>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div>
					<div contentEditable="false" style="PAGE-BREAK-AFTER: always">
						<br/>
						<span class="xdPageBreak" unselectable="on">
							<br/>
						</span>
					</div>
				</div>
				<div>
					<table class="xdFormLayout xdLayout" style="TABLE-LAYOUT: fixed; WIDTH: 651px; BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-COLLAPSE: collapse; WORD-WRAP: break-word; BORDER-BOTTOM-STYLE: none" border="1">
						<colgroup>
							<col style="WIDTH: 651px"></col>
						</colgroup>
						<tbody vAlign="top">
							<tr style="MIN-HEIGHT: 0.26in">
								<td style="BORDER-RIGHT: #000000 1pt solid; BORDER-TOP: #000000 1pt solid; BORDER-LEFT: #000000 1pt solid; BORDER-BOTTOM: #000000 1pt solid; BACKGROUND-COLOR: #408ce8">
									<div>
										<font color="#ffffff" size="4">
											<strong>Algorithm Definitions</strong>
										</font>
									</div>
								</td>
							</tr>
							<tr style="MIN-HEIGHT: 0.042in">
								<td style="BORDER-RIGHT: #000000 1pt solid; BORDER-TOP: #000000 1pt solid; BORDER-LEFT: #000000 1pt solid; BORDER-BOTTOM: #000000 1pt solid">
									<div>
										<table class="xdRepeatingTable msoUcTable xdMaster" title="" style="TABLE-LAYOUT: fixed; WIDTH: 642px; BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-COLLAPSE: collapse; WORD-WRAP: break-word; BORDER-BOTTOM-STYLE: none" border="1" xd:CtrlId="CTRL183_5" xd:masterID="CTRL183_5">
											<colgroup>
												<col style="WIDTH: 237px"></col>
												<col style="WIDTH: 70px"></col>
												<col style="WIDTH: 80px"></col>
												<col style="WIDTH: 88px"></col>
												<col style="WIDTH: 86px"></col>
												<col style="WIDTH: 81px"></col>
											</colgroup>
											<tbody class="xdTableHeader">
												<tr>
													<td>
														<div align="center">
															<strong>Name</strong>
														</div>
													</td>
													<td>
														<div align="center">
															<strong>Type</strong>
														</div>
													</td>
													<td>
														<div align="center">
															<strong>History Window (TS)</strong>
														</div>
													</td>
													<td>
														<div align="center">
															<strong>Normalized Outlier Threshold</strong>
														</div>
													</td>
													<td>
														<div align="center">
															<strong>Event </strong>
														</div>
														<div align="center">
															<strong>Probability Threshold</strong>
														</div>
													</td>
													<td>
														<div align="center">
															<strong>Event Timeout (TS)</strong>
														</div>
													</td>
												</tr>
											</tbody><tbody xd:xctname="RepeatingTable" xd:masterName="CTRL183_5">
												<xsl:for-each select="Algorithms/Algorithm">
													<tr>
														<td><span class="xdTextBox" hideFocus="1" title="" tabIndex="0" xd:binding="@name" xd:CtrlId="CTRL184" xd:xctname="PlainText" style="WIDTH: 100%">
																<xsl:value-of select="@name"/>
															</span>
														</td>
														<td><select class="xdComboBox xdBehavior_Select" title="" size="1" tabIndex="0" xd:boundProp="value" xd:binding="@type" xd:CtrlId="CTRL223" xd:xctname="dropdown" style="WIDTH: 100%">
																<xsl:attribute name="value">
																	<xsl:value-of select="@type"/>
																</xsl:attribute>
																<option value="LPCF">
																	<xsl:if test="@type=&quot;LPCF&quot;">
																		<xsl:attribute name="selected">selected</xsl:attribute>
																	</xsl:if>LPCF</option>
																<option value="MVNN">
																	<xsl:if test="@type=&quot;MVNN&quot;">
																		<xsl:attribute name="selected">selected</xsl:attribute>
																	</xsl:if>MVNN</option>
																<option value="SPPB">
																	<xsl:if test="@type=&quot;SPPB&quot;">
																		<xsl:attribute name="selected">selected</xsl:attribute>
																	</xsl:if>SPPB</option>
																<option value="SPPE">
																	<xsl:if test="@type=&quot;SPPE&quot;">
																		<xsl:attribute name="selected">selected</xsl:attribute>
																	</xsl:if>SPPE</option>
																<option value="JAVA">
																	<xsl:if test="@type=&quot;JAVA&quot;">
																		<xsl:attribute name="selected">selected</xsl:attribute>
																	</xsl:if>JAVA</option>
																<option value="EXTERNAL">
																	<xsl:if test="@type=&quot;EXTERNAL&quot;">
																		<xsl:attribute name="selected">selected</xsl:attribute>
																	</xsl:if>EXTERNAL</option>
																<option value="CAND">
																	<xsl:if test="@type=&quot;CAND&quot;">
																		<xsl:attribute name="selected">selected</xsl:attribute>
																	</xsl:if>CAND</option>
																<option value="CAVE">
																	<xsl:if test="@type=&quot;CAVE&quot;">
																		<xsl:attribute name="selected">selected</xsl:attribute>
																	</xsl:if>CAVE</option>
																<option value="CMAX">
																	<xsl:if test="@type=&quot;CMAX&quot;">
																		<xsl:attribute name="selected">selected</xsl:attribute>
																	</xsl:if>CMAX</option>
															</select>
														</td>
														<td><span class="xdTextBox xdBehavior_Formatting" hideFocus="1" title="" contentEditable="true" tabIndex="0" xd:boundProp="xd:num" xd:binding="@history-window-TS" xd:CtrlId="CTRL186" xd:xctname="PlainText" xd:datafmt="&quot;number&quot;,&quot;numDigits:0;negativeOrder:1;&quot;" style="WIDTH: 100%">
																<xsl:attribute name="xd:num">
																	<xsl:value-of select="@history-window-TS"/>
																</xsl:attribute>
																<xsl:choose>
																	<xsl:when test="function-available('xdFormatting:formatString')">
																		<xsl:value-of select="xdFormatting:formatString(@history-window-TS,&quot;number&quot;,&quot;numDigits:0;negativeOrder:1;&quot;)"/>
																	</xsl:when>
																	<xsl:otherwise>
																		<xsl:value-of select="@history-window-TS"/>
																	</xsl:otherwise>
																</xsl:choose>
															</span>
														</td>
														<td><span class="xdTextBox xdBehavior_Formatting" hideFocus="1" title="" contentEditable="true" tabIndex="0" xd:boundProp="xd:num" xd:binding="@outlier-threshold-SD" xd:CtrlId="CTRL187" xd:xctname="PlainText" xd:datafmt="&quot;number&quot;,&quot;numDigits:auto;negativeOrder:1;&quot;" style="WIDTH: 100%">
																<xsl:attribute name="xd:num">
																	<xsl:value-of select="@outlier-threshold-SD"/>
																</xsl:attribute>
																<xsl:choose>
																	<xsl:when test="function-available('xdFormatting:formatString')">
																		<xsl:value-of select="xdFormatting:formatString(@outlier-threshold-SD,&quot;number&quot;,&quot;numDigits:auto;negativeOrder:1;&quot;)"/>
																	</xsl:when>
																	<xsl:otherwise>
																		<xsl:value-of select="@outlier-threshold-SD"/>
																	</xsl:otherwise>
																</xsl:choose>
															</span>
														</td>
														<td><span class="xdTextBox xdBehavior_Formatting" hideFocus="1" title="" contentEditable="true" tabIndex="0" xd:boundProp="xd:num" xd:binding="@event-threshold-P" xd:CtrlId="CTRL188" xd:xctname="PlainText" xd:datafmt="&quot;number&quot;,&quot;numDigits:auto;negativeOrder:1;&quot;" style="WIDTH: 100%">
																<xsl:attribute name="xd:num">
																	<xsl:value-of select="@event-threshold-P"/>
																</xsl:attribute>
																<xsl:choose>
																	<xsl:when test="function-available('xdFormatting:formatString')">
																		<xsl:value-of select="xdFormatting:formatString(@event-threshold-P,&quot;number&quot;,&quot;numDigits:auto;negativeOrder:1;&quot;)"/>
																	</xsl:when>
																	<xsl:otherwise>
																		<xsl:value-of select="@event-threshold-P"/>
																	</xsl:otherwise>
																</xsl:choose>
															</span>
														</td>
														<td><span class="xdTextBox xdBehavior_Formatting" hideFocus="1" title="" contentEditable="true" tabIndex="0" xd:boundProp="xd:num" xd:binding="@event-timeout-TS" xd:CtrlId="CTRL189" xd:xctname="PlainText" xd:datafmt="&quot;number&quot;,&quot;numDigits:0;negativeOrder:1;&quot;" style="WIDTH: 100%">
																<xsl:attribute name="xd:num">
																	<xsl:value-of select="@event-timeout-TS"/>
																</xsl:attribute>
																<xsl:choose>
																	<xsl:when test="function-available('xdFormatting:formatString')">
																		<xsl:value-of select="xdFormatting:formatString(@event-timeout-TS,&quot;number&quot;,&quot;numDigits:0;negativeOrder:1;&quot;)"/>
																	</xsl:when>
																	<xsl:otherwise>
																		<xsl:value-of select="@event-timeout-TS"/>
																	</xsl:otherwise>
																</xsl:choose>
															</span>
														</td>
													</tr>
												</xsl:for-each>
											</tbody>
										</table>
										<div class="optionalPlaceholder" xd:xmlToEdit="Algorithm_125" tabIndex="0" xd:action="xCollection::insert" style="WIDTH: 642px">Insert item</div>
									</div>
									<div><xsl:if test="function-available('xdXDocument:GetDOM')">
											<xsl:variable name="masterPosCTRL203" select="xdXDocument:GetNamedNodeProperty(/canary/Algorithms, 'CTRL183_5', 1)"/>
											<xsl:apply-templates select="Algorithms/Algorithm [ (position() = $masterPosCTRL203) ] " mode="_20"/>
											<div class="optionalPlaceholder" xd:xmlToEdit="Algorithm_132" tabIndex="0" xd:action="xCollection::insert" align="left" style="WIDTH: 649px">Insert item</div>
										</xsl:if>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div>
					<div contentEditable="false" style="PAGE-BREAK-AFTER: always">
						<br/>
						<span class="xdPageBreak" unselectable="on">
							<br/>
						</span>
					</div>
				</div>
				<div>
					<table class="xdFormLayout xdLayout" style="TABLE-LAYOUT: fixed; WIDTH: 651px; BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-COLLAPSE: collapse; WORD-WRAP: break-word; BORDER-BOTTOM-STYLE: none" border="1">
						<colgroup>
							<col style="WIDTH: 651px"></col>
						</colgroup>
						<tbody vAlign="top">
							<tr style="MIN-HEIGHT: 0.26in">
								<td style="BORDER-RIGHT: #000000 1pt solid; BORDER-TOP: #000000 1pt solid; BORDER-LEFT: #000000 1pt solid; BORDER-BOTTOM: #000000 1pt solid; BACKGROUND-COLOR: #408ce8">
									<div>
										<font color="#ffffff" size="4">
											<strong>Station Definitions</strong>
										</font>
									</div>
								</td>
							</tr>
							<tr style="MIN-HEIGHT: 0.042in">
								<td style="BORDER-RIGHT: #000000 1pt solid; BORDER-TOP: #000000 1pt solid; BORDER-LEFT: #000000 1pt solid; BORDER-BOTTOM: #000000 1pt solid">
									<div>
										<table class="xdRepeatingTable msoUcTable xdMaster" title="" style="TABLE-LAYOUT: fixed; WIDTH: 643px; BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-COLLAPSE: collapse; WORD-WRAP: break-word; BORDER-BOTTOM-STYLE: none" border="1" xd:CtrlId="CTRL225_5" xd:masterID="CTRL225_5">
											<colgroup>
												<col style="WIDTH: 585px"></col>
												<col style="WIDTH: 58px"></col>
											</colgroup>
											<tbody class="xdTableHeader">
												<tr>
													<td>
														<div>
															<strong>Station ID/Name</strong>
														</div>
													</td>
													<td>
														<div>
															<strong>Enable</strong>
														</div>
													</td>
												</tr>
											</tbody><tbody xd:xctname="RepeatingTable" xd:masterName="CTRL225_5">
												<xsl:for-each select="general-settings/Station">
													<tr>
														<td><span class="xdTextBox" hideFocus="1" title="" tabIndex="0" xd:binding="@scada-id" xd:CtrlId="CTRL226" xd:xctname="PlainText" style="WIDTH: 100%">
																<xsl:value-of select="@scada-id"/>
															</span>
														</td>
														<td><input class="xdBehavior_Boolean" title="" type="checkbox" tabIndex="0" xd:boundProp="xd:value" xd:binding="@state" xd:CtrlId="CTRL259" xd:xctname="CheckBox" xd:onValue="enabled" xd:offValue="disabled">
																<xsl:attribute name="xd:value">
																	<xsl:value-of select="@state"/>
																</xsl:attribute>
																<xsl:if test="@state=&quot;enabled&quot;">
																	<xsl:attribute name="CHECKED">CHECKED</xsl:attribute>
																</xsl:if>
															</input>
														</td>
													</tr>
												</xsl:for-each>
											</tbody>
										</table>
										<div class="optionalPlaceholder" xd:xmlToEdit="Station_158" tabIndex="0" xd:action="xCollection::insert" style="WIDTH: 643px">Insert item</div>
									</div>
									<div><xsl:if test="function-available('xdXDocument:GetDOM')">
											<xsl:variable name="masterPosCTRL242" select="xdXDocument:GetNamedNodeProperty(/canary/general-settings, 'CTRL225_5', 1)"/>
											<xsl:apply-templates select="general-settings/Station [ (position() = $masterPosCTRL242) ] " mode="_24"/>
											<div class="optionalPlaceholder" xd:xmlToEdit="Station_161" tabIndex="0" xd:action="xCollection::insert" align="left" style="WIDTH: 647px">Insert item</div>
										</xsl:if>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div> </div>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="AlgorithmsFile" mode="_1">
		<div class="xdSection xdRepeating" title="" style="MARGIN-BOTTOM: 6px; WIDTH: 643px" align="left" xd:CtrlId="CTRL7" xd:xctname="Section" tabIndex="-1">
			<div>Use external Algorithm definitions from the following file:<span class="xdTextBox" hideFocus="1" title="" tabIndex="0" xd:binding="@name" xd:CtrlId="CTRL9" xd:xctname="PlainText" style="WIDTH: 100%">
					<xsl:value-of select="@name"/>
				</span>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="SignalsFile" mode="_2">
		<div class="xdSection xdRepeating" title="" style="MARGIN-BOTTOM: 6px; WIDTH: 100%" align="left" xd:CtrlId="CTRL10" xd:xctname="Section" tabIndex="-1">
			<div>Use external Signal definitions from the following file: <span class="xdTextBox" hideFocus="1" title="" tabIndex="0" xd:binding="@name" xd:CtrlId="CTRL11" xd:xctname="PlainText" style="WIDTH: 100%">
					<xsl:value-of select="@name"/>
				</span>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="datasource" mode="_9">
		<div class="xdRepeatingSection xdRepeating" title="" style="MARGIN-BOTTOM: 6px; WIDTH: 651px" align="left" xd:CtrlId="CTRL100" xd:xctname="RepeatingSection" xd:linkedToMaster="CTRL79_5" tabIndex="-1">
			<div align="center">
				<strong>
					<font size="3">Datasource Details</font>
				</strong>
				<hr/>
			</div>
			<div>Short Id: <span class="xdTextBox xdBehavior_GhostedText" hideFocus="1" title="" contentEditable="true" tabIndex="0" xd:binding="@short-id" xd:CtrlId="CTRL101" xd:xctname="PlainText" style="WIDTH: 473px; WHITE-SPACE: nowrap">
					<xsl:choose>
						<xsl:when test="not(string(@short-id))">
							<xsl:attribute name="xd:ghosted">true</xsl:attribute>Unique string to identify this  datasource</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="@short-id"/>
						</xsl:otherwise>
					</xsl:choose>
				</span>  Enabled: <input class="xdBehavior_Boolean" title="" type="checkbox" tabIndex="0" xd:boundProp="xd:value" xd:binding="@state" xd:CtrlId="CTRL122" xd:xctname="CheckBox" xd:onValue="enabled" xd:offValue="disabled">
					<xsl:attribute name="xd:value">
						<xsl:value-of select="@state"/>
					</xsl:attribute>
					<xsl:if test="@state=&quot;enabled&quot;">
						<xsl:attribute name="CHECKED">CHECKED</xsl:attribute>
					</xsl:if>
				</input>
			</div>
			<div>Type: <select class="xdComboBox xdBehavior_Select" title="" size="1" tabIndex="0" xd:boundProp="value" xd:binding="@type" xd:CtrlId="CTRL123" xd:xctname="dropdown" style="WIDTH: 131px">
					<xsl:attribute name="value">
						<xsl:value-of select="@type"/>
					</xsl:attribute>
					<option value="CSV">
						<xsl:if test="@type=&quot;CSV&quot;">
							<xsl:attribute name="selected">selected</xsl:attribute>
						</xsl:if>CSV Files</option>
					<option value="JDBC">
						<xsl:if test="@type=&quot;JDBC&quot;">
							<xsl:attribute name="selected">selected</xsl:attribute>
						</xsl:if>JDBC Database</option>
					<option value="EDDIES">
						<xsl:if test="@type=&quot;EDDIES&quot;">
							<xsl:attribute name="selected">selected</xsl:attribute>
						</xsl:if>EDDIES Database</option>
					<option value="XML">
						<xsl:if test="@type=&quot;XML&quot;">
							<xsl:attribute name="selected">selected</xsl:attribute>
						</xsl:if>XML Messages</option>
				</select> Input Type: <select class="xdComboBox xdBehavior_Select" title="" size="1" tabIndex="0" xd:boundProp="value" xd:binding="@input-type" xd:CtrlId="CTRL124" xd:xctname="dropdown" style="WIDTH: 129px">
					<xsl:attribute name="value">
						<xsl:value-of select="@input-type"/>
					</xsl:attribute>
					<option>
						<xsl:if test="@input-type=&quot;&quot;">
							<xsl:attribute name="selected">selected</xsl:attribute>
						</xsl:if>Same as "Type"</option>
					<option value="CSV">
						<xsl:if test="@input-type=&quot;CSV&quot;">
							<xsl:attribute name="selected">selected</xsl:attribute>
						</xsl:if>CSV</option>
					<option value="JDBC">
						<xsl:if test="@input-type=&quot;JDBC&quot;">
							<xsl:attribute name="selected">selected</xsl:attribute>
						</xsl:if>JDBC</option>
					<option value="EDDIES">
						<xsl:if test="@input-type=&quot;EDDIES&quot;">
							<xsl:attribute name="selected">selected</xsl:attribute>
						</xsl:if>EDDIES</option>
					<option value="XML">
						<xsl:if test="@input-type=&quot;XML&quot;">
							<xsl:attribute name="selected">selected</xsl:attribute>
						</xsl:if>XML</option>
				</select> Output Type: <select class="xdComboBox xdBehavior_Select" title="" size="1" tabIndex="0" xd:boundProp="value" xd:binding="@output-type" xd:CtrlId="CTRL125" xd:xctname="dropdown" style="WIDTH: 132px">
					<xsl:attribute name="value">
						<xsl:value-of select="@output-type"/>
					</xsl:attribute>
					<option>
						<xsl:if test="@output-type=&quot;&quot;">
							<xsl:attribute name="selected">selected</xsl:attribute>
						</xsl:if>Same as "Type"</option>
					<option value="FILES">
						<xsl:if test="@output-type=&quot;FILES&quot;">
							<xsl:attribute name="selected">selected</xsl:attribute>
						</xsl:if>FILES</option>
					<option value="JDBC">
						<xsl:if test="@output-type=&quot;JDBC&quot;">
							<xsl:attribute name="selected">selected</xsl:attribute>
						</xsl:if>JDBC</option>
					<option value="EDDIES">
						<xsl:if test="@output-type=&quot;EDDIES&quot;">
							<xsl:attribute name="selected">selected</xsl:attribute>
						</xsl:if>EDDIES</option>
					<option value="XML">
						<xsl:if test="@output-type=&quot;XML&quot;">
							<xsl:attribute name="selected">selected</xsl:attribute>
						</xsl:if>XML</option>
				</select>
			</div>
			<div align="center">
				<strong>Location Options</strong>
			</div>
			<div>Location: <span class="xdTextBox xdBehavior_GhostedText" hideFocus="1" title="" contentEditable="true" tabIndex="0" xd:binding="location" xd:CtrlId="CTRL106" xd:xctname="PlainText" style="WIDTH: 567px; WHITE-SPACE: nowrap">
					<xsl:choose>
						<xsl:when test="not(string(location))">
							<xsl:attribute name="xd:ghosted">true</xsl:attribute>Filename, Full Path and Filename, Complete URL, or Database ID</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="location"/>
						</xsl:otherwise>
					</xsl:choose>
				</span>
			</div>
			<div>URL Type: <span class="xdTextBox xdBehavior_GhostedText" hideFocus="1" title="" contentEditable="true" tabIndex="0" xd:binding="url-type" xd:CtrlId="CTRL109" xd:xctname="PlainText" style="WIDTH: 130px; WHITE-SPACE: nowrap">
					<xsl:choose>
						<xsl:when test="not(string(url-type))">
							<xsl:attribute name="xd:ghosted">true</xsl:attribute>jdbc:SPECIFIC</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="url-type"/>
						</xsl:otherwise>
					</xsl:choose>
				</span>IP address: <span class="xdTextBox xdBehavior_GhostedText" hideFocus="1" title="" contentEditable="true" tabIndex="0" xd:binding="ipaddress" xd:CtrlId="CTRL107" xd:xctname="PlainText" style="WIDTH: 130px; WHITE-SPACE: nowrap">
					<xsl:choose>
						<xsl:when test="not(string(ipaddress))">
							<xsl:attribute name="xd:ghosted">true</xsl:attribute>IP of database</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="ipaddress"/>
						</xsl:otherwise>
					</xsl:choose>
				</span>Port: <span class="xdTextBox xdBehavior_GhostedText" hideFocus="1" title="" contentEditable="true" tabIndex="0" xd:binding="port" xd:CtrlId="CTRL108" xd:xctname="PlainText" style="WIDTH: 130px; WHITE-SPACE: nowrap">
					<xsl:choose>
						<xsl:when test="not(string(port))">
							<xsl:attribute name="xd:ghosted">true</xsl:attribute>Database port</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="port"/>
						</xsl:otherwise>
					</xsl:choose>
				</span>
				<strong/>
			</div>
			<div align="center">
				<strong>Java JDBC Options</strong>
			</div>
			<div>
				<table class="xdLayout" style="BORDER-RIGHT: medium none; TABLE-LAYOUT: fixed; BORDER-TOP: medium none; BORDER-LEFT: medium none; WIDTH: 636px; BORDER-BOTTOM: medium none; BORDER-COLLAPSE: collapse; WORD-WRAP: break-word" borderColor="buttontext" border="1">
					<colgroup>
						<col style="WIDTH: 318px"></col>
						<col style="WIDTH: 318px"></col>
					</colgroup>
					<tbody vAlign="top">
						<tr style="MIN-HEIGHT: 25px">
							<td>
								<div>
									<font face="Verdana" size="2">Datasource Class: <span class="xdTextBox xdBehavior_GhostedText" hideFocus="1" title="" contentEditable="true" tabIndex="0" xd:binding="datasource-class" xd:CtrlId="CTRL110" xd:xctname="PlainText" style="WIDTH: 186px; WHITE-SPACE: nowrap">
											<xsl:choose>
												<xsl:when test="not(string(datasource-class))">
													<xsl:attribute name="xd:ghosted">true</xsl:attribute>JDBC "Datasource" class name</xsl:when>
												<xsl:otherwise>
													<xsl:value-of select="datasource-class"/>
												</xsl:otherwise>
											</xsl:choose>
										</span>
									</font>
								</div>
							</td>
							<td>
								<div>
									<font face="Verdana" size="2">Driver Config File: <span class="xdTextBox xdBehavior_GhostedText" hideFocus="1" title="" contentEditable="true" tabIndex="0" xd:binding="driver-config" xd:CtrlId="CTRL111" xd:xctname="PlainText" style="WIDTH: 188px; WHITE-SPACE: nowrap">
											<xsl:choose>
												<xsl:when test="not(string(driver-config))">
													<xsl:attribute name="xd:ghosted">true</xsl:attribute>From etc directory</xsl:when>
												<xsl:otherwise>
													<xsl:value-of select="driver-config"/>
												</xsl:otherwise>
											</xsl:choose>
										</span>
									</font>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div>
									<font face="Verdana" size="2">Input Table: <span class="xdTextBox xdBehavior_GhostedText" hideFocus="1" title="" contentEditable="true" tabIndex="0" xd:binding="input-table" xd:CtrlId="CTRL112" xd:xctname="PlainText" style="WIDTH: 224px; WHITE-SPACE: nowrap">
											<xsl:choose>
												<xsl:when test="not(string(input-table))">
													<xsl:attribute name="xd:ghosted">true</xsl:attribute>Input data view or table</xsl:when>
												<xsl:otherwise>
													<xsl:value-of select="input-table"/>
												</xsl:otherwise>
											</xsl:choose>
										</span>
									</font>
								</div>
							</td>
							<td>
								<div>
									<font face="Verdana" size="2">Output Table: <span class="xdTextBox xdBehavior_GhostedText" hideFocus="1" title="" contentEditable="true" tabIndex="0" xd:binding="output-table" xd:CtrlId="CTRL113" xd:xctname="PlainText" style="WIDTH: 212px; WHITE-SPACE: nowrap">
											<xsl:choose>
												<xsl:when test="not(string(output-table))">
													<xsl:attribute name="xd:ghosted">true</xsl:attribute>Output data view or table</xsl:when>
												<xsl:otherwise>
													<xsl:value-of select="output-table"/>
												</xsl:otherwise>
											</xsl:choose>
										</span>
									</font>
								</div>
							</td>
						</tr>
						<tr style="MIN-HEIGHT: 26px">
							<td>
								<div>
									<font face="Verdana" size="2">Timestep Field: <span class="xdTextBox xdBehavior_GhostedText" hideFocus="1" title="" contentEditable="true" tabIndex="0" xd:binding="timestep-field" xd:CtrlId="CTRL114" xd:xctname="PlainText" style="WIDTH: 205px; WHITE-SPACE: nowrap">
											<xsl:choose>
												<xsl:when test="not(string(timestep-field))">
													<xsl:attribute name="xd:ghosted">true</xsl:attribute>Field where date/time saved</xsl:when>
												<xsl:otherwise>
													<xsl:value-of select="timestep-field"/>
												</xsl:otherwise>
											</xsl:choose>
										</span>
									</font>
								</div>
							</td>
							<td>
								<div>
									<font face="Verdana" size="2">To Date Function: <span class="xdTextBox xdBehavior_GhostedText" hideFocus="1" title="" contentEditable="true" tabIndex="0" xd:binding="to-date-func" xd:CtrlId="CTRL115" xd:xctname="PlainText" style="WIDTH: 183px; WHITE-SPACE: nowrap">
											<xsl:choose>
												<xsl:when test="not(string(to-date-func))">
													<xsl:attribute name="xd:ghosted">true</xsl:attribute>SQL conversion command</xsl:when>
												<xsl:otherwise>
													<xsl:value-of select="to-date-func"/>
												</xsl:otherwise>
											</xsl:choose>
										</span>
									</font>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div align="center">
				<strong>Date Time Format Options (All Types)</strong>
			</div>
			<div>To Date Format: <span class="xdTextBox xdBehavior_GhostedText" hideFocus="1" title="" contentEditable="true" tabIndex="0" xd:binding="to-date-fmt" xd:CtrlId="CTRL116" xd:xctname="PlainText" style="WIDTH: 515px; WHITE-SPACE: nowrap">
					<xsl:choose>
						<xsl:when test="not(string(to-date-fmt))">
							<xsl:attribute name="xd:ghosted">true</xsl:attribute>MATLAB format string (CSV files) or Native Database Format String</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="to-date-fmt"/>
						</xsl:otherwise>
					</xsl:choose>
				</span>
			</div>
			<div align="center">
				<strong>Login Options</strong>
			</div>
			<div>Username: <span class="xdTextBox xdBehavior_GhostedText" hideFocus="1" title="" contentEditable="true" tabIndex="0" xd:binding="username" xd:CtrlId="CTRL117" xd:xctname="PlainText" style="WIDTH: 130px; WHITE-SPACE: nowrap">
					<xsl:choose>
						<xsl:when test="not(string(username))">
							<xsl:attribute name="xd:ghosted">true</xsl:attribute>Clear text!</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="username"/>
						</xsl:otherwise>
					</xsl:choose>
				</span>   Password: <span class="xdTextBox xdBehavior_GhostedText" hideFocus="1" title="" contentEditable="true" tabIndex="0" xd:binding="password" xd:CtrlId="CTRL118" xd:xctname="PlainText" style="WIDTH: 160px; WHITE-SPACE: nowrap">
					<xsl:choose>
						<xsl:when test="not(string(password))">
							<xsl:attribute name="xd:ghosted">true</xsl:attribute>Clear text! Protect file!</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="password"/>
						</xsl:otherwise>
					</xsl:choose>
				</span>  Use Interactive Login: <input class="xdBehavior_Boolean" title="" type="checkbox" tabIndex="0" xd:boundProp="xd:value" xd:binding="interactive-login" xd:CtrlId="CTRL119" xd:xctname="CheckBox" xd:onValue="true" xd:offValue="false">
					<xsl:attribute name="xd:value">
						<xsl:value-of select="interactive-login"/>
					</xsl:attribute>
					<xsl:if test="interactive-login=&quot;true&quot;">
						<xsl:attribute name="CHECKED">CHECKED</xsl:attribute>
					</xsl:if>
				</input>
			</div>
			<div>Alternate CANARY ID for middleware: <span class="xdTextBox xdBehavior_GhostedText" hideFocus="1" title="" contentEditable="true" tabIndex="0" xd:binding="canary-id" xd:CtrlId="CTRL120" xd:xctname="PlainText" style="WIDTH: 383px; WHITE-SPACE: nowrap">
					<xsl:choose>
						<xsl:when test="not(string(canary-id))">
							<xsl:attribute name="xd:ghosted">true</xsl:attribute>Optional "Instance" ID - Set via username for EDDIES</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="canary-id"/>
						</xsl:otherwise>
					</xsl:choose>
				</span>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="Signal" mode="_13">
		<div class="xdRepeatingSection xdRepeating" title="" style="MARGIN-BOTTOM: 6px; WIDTH: 644px" align="left" xd:CtrlId="CTRL146" xd:xctname="RepeatingSection" xd:linkedToMaster="CTRL127_5" tabIndex="-1">
			<div align="center">
				<strong>
					<font size="3">Signal Details</font>
				</strong>
			</div>
			<div>
				<hr/>
			</div>
			<div>Name: <span class="xdTextBox xdBehavior_GhostedText" hideFocus="1" title="" contentEditable="true" tabIndex="0" xd:binding="@name" xd:CtrlId="CTRL147" xd:xctname="PlainText" style="WIDTH: 585px; WHITE-SPACE: nowrap">
					<xsl:choose>
						<xsl:when test="not(string(@name))">
							<xsl:attribute name="xd:ghosted">true</xsl:attribute>Unique signal alias; e.g., use "TEST_1" and "TEST_2" not "TEST" and "TEST_2"</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="@name"/>
						</xsl:otherwise>
					</xsl:choose>
				</span>
			</div>
			<div>SCADA Tag: <span class="xdTextBox xdBehavior_GhostedText" hideFocus="1" title="" contentEditable="true" tabIndex="0" xd:binding="@scada-tag" xd:CtrlId="CTRL148" xd:xctname="PlainText" style="WIDTH: 546px; WHITE-SPACE: nowrap">
					<xsl:choose>
						<xsl:when test="not(string(@scada-tag))">
							<xsl:attribute name="xd:ghosted">true</xsl:attribute>Complete SCADA tag for the data that goes with this signal</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="@scada-tag"/>
						</xsl:otherwise>
					</xsl:choose>
				</span>
			</div>
			<div>Signal Type: <select class="xdComboBox xdBehavior_Select" title="" size="1" tabIndex="0" xd:boundProp="value" xd:binding="@signal-type" xd:CtrlId="CTRL165" xd:xctname="dropdown" style="WIDTH: 70px">
					<xsl:attribute name="value">
						<xsl:value-of select="@signal-type"/>
					</xsl:attribute>
					<option value="WQ">
						<xsl:if test="@signal-type=&quot;WQ&quot;">
							<xsl:attribute name="selected">selected</xsl:attribute>
						</xsl:if>WQ</option>
					<option value="OP">
						<xsl:if test="@signal-type=&quot;OP&quot;">
							<xsl:attribute name="selected">selected</xsl:attribute>
						</xsl:if>OP</option>
					<option value="ALM">
						<xsl:if test="@signal-type=&quot;ALM&quot;">
							<xsl:attribute name="selected">selected</xsl:attribute>
						</xsl:if>ALM</option>
					<option value="CAL">
						<xsl:if test="@signal-type=&quot;CAL&quot;">
							<xsl:attribute name="selected">selected</xsl:attribute>
						</xsl:if>CAL</option>
					<option value="INFO">
						<xsl:if test="@signal-type=&quot;INFO&quot;">
							<xsl:attribute name="selected">selected</xsl:attribute>
						</xsl:if>INFO</option>
				</select> Parameter Type: <span class="xdTextBox xdBehavior_GhostedText" hideFocus="1" title="" contentEditable="true" tabIndex="0" xd:binding="@parameter" xd:CtrlId="CTRL150" xd:xctname="PlainText" style="WIDTH: 130px; WHITE-SPACE: nowrap">
					<xsl:choose>
						<xsl:when test="not(string(@parameter))">
							<xsl:attribute name="xd:ghosted">true</xsl:attribute>E.g., COND, PH, CL2</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="@parameter"/>
						</xsl:otherwise>
					</xsl:choose>
				</span> Ignore Changes: <select class="xdComboBox xdBehavior_Select" title="" size="1" tabIndex="0" xd:boundProp="value" xd:binding="@ignore-changes" xd:CtrlId="CTRL167" xd:xctname="dropdown" style="WIDTH: 100px">
					<xsl:attribute name="value">
						<xsl:value-of select="@ignore-changes"/>
					</xsl:attribute>
					<option value="none">
						<xsl:if test="@ignore-changes=&quot;none&quot;">
							<xsl:attribute name="selected">selected</xsl:attribute>
						</xsl:if>OFF</option>
					<option value="increases">
						<xsl:if test="@ignore-changes=&quot;increases&quot;">
							<xsl:attribute name="selected">selected</xsl:attribute>
						</xsl:if>increases</option>
					<option value="decreases">
						<xsl:if test="@ignore-changes=&quot;decreases&quot;">
							<xsl:attribute name="selected">selected</xsl:attribute>
						</xsl:if>decreases</option>
					<option value="both">
						<xsl:if test="@ignore-changes=&quot;both&quot;">
							<xsl:attribute name="selected">selected</xsl:attribute>
						</xsl:if>both inc/dec</option>
					<option value="all">
						<xsl:if test="@ignore-changes=&quot;all&quot;">
							<xsl:attribute name="selected">selected</xsl:attribute>
						</xsl:if>Ignore Signal</option>
				</select>
			</div>
			<div>
				<hr/>
			</div>
			<div><xsl:choose>
					<xsl:when test="DataType">
						<xsl:apply-templates select="DataType" mode="_14"/>
					</xsl:when>
					<xsl:otherwise>
						<div class="optionalPlaceholder" xd:xmlToEdit="DataType_100" tabIndex="0" align="left" style="WIDTH: 633px">Click here to make this a DATA typed signal</div>
					</xsl:otherwise>
				</xsl:choose>
			</div>
			<div><xsl:choose>
					<xsl:when test="AlarmType">
						<xsl:apply-templates select="AlarmType" mode="_15"/>
					</xsl:when>
					<xsl:otherwise>
						<div class="optionalPlaceholder" xd:xmlToEdit="AlarmType_101" tabIndex="0" align="left" style="WIDTH: 633px">Click here to make this an ALARM typed signal</div>
					</xsl:otherwise>
				</xsl:choose>
			</div>
			<div><xsl:choose>
					<xsl:when test="CompositeSignal">
						<xsl:apply-templates select="CompositeSignal" mode="_16"/>
					</xsl:when>
					<xsl:otherwise>
						<div class="optionalPlaceholder" xd:xmlToEdit="CompositeSignal_102" tabIndex="0" align="left" style="WIDTH: 633px">Click here to make this signal a COMPOSITE signal</div>
					</xsl:otherwise>
				</xsl:choose>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="DataType" mode="_14">
		<div class="xdSection xdRepeating" title="" style="MARGIN-BOTTOM: 6px; WIDTH: 633px" align="left" xd:CtrlId="CTRL152" xd:xctname="Section" tabIndex="-1">
			<div align="center">
				<strong>DATA TYPE SIGNAL OPTIONS</strong>
			</div>
			<div>
				<table class="msoUcTable" style="TABLE-LAYOUT: fixed; WIDTH: 623px; BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-COLLAPSE: collapse; WORD-WRAP: break-word; BORDER-BOTTOM-STYLE: none" border="1">
					<colgroup>
						<col style="WIDTH: 149px"></col>
						<col style="WIDTH: 161px"></col>
						<col style="WIDTH: 161px"></col>
						<col style="WIDTH: 152px"></col>
					</colgroup>
					<tbody>
						<tr>
							<td style="BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: none">
								<div align="right">Precision</div>
							</td>
							<td style="BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: none">
								<div><span class="xdTextBox xdBehavior_Formatting" hideFocus="1" title="" contentEditable="true" tabIndex="0" xd:boundProp="xd:num" xd:binding="@precision" xd:CtrlId="CTRL177" xd:xctname="PlainText" xd:datafmt="&quot;number&quot;,&quot;numDigits:auto;negativeOrder:1;&quot;" style="WIDTH: 100%">
										<xsl:attribute name="xd:num">
											<xsl:value-of select="@precision"/>
										</xsl:attribute>
										<xsl:choose>
											<xsl:when test="function-available('xdFormatting:formatString')">
												<xsl:value-of select="xdFormatting:formatString(@precision,&quot;number&quot;,&quot;numDigits:auto;negativeOrder:1;&quot;)"/>
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="@precision"/>
											</xsl:otherwise>
										</xsl:choose>
									</span>
								</div>
							</td>
							<td style="BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: none">
								<div align="right">Units</div>
							</td>
							<td style="BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: none">
								<div><span class="xdTextBox xdBehavior_GhostedText" hideFocus="1" title="" contentEditable="true" tabIndex="0" xd:binding="@units" xd:CtrlId="CTRL178" xd:xctname="PlainText" style="WIDTH: 100%; WHITE-SPACE: nowrap">
										<xsl:choose>
											<xsl:when test="not(string(@units))">
												<xsl:attribute name="xd:ghosted">true</xsl:attribute>LaTeX text</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="@units"/>
											</xsl:otherwise>
										</xsl:choose>
									</span>
								</div>
							</td>
						</tr>
						<tr>
							<td style="BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: none">
								<div align="right">Minimum Data Value</div>
							</td>
							<td style="BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: none">
								<div><span class="xdTextBox" hideFocus="1" title="" tabIndex="0" xd:binding="@data-min" xd:CtrlId="CTRL179" xd:xctname="PlainText" style="WIDTH: 100%">
										<xsl:value-of select="@data-min"/>
									</span>
								</div>
							</td>
							<td style="BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: none">
								<div align="right">Maximum Data Value</div>
							</td>
							<td style="BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: none">
								<div><span class="xdTextBox" hideFocus="1" title="" tabIndex="0" xd:binding="@data-max" xd:CtrlId="CTRL180" xd:xctname="PlainText" style="WIDTH: 100%">
										<xsl:value-of select="@data-max"/>
									</span>
								</div>
							</td>
						</tr>
						<tr>
							<td style="BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: none">
								<div align="right">Set Point (Low)</div>
							</td>
							<td style="BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: none">
								<div><span class="xdTextBox" hideFocus="1" title="" tabIndex="0" xd:binding="@set-point-min" xd:CtrlId="CTRL181" xd:xctname="PlainText" style="WIDTH: 100%">
										<xsl:value-of select="@set-point-min"/>
									</span>
								</div>
							</td>
							<td style="BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: none">
								<div align="right">Set Point (High)</div>
							</td>
							<td style="BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: none">
								<div><span class="xdTextBox" hideFocus="1" title="" tabIndex="0" xd:binding="@set-point-max" xd:CtrlId="CTRL182" xd:xctname="PlainText" style="WIDTH: 100%">
										<xsl:value-of select="@set-point-max"/>
									</span>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div> </div>
		</div>
	</xsl:template>
	<xsl:template match="AlarmType" mode="_15">
		<div class="xdSection xdRepeating" title="" style="MARGIN-BOTTOM: 6px; WIDTH: 633px" align="left" xd:CtrlId="CTRL159" xd:xctname="Section" tabIndex="-1">
			<div align="center">
				<strong>ALARM TYPE SIGNAL OPTIONS</strong>
			</div>
			<div>Alarm Scope (ALM types, not CAL types): <span class="xdComboBox xdBehavior_ComboBox" xd:xctname="combobox" style="WIDTH: 339px;LAYOUT-GRID:none;">
					<xsl:if test="function-available('ipApp:GetMajorVersion') and ipApp:GetMajorVersion() &gt;= 12">
						<select tabIndex="-1" disabled="true" style="WIDTH: 339px;VISIBILITY:hidden;WIDTH:100%;"/>
						<span xd:xctname="PlainText" hideFocus="1" class="xdTextBox xdBehavior_ComboBoxTextField" title="" value="" xd:binding="@alarm-scope" xd:CtrlId="CTRL176" tabIndex="0">
							<xsl:attribute name="style">WIDTH: 339px;POSITION:absolute;WIDTH:0px;WORD-WRAP:normal</xsl:attribute>
							<xsl:variable name="val" select="@alarm-scope"/>
							<xsl:choose>
								<xsl:when test="../@name[.=$val]/.">
									<xsl:value-of select="../@name[.=$val]/."/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="@alarm-scope"/>
								</xsl:otherwise>
							</xsl:choose>
						</span>
					</xsl:if>
					<select class="xdComboBox xdBehavior_Select" title="" size="1" value="" xd:binding="@alarm-scope" xd:CtrlId="CTRL176" xd:xctname="dropdown" xd:boundProp="value">
						<xsl:choose>
							<xsl:when test="function-available('ipApp:GetMajorVersion') and ipApp:GetMajorVersion() &gt;= 12">
								<xsl:attribute name="tabIndex">-1</xsl:attribute>
							</xsl:when>
							<xsl:otherwise>
								<xsl:attribute name="tabIndex">0</xsl:attribute>
							</xsl:otherwise>
						</xsl:choose>
						<xsl:attribute name="style">WIDTH: 339px<xsl:choose>
								<xsl:when test="function-available('ipApp:GetMajorVersion') and ipApp:GetMajorVersion() &gt;= 12">;POSITION:absolute;WIDTH:0px;</xsl:when>
								<xsl:otherwise>;WIDTH: 339px;</xsl:otherwise>
							</xsl:choose>
						</xsl:attribute>
						<xsl:attribute name="value"><xsl:value-of select="@alarm-scope"/></xsl:attribute>
						<xsl:choose><xsl:when test="function-available('xdXDocument:GetDOM')"><option/><xsl:variable name="val" select="@alarm-scope"/><xsl:if test="not(../@name[.=$val] or $val='')"><option selected="selected"><xsl:attribute name="value"><xsl:value-of select="$val"/></xsl:attribute><xsl:value-of select="$val"/></option></xsl:if><xsl:for-each select="../@name"><option><xsl:attribute name="value"><xsl:value-of select="."/></xsl:attribute><xsl:if test="$val=."><xsl:attribute name="selected">selected</xsl:attribute></xsl:if><xsl:value-of select="."/></option></xsl:for-each></xsl:when><xsl:otherwise><option><xsl:value-of select="@alarm-scope"/></option></xsl:otherwise></xsl:choose>
					</select>
				</span>
			</div>
			<div>Value when alarm is TRUE or Active: <span class="xdTextBox" hideFocus="1" title="" tabIndex="0" xd:binding="@active" xd:CtrlId="CTRL161" xd:xctname="PlainText" style="WIDTH: 130px">
					<xsl:value-of select="@active"/>
				</span>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="CompositeSignal" mode="_16">
		<div class="xdSection xdRepeating" title="" style="MARGIN-BOTTOM: 6px; WIDTH: 633px" align="left" xd:CtrlId="CTRL163" xd:xctname="Section" tabIndex="-1">
			<div align="center">
				<strong>COMPOSITE SIGNAL RULES</strong>
			</div>
			<div/>
			<div>
				<table class="xdRepeatingTable msoUcTable" title="" style="TABLE-LAYOUT: fixed; WIDTH: 621px; BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-COLLAPSE: collapse; WORD-WRAP: break-word; BORDER-BOTTOM-STYLE: none" border="1" xd:CtrlId="CTRL169">
					<colgroup>
						<col style="WIDTH: 223px"></col>
						<col style="WIDTH: 72px"></col>
						<col style="WIDTH: 28px"></col>
						<col style="WIDTH: 129px"></col>
						<col style="WIDTH: 30px"></col>
						<col style="WIDTH: 139px"></col>
					</colgroup>
					<tbody class="xdTableHeader">
						<tr style="MIN-HEIGHT: 19px">
							<td style="BORDER-RIGHT: #000000 1pt">
								<div>
									<strong>Variable (another signal)</strong>
								</div>
							</td>
							<td style="BORDER-LEFT: #000000 1pt">
								<div align="right">
									<strong>(TS) Shift</strong>
								</div>
							</td>
							<td>
								<div>
									<strong/> </div>
							</td>
							<td>
								<div align="center">
									<strong>Constant</strong>
								</div>
							</td>
							<td>
								<div>
									<strong/> </div>
							</td>
							<td>
								<div align="center">
									<strong>Command</strong>
								</div>
							</td>
						</tr>
					</tbody><tbody xd:xctname="RepeatingTable">
						<xsl:for-each select="Entry">
							<tr>
								<td style="BORDER-RIGHT: #000000 1pt"><span class="xdTextBox xdBehavior_GhostedText" hideFocus="1" title="" contentEditable="true" tabIndex="0" xd:binding="@var" xd:CtrlId="CTRL266" xd:xctname="PlainText" style="WIDTH: 100%; WHITE-SPACE: nowrap">
										<xsl:choose>
											<xsl:when test="not(string(@var))">
												<xsl:attribute name="xd:ghosted">true</xsl:attribute>Short Name of another signal</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="@var"/>
											</xsl:otherwise>
										</xsl:choose>
									</span>
								</td>
								<td style="BORDER-LEFT: #000000 1pt"><span class="xdTextBox" hideFocus="1" title="" tabIndex="0" xd:binding="@shift" xd:CtrlId="CTRL171" xd:xctname="PlainText" style="WIDTH: 100%">
										<xsl:value-of select="@shift"/>
									</span>
								</td>
								<td>
									<div align="center">
										<strong>OR</strong>
									</div>
								</td>
								<td><span class="xdTextBox" hideFocus="1" title="" tabIndex="0" xd:binding="@const" xd:CtrlId="CTRL172" xd:xctname="PlainText" style="WIDTH: 100%">
										<xsl:value-of select="@const"/>
									</span>
								</td>
								<td>
									<div align="center">
										<strong>OR</strong>
									</div>
								</td>
								<td><span class="xdTextBox" hideFocus="1" title="" tabIndex="0" xd:binding="@cmd" xd:CtrlId="CTRL173" xd:xctname="PlainText" style="WIDTH: 100%">
										<xsl:value-of select="@cmd"/>
									</span>
								</td>
							</tr>
						</xsl:for-each>
					</tbody>
				</table>
				<div class="optionalPlaceholder" xd:xmlToEdit="Entry_113" tabIndex="0" xd:action="xCollection::insert" style="WIDTH: 621px">Insert another entry</div>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="Algorithm" mode="_20">
		<div class="xdRepeatingSection xdRepeating" title="" style="MARGIN-BOTTOM: 6px; WIDTH: 649px" align="left" xd:CtrlId="CTRL203" xd:xctname="RepeatingSection" xd:linkedToMaster="CTRL183_5" tabIndex="-1">
			<div style="PADDING-LEFT: 50px" align="center">
				<strong>
					<font size="3">Algorithm Details</font>
				</strong>
				<hr/>
			</div>
			<div>
				<table class="xdLayout" style="BORDER-RIGHT: medium none; TABLE-LAYOUT: fixed; BORDER-TOP: medium none; BORDER-LEFT: medium none; WIDTH: 640px; BORDER-BOTTOM: medium none; BORDER-COLLAPSE: collapse; WORD-WRAP: break-word" borderColor="buttontext" border="1">
					<colgroup>
						<col style="WIDTH: 320px"></col>
						<col style="WIDTH: 320px"></col>
					</colgroup>
					<tbody vAlign="top">
						<tr style="MIN-HEIGHT: 27px">
							<td colSpan="2">
								<div>
									<font face="Verdana" size="2">Name: <span class="xdTextBox" hideFocus="1" title="" tabIndex="0" xd:binding="@name" xd:CtrlId="CTRL204" xd:xctname="PlainText" style="WIDTH: 217px">
											<xsl:value-of select="@name"/>
										</span>
									</font>
									<font face="Verdana" size="2">Type:<select class="xdComboBox xdBehavior_Select" title="" size="1" tabIndex="0" xd:boundProp="value" xd:binding="@type" xd:CtrlId="CTRL224" xd:xctname="dropdown" style="WIDTH: 328px">
											<xsl:attribute name="value">
												<xsl:value-of select="@type"/>
											</xsl:attribute>
											<option value="LPCF">
												<xsl:if test="@type=&quot;LPCF&quot;">
													<xsl:attribute name="selected">selected</xsl:attribute>
												</xsl:if>LPCF - Linear Predictive Coefficient Filter</option>
											<option value="MVNN">
												<xsl:if test="@type=&quot;MVNN&quot;">
													<xsl:attribute name="selected">selected</xsl:attribute>
												</xsl:if>MVNN - Multivariate Nearest Neighbor</option>
											<option value="SPPE">
												<xsl:if test="@type=&quot;SPPE&quot;">
													<xsl:attribute name="selected">selected</xsl:attribute>
												</xsl:if>SPPE - Set-point Proximity (Exponential)</option>
											<option value="SPPB">
												<xsl:if test="@type=&quot;SPPB&quot;">
													<xsl:attribute name="selected">selected</xsl:attribute>
												</xsl:if>SPPB - Set-point Proximity (Beta)</option>
											<option value="JAVA">
												<xsl:if test="@type=&quot;JAVA&quot;">
													<xsl:attribute name="selected">selected</xsl:attribute>
												</xsl:if>JAVA - Java class (with BED/clustering available)</option>
											<option value="EXTERNAL">
												<xsl:if test="@type=&quot;EXTERNAL&quot;">
													<xsl:attribute name="selected">selected</xsl:attribute>
												</xsl:if>EXTERNAL - Java class (fully external - no BED/clustering)</option>
											<option value="CAND">
												<xsl:if test="@type=&quot;CAND&quot;">
													<xsl:attribute name="selected">selected</xsl:attribute>
												</xsl:if>CAND - Combine algorithms (ANDed)</option>
											<option value="CAVE">
												<xsl:if test="@type=&quot;CAVE&quot;">
													<xsl:attribute name="selected">selected</xsl:attribute>
												</xsl:if>CAVE - Combine algorithm inputs (Average "P")</option>
											<option value="CMAX">
												<xsl:if test="@type=&quot;CMAX&quot;">
													<xsl:attribute name="selected">selected</xsl:attribute>
												</xsl:if>CMAX - Combine algorithms (Max "P")</option>
										</select>
									</font>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div>History Window Size (in time steps):     </div>
							</td>
							<td>
								<div>
									<font face="Verdana" size="2"><span class="xdTextBox xdBehavior_Formatting" hideFocus="1" title="" contentEditable="true" tabIndex="0" xd:boundProp="xd:num" xd:binding="@history-window-TS" xd:CtrlId="CTRL206" xd:xctname="PlainText" xd:datafmt="&quot;number&quot;,&quot;numDigits:0;negativeOrder:1;&quot;" style="WIDTH: 100%">
											<xsl:attribute name="xd:num">
												<xsl:value-of select="@history-window-TS"/>
											</xsl:attribute>
											<xsl:choose>
												<xsl:when test="function-available('xdFormatting:formatString')">
													<xsl:value-of select="xdFormatting:formatString(@history-window-TS,&quot;number&quot;,&quot;numDigits:0;negativeOrder:1;&quot;)"/>
												</xsl:when>
												<xsl:otherwise>
													<xsl:value-of select="@history-window-TS"/>
												</xsl:otherwise>
											</xsl:choose>
										</span>
									</font>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div>Outlier Threshold (in normalized units): </div>
							</td>
							<td>
								<div>
									<font face="Verdana" size="2"><span class="xdTextBox xdBehavior_Formatting" hideFocus="1" title="" contentEditable="true" tabIndex="0" xd:boundProp="xd:num" xd:binding="@outlier-threshold-SD" xd:CtrlId="CTRL207" xd:xctname="PlainText" xd:datafmt="&quot;number&quot;,&quot;numDigits:auto;negativeOrder:1;&quot;" style="WIDTH: 100%">
											<xsl:attribute name="xd:num">
												<xsl:value-of select="@outlier-threshold-SD"/>
											</xsl:attribute>
											<xsl:choose>
												<xsl:when test="function-available('xdFormatting:formatString')">
													<xsl:value-of select="xdFormatting:formatString(@outlier-threshold-SD,&quot;number&quot;,&quot;numDigits:auto;negativeOrder:1;&quot;)"/>
												</xsl:when>
												<xsl:otherwise>
													<xsl:value-of select="@outlier-threshold-SD"/>
												</xsl:otherwise>
											</xsl:choose>
										</span>
									</font>
								</div>
							</td>
						</tr>
						<tr style="MIN-HEIGHT: 25px">
							<td>
								<div>
									<font face="Verdana" size="2">Event Threshold (in probability):</font>
								</div>
							</td>
							<td>
								<div>
									<font face="Verdana" size="2"><span class="xdTextBox xdBehavior_Formatting" hideFocus="1" title="" contentEditable="true" tabIndex="0" xd:boundProp="xd:num" xd:binding="@event-threshold-P" xd:CtrlId="CTRL208" xd:xctname="PlainText" xd:datafmt="&quot;number&quot;,&quot;numDigits:auto;negativeOrder:1;&quot;" style="WIDTH: 100%">
											<xsl:attribute name="xd:num">
												<xsl:value-of select="@event-threshold-P"/>
											</xsl:attribute>
											<xsl:choose>
												<xsl:when test="function-available('xdFormatting:formatString')">
													<xsl:value-of select="xdFormatting:formatString(@event-threshold-P,&quot;number&quot;,&quot;numDigits:auto;negativeOrder:1;&quot;)"/>
												</xsl:when>
												<xsl:otherwise>
													<xsl:value-of select="@event-threshold-P"/>
												</xsl:otherwise>
											</xsl:choose>
										</span>
									</font>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div>
									<font face="Verdana" size="2">Event Timeout (in time steps):</font>
								</div>
							</td>
							<td>
								<div>
									<font face="Verdana" size="2"><span class="xdTextBox xdBehavior_Formatting" hideFocus="1" title="" contentEditable="true" tabIndex="0" xd:boundProp="xd:num" xd:binding="@event-timeout-TS" xd:CtrlId="CTRL209" xd:xctname="PlainText" xd:datafmt="&quot;number&quot;,&quot;numDigits:0;negativeOrder:1;&quot;" style="WIDTH: 100%">
											<xsl:attribute name="xd:num">
												<xsl:value-of select="@event-timeout-TS"/>
											</xsl:attribute>
											<xsl:choose>
												<xsl:when test="function-available('xdFormatting:formatString')">
													<xsl:value-of select="xdFormatting:formatString(@event-timeout-TS,&quot;number&quot;,&quot;numDigits:0;negativeOrder:1;&quot;)"/>
												</xsl:when>
												<xsl:otherwise>
													<xsl:value-of select="@event-timeout-TS"/>
												</xsl:otherwise>
											</xsl:choose>
										</span>
									</font>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div><xsl:choose>
					<xsl:when test="BED">
						<xsl:apply-templates select="BED" mode="_21"/>
					</xsl:when>
					<xsl:otherwise>
						<div class="optionalPlaceholder" xd:xmlToEdit="BED_139" tabIndex="0" align="left" style="WIDTH: 100%">Add BED to this algorithm</div>
					</xsl:otherwise>
				</xsl:choose>
			</div>
			<div/>
			<div><xsl:choose>
					<xsl:when test="ExternalAlgorithm">
						<xsl:apply-templates select="ExternalAlgorithm" mode="_22"/>
					</xsl:when>
					<xsl:otherwise>
						<div class="optionalPlaceholder" xd:xmlToEdit="ExternalAlgorithm_141" tabIndex="0" align="left" style="WIDTH: 638px">Click to add details to an EXTERNAL or JAVA algorithm type</div>
					</xsl:otherwise>
				</xsl:choose>
			</div>
			<div><xsl:choose>
					<xsl:when test="Clustering">
						<xsl:apply-templates select="Clustering" mode="_23"/>
					</xsl:when>
					<xsl:otherwise>
						<div class="optionalPlaceholder" xd:xmlToEdit="Clustering_142" tabIndex="0" align="left" style="WIDTH: 638px">Click here to add trajectory clustering to this algorithm</div>
					</xsl:otherwise>
				</xsl:choose>
			</div>
			<div style="PADDING-LEFT: 100px">
				<table class="xdRepeatingTable msoUcTable" title="" style="TABLE-LAYOUT: fixed; WIDTH: 532px; BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-COLLAPSE: collapse; WORD-WRAP: break-word; BORDER-BOTTOM-STYLE: none" border="1" xd:CtrlId="CTRL213">
					<colgroup>
						<col style="WIDTH: 532px"></col>
					</colgroup>
					<tbody class="xdTableHeader">
						<tr style="MIN-HEIGHT: 19px">
							<td>
								<div align="center">
									<strong>
										<em>OPTIONAL:</em> COMBINED-ALGORITHMS INPUT</strong>
								</div>
							</td>
						</tr>
					</tbody><tbody xd:xctname="RepeatingTable">
						<xsl:for-each select="UseAlgorithm">
							<tr>
								<td><span class="xdTextBox xdBehavior_GhostedText" hideFocus="1" title="" contentEditable="true" tabIndex="0" xd:binding="@name" xd:CtrlId="CTRL268" xd:xctname="PlainText" style="WIDTH: 100%; WHITE-SPACE: nowrap">
										<xsl:choose>
											<xsl:when test="not(string(@name))">
												<xsl:attribute name="xd:ghosted">true</xsl:attribute>Delete me if not CAND, CAVE, or CMAX type algorithm</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="@name"/>
											</xsl:otherwise>
										</xsl:choose>
									</span>
								</td>
							</tr>
						</xsl:for-each>
					</tbody>
				</table>
				<div class="optionalPlaceholder" xd:xmlToEdit="UseAlgorithm_124" tabIndex="0" xd:action="xCollection::insert" style="WIDTH: 532px">Add algorithms as inputs (for composite algorithms only)</div>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="BED" mode="_21">
		<div class="xdSection xdRepeating" title="" style="BORDER-RIGHT: #000000 1pt solid; BORDER-TOP: #000000 1pt solid; MARGIN-BOTTOM: 6px; BORDER-LEFT: #000000 1pt solid; WIDTH: 100%; BORDER-BOTTOM: #000000 1pt solid" align="left" xd:CtrlId="CTRL210" xd:xctname="Section" tabIndex="-1">
			<div align="center">
				<strong>BINOMIAL EVENT DESCRIMINATOR (BED) OPTIONS</strong>
			</div>
			<div>BED Window Size (TS): <span class="xdTextBox xdBehavior_Formatting" hideFocus="1" title="" contentEditable="true" tabIndex="0" xd:boundProp="xd:num" xd:binding="@bed-window-TS" xd:CtrlId="CTRL211" xd:xctname="PlainText" xd:datafmt="&quot;number&quot;,&quot;numDigits:0;negativeOrder:1;&quot;" style="WIDTH: 130px">
					<xsl:attribute name="xd:num">
						<xsl:value-of select="@bed-window-TS"/>
					</xsl:attribute>
					<xsl:choose>
						<xsl:when test="function-available('xdFormatting:formatString')">
							<xsl:value-of select="xdFormatting:formatString(@bed-window-TS,&quot;number&quot;,&quot;numDigits:0;negativeOrder:1;&quot;)"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="@bed-window-TS"/>
						</xsl:otherwise>
					</xsl:choose>
				</span> Probability of an Outlier: <span class="xdTextBox xdBehavior_Formatting" hideFocus="1" title="" contentEditable="true" tabIndex="0" xd:boundProp="xd:num" xd:binding="@bed-P-outlier" xd:CtrlId="CTRL212" xd:xctname="PlainText" xd:datafmt="&quot;number&quot;,&quot;numDigits:auto;negativeOrder:1;&quot;" style="WIDTH: 130px">
					<xsl:attribute name="xd:num">
						<xsl:value-of select="@bed-P-outlier"/>
					</xsl:attribute>
					<xsl:choose>
						<xsl:when test="function-available('xdFormatting:formatString')">
							<xsl:value-of select="xdFormatting:formatString(@bed-P-outlier,&quot;number&quot;,&quot;numDigits:auto;negativeOrder:1;&quot;)"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="@bed-P-outlier"/>
						</xsl:otherwise>
					</xsl:choose>
				</span>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="ExternalAlgorithm" mode="_22">
		<div class="xdSection xdRepeating" title="" style="BORDER-RIGHT: #000000 1pt solid; BORDER-TOP: #000000 1pt solid; MARGIN-BOTTOM: 6px; BORDER-LEFT: #000000 1pt solid; WIDTH: 638px; BORDER-BOTTOM: #000000 1pt solid" align="left" xd:CtrlId="CTRL215" xd:xctname="Section" tabIndex="-1">
			<div align="center">
				<strong>JAVA AND EXTERNAL ALGORITHM OPTIONS</strong>
			</div>
			<div>Algorithm's Class Name: <span class="xdTextBox" hideFocus="1" title="" tabIndex="0" xd:binding="@class" xd:CtrlId="CTRL216" xd:xctname="PlainText" style="WIDTH: 463px">
					<xsl:value-of select="@class"/>
				</span>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="Clustering" mode="_23">
		<div class="xdSection xdRepeating" title="" style="BORDER-RIGHT: #000000 1pt solid; BORDER-TOP: #000000 1pt solid; MARGIN-BOTTOM: 6px; BORDER-LEFT: #000000 1pt solid; WIDTH: 638px; BORDER-BOTTOM: #000000 1pt solid" align="left" xd:CtrlId="CTRL217" xd:xctname="Section" tabIndex="-1">
			<div align="center">
				<strong>TRAJECTORY CLUSTERING OPTIONS</strong>
			</div>
			<div>Load From File: <span class="xdTextBox" hideFocus="1" title="" tabIndex="0" xd:binding="@load-from-file" xd:CtrlId="CTRL218" xd:xctname="PlainText" style="WIDTH: 521px">
					<xsl:value-of select="@load-from-file"/>
				</span>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="Station" mode="_24">
		<div class="xdRepeatingSection xdRepeating" title="" style="MARGIN-BOTTOM: 6px; WIDTH: 647px" align="left" xd:CtrlId="CTRL242" xd:xctname="RepeatingSection" xd:linkedToMaster="CTRL225_5" tabIndex="-1">
			<div align="center">
				<strong>
					<font size="3">Station Details</font>
				</strong>
				<hr/>
			</div>
			<div>Station ID/Name: <span class="xdTextBox" hideFocus="1" title="" tabIndex="0" xd:binding="@scada-id" xd:CtrlId="CTRL243" xd:xctname="PlainText" style="WIDTH: 374px">
					<xsl:value-of select="@scada-id"/>
				</span> State: <span class="xdTextBox" hideFocus="1" title="" tabIndex="-1" xd:binding="@state" xd:CtrlId="CTRL247" xd:xctname="PlainText" xd:disableEditing="yes" style="WIDTH: 73px; WHITE-SPACE: nowrap">
					<xsl:value-of select="@state"/>
				</span>
			</div>
			<div style="PADDING-LEFT: 50px">
				<em>XML specific options</em>
			</div>
			<div>Station Number: <span class="xdTextBox" hideFocus="1" title="" tabIndex="0" xd:binding="@output_Station" xd:CtrlId="CTRL244" xd:xctname="PlainText" style="WIDTH: 64px">
					<xsl:value-of select="@output_Station"/>
				</span> Output Tag Name: <span class="xdTextBox" hideFocus="1" title="" tabIndex="0" xd:binding="@output_TagName" xd:CtrlId="CTRL245" xd:xctname="PlainText" style="WIDTH: 130px">
					<xsl:value-of select="@output_TagName"/>
				</span> Point Number:<span class="xdTextBox" hideFocus="1" title="" tabIndex="0" xd:binding="@output_PointNr" xd:CtrlId="CTRL246" xd:xctname="PlainText" style="WIDTH: 69px">
					<xsl:value-of select="@output_PointNr"/>
				</span>
			</div>
			<div>Pattern List Directory: <span class="xdTextBox" hideFocus="1" title="" tabIndex="0" xd:binding="@patListDir" xd:CtrlId="CTRL248" xd:xctname="PlainText" style="WIDTH: 130px">
					<xsl:value-of select="@patListDir"/>
				</span>  Pattern Graphics Directory: <span class="xdTextBox" hideFocus="1" title="" tabIndex="0" xd:binding="@patGraphicsDir" xd:CtrlId="CTRL249" xd:xctname="PlainText" style="WIDTH: 130px">
					<xsl:value-of select="@patGraphicsDir"/>
				</span>
			</div>
			<div> </div>
			<div>
				<table class="xdRepeatingTable msoUcTable" title="" style="TABLE-LAYOUT: fixed; WIDTH: 636px; BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-COLLAPSE: collapse; WORD-WRAP: break-word; BORDER-BOTTOM-STYLE: none" border="1" xd:CtrlId="CTRL250">
					<colgroup>
						<col style="WIDTH: 636px"></col>
					</colgroup>
					<tbody class="xdTableHeader">
						<tr>
							<td>
								<div>
									<strong>Input IDs</strong>
								</div>
							</td>
						</tr>
					</tbody><tbody xd:xctname="RepeatingTable">
						<xsl:for-each select="use-input">
							<tr>
								<td>
									<select class="xdComboBox xdBehavior_Select" title="" style="WIDTH: 100%" size="1" value="" xd:boundProp="value" xd:binding="@id" xd:CtrlId="CTRL260" xd:xctname="dropdown" tabIndex="0">
										<xsl:attribute name="value">
											<xsl:value-of select="@id"/>
										</xsl:attribute>
										<xsl:choose>
											<xsl:when test="function-available('xdXDocument:GetDOM')">
												<option/>
												<xsl:variable name="val" select="@id"/>
												<xsl:if test="not(../../../datasource/@short-id[.=$val] or $val='')">
													<option selected="selected">
														<xsl:attribute name="value">
															<xsl:value-of select="$val"/>
														</xsl:attribute>
														<xsl:value-of select="$val"/>
													</option>
												</xsl:if>
												<xsl:for-each select="../../../datasource/@short-id">
													<option>
														<xsl:attribute name="value">
															<xsl:value-of select="."/>
														</xsl:attribute>
														<xsl:if test="$val=.">
															<xsl:attribute name="selected">selected</xsl:attribute>
														</xsl:if>
														<xsl:value-of select="."/>
													</option>
												</xsl:for-each>
											</xsl:when>
											<xsl:otherwise>
												<option>
													<xsl:value-of select="@id"/>
												</option>
											</xsl:otherwise>
										</xsl:choose>
									</select>
								</td>
							</tr>
						</xsl:for-each>
					</tbody>
				</table>
				<div class="optionalPlaceholder" xd:xmlToEdit="use-input_153" tabIndex="0" xd:action="xCollection::insert" style="WIDTH: 636px">Add input datasource to station</div>
			</div>
			<div> </div>
			<div>
				<table class="xdRepeatingTable msoUcTable" title="" style="TABLE-LAYOUT: fixed; WIDTH: 636px; BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-COLLAPSE: collapse; WORD-WRAP: break-word; BORDER-BOTTOM-STYLE: none" border="1" xd:CtrlId="CTRL252">
					<colgroup>
						<col style="WIDTH: 636px"></col>
					</colgroup>
					<tbody class="xdTableHeader">
						<tr>
							<td>
								<div>
									<strong>Output IDs</strong>
								</div>
							</td>
						</tr>
					</tbody><tbody xd:xctname="RepeatingTable">
						<xsl:for-each select="use-output">
							<tr>
								<td>
									<select class="xdComboBox xdBehavior_Select" title="" style="WIDTH: 100%" size="1" value="" xd:boundProp="value" xd:binding="@id" xd:CtrlId="CTRL261" xd:xctname="dropdown" tabIndex="0">
										<xsl:attribute name="value">
											<xsl:value-of select="@id"/>
										</xsl:attribute>
										<xsl:choose>
											<xsl:when test="function-available('xdXDocument:GetDOM')">
												<option/>
												<xsl:variable name="val" select="@id"/>
												<xsl:if test="not(../../../datasource/@short-id[.=$val] or $val='')">
													<option selected="selected">
														<xsl:attribute name="value">
															<xsl:value-of select="$val"/>
														</xsl:attribute>
														<xsl:value-of select="$val"/>
													</option>
												</xsl:if>
												<xsl:for-each select="../../../datasource/@short-id">
													<option>
														<xsl:attribute name="value">
															<xsl:value-of select="."/>
														</xsl:attribute>
														<xsl:if test="$val=.">
															<xsl:attribute name="selected">selected</xsl:attribute>
														</xsl:if>
														<xsl:value-of select="."/>
													</option>
												</xsl:for-each>
											</xsl:when>
											<xsl:otherwise>
												<option>
													<xsl:value-of select="@id"/>
												</option>
											</xsl:otherwise>
										</xsl:choose>
									</select>
								</td>
							</tr>
						</xsl:for-each>
					</tbody>
				</table>
				<div class="optionalPlaceholder" xd:xmlToEdit="use-output_154" tabIndex="0" xd:action="xCollection::insert" style="WIDTH: 636px">Add output datasource to station</div>
			</div>
			<div> </div>
			<div>
				<table class="xdRepeatingTable msoUcTable" title="" style="TABLE-LAYOUT: fixed; WIDTH: 636px; BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-COLLAPSE: collapse; WORD-WRAP: break-word; BORDER-BOTTOM-STYLE: none" border="1" xd:CtrlId="CTRL254">
					<colgroup>
						<col style="WIDTH: 559px"></col>
						<col style="WIDTH: 77px"></col>
					</colgroup>
					<tbody class="xdTableHeader">
						<tr>
							<td>
								<div>
									<strong>Data Signal IDs</strong>
								</div>
							</td>
							<td>
								<div>
									<strong>In Cluster</strong>
								</div>
							</td>
						</tr>
					</tbody><tbody xd:xctname="RepeatingTable">
						<xsl:for-each select="use-signal">
							<tr>
								<td>
									<select class="xdComboBox xdBehavior_Select" title="" style="WIDTH: 100%" size="1" value="" xd:boundProp="value" xd:binding="@id" xd:CtrlId="CTRL262" xd:xctname="dropdown" tabIndex="0">
										<xsl:attribute name="value">
											<xsl:value-of select="@id"/>
										</xsl:attribute>
										<xsl:choose>
											<xsl:when test="function-available('xdXDocument:GetDOM')">
												<option/>
												<xsl:variable name="val" select="@id"/>
												<xsl:if test="not(../../../Signals/Signal/@name[.=$val] or $val='')">
													<option selected="selected">
														<xsl:attribute name="value">
															<xsl:value-of select="$val"/>
														</xsl:attribute>
														<xsl:value-of select="$val"/>
													</option>
												</xsl:if>
												<xsl:for-each select="../../../Signals/Signal/@name">
													<option>
														<xsl:attribute name="value">
															<xsl:value-of select="."/>
														</xsl:attribute>
														<xsl:if test="$val=.">
															<xsl:attribute name="selected">selected</xsl:attribute>
														</xsl:if>
														<xsl:value-of select="."/>
													</option>
												</xsl:for-each>
											</xsl:when>
											<xsl:otherwise>
												<option>
													<xsl:value-of select="@id"/>
												</option>
											</xsl:otherwise>
										</xsl:choose>
									</select>
								</td>
								<td><input class="xdBehavior_Boolean" title="" type="checkbox" tabIndex="0" xd:boundProp="xd:value" xd:binding="@no-cluster" xd:CtrlId="CTRL256" xd:xctname="CheckBox" xd:onValue="false" xd:offValue="true">
										<xsl:attribute name="xd:value">
											<xsl:value-of select="@no-cluster"/>
										</xsl:attribute>
										<xsl:if test="@no-cluster=&quot;false&quot;">
											<xsl:attribute name="CHECKED">CHECKED</xsl:attribute>
										</xsl:if>
									</input>
								</td>
							</tr>
						</xsl:for-each>
					</tbody>
				</table>
				<div class="optionalPlaceholder" xd:xmlToEdit="use-signal_156" tabIndex="0" xd:action="xCollection::insert" style="WIDTH: 636px">Add signal to station</div>
			</div>
			<div> </div>
			<div>
				<table class="xdRepeatingTable msoUcTable" title="" style="TABLE-LAYOUT: fixed; WIDTH: 636px; BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-COLLAPSE: collapse; WORD-WRAP: break-word; BORDER-BOTTOM-STYLE: none" border="1" xd:CtrlId="CTRL257">
					<colgroup>
						<col style="WIDTH: 636px"></col>
					</colgroup>
					<tbody class="xdTableHeader">
						<tr>
							<td>
								<div>
									<strong>Algorithm IDs</strong>
								</div>
							</td>
						</tr>
					</tbody><tbody xd:xctname="RepeatingTable">
						<xsl:for-each select="use-algorithm">
							<tr>
								<td>
									<select class="xdComboBox xdBehavior_Select" title="" style="WIDTH: 100%" size="1" value="" xd:boundProp="value" xd:binding="@id" xd:CtrlId="CTRL263" xd:xctname="dropdown" tabIndex="0">
										<xsl:attribute name="value">
											<xsl:value-of select="@id"/>
										</xsl:attribute>
										<xsl:choose>
											<xsl:when test="function-available('xdXDocument:GetDOM')">
												<option/>
												<xsl:variable name="val" select="@id"/>
												<xsl:if test="not(../../../Algorithms/Algorithm/@name[.=$val] or $val='')">
													<option selected="selected">
														<xsl:attribute name="value">
															<xsl:value-of select="$val"/>
														</xsl:attribute>
														<xsl:value-of select="$val"/>
													</option>
												</xsl:if>
												<xsl:for-each select="../../../Algorithms/Algorithm/@name">
													<option>
														<xsl:attribute name="value">
															<xsl:value-of select="."/>
														</xsl:attribute>
														<xsl:if test="$val=.">
															<xsl:attribute name="selected">selected</xsl:attribute>
														</xsl:if>
														<xsl:value-of select="."/>
													</option>
												</xsl:for-each>
											</xsl:when>
											<xsl:otherwise>
												<option>
													<xsl:value-of select="@id"/>
												</option>
											</xsl:otherwise>
										</xsl:choose>
									</select>
								</td>
							</tr>
						</xsl:for-each>
					</tbody>
				</table>
				<div class="optionalPlaceholder" xd:xmlToEdit="use-algorithm_155" tabIndex="0" xd:action="xCollection::insert" style="WIDTH: 636px">Add algorithm to station</div>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>
