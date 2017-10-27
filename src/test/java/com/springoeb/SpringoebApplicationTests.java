package com.springoeb;

import com.springoeb.cashier.service.OrderService;
import com.springoeb.menu.service.BranchMenuService;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
public class SpringoebApplicationTests {

	@Autowired
	private OrderService orderService;
	@Autowired
	private BranchMenuService branchMenuService;
}
