package com.example.cgl.serviceImpl;

import com.example.cgl.dao.AccountMeetingDao;
import com.example.cgl.entity.AccountMeeting;
import com.example.cgl.entity.Meeting;
import com.example.cgl.service.AccountMeetingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AccountMeetingServiceImpl implements AccountMeetingService {
    @Autowired
    private AccountMeetingDao accountMeetingDao;
    @Override
    public void addParticipant(AccountMeeting accountMeeting) {
        accountMeetingDao.addParticipant(accountMeeting);
    }

    @Override
    public boolean selectIsExist(int meetingID, String accountID) {
        return accountMeetingDao.selectIsExist(meetingID,accountID);
    }
    public List<AccountMeeting> selectMyMeetingInfo(String meetingID){
        return accountMeetingDao.selectMyMeetingInfo(meetingID);
    }

    @Override
    public boolean deleteMeeting(String meetingID) {
        return accountMeetingDao.deleteMeeting(meetingID);
    }

    @Override
    public List<Meeting> selectMyJoinMeeting(String accountID) {
        return accountMeetingDao.selectMyJoinMeeting(accountID);
    }

    @Override
    public boolean exitMeeting(String meetingID, String accountID) {
        return accountMeetingDao.exitMeeting(meetingID,accountID);
    }

    @Override
    public List<Meeting> selectAllMeeting() {
        return accountMeetingDao.selectAllMeeting();
    }
}
