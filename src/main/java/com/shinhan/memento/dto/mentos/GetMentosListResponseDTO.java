package com.shinhan.memento.dto.mentos;

import java.util.List;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class GetMentosListResponseDTO {
    private List<GetMentosDTO> mentosList; // 멘토스 목록
    private PaginationInfo paginationInfo; // 페이지 정보

    @Data
    @Builder
    public static class PaginationInfo {
        private int currentPage;    // 현재 페이지
        private int totalPageCount; // 총 페이지 수
        private int startPage;      // 페이지네이션 시작 번호
        private int endPage;        // 페이지네이션 끝 번호
        private boolean hasPrev;    // 이전 버튼 유무
        private boolean hasNext;    // 다음 버튼 유무
    }
}