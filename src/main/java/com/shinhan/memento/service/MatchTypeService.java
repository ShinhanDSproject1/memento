package com.shinhan.memento.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shinhan.memento.mapper.MatchTypeMapper;

@Service
public class MatchTypeService {

	@Autowired
	private MatchTypeMapper matchTypeMapper;

	public String findMatchTypeNameById(int matchTypeId) {
		return matchTypeMapper.findMatchTypeNameById(matchTypeId);
	}
}
