package com.shinhan.memento.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shinhan.memento.mapper.CategoryMapper;
@Service
public class CategoryService {
	 @Autowired
	    private CategoryMapper categoryMapper;

	    public String findCategoryNameById(int categoryId) {
	        return categoryMapper.findCategoryNameById(categoryId);
	    }
}
