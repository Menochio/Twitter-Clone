package tech.codingclub.helix.entity;

public class Tweet {
    public String message;
    public Long id;
    public Long userId;
    public Long createdAt;
    public Tweet(){}
    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Long getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Long createdAt) {
        this.createdAt = createdAt;
    }

    public Tweet(String message, Long id, Long userId, Long createdAt) {
        this.message = message;
        this.id = id;
        this.userId = userId;
        this.createdAt = createdAt;
    }
}
