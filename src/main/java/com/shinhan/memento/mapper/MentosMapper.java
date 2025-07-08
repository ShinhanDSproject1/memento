package com.shinhan.memento.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.shinhan.memento.dto.CategoryDTO;
import com.shinhan.memento.dto.LanguageDTO;
import com.shinhan.memento.dto.MatchTypeDTO;
import com.shinhan.memento.dto.mentoDetail.MentoDetailClassDTO;
import com.shinhan.memento.dto.mentos.CreateMentosDBDTO;
import com.shinhan.memento.dto.mentos.GetMentosDetailDTO.GetSimilarMentosListDTO;
import com.shinhan.memento.model.Mentos;

@Mapper
public interface MentosMapper {

	int createMentos(CreateMentosDBDTO dto);
	void deleteMentos(int mentosId);

	int updateMentos(Map<String, Object> mentosUpdateParams);
	List<LanguageDTO> getAllLanguages();

	List<CategoryDTO> getAllCategories();

	List<MatchTypeDTO> getAllMatchTypes();
	
	List<Map<String, String>> getRegionGroups();

	Mentos checkValidMentosById(int mentosId);

	List<Mentos> showMentosList(@Param("regionGroup") String regionGroup, @Param("matchTypeId") Integer matchTypeId,
			@Param("categoryId") Integer categoryId, @Param("languageId") Integer languageId,
			@Param("offset") int offset);
	
	List<Mentos> showPreMentoList(@Param("regionGroup") String regionGroup, @Param("matchTypeId") Integer matchTypeId,
	        @Param("categoryId") Integer categoryId, @Param("languageId") Integer languageId);
	
	List<Mentos> showInProgressMentosList(int mentoId);

	List<Mentos> showMentosListByMentoId(Map<String, Object> mentosParams);

	List<Mentos> findSimilarMentosList(Map<String, Object> similarParams);
	List<Mentos> findMentoIdListByMentosId(int mentoId);

    int checkPermission(Map<String, Object> checkParams);

	int getMentosListTotalCount(@Param("regionGroup") String regionGroup, @Param("matchTypeId") Integer matchTypeId,
			@Param("categoryId") Integer categoryId, @Param("languageId") Integer languageId);
	
	int countNowMember(int mentosId);

}
