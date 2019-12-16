package com.example.cgl.serviceImpl;

import com.example.cgl.dao.AccountDao;
import com.example.cgl.entity.Account;
import com.example.cgl.service.AccountService;
import com.sun.org.apache.xpath.internal.operations.Bool;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AccountServiceImpl implements AccountService {
    @Autowired
    private AccountDao accountDao;

    public List<Account> selectAllAccount(){
       return accountDao.selectAllAccount();
    }
    public void addAccount(Account account){ accountDao.addAccount(account);}
    public Account selectAccount(String accountID){return accountDao.selectAccount(accountID);}
    public boolean checkID(String accountID){return  accountDao.checkID(accountID);}
    public boolean deleteAccount(String accountID) {
        return accountDao.deleteAccount(accountID);
    }
}
