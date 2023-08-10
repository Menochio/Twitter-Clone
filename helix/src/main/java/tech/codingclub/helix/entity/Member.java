package tech.codingclub.helix.entity;


public class Member extends MemberBase {

    public boolean isIs_followed() {
        return is_followed;
    }

    public void setIs_followed(boolean is_followed) {
        this.is_followed = is_followed;
    }

    public boolean is_followed;

    public String getName() {
        return name;
    }
    Member(){}

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public Boolean getIs_verified() {
        return is_verified;
    }

    public Long getId() {
        return id;
    }

    public void setIs_verified(Boolean is_verified) {
        this.is_verified = is_verified;
    }

    public Member(String name, String email, String role, String password, String image, String token, Boolean is_verified) {
        this.name = name;
        this.email = email;
        this.role = role;
        this.password = password;
        this.image = image;
        this.token = token;
        this.is_verified = is_verified;
    }

    public String name;
    public String email;
    public String role;
    public String password;
    public String image;
    public String token;
    public Boolean is_verified;

}
