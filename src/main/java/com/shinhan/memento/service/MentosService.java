package com.shinhan.memento.service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.sql.Date;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.shinhan.memento.dto.CategoryDTO;
import com.shinhan.memento.dto.CreateMentosDBDTO;
import com.shinhan.memento.dto.CreateMentosDTO;
import com.shinhan.memento.dto.LanguageDTO;
import com.shinhan.memento.dto.MatchTypeDTO;
import com.shinhan.memento.mapper.MentosMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class MentosService {

    @Autowired
    MentosMapper mentosMapper;

    @Value("${file.upload.dir}")
    private String uploadDir;

    public boolean createMentos(CreateMentosDTO requestDto, MultipartFile imageFile) {
        log.info("[MentosService.createMentos]");

        // 날짜 및 시간 변환
        Date startDay = Date.valueOf(requestDto.getStartDay());
        Date endDay = Date.valueOf(requestDto.getEndDay());
        Timestamp startTime = Timestamp.valueOf(LocalDateTime.of(LocalDate.of(2000, 1, 1), LocalTime.parse(requestDto.getStartTime())));
        Timestamp endTime = Timestamp.valueOf(LocalDateTime.of(LocalDate.of(2000, 1, 1), LocalTime.parse(requestDto.getEndTime())));

        // 이미지 저장 처리
        String imageUrl = null;
        if (imageFile != null && !imageFile.isEmpty()) {
            try {
                File dir = new File(uploadDir);
                if (!dir.exists()) {
                    dir.mkdirs();
                }

                // 확장자 추출 + 고유 파일명 생성
                String ext = getFileExtension(imageFile.getOriginalFilename());
                String savedFileName = UUID.randomUUID().toString() + (ext != null ? "." + ext : "");
                File destFile = new File(dir, savedFileName);
                Files.copy(imageFile.getInputStream(), destFile.toPath(), StandardCopyOption.REPLACE_EXISTING);

                // 웹에서 접근 가능한 경로로 구성 (리소스 경로 기준)
                imageUrl = "/resources/uploadImage/" + savedFileName;
                log.info("이미지 저장 완료: {}", imageUrl);
            } catch (IOException e) {
                log.error("이미지 업로드 실패", e);
                return false;
            }
        }

        // DB 저장용 DTO 생성
        CreateMentosDBDTO dbDTO = CreateMentosDBDTO.builder()
                .categoryId(requestDto.getCategoryId())
                .content(requestDto.getContent())
                .endDay(endDay)
                .startDay(startDay)
                .endTime(endTime)
                .startTime(startTime)
                .image(imageUrl) // URL 경로 저장
                .languageId(requestDto.getLanguageId())
                .matchTypeFirst(requestDto.getMatchTypeFirst())
                .matchTypeSecond(requestDto.getMatchTypeSecond())
                .matchTypeThird(requestDto.getMatchTypeThird())
                .maxMember(requestDto.getMaxMember())
                .minMember(requestDto.getMinMember())
                .price(requestDto.getPrice())
                .mentoId(requestDto.getMentoId())
                .title(requestDto.getTitle())
                .simpleContent(requestDto.getSimpleContent())
                .selectedDays(requestDto.getSelectedDays())
                .times(requestDto.getTimes())
                .regionDetail(requestDto.getRegionDetail())
                .regionGroup(requestDto.getRegionGroup())
                .regionSubgroup(requestDto.getRegionSubgroup())
                .build();

        int result = mentosMapper.createMentos(dbDTO);
        return result == 1;
    }

    private String getFileExtension(String fileName) {
        if (fileName != null && fileName.contains(".")) {
            return fileName.substring(fileName.lastIndexOf('.') + 1);
        }
        return null;
    }

    public List<LanguageDTO> getAllLanguages() {
        return mentosMapper.getAllLanguages();
    }

    public List<CategoryDTO> getAllCategories() {
        return mentosMapper.getAllCategories();
    }

    public List<MatchTypeDTO> getAllMatchTypes() {
        return mentosMapper.getAllMatchTypes();
    }
}
