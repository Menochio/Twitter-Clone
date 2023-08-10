package tech.codingclub.helix.entity;

public class LoginResponse {


    public LoginResponse(Long id, Boolean is_loggedIn, String message) {
        this.id = id;
        this.is_loggedIn = is_loggedIn;
        this.message = message;
    }
    public LoginResponse(){}

    public Long id;
    public Boolean is_loggedIn;
    public String message;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Boolean getIs_loggedIn() {
        return is_loggedIn;
    }

    public void setIs_loggedIn(Boolean is_loggedIn) {
        this.is_loggedIn = is_loggedIn;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

}
