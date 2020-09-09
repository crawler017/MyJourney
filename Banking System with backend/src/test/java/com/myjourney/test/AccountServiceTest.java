package com.myjourney.test;

import com.myjourney.domain.Account;
import com.myjourney.service.AccountService;
import com.myjourney.service.impl.AccountServiceImpl;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:bean.xml")
public class AccountServiceTest {

    @Autowired
    private AccountService as;

    @Test
    public void testFindAll() {

        List<Account> accounts = as.findAllAccount();

        for (Account account: accounts)
            System.out.println(account);

    }

    @Test
    public void testTransfer() {
        String targetName = "aaa";
        String sourceName = "bbb";
        Float money = 50.56f;

        as.transfer(targetName, sourceName, money);
    }
}
