<%@ include file="header.jsp" %>
<style>
    .tableside {margin-left: 0%; width: 99%;margin-right: 50px; padding-top: 40px}
    .tr:nth-child(even){background-color: #f2f2f2}
    .th {background-color: #00accc; color: white;}
    .table {border-collapse: collapse; width: 100%;}
    .th, td {text-align: left; padding: 8px;}
</style>

<div class = "container">
    <div>
        <div style="padding-top: 50px"><div/>
            <h3>All Urgent and High Tickets</h3>
            ${sa}
<%@ include file="footer.jsp" %>