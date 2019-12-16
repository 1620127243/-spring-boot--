package com.example.cgl.controller;


import com.example.cgl.entity.AccountMeeting;
import com.example.cgl.entity.Meeting;
import com.example.cgl.serviceImpl.AccountMeetingServiceImpl;
import com.example.cgl.serviceImpl.MeetingServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Controller
@RequestMapping("/meeting")
public class MeetingController {
    @Autowired
    private MeetingServiceImpl meetingServiceImpl;
    @Autowired
    private   AccountMeetingServiceImpl accountMeetingService;
    @RequestMapping(value = "/createMeeting",method = RequestMethod.POST)
    @ResponseBody
    public String addMeeting(@RequestBody Meeting meeting){
        meetingServiceImpl.addMeeting(meeting);
        return meetingServiceImpl.getMeetingID();
    }
    @RequestMapping(value = "/selectMeeting",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> selectMeeting(String selectCondition){
        List<Meeting> meetings=meetingServiceImpl.selectMeeting(selectCondition);
        Map<String,Object> map=new HashMap<String, Object>();
        if(meetings!=null){
            map.put("status",true);
            map.put("meetings",meetings);
        }
        else {
            map.put("status",false );
        }
        return map;
    }
    @RequestMapping(value = "/checkMeetingPassword",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> checkPassword(String joinMeetingID,String joinMeetingPassword){
        Map<String,Object> map=new HashMap<String, Object>();

        Meeting meeting=meetingServiceImpl.selectJoinMeeting(joinMeetingID);
        if(joinMeetingPassword.equals(meeting.getMeetingPassword())){
            map.put("flag",true);
            String[] info=getMeetingInfo(meeting.getMeetingInfo());
            map.put("infos",info);
        }
        else {
            map.put("flag",false);
        }
        return map;
    }
    @RequestMapping(value = "/selectMyCreateMeeting",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> selectMyCreateMeeeting(String accountID){
        Map<String,Object>map=new HashMap<>();
        List<Meeting> lists=meetingServiceImpl.selectMyCreateMeeting(accountID);
        if(lists!=null&&lists.size()>0){
            map.put("flag",true);
            map.put("meetings",lists);
        }
        else {
            map.put("flag",false);
        }

        return map;

    }
    @RequestMapping(value = "/selectMyMeetingInfo",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> selectMyMeetingInfo(String meetingID){
        Map<String,Object>map=new HashMap<>();
        List<AccountMeeting> lists=accountMeetingService.selectMyMeetingInfo(meetingID);
        if(lists!=null&&lists.size()>0){
            map.put("flag",true);
            map.put("meetingInfo",lists);
        }
        else {
            map.put("flag",false);
        }
        return map;

    }
    @RequestMapping(value = "/deleteMeeting",method = RequestMethod.POST)
    @ResponseBody
    public boolean deleteMeeting(String meetingID){
        return accountMeetingService.deleteMeeting(meetingID);
    }
    @RequestMapping(value = "/selectMyJoinMeeting",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> selectMyJoinMeeeting(String accountID){
        Map<String,Object>map=new HashMap<>();
        List<Meeting> lists=accountMeetingService.selectMyJoinMeeting(accountID);
        if(lists!=null&&lists.size()>0){
            map.put("flag",true);
            map.put("meetings",lists);
        }
        else {
            map.put("flag",false);
        }
        return map;

    }
    @RequestMapping(value = "/joinMeeting",method = RequestMethod.POST)
    @ResponseBody
    public boolean joinMeeting(@RequestBody AccountMeeting accountMeeting){
        boolean flag;
        if(accountMeetingService.selectIsExist(accountMeeting.getMeetingID(),accountMeeting.getAccountID())){
            flag=false;
        }
        else{
            accountMeetingService.addParticipant(accountMeeting);
            flag=true;
        }
        return flag;
    }
    @RequestMapping(value = "/exitMeeting",method = RequestMethod.POST)
    @ResponseBody
    public boolean exitMeeting(String meetingID,String accountID){
     return accountMeetingService.exitMeeting(meetingID,accountID);
    }
    @RequestMapping(value = "/deleteAccount",method = RequestMethod.POST)
    @ResponseBody
    public boolean deleteAccount(String meetingID,String accountID){
        return accountMeetingService.exitMeeting(meetingID,accountID);
    }
    @RequestMapping(value = "/selectAllMeeting",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> selectAllAccount(){
        Map<String,Object> map=new HashMap<>();
        List<Meeting> list=accountMeetingService.selectAllMeeting();
        map.put("meetings",list);
        return map;
    }
    @RequestMapping(value = "/deleteMeetingByAdmin",method = RequestMethod.POST)
    @ResponseBody
    public boolean deleteMeetingByAdmin(String meetingID){
        return accountMeetingService.deleteMeeting(meetingID);
    }


    private String[] getMeetingInfo(String meetingInfo){
        char[] strings=meetingInfo.toCharArray();
        String[] str=new String[strings.length];
        for(int i=0;i<str.length;i++){
            str[i]=String.valueOf( strings[i]);
        }
        for (int i=0;i<str.length;i++){
            if(str[i].equals("1")){
                str[i]="姓名";
            }
            if(str[i].equals("2")){
                str[i]="性别";
            }
            if(str[i].equals("3")){
                str[i]="联系方式";
            }
            if(str[i].equals("4")){
                str[i]="身份证号";
            } if(str[i].equals("5")){
                str[i]="工作单位";
            } if(str[i].equals("6")){
                str[i]="是否需要宾馆";
            }
        }
        return str;
        }
    }

