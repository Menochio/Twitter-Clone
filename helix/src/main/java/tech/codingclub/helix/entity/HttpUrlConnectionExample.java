package tech.codingclub.helix.entity;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

public class  HttpUrlConnectionExample{

    public static String setGet(String stringUrl) throws Exception{
        StringBuilder stringBuilder = new StringBuilder();
        URL url = new URL(stringUrl);
        HttpURLConnection httpURLConnection =  (HttpURLConnection)url.openConnection();
        httpURLConnection.setRequestMethod("GET");
        BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(httpURLConnection.getInputStream()));
        String line;
        while((line = bufferedReader.readLine())!=null){
            stringBuilder.append(line);
            stringBuilder.append("\n");
        }
        bufferedReader.close();
        return stringBuilder.toString();
    }

    public static void main(String[] args) throws Exception {
        String uiData = HttpUrlConnectionExample.setGet("https://codingclub.tech/test-get-request?name=Abhishek");
        System.out.println(uiData);
    }

}
