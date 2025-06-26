package com.shinhan.memento.dao;

import java.util.List;

import com.shinhan.memento.dto.MentosEntity;
import com.shinhan.memento.dto.mentos.MentosListRequestDTO;

public interface MentosDAO {
    List<MentosEntity> selectPreMentos(MentosListRequestDTO reqDTO);
    List<MentosEntity> selectMentos(MentosListRequestDTO reqDTO);
    int countTotalPages(MentosListRequestDTO reqDTO);
}

