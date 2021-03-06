<%@ page import="ait.servlet.utils.RequestParams" %>
<%@ page import="ait.servlet.utils.RequestUtils" %>
<%@ page import="ait.servlet.utils.Path" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Visualisation</title>
    <link rel="stylesheet" type="text/css" href="../js/lib/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="../css/visualisation.css">
    <link rel="stylesheet" type="text/css" href="../css/common.css">
    <script src="../js/lib/jquery.min.js"></script>
    <script src="../js/common.js"></script>
    <script src="../js/lib/Chart.js"></script>
    <script src="../js/visualisation/temperatureHelper.js"></script>
    <script src="../js/visualisation/temperatureByYear.js"></script>
    <script src="../js/visualisation/temperatureByMonth.js"></script>
    <script>
        function getResource(resource) {
            switch (resource) {
                case "visId":
                    return '<%= RequestUtils.getStringParam(request, RequestParams.VISUALISATION_ID) %>';
                case "minYear":
                    return '<%= RequestUtils.getIntParam(request, RequestParams.VISUALISATION_MIN_YEAR) %>';
                case "maxYear":
                    return '<%= RequestUtils.getIntParam(request, RequestParams.VISUALISATION_MAX_YEAR) %>';
            }
        }
    </script>
    <script src="../js/visualisation/visualisation.js"></script>
</head>
<body>
<div id="mainDiv">
    <div class="containerTop">
        <div id="temperatureYearSelect" hidden>
            <h1><%= RequestUtils.getStringParam(request, RequestParams.VISUALISATION_LABEL) %>
            </h1>
            <div class="block" style="margin-top: 2em">
                <div class="inline smallMarginLeft pull-right">
                    <button type="button" class="btn btn-default" onclick="logout()">Sign out</button>
                </div>
                <div class="inline smallMarginLeft pull-right">
                    <button type="button" class="btn btn-default" onclick="homeButtonClicked()">Home</button>
                </div>
                <div class="inline smallMarginLeft pull-right">
                    <button type="button" class="btn btn-default" onclick="window.location='<%=Path.ORDER_HISTORY_URL%>'">Order
                        history
                    </button>
                </div>
            </div>
            <div class="block">
                <% if (RequestUtils.getStringParam(request, RequestParams.VISUALISATION_ID).startsWith("TEMPERATURE")) {%>
                <div class="inline mediumMarginRight minWidth8">
                    <label>From Year</label>
                    <select class="form-control widthFull" name="fromYearPicker" id="fromYearPicker"></select>
                </div>
                <div class="inline mediumMarginRight minWidth8">
                    <label>To Year</label>
                    <select class="form-control widthFull" name="toYearPicker" id="toYearPicker"></select>
                </div>
                <% } else{%>
                <div class="inline mediumMarginRight minWidth8">
                    <label>Month</label>
                    <select class="form-control widthFull" name="monthPicker" id="monthPicker"></select>
                </div>
                <% }%>
            </div>
        </div>

        <canvas id="canvas"></canvas>
    </div>
</div>
</body>
</html>