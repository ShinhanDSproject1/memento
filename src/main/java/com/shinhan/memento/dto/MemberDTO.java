package com.shinhan.memento.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Builder
@Data
public class MemberDTO {
    private int member_id;
    private String email;
    private String nickname;
    private String user_type;
    private String status;
    private String profile_image_url;
    // 필요 시 추가 필드 작성
}
