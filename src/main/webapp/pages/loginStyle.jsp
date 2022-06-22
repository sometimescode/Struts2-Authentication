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
        body {
            background-color: black
        }
    </style>
  </head>
  <body>
    <!-- Start your project here-->
    <div class="container">
      <div class="d-flex align-items-center justify-content-center" style="height: 100vh;">
          <div class="row g-0">
            <div class="col-md-4">
              <img
                src="https://cdn.pixabay.com/photo/2021/07/25/08/03/account-6491185_960_720.png"
                class="img-fluid rounded-start"
              />
            </div>
            <div class="col-md-8">
              <s:if test="token == null || token.isBlank()">
                <p><s:property value="fetchedAccount.firstName"/> <s:property value="fetchedAccount.lastName"/></p>
                <p><s:property value="fetchedAccount.email"/></p>
                <a href="<s:url action='Login'/>">Logout</a>
              </s:if>
              <s:else>
                <p>You are logged in using LoginRadius.</p>
                <a href="https://authtest0.hub.loginradius.com/auth.aspx?action=logout&return_url=http://localhost:8080/basic-struts/Login">Logout</a>
              </s:else>
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
