package com.shinhan.memento.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shinhan.memento.dao.MyPageDAO;

@Service
public class MyPageService {

		@Autowired
		MyPageDAO myPageDAO;
}
