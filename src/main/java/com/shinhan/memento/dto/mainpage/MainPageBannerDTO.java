package com.shinhan.memento.dto.mainpage;

import java.util.Date;
import lombok.Data;

@Data 
public class MainPageBannerDTO {
    private String title;
    private int mentosId;
    private String nickname;
    private String image;
    private Date startTime;
}