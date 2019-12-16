package com.example.cgl.controller;

import com.example.cgl.entity.Account;
import com.example.cgl.serviceImpl.AccountServiceImpl;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class AccountController {
    @Autowired
    private AccountServiceImpl accountServiceImp;
    @RequestMapping(value = "/index")
    public String index(){
        return "index";
    }
    @RequestMapping (value = "/login",method= RequestMethod.POST)
    public ModelAndView login( @RequestParam("loginID") String loginID,@RequestParam("loginPassword") String loginPassword){
        ModelAndView mv=new ModelAndView();
        if(loginID.equals(accountServiceImp.selectAccount(loginID).getAccountID())&&loginPassword.equals(accountServiceImp.selectAccount(loginID).getAccountPassword())){
            mv.setViewName("main");
            mv.addObject("ID",loginID);
            mv.addObject("Power",accountServiceImp.selectAccount(loginID).getAccountPower());
            mv.addObject("Email",accountServiceImp.selectAccount(loginID).getAccountEmail());
        }
        return mv;
    }

    @RequestMapping(value="/register",method= RequestMethod.POST)
    @ResponseBody
    public String  addAccount(@RequestBody Account account){
            accountServiceImp.addAccount(account);
        return account.getAccountID();
    }

    @RequestMapping(value="/checkID",method= RequestMethod.POST)
    @ResponseBody
    public boolean CheckID( String accountID){
        return accountServiceImp.checkID(accountID);
    }

    @RequestMapping(value="/selectAllAccount",method= RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> selectAllAccount(String test){
        Map<String,Object> map=new HashMap<>();
        List<Account> list=accountServiceImp.selectAllAccount();
        for(int i=0;i<list.size();i++){
            if(list.get(i).getAccountPower().equals("管理员")){
                list.remove(i);
            }
        }
        map.put("accounts",list);
        return map;
    }
    @RequestMapping(value="/deleteAccountByAdmin",method= RequestMethod.POST)
    @ResponseBody
    public boolean deleteAccount(String accountID){
        return accountServiceImp.deleteAccount(accountID);
    }

}
