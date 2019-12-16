package com.example.cgl.entity;

import javax.persistence.*;
import java.text.SimpleDateFormat;

@Table(name = "meeting")
@Entity
public class Meeting {
    //会议编号
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int meetingID;
    //会议名称
    private String meetingName;
    //会议密码
    private String meetingPassword;
    //会议时间
    private String meetingTime;
    //会议地址
    private String meetingAddress;
    //会议宾馆
    private String meetingHotel;
    //会议发布者的账户ID
    private String accountID;
    private String meetingInfo;

    public int getMeetingID() {
        return meetingID;
    }

    public void setMeetingID(int meetingID) {
        this.meetingID = meetingID;
    }

    public String getMeetingName() {
        return meetingName;
    }

    public void setMeetingName(String meetingName) {
        this.meetingName = meetingName;
    }

    public String getMeetingPassword() {
        return meetingPassword;
    }

    public void setMeetingPassword(String meetingPassword) {
        this.meetingPassword = meetingPassword;
    }

    public String getMeetingTime() {
        return meetingTime;
    }

    public void setMeetingTime(String meetingTime) {
        this.meetingTime = meetingTime;
    }

    public String getMeetingAddress() {
        return meetingAddress;
    }

    public void setMeetingAddress(String meetingAddress) {
        this.meetingAddress = meetingAddress;
    }

    public String getMeetingHotel() {
        return meetingHotel;
    }

    public void setMeetingHotel(String meetingHotel) {
        this.meetingHotel = meetingHotel;
    }

    public String getAccountID() {
        return accountID;
    }

    public void setAccountID(String accountID) {
        this.accountID = accountID;
    }

    public String getMeetingInfo() {
        return meetingInfo;
    }

    public void setMeetingInfo(String meetingInfo) {
        this.meetingInfo = meetingInfo;
    }

    @Override
    public String toString() {
        String str="会议编号:"+meetingID+"\n 会议发布者:"+accountID+"\n 会议名称:"+meetingName+"\n 会议时间:"+meetingTime+"\n 会议地点:"+
                meetingAddress+"\n 会议宾馆:"+meetingHotel;
        return str;
    }
}
