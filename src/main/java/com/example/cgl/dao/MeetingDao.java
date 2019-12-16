package com.example.cgl.dao;

import com.example.cgl.entity.Account;
import com.example.cgl.entity.Meeting;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.*;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Repository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

@Repository

public class MeetingDao {
    @Autowired
    private JdbcTemplate jdbcTemplate;
    public void addMeeting(Meeting meeting){
        String sql="insert into meeting(meetingName,meetingPassword,meetingTime,meetingAddress,meetingHotel,meetingInfo,accountID) values(?,?,?,?,?,?,?)";
        jdbcTemplate.update(sql, new PreparedStatementSetter() {
            @Override
            public void setValues(PreparedStatement preparedStatement) throws SQLException {
                preparedStatement.setString(1,meeting.getMeetingName());
                preparedStatement.setString(2,meeting.getMeetingPassword());
                preparedStatement.setString(3,meeting.getMeetingTime());
                preparedStatement.setString(4,meeting.getMeetingAddress());
                preparedStatement.setString(5,meeting.getMeetingHotel());
                preparedStatement.setString(6,meeting.getMeetingInfo());
                preparedStatement.setString(7,meeting.getAccountID());
            }
        });
    }
    public String getMeetingID(){
        String sql="select max(meetingID) from meeting";
        String maxID=jdbcTemplate.queryForObject(sql,String.class);
        return maxID;
    }

    public List<Meeting> selectMeeting(String selectCondition){
        String sql="select *from meeting where meetingID=? ";
        List<Meeting> meetings=new ArrayList<>();
        jdbcTemplate.query(sql, new Object[]{Integer.parseInt(selectCondition)}, new RowCallbackHandler() {
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
    public Meeting selectJoinMeeting(String ID){
        String sql="select *from meeting where meetingID=? ";
        RowMapper<Meeting> rowMapper=new BeanPropertyRowMapper<Meeting>(Meeting.class);
        Meeting meeting=jdbcTemplate.queryForObject(sql,rowMapper,ID);
        return meeting;
    }
    public List<Meeting> selectMyCreateMeeting(String accountID){
        String sql="select *from meeting where accountID=? ";
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
}
