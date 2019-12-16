package com.example.cgl.entity;


public class Account {
    //账户ID
    private String accountID;
    // 账户登陆密码
    private String accountPassword;
    //账户权限，1代表管理员，2代表会员，3代表普通用户。会员可发布会议，普通用户只能参加别人发起的会议
    private String accountPower;
    //用户Email
    private String accountEmail;

    public String getAccountID() {
        return accountID;
    }

    public void setAccountID(String accountID) {
        this.accountID = accountID;
    }

    public String getAccountPassword() {
        return accountPassword;
    }

    public void setAccountPassword(String accountPassword) {
        this.accountPassword = accountPassword;
    }

    public String getAccountPower() {
        return accountPower;
    }

    public void setAccountPower(String accountPower) {
        this.accountPower = accountPower;
    }

    public String getAccountEmail() {
        return accountEmail;
    }

    public void setAccountEmail(String accountEmail) {
        this.accountEmail = accountEmail;
    }
}
