package com.myjourney.service.impl;

import com.myjourney.dao.AccountDao;
import com.myjourney.domain.Account;
import com.myjourney.service.AccountService;
import com.myjourney.utils.TransactionManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

public class AccountServiceImpl implements AccountService {

    private AccountDao accountDao;
    private TransactionManager transactionManager;

    public void setAccountDao(AccountDao accountDao) {
        this.accountDao = accountDao;
    }

    public void setTransactionManager(TransactionManager transactionManager) {
        this.transactionManager = transactionManager;
    }

    @Override
    public List<Account> findAllAccount() {
        try {
            transactionManager.beginTransaction();
            List<Account> accounts = accountDao.findAllAccount();
            transactionManager.commit();
            return accounts;
        }catch (Exception e){
            transactionManager.rollback();
            throw new RuntimeException("数据库为空");
        }finally{
            transactionManager.release();
        }
    }

    @Override
    public Account findAccountById(Integer id) {
        try{
            transactionManager.beginTransaction();
            Account account = accountDao.findAccountById(id);
            transactionManager.commit();
            return account;
        }catch (Exception e) {
            transactionManager.rollback();
            throw new RuntimeException("无此用户");
        }finally {
            transactionManager.release();
        }
    }

    @Override
    public void saveAccount(Account account) {
        try {
            transactionManager.beginTransaction();
            accountDao.saveAccount(account);
            transactionManager.commit();
        } catch (Exception e) {
            transactionManager.rollback();
        } finally {
            transactionManager.release();
        }
    }

    @Override
    public void updateAccount(Account account) {
        try {
            transactionManager.beginTransaction();
            accountDao.updateAccount(account);
            transactionManager.commit();
        } catch (Exception e) {
            transactionManager.rollback();
        } finally {
            transactionManager.release();
        }
    }

    @Override
    public void deleteAccount(Integer id) {
        try {
            transactionManager.beginTransaction();
            accountDao.deleteAccount(id);
            transactionManager.commit();
        } catch (Exception e){
            transactionManager.rollback();
        } finally {
            transactionManager.release();
        }
    }

    @Override
    public void transfer(String sourceName, String targetName, Float money) {
        try {
            transactionManager.beginTransaction();
            Account sourceAccount = accountDao.findAccountByName(sourceName);
            Account targetAccount = accountDao.findAccountByName(targetName);

            if (sourceAccount != null) {
                if (sourceAccount.getMoney() >= money) {
                    sourceAccount.setMoney(sourceAccount.getMoney() - money);
                    accountDao.updateAccount(sourceAccount);

                    targetAccount.setMoney(targetAccount.getMoney() + money);
                    accountDao.updateAccount(targetAccount);
                } else
                    throw new RuntimeException("金额不足");
            } else
                throw new RuntimeException("无此账号");

            transactionManager.commit();
        } catch (Exception e) {
            transactionManager.rollback();
            e.printStackTrace();
        } finally {
            transactionManager.release();
        }
    }
}
