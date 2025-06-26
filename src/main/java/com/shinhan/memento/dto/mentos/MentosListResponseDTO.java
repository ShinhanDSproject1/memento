package com.shinhan.memento.dto.mentos;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
@AllArgsConstructor
public class MentosListResponseDTO {

    private Integer page;
    private Integer totalPages;
    private List<MentosItemDTO> preMentos;
    private List<MentosItemDTO> mentos;
}
