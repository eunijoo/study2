<%--tag body-content="scriptless" : 몸체를 만들겠다. --%>
<%@ tag body-content="scriptless" pageEncoding="UTF-8"%>
<%@ tag trimDirectiveWhitespaces="true" %>
<%@ attribute name="trim"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:doBody var="content" scope="page"/>

<!-- body내용 자체를 데이터로 처리. 단, 엔터처리는 안됨. -->
<c:out value="${content}" escapeXml="true" />