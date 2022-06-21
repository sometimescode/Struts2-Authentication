package project.demo.action;

import com.opensymphony.xwork2.ActionSupport;

public class LoginRadiusAuth extends ActionSupport {
    private String token;
    private String error = "";

    public String execute() {
        if(token == null || token.isBlank()) {
            error = "Token is invalid.";
            return ERROR;
        }
        else {
            return SUCCESS;
        }
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public String getError() {
        return error;
    }

    public void setError(String error) {
        this.error = error;
    }

    
}
