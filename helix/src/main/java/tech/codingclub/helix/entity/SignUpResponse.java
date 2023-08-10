package tech.codingclub.helix.entity;

public class SignUpResponse {
    public String message;
    public Boolean user_created;
    public SignUpResponse(String message, Boolean userCreated) {
        this.message = message;
        this.user_created = userCreated;
    }

    public String getResponse() {
        return message;
    }

    public void setResponse(String message) {
        this.message = message;
    }

    public Boolean getUser_created() {
        return user_created;
    }

    public void setUser_created(Boolean user_created) {
        this.user_created = user_created;
    }


}
