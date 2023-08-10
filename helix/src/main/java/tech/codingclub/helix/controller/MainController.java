package tech.codingclub.helix.controller;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import org.apache.log4j.Logger;
import org.springframework.http.HttpEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import tech.codingclub.helix.database.GenericDB;
import tech.codingclub.helix.entity.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.HashMap;

/**
 * User: Abhishek
 */
@Controller
@RequestMapping("/")
public class MainController extends BaseController {

    private static Logger logger = Logger.getLogger(MainController.class);

    @RequestMapping(method = RequestMethod.GET, value = "/helloworld")
    public String getQuiz(ModelMap modelMap, HttpServletResponse response, HttpServletRequest request) {
        return "hello";
    }

    @RequestMapping(method = RequestMethod.POST, value = "/signup")
    public @ResponseBody  SignUpResponse getSignUp(@RequestBody Member member, ModelMap modelMap, HttpServletResponse response, HttpServletRequest request) {
        Boolean user_created = false;
        String message="";

        if(GenericDB.getCount(tech.codingclub.helix.tables.Member.MEMBER,tech.codingclub.helix.tables.Member.MEMBER.EMAIL.eq(member.email))>0){
            message = "User already exists for this email id";
        }
        else{
            user_created = true;
            message="New user Created !!!";
            member.setImage("/static/images/profile-image/dummy.jpg");
            Member member1 = new GenericDB<Member>().addRow(tech.codingclub.helix.tables.Member.MEMBER, member);
        }
        SignUpResponse signUpResponse = new SignUpResponse(message, user_created);
        return signUpResponse;
    }
    @RequestMapping(method = RequestMethod.GET, value = "/signup")
    public  String getSignUp(ModelMap modelMap, HttpServletResponse response, HttpServletRequest request) {
        return "userSignUp";
    }

    @RequestMapping(method = RequestMethod.GET, value = "/getTime")
    public @ResponseBody String getTime(ModelMap modelMap, HttpServletResponse response, HttpServletRequest request) {
        Time time = new Time(new Date().toString(),new Date());
        return new Gson().toJson(time);
    }
    @RequestMapping(method = RequestMethod.GET, value = "/wiki/{keyword}")
    public @ResponseBody String getWikiResponse(@PathVariable(value = "keyword") String keyword) {
        WikipediaDownloader wikipediaDownloader = new WikipediaDownloader(keyword);
        WikiResult result = wikipediaDownloader.getResult();
        String s = new Gson().toJson(result);
        return s;
    }

    @RequestMapping(method = RequestMethod.GET, value = "/wiki/api/{keyword}")
    public String getWikiResult(ModelMap modelMap,@PathVariable(value = "keyword") String keyword) {
        WikipediaDownloader wikipediaDownloader = new WikipediaDownloader(keyword);
        WikiResult result = wikipediaDownloader.getResult();
        modelMap.addAttribute("IMAGE",result.getImageUrl());
        modelMap.addAttribute("QUERY",result.getQuery());
        modelMap.addAttribute("TEXT",result.getText_results());
        return "wiki";
    }

    @RequestMapping(method = RequestMethod.POST, value = "/handle")
    public @ResponseBody String handleEncrypt(@RequestBody String data, HttpServletRequest request, HttpServletResponse response) {
        return "ok";
    }
}