package com.example.cgl.service;

import com.example.cgl.entity.Account;

import java.util.List;

public interface AccountService {
    List<Account> selectAllAccount();
    void addAccount(Account account);
    Account selectAccount(String accountID);
    boolean checkID(String accountID);
    boolean deleteAccount(String accountID);
}
