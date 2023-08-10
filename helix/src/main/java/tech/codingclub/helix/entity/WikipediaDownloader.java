package tech.codingclub.helix.entity;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class WikipediaDownloader implements Runnable {
    private String keyword;
    private String result;
    private String image;
    public WikipediaDownloader(){}
    public  WikipediaDownloader(String keyword){
        this.keyword = keyword;
    }

    public  WikiResult getResult() {
        String searchWord = this.keyword;
        if(searchWord == null || searchWord.length() == 0) return null;

        searchWord = searchWord.trim().replaceAll("[ ]","_");
        searchWord = searchWord.substring(0,1).toUpperCase()+searchWord.substring(1);
        String wikiUrl = getWikiUrl(searchWord);
        int state = 0;
        try {
            String htmlResponse = HttpUrlConnectionExample.setGet(wikiUrl);
            Document document = Jsoup.parse(htmlResponse, "https://en.wikipedia.org");
            Elements childElements = document.body().select(".mw-parser-output > *");

            for(Element element:childElements){
                if(state == 0){
                    if(element.tagName().equals("table")){
                        state++;
                    }
                }
                else if(state == 1 && element.tagName().equals("p")){
                    result = element.text();
                    state = 2;
                    break;
                }
            }
            this.image = document.body().select(".infobox img").get(0).attr("src");


        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        WikiResult wikiResult = new WikiResult(this.keyword,this.image,this.result);
        Gson gson = new GsonBuilder().setPrettyPrinting().create();
        String json = gson.toJson(wikiResult);
        return wikiResult;
    }

    private String getWikiUrl(String searchWord) {
        String wikiUrl = "https://en.wikipedia.org/wiki/"+searchWord;
        return wikiUrl;
    }

    public static void main(String[] args) {
        TaskManager taskManager = new TaskManager(1);
        String [] queries = {"India","Asia","Australia","England","Hulk"};
        for(String query:queries){
            WikipediaDownloader  wikipediaDownloader = new WikipediaDownloader(query);
            taskManager.waitTillQueueIsFreeAndAddTask(wikipediaDownloader);
        }
    }

    @Override
    public void run() {
        
    }
}
