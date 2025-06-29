package com.shinhan.memento.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shinhan.memento.dao.MyPageDAO;
import com.shinhan.memento.dto.MyMentosListResponseDTO;

@Service
public class MyPageService {

		@Autowired
		MyPageDAO myPageDAO;
		
		public List<MyMentosListResponseDTO> selectMyMentosListById(Integer memberId){
			return myPageDAO.selectMyMentosListById(memberId);
		}
}
