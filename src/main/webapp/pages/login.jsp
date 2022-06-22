<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>Log In</title>
    <!-- Font Awesome -->
    <link
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
    rel="stylesheet"
    />
    <!-- Google Fonts -->
    <link
    href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
    rel="stylesheet"
    />
    <!-- MDB -->
    <link
    href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/4.2.0/mdb.min.css"
    rel="stylesheet"
    />

    <style>
    </style>
  </head>
  <body>
    <s:include value="menu.jsp" /> 

    <div class="container">
      <div class="d-flex align-items-center justify-content-center" style="height: 80vh;">
        <div class="card text-center shadow-5-strong">
          <div class="card-header fs-5">Welcome!</div>
          <div class="card-body">
            <s:form action="CheckUserCredentials" theme="simple">
              <div class="form-outline mb-4">
                <s:textfield key="username" placeholder="Username" label="Username" cssClass="form-control"/>
              </div>
              <div class="form-outline mb-4">
                <s:password key="password" placeholder="Password" label="Password" cssClass="form-control"/>
              </div>
            
              <s:submit cssClass="btn btn-primary btn-block mb-4" value="Sign In"/>  

              <div class="text-center">
                <p>Not a member? <a href="<s:url action='Register'/>">Register</a></p>
                <p>or sign up with:</p>
                <a href="https://authtest0.hub.loginradius.com/auth.aspx?action=login&return_url=http://localhost:8080/basic-struts/LoginRadiusAuth" class="btn btn-primary">LoginRadius</a>
              </div>
            </s:form>
          </div>
        </div>
      </div>
    </div>

    <script
    type="text/javascript"
    src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/4.2.0/mdb.min.js"
    ></script>
  </body>
</html>
