package com.example.cgl.service;

import com.example.cgl.entity.AccountMeeting;
import com.example.cgl.entity.Meeting;

import java.util.List;

public interface AccountMeetingService {
    void addParticipant(AccountMeeting accountMeeting);
    boolean selectIsExist(int meetingID,String accountID);
    List<AccountMeeting> selectMyMeetingInfo(String meetingID);
    boolean deleteMeeting(String meetingID);
    List<Meeting> selectMyJoinMeeting(String accountID);
    boolean exitMeeting(String meetingID,String accountID);
    List<Meeting> selectAllMeeting();
}
