package com.example.cgl.dao;

import com.example.cgl.entity.Account;
import com.example.cgl.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.relational.core.sql.In;
import org.springframework.jdbc.core.*;
import org.springframework.stereotype.Repository;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@Repository
public class AccountDao {
@Autowired
    private JdbcTemplate jdbcTemplate;
    private RowMapper<Account> rowMapper=new BeanPropertyRowMapper<Account>(Account.class);
    public List<Account> selectAllAccount(){
        String sql="select *from account";
        List<Account> list=new ArrayList<>();
        jdbcTemplate.query(sql, new RowCallbackHandler() {
            @Override
            public void processRow(ResultSet resultSet) throws SQLException {
                Account account=new Account();
                account.setAccountID(resultSet.getString("accountID"));
                account.setAccountPassword(resultSet.getString("accountPassword"));
                account.setAccountEmail(resultSet.getString("accountEmail"));
                account.setAccountPower(resultSet.getString("accountPower"));
                list.add(account);
            }
        });
        return list;
    }
    public void addAccount(Account account){
        String sql="insert into account(accountID,accountPassword,accountPower,accountEmail) values(?,?,?,?)";
        jdbcTemplate.update(sql, new PreparedStatementSetter() {
            @Override
            public void setValues(PreparedStatement preparedStatement) throws SQLException {
                preparedStatement.setString(1,account.getAccountID());
                preparedStatement.setString(2,account.getAccountPassword());
                preparedStatement.setString(3,account.getAccountPower());
                preparedStatement.setString(4,account.getAccountEmail());
            }
        });
    }
    public Account selectAccount(String accountID){
        String sql="select *from account where accountID=?";
        RowMapper<Account> rowMapper=new BeanPropertyRowMapper<Account>(Account.class);
         Account account=jdbcTemplate.queryForObject(sql,rowMapper,accountID);
         return account;
    }
    public boolean checkID(String accountID){
        boolean flag=true;
        String sql="select count(*) from account where accountID=?";
        int count=jdbcTemplate.queryForObject(sql, Integer.class,accountID);
        if(count==1) flag=false;
        if(count==0) flag=true;
        return flag;
    }
    public boolean deleteAccount(String accountID){
        boolean flag;
        String sql="delete from account where accountID=? ";
        int row=jdbcTemplate.update(sql, new PreparedStatementSetter() {
            @Override
            public void setValues(PreparedStatement preparedStatement) throws SQLException {
                preparedStatement.setString(1,accountID);
            }
        });
        if(row>0) flag=true;
        else flag=false;
        return flag;
    }


}
