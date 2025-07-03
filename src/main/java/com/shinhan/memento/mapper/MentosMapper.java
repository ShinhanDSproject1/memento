package com.shinhan.memento.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.shinhan.memento.dto.CategoryDTO;
import com.shinhan.memento.dto.LanguageDTO;
import com.shinhan.memento.dto.MatchTypeDTO;
import com.shinhan.memento.dto.mentoDetail.MentoDetailClassDTO;
import com.shinhan.memento.dto.mentos.CreateMentosDBDTO;
import com.shinhan.memento.model.Mentos;

@Mapper
public interface MentosMapper {

	int createMentos(CreateMentosDBDTO dto);

	List<LanguageDTO> getAllLanguages();

	List<CategoryDTO> getAllCategories();

	List<MatchTypeDTO> getAllMatchTypes();

	Mentos checkValidMentosById(int mentosId);

	List<Mentos> showMentosList(@Param("regionGroup") String regionGroup, @Param("matchTypeId") Integer matchTypeId,
			@Param("categoryId") Integer categoryId, @Param("languageId") Integer languageId,
			@Param("offset") int offset);
	
	int countNowMember(int mentosId);
	
	List<Mentos> showInProgressMentosList(int mentoId);
}
