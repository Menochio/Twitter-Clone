package tech.codingclub.helix.entity;

public class Follower {
    Follower(){}

    public Long getUser_id() {
        return user_id;
    }

    public void setUser_id(Long user_id) {
        this.user_id = user_id;
    }

    public Long getFollower_id() {
        return follower_id;
    }

    public void setFollower_id(Long follower_id) {
        this.follower_id = follower_id;
    }

    public Follower(Long user_id, Long follower_id) {
        this.user_id = user_id;
        this.follower_id = follower_id;
    }

    public Long user_id;
    public Long follower_id;
}
