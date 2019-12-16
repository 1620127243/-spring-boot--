package com.example.cgl.serviceImpl;

import com.example.cgl.dao.MeetingDao;
import com.example.cgl.entity.Meeting;
import com.example.cgl.service.MeetingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MeetingServiceImpl implements MeetingService {
    @Autowired
    private MeetingDao meetingDao;

    public void addMeeting(Meeting meeting) {
        meetingDao.addMeeting(meeting);
    }


    public String getMeetingID() {
        return meetingDao.getMeetingID();
    }


    public List<Meeting> selectMeeting(String selectCondition) {
        return meetingDao.selectMeeting(selectCondition);
    }


    public Meeting selectJoinMeeting(String ID) {
        return meetingDao.selectJoinMeeting(ID);
    }

    public List<Meeting> selectMyCreateMeeting(String accountID){return meetingDao.selectMyCreateMeeting(accountID);}
}
