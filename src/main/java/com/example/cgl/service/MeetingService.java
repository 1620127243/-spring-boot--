package com.example.cgl.service;

import com.example.cgl.entity.Meeting;

import java.util.List;

public interface MeetingService {
    void addMeeting(Meeting meeting);
    String getMeetingID();
    List<Meeting> selectMeeting(String selectCondition);
    Meeting selectJoinMeeting(String ID);
    List<Meeting> selectMyCreateMeeting(String accountID);
}
