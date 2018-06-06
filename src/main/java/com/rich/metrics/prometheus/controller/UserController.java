package com.rich.metrics.prometheus.controller;

import io.prometheus.client.Counter;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/users")
public class UserController {

	private static final Counter user_regist_counter = Counter.build()
			.name("user_counter")
			.labelNames("status")
			.help("Show user added and removed counts").register();

	@GetMapping
	public void registUser() {
		user_regist_counter.labels("add").inc();
	}

	@DeleteMapping
	public void deleteUser() {
		user_regist_counter.labels("delete").inc();
	}
}
