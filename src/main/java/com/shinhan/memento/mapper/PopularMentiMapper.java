package com.shinhan.memento.mapper;

import java.util.List;
import com.shinhan.memento.dto.PopularMentiDTO;

public interface PopularMentiMapper {
    List<PopularMentiDTO> findPopularMenti();
}
