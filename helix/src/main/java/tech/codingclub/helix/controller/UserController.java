package tech.codingclub.helix.controller;

import com.google.gson.Gson;
import org.apache.log4j.Logger;
import org.jooq.Condition;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import tech.codingclub.helix.database.GenericDB;
import tech.codingclub.helix.entity.*;
import tech.codingclub.helix.global.SysProperties;

import javax.naming.ldap.Control;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.*;

/**
 * User: Abhishek
 */
@Controller
@RequestMapping("/user")
public class UserController extends BaseController {

    private static Logger logger = Logger.getLogger(UserController.class);
    @RequestMapping(method = RequestMethod.GET, value = "/home")
    public String uitest(ModelMap model) {
        return "home";
    }


    @RequestMapping(method = RequestMethod.GET, value = "/welcome")
    public  String userWelcome(ModelMap modelMap, HttpServletResponse response, HttpServletRequest request) {
        Member currentMember = ControllerUtils.getCurrentMember(request);
        return "welcome";
    }

    @RequestMapping(method = RequestMethod.POST, value = "/public-tweet/{id}")
    public @ResponseBody List<TweetUI> fetchTweet(@PathVariable("id")Long id, HttpServletRequest request, HttpServletResponse response) {
        Condition condition = tech.codingclub.helix.tables.Tweet.TWEET.ID.lessThan(id);
        List<Tweet> tweets = (List<Tweet>) GenericDB.getRows(tech.codingclub.helix.tables.Tweet.TWEET, tech.codingclub.helix.entity.Tweet.class, condition, 5, tech.codingclub.helix.tables.Tweet.TWEET.CREATEDAT.desc());

        Set<Long>memberIds = new HashSet<Long>();
        for(Tweet tweet:tweets){
            memberIds.add(tweet.userId);
        }
        HashMap<Long,Member>members = new HashMap<Long, Member>();
        Condition condition1 = tech.codingclub.helix.tables.Member.MEMBER.ID.in(memberIds);
        List<Member> data = (List<Member>) GenericDB.getRows(tech.codingclub.helix.tables.Member.MEMBER, Member.class, condition1, null);

        List<TweetUI>tweetsUis = new ArrayList<TweetUI>();
        for(Member member:data){
            members.put(member.id,member);
        }
        for(Tweet tweet:tweets){
            Member member= members.get(tweet.id);
            TweetUI tweetUI = new TweetUI(tweet,member);
            tweetsUis.add(tweetUI);
        }
        return tweetsUis;
    }
    @RequestMapping(method = RequestMethod.POST, value = "/create-post")
    public @ResponseBody String handleEncrypt(@RequestBody String data, HttpServletRequest request, HttpServletResponse response) {
        Tweet tweet = new Tweet(data,null,ControllerUtils.getUserId(request),new Date().getTime());
        new GenericDB<Tweet>().addRow(tech.codingclub.helix.tables.Tweet.TWEET,tweet);
        return "Posted Successfully !!!";
    }

    @RequestMapping(method = RequestMethod.POST, value = "/follow-member/{memberId}")
    public @ResponseBody String followMember(@PathVariable Long memberId, HttpServletRequest request, HttpServletResponse response) {
        Member currentMember = ControllerUtils.getCurrentMember(request);
        Long id = currentMember.getId();
        if(currentMember!=null && memberId!=null && !id.equals(memberId)){
            Follower follower = new Follower(id,memberId);
            Follower follower1 = new GenericDB<Follower>().addRow(tech.codingclub.helix.tables.Follower.FOLLOWER, follower);
            return "Connected Successfully !!!";
        }
        else{
            return "not permitted !!!";
        }
    }

    @RequestMapping(method = RequestMethod.POST, value = "/unfollow-member/{memberId}")
    public @ResponseBody String unFollowMember(@PathVariable Long memberId, HttpServletRequest request, HttpServletResponse response) {
        Member currentMember = ControllerUtils.getCurrentMember(request);
        Long currentMemberId = currentMember.getId();
        if(currentMember!=null && memberId!=null && !currentMemberId.equals(memberId)){
            Condition condition = tech.codingclub.helix.tables.Follower.FOLLOWER.USER_ID.eq(currentMemberId).and(tech.codingclub.helix.tables.Follower.FOLLOWER.FOLLOWER_ID.eq(memberId));
            boolean b = new GenericDB<Follower>().deleteRow(tech.codingclub.helix.tables.Follower.FOLLOWER, condition);
            if(b){
                return "Unconnected Successfully !!!";
            }
            else{
                return "BACKEND ISSUE !!!";
            }

        }
        else{
            return "not permitted !!!";
        }
    }

    @RequestMapping(method = RequestMethod.GET, value = "/recommendations")
    public String recommendations(ModelMap modelMap, HttpServletRequest request, HttpServletResponse response) {


        Member member = ControllerUtils.getCurrentMember(request);
        Long currentMemberId = member.id;

        List<Member> members = (List<Member>) new GenericDB<Member>().getRows(tech.codingclub.helix.tables.Member.MEMBER, Member.class, null, 10,tech.codingclub.helix.tables.Member.MEMBER.ID.desc());
        modelMap.addAttribute("members",members);

        ArrayList<Long>memberIds = new ArrayList<Long>();
        for(Member m:members){
            memberIds.add(m.id);
        }

        Condition condition = tech.codingclub.helix.tables.Follower.FOLLOWER.USER_ID.eq(currentMemberId).and(tech.codingclub.helix.tables.Follower.FOLLOWER.FOLLOWER_ID.in(memberIds));
        List<Follower> rows = (List<Follower>) new GenericDB<Follower>().getRows(tech.codingclub.helix.tables.Follower.FOLLOWER, Follower.class, condition, null);


        //Filter
        Set<Long> followerIds = new HashSet<Long>();
        for(Follower follow:rows){
            followerIds.add(follow.follower_id);
        }

        for(Member member1:members){
            if(followerIds.contains(member1.id)){
                member1.is_followed = true;

            }
        }
        return "recommendations";
    }

    @RequestMapping(method = RequestMethod.GET, value = "/update")
    public String updateUser(ModelMap modelMap, HttpServletResponse response, HttpServletRequest request) {

        return "updateuser";
    }

    private static String saveUploadedFile( MultipartFile file, Long userId){
        try {
            String path = SysProperties.getBaseDir()+"/static/images/profile-image/"+userId+".jpg";
            file.transferTo( new File(path));
            return "/static/images/profile-image/"+userId+".jpg";
        } catch (IOException e) {
            e.printStackTrace();
        }
        return  null;
    }


    @RequestMapping(method = RequestMethod.POST, value = "/profile-image/upload")
    public ResponseEntity<?> uploadFile(
            @RequestParam("file") MultipartFile uploadfile, HttpServletRequest request) {
        if (uploadfile.isEmpty()) {
            return new ResponseEntity("please select a file!", HttpStatus.OK);
        }
        String path = "";
        try {
            Long currentMemberId = ControllerUtils.getUserId(request);
            Member row = new GenericDB<Member>().getRow(tech.codingclub.helix.tables.Member.MEMBER, Member.class, tech.codingclub.helix.tables.Member.MEMBER.ID.eq(currentMemberId));
            path = saveUploadedFile(uploadfile,currentMemberId);
            row.setImage(path);
            new GenericDB<Member>().updateRow(tech.codingclub.helix.tables.Member.MEMBER,row,tech.codingclub.helix.tables.Member.MEMBER.ID.eq(currentMemberId));
            logger.info(row);
        } catch (Exception e) {
            return new ResponseEntity(HttpStatus.BAD_REQUEST);
        }
        return new ResponseEntity(path, new HttpHeaders(), HttpStatus.OK);
    }
    @RequestMapping(method = RequestMethod.GET, value = "/followers")
    public String getFollowers(ModelMap modelMap, HttpServletRequest request, HttpServletResponse response) {
        Long userId = ControllerUtils.getUserId(request);
        Condition condition = tech.codingclub.helix.tables.Follower.FOLLOWER.USER_ID.eq(userId);
        List<Long> columnRows = new GenericDB<Long>().getColumnRows(tech.codingclub.helix.tables.Follower.FOLLOWER.FOLLOWER_ID, tech.codingclub.helix.tables.Follower.FOLLOWER, Long.class, condition, 100);

        Condition selectedMemberIds = tech.codingclub.helix.tables.Member.MEMBER.ID.in(columnRows);
        List<Member> members = (List<Member>) new GenericDB<Member>().getRows(tech.codingclub.helix.tables.Member.MEMBER, Member.class, selectedMemberIds, 10);
        String image_path = "/static/images/profile-image/"+userId+".jpg";

        File f = new File(image_path);
        logger.info(image_path);
        logger.info(f.exists());
        modelMap.addAttribute("USER_IMAGE","/static/images/profile-image/dummy.jpg");
        modelMap.addAttribute("members",members);
        return "followers";
    }
}