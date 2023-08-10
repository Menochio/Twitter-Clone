package tech.codingclub.helix.entity;

public class TweetUI extends Tweet{
    private String name,email;
    public TweetUI(Tweet tweet,Member member){
        this.name = member.name;
        this.email = member.email;

    }
}
