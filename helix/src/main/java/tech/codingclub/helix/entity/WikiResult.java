package tech.codingclub.helix.entity;

public class WikiResult {
    public String getQuery() {
        return query;
    }

    public void setQuery(String query) {
        this.query = query;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public String getText_results() {
        return text_results;
    }

    public void setText_results(String text_results) {
        this.text_results = text_results;
    }

    public String query;
    public String imageUrl;
    public String text_results;
    public WikiResult(){

    }
    public WikiResult(String query,String imageUrl,String text_results){
        this.imageUrl = imageUrl;
        this.text_results =  text_results;
        this.query = query;
    }
}
