package com.shop.schedule.schedule;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.shop.schedule.service.DailyOrderService;

@Component
public class DailyOrderSchedule {

	@Autowired
	DailyOrderService service;
	
	//하루에 한번 , 오전 3시에 실행
	@Scheduled(cron = "0 0 3 * * *")  
	public void dailyOrder() {
		try {
			int c = service.insertOrderList();
			
			//…
		} catch (Exception e) {
			System.out.println("* Batch 시스템이 예기치 않게 종료되었습니다. Message: {}" 
									+ e.getMessage());
		}
	}
	
}
