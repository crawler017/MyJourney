package com.myjourney.dao;

import com.myjourney.domain.Account;

import java.util.List;

public interface AccountDao {

    List<Account> findAllAccount();

    Account findAccountById(Integer id);

    void saveAccount(Account account);

    void updateAccount(Account account);

    void deleteAccount(Integer id);

    Account findAccountByName(String name);
}
