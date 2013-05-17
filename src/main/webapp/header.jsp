<%@ page language="java" import="java.util.*, java.text.*,java.io.*,gov.nysenate.openleg.*,gov.nysenate.openleg.model.*" pageEncoding="UTF-8"%><%
	String appPath = request.getContextPath();
	String title = request.getParameter("title");
	if (title == null)
		title = "Open Legislation Service";
	title += " - New York State Senate";
		
	String term = (String)request.getAttribute("term");
	
	if (term == null)
		term = "";
	else
	{
		term = term.replaceAll("\"","&quot;");
	}
	
	String search = (String)request.getAttribute("search");
	if(search == null) {
		search = "";
	}
	else {
		search = search.replaceAll("\"","&quot;");
	}
	
	String searchType = (String)request.getAttribute("type");
	if (searchType == null)
		searchType = "";
%>
<!DOCTYPE html>
<html>
	<head>
		<title><%=title%></title>
		
		<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; minimum-scale=1.0; user-scalable=0;" />
		<meta name="apple-mobile-web-app-capable" content="YES"/>
		
		<link rel="shortcut icon" href="<%=appPath%>/img/nys_favicon_0.ico" type="image/x-icon" />
		<link rel="stylesheet" type="text/css" media="screen" href="<%=appPath%>/style.css"/>
		<link rel="alternate" type="application/rss+xml" title="RSS 2.0" href="<%=appPath%>/feed" />
		
		<script type="text/javascript" src="<%=appPath%>/js/jquery-1.9.1.min.js"></script>
		<script type="text/javascript" src="<%=appPath%>/js/search.js"></script>
	 
		<script type="text/javascript">
			searchType = "<%=searchType%>";

			$(document).ready(function() {
				var clearOnFocus = function(element, text) {
	                element.focus(function() {
	                    var self = $(this);
	                    if (self.val() == text) {
	                        self.val("");
	                    }
	                }).blur(function() {
	                    var self = $(this);
	                    if (self.val() == "") {
	                        self.val(text);
	                    }
	                }).blur();
	            };

	            clearOnFocus($("input[name=email]"), "enter email");
			});

		</script>
	</head>
	<body>
    <div id="menu">
    	<div id="content-full" class="main-menu">
    		<ul>
			<%if (searchType.startsWith("bill")||searchType.equals("search")||searchType.equals("sponsor")||searchType.equals("committee")){ %>
				<li><a href="<%=appPath%>/bills/"  class="linkActivated" title="Browse and search Senate and Assembly bills by number, keyword, sponsor and more">Bills</a></li>
			<%}else{ %>
				<li><a href="<%=appPath%>/bills/" title="Browse and search Senate and Assembly bills by number, keyword, sponsor and more">Bills</a></li>
			<%} %>
				<li><a href="<%=appPath%>/calendars/"  <%if (searchType.startsWith("calendar")){%>class="linkActivated"<%} %> title="View recent and search floor calendars and active lists by number or date (i.e. 1/07/2013)">Calendars</a></li>
				<li><a href="<%=appPath%>/meetings/"  <%if (searchType.startsWith("meeting")){%>class="linkActivated"<%} %> title="View upcoming and recent committee meetings, and search by committee, chairperson, location, date (i.e. 1/07/2013) and more.">Meetings</a></li>
				<li><a href="<%=appPath%>/transcripts/" <%if (searchType.startsWith("transcript")){%>class="linkActivated"<%} %> title="View and search Senate floor full text transcripts">Transcripts</a></li>
				<li><a href="<%=appPath%>/actions/"  <%if (searchType.startsWith("action")){%>class="linkActivated"<%} %> title="View and filter Floor Actions on Bills from the Floor of the Senate">Actions</a></li>
				<% if(searchType.matches("(sponsor|bill|calendar|meeting|transcript|action|vote).*?")) { term = ""; } %>
				<li><a href="<%=appPath%>/senators">Sponsor</a></li>
				<li><a href="<%=appPath%>/committees">Committee</a></li>
			</ul>
		</div>
		<div id="content" class='searbar'>
			<div id="logobox">
				<a href="<%=appPath%>/"><img src="<%=appPath%>/img/openwordlogo.gif" /></a>
			</div>
			<div class='searchbox'>
			<form method="get" action="<%=appPath%>/search/">
				<input type="text" id="txtSearchBox"  name="search" value="<%=search%>" autocomplete="off">	
				<input type="hidden" name="searchType" value="<%=searchType%>">	
				<input type="submit" value="Search"/> | <a href="<%=appPath%>/advanced/">Advanced</a>
				<div id="quickresult" class="quickresult-header"></div>
			</form>
			</div>
		</div>
	</div>
	<div id="content" >
		
