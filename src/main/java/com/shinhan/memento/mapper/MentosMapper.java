package com.shinhan.memento.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.shinhan.memento.dto.CreateMentosDBDTO;
import com.shinhan.memento.dto.DetailMentosDTO;
import com.shinhan.memento.dto.DetailMentosDTO.SimilarMentosListDTO;
import com.shinhan.memento.dto.SimilarMentosDTO;
import com.shinhan.memento.model.Mentos;

@Mapper
public interface MentosMapper {

	int createMentos(CreateMentosDBDTO dto);
	
	Mentos findMentosByMentosId(Map<String, Object> params);
	
	List<SimilarMentosListDTO> findSimilarMentos(SimilarMentosDTO dto);
	
    DetailMentosDTO findDetailMentosById(@Param("mentosId") int mentosId);
}
