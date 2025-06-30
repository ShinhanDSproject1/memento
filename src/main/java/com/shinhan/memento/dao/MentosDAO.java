package com.shinhan.memento.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shinhan.memento.dto.CreateMentosDTO;
import com.shinhan.memento.dto.DetailMentosDTO;
import com.shinhan.memento.dto.EditMentosDTO;
import com.shinhan.memento.dto.SimilarMentosDTO;

@Repository
public class MentosDAO implements MentosInterfaceDAO {

	@Autowired
	SqlSession session;

	String namespace = "com.shinhan.memento.dao.MentosDAO.";

	@Override
	public DetailMentosDTO selectMentosDetail(int mentosId) {
		return session.selectOne(namespace + "selectMentosDetail", mentosId);
	}
	
	@Override
	public List<DetailMentosDTO> findSimilarMentos(SimilarMentosDTO simpleDTO) {
	    return session.selectList(namespace + "findSimilarMentos", simpleDTO);
	}


	@Override
	public int insertMentos(CreateMentosDTO dto) {
		return session.insert(namespace + "insertMentos", dto);
	}

	@Override
	public int updateMentos(EditMentosDTO dto) {
		return session.update(namespace + "updateMentos", dto);
	}

	@Override
	public int deleteMentos(int mentosId) {
		return session.update(namespace + "deleteMentos", mentosId);
	}

}