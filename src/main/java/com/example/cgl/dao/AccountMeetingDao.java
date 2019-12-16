package com.example.cgl.dao;

import com.example.cgl.entity.AccountMeeting;
import com.example.cgl.entity.Meeting;
import com.example.cgl.service.AccountMeetingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.*;
import org.springframework.stereotype.Repository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@Repository
public class AccountMeetingDao {
    @Autowired
    private JdbcTemplate jdbcTemplate;
    public void addParticipant(AccountMeeting accountMeeting){
        String sql="insert into account_meeting(meetingID,accountID,participantName,participantWork,participantSex,participantPhone,participantIdentity,needHotel) values(?,?,?,?,?,?,?,?)";
        jdbcTemplate.update(sql, new PreparedStatementSetter() {
            @Override
            public void setValues(PreparedStatement preparedStatement) throws SQLException {
                preparedStatement.setInt(1,accountMeeting.getMeetingID());
                preparedStatement.setString(2,accountMeeting.getAccountID());
                preparedStatement.setString(3,accountMeeting.getParticipantName());
                preparedStatement.setString(4,accountMeeting.getParticipantWork());
                preparedStatement.setString(5,accountMeeting.getParticipantSex());
                preparedStatement.setString(6,accountMeeting.getParticipantPhone());
                preparedStatement.setString(7,accountMeeting.getParticipantIdentity());
                preparedStatement.setString(8,accountMeeting.getNeedHotel());
            }
        });
    }
    public boolean selectIsExist(int meetingID,String accountID){
        boolean flag=false;
        String sql="select * from account_meeting where meetingID=? ";
        RowMapper<AccountMeeting> rowMapper=new BeanPropertyRowMapper<>(AccountMeeting.class);
        List<AccountMeeting> list=jdbcTemplate.query(sql,new Object[]{meetingID},rowMapper);
        if(list!=null&&list.size()>0){
          for(int i=0;i<list.size();i++)
            if(list.get(i).getAccountID().equals(accountID)) flag=true;
            else flag=false;
        }
        else {flag=false;}
        return flag;
    }
    public List<AccountMeeting> selectMyMeetingInfo(String meetingID){
        String sql="select *from account_meeting where meetingID=? ";
        List<AccountMeeting> accountMeetings=new ArrayList<>();
        jdbcTemplate.query(sql, new Object[]{Integer.parseInt(meetingID)}, new RowCallbackHandler() {
            @Override
            public void processRow(ResultSet resultSet) throws SQLException {
                AccountMeeting accountMeeting=new AccountMeeting();
                accountMeeting.setMeetingID(resultSet.getInt("meetingID"));
                accountMeeting.setAccountID(resultSet.getString("accountID"));
                accountMeeting.setParticipantName(resultSet.getString("participantName"));
                accountMeeting.setParticipantSex(resultSet.getString("participantSex"));
                accountMeeting.setParticipantPhone(resultSet.getString("participantPhone"));
                accountMeeting.setParticipantIdentity(resultSet.getString("participantIdentity"));
                accountMeeting.setParticipantWork(resultSet.getString("participantWork"));
                accountMeeting.setNeedHotel(resultSet.getString("needHotel"));
                accountMeetings.add(accountMeeting);
            }
        });
        return accountMeetings;
    }
    public boolean deleteMeeting(String meetingID){
        boolean flag;
        String sql="delete from account_meeting where meetingID=? delete from meeting where meetingID=?";
        int row=jdbcTemplate.update(sql, new PreparedStatementSetter() {
            @Override
            public void setValues(PreparedStatement preparedStatement) throws SQLException {
                preparedStatement.setInt(1,Integer.parseInt(meetingID));
                preparedStatement.setInt(2,Integer.parseInt(meetingID));
            }
        });
        if(row>0) flag=true;
        else flag=false;
        return flag;
    }
    public boolean exitMeeting(String meetingID,String accountID){
        boolean flag;
        String sql="delete from account_meeting where meetingID=? and accountID=?";
        int row=jdbcTemplate.update(sql, new PreparedStatementSetter() {
            @Override
            public void setValues(PreparedStatement preparedStatement) throws SQLException {
                preparedStatement.setInt(1,Integer.parseInt(meetingID));
                preparedStatement.setString(2,accountID);
            }
        });
        if(row==0) flag=false;
        else flag=true;
        return flag;
    }


    public List<Meeting> selectMyJoinMeeting(String accountID){
       String sql="select distinct meeting.meetingID,meeting.accountID,meetingName,meetingTime,meetingAddress,meetingHotel from meeting,account_meeting where account_meeting.accountID=? and meeting.meetingID=account_meeting.meetingID ";
        List<Meeting> meetings=new ArrayList<>();
        jdbcTemplate.query(sql, new Object[]{accountID}, new RowCallbackHandler() {
            @Override
            public void processRow(ResultSet resultSet) throws SQLException {
                Meeting meeting=new Meeting();
                meeting.setMeetingID(resultSet.getInt("meetingID"));
                meeting.setMeetingName(resultSet.getString("meetingName"));
                meeting.setMeetingTime(resultSet.getString("meetingTime"));
                meeting.setMeetingAddress(resultSet.getString("meetingAddress"));
                meeting.setAccountID(resultSet.getString("accountID"));
                meeting.setMeetingHotel(resultSet.getString("meetingHotel"));
                meetings.add(meeting);
            }
        });
        return meetings;
    }

    public List<Meeting> selectAllMeeting(){
        String sql="select *from meeting";
        List<Meeting> list=new ArrayList<>();
        jdbcTemplate.query(sql, new RowCallbackHandler() {
            @Override
            public void processRow(ResultSet resultSet) throws SQLException {
                Meeting meeting=new Meeting();
                meeting.setMeetingID(resultSet.getInt("meetingID"));
                meeting.setAccountID(resultSet.getString("accountID"));
                meeting.setMeetingPassword(resultSet.getString("meetingPassword"));
                meeting.setMeetingName(resultSet.getString("meetingName"));
                meeting.setMeetingTime(resultSet.getString("meetingTime"));
                meeting.setMeetingAddress(resultSet.getString("meetingAddress"));
                meeting.setMeetingHotel(resultSet.getString("meetingHotel"));
                list.add(meeting);
            }
        });
        return list;
    }

}
