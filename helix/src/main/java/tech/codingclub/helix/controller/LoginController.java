package tech.codingclub.helix.controller;

import org.jooq.Condition;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import tech.codingclub.helix.database.GenericDB;
import tech.codingclub.helix.entity.LoginResponse;
import tech.codingclub.helix.entity.Member;
import tech.codingclub.helix.entity.Tweet;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Currency;
import java.util.List;

@Controller
@RequestMapping("/login")
public class LoginController {

    @RequestMapping(method = RequestMethod.GET,value="/admin")
    public String adminLogin(ModelMap modelMap, HttpServletResponse response, HttpServletRequest request){
        return "adminlogin";
    }

    @RequestMapping(method= RequestMethod.GET,value="/user")
    public String userLogin(ModelMap modelMap, HttpServletResponse response, HttpServletRequest request){
        return "userLogin";
    }
    @RequestMapping(method= RequestMethod.GET,value="/welcome")
    public String welcomeLogin(ModelMap modelMap, HttpServletResponse response, HttpServletRequest request){
        return "welcomeLogin";
    }

    @RequestMapping(method = RequestMethod.POST, value = "/welcome")
    public @ResponseBody LoginResponse handleLogin(@RequestBody Member member, ModelMap modelMap, HttpServletResponse response, HttpServletRequest request) {
        List<Member> rows = (List<Member>) GenericDB.getRows(tech.codingclub.helix.tables.Member.MEMBER, Member.class, tech.codingclub.helix.tables.Member.MEMBER.EMAIL.eq(member.email).and(tech.codingclub.helix.tables.Member.MEMBER.PASSWORD.eq(member.password)), 1);
        LoginResponse loginResponse;

        if(rows!=null && rows.size()>0){
            Member member1 = rows.get(0);
            member1.setRole("cm");
            ControllerUtils.setUserSession(request,member1);
            loginResponse = new LoginResponse(member1.id,true,"Logged In SuccessFully");
        }
        else {
            loginResponse = new LoginResponse(null, false, "Wrong Credentials");
        }
        return loginResponse;
    }
}
