<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="org.springframework.security.saml.SAMLCredential" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>

<html>
<head>
        <title>BankBox</title>
</head>
<body>
<h1>
Successful login to BankBox
</h1>
<%
    SAMLCredential credential = (SAMLCredential) SecurityContextHolder.getContext().getAuthentication().getCredentials();
    pageContext.setAttribute("credential", credential);

    Cookie accessTokenCookie = new Cookie("access-token", session.getId());
    response.addCookie(accessTokenCookie);
%>

<p>
<table>
    <tr>
        <td colspan="2"><b>General information</b></td>
    </tr>
    <tr>
        <td width="300">Username:</td>
        <td><c:out value="${credential.nameID.value}"/></td>
    </tr>
    <tr>
        <td>User format:</td>
        <td><c:out value="${credential.nameID.format}"/></td>
    </tr>
    <tr>
        <td>IDP:</td>
        <td><c:out value="${credential.authenticationAssertion.issuer.value}"/></td>
    </tr>
    <tr>
        <td>Assertion issue time:</td>
        <td><c:out value="${credential.authenticationAssertion.issueInstant}"/></td>
    </tr>
</table>
</p>

<P>  The time on the server is ${serverTime}. </P>
</body>
</html>
