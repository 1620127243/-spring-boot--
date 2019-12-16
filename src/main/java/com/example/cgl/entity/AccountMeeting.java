package com.example.cgl.entity;

import cn.afterturn.easypoi.excel.annotation.Excel;


public class AccountMeeting {
    //会议ID
    @Excel(name = "会议编号",width = 25)
    private int meetingID;
    //参会者账户ID
    @Excel(name = "参会人员账号",width = 25)
    private String accountID;
    @Excel(name = "参会者姓名",width = 25)
    //参会者姓名
    private String participantName;
    @Excel(name = "参会者工作单位",width = 25)
    //参会者工作单位
    private String participantWork;
    //参会者性别
    @Excel(name = "参会者性别",width = 25)
    private String participantSex;
    //参会者联系方式
    @Excel(name = "参会者联系方式",width = 25)
    private String participantPhone;
    //参会者身份证号
    @Excel(name = "参会者身份者号",width = 25)
    private String participantIdentity;
    //参会者是否需要入住宾馆
    @Excel(name = "参会者是否需要入住宾馆",width = 25)
    private String needHotel;

    public int getMeetingID() {
        return meetingID;
    }

    public void setMeetingID(int meetingID) {
        this.meetingID = meetingID;
    }

    public String getAccountID() {
        return accountID;
    }

    public void setAccountID(String accountID) {
        this.accountID = accountID;
    }

    public String getParticipantName() {
        return participantName;
    }

    public void setParticipantName(String participantName) {
        this.participantName = participantName;
    }

    public String getParticipantWork() {
        return participantWork;
    }

    public void setParticipantWork(String participantWork) {
        this.participantWork = participantWork;
    }

    public String getParticipantSex() {
        return participantSex;
    }

    public void setParticipantSex(String participantSex) {
        this.participantSex = participantSex;
    }

    public String getParticipantPhone() {
        return participantPhone;
    }

    public void setParticipantPhone(String participantPhone) {
        this.participantPhone = participantPhone;
    }

    public String getParticipantIdentity() {
        return participantIdentity;
    }

    public void setParticipantIdentity(String participantIdentity) {
        this.participantIdentity = participantIdentity;
    }

    public String getNeedHotel() {
        return needHotel;
    }

    public void setNeedHotel(String needHotel) {
        this.needHotel = needHotel;
    }
}
