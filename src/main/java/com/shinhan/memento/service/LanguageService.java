package com.shinhan.memento.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shinhan.memento.mapper.LanguageMapper;

@Service
public class LanguageService {

	@Autowired
	private LanguageMapper languageMapper;

	public String findLanguageNameById(int languageId) {
		return languageMapper.findLanguageNameById(languageId);
	}
}
