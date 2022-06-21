<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
  <head>
    <title>Profile</title>
    <style>
     .column {
        float: left;
        width: 50%;
      }

      /* Clear floats after the columns */
      .row:after {
        content: "";
        display: table;
        clear: both;
      }

      #userImage {
        width: 100px;
        height: 100px;
        padding: 0px 15px;
      }
    </style>
  </head>
  <body>
    <s:include value="menu.jsp" /> 
    
    <main>
      <header class="center">
        <h2>User Details</h2>
      </header>
      <div class="row">
        <div class="column">
          <img id="userImage" src="https://cdn.pixabay.com/photo/2021/07/25/08/03/account-6491185_960_720.png" alt="">
        </div>
        <div class="column">
          <s:if test="token == null || token.isBlank()">
            <p><s:property value="fetchedAccount.firstName"/> <s:property value="fetchedAccount.lastName"/></p>
            <p><s:property value="fetchedAccount.email"/></p>
          </s:if>
          <s:else>
            <p>You are logged in using LoginRadius.</p>
          </s:else>
          <a href="<s:url action='Login'/>">Logout</a>
        </div>
      </div>
    </main>
  </body>
</html>