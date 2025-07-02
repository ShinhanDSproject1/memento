package com.shinhan.memento.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.shinhan.memento.dto.CategoryDTO;
import com.shinhan.memento.dto.CreateMentosDBDTO;
import com.shinhan.memento.dto.LanguageDTO;
import com.shinhan.memento.dto.MatchTypeDTO;
import com.shinhan.memento.model.Mentos;

@Mapper
public interface MentosMapper {

	int createMentos(CreateMentosDBDTO dto);

	List<LanguageDTO> getAllLanguages();

	List<CategoryDTO> getAllCategories();

	List<MatchTypeDTO> getAllMatchTypes();
	
	Mentos checkValidMentosById(int mentosId);
}
