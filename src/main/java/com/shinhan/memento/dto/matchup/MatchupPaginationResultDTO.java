package com.shinhan.memento.dto.matchup;

import lombok.Getter;

@Getter
public class MatchupPaginationResultDTO {

    private int totalRecordCount;     // 전체 데이터 개수
    private int totalPageCount;       // 전체 페이지 개수
    private int startPage;            // 첫 페이지 번호
    private int endPage;              // 끝 페이지 번호
    private int limitStart;           // LIMIT 시작 위치 (MariaDB, MySQL 사용 시)
    private boolean hasNext;          // 이전 페이지 존재 여부
    private boolean hasPrev;          // 다음 페이지 존재 여부

    private MatchupPaginationDTO pagination; // 현재 페이지 정보

    public MatchupPaginationResultDTO(MatchupPaginationDTO pagination, int totalRecordCount) {
        this.pagination = pagination;
        this.totalRecordCount = totalRecordCount;

        // 전체 데이터 수가 0개 미만일 경우, 페이지 번호를 1로 초기화
        if (totalRecordCount < 1) {
            this.totalPageCount = 1;
            this.startPage = 1;
            this.endPage = 1;
            return;
        }

        // 전체 페이지 수 계산
        this.totalPageCount = (int) Math.ceil((double) totalRecordCount / pagination.getRecordSize());

        // 끝 페이지 번호가 전체 페이지 수보다 클 수 없음
        if (this.totalPageCount < pagination.getPage()) {
            pagination.setPage(this.totalPageCount);
        }

        // 첫 페이지 번호 계산
        this.startPage = ((pagination.getPage() - 1) / pagination.getPageSize()) * pagination.getPageSize() + 1;

        // 끝 페이지 번호 계산
        this.endPage = this.startPage + pagination.getPageSize() - 1;

        // 끝 페이지가 전체 페이지 수보다 클 수 없음
        if (this.endPage > this.totalPageCount) {
            this.endPage = this.totalPageCount;
        }

        // LIMIT 시작 위치 계산
        this.limitStart = (pagination.getPage() - 1) * pagination.getRecordSize();

        // 이전 페이지 존재 여부 확인
        this.hasPrev = this.startPage != 1;

        // 다음 페이지 존재 여부 확인
        this.hasNext = (this.endPage * pagination.getRecordSize()) < totalRecordCount;
    }
	
}
