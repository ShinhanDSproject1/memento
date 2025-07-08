package com.shinhan.memento.service;

import java.util.concurrent.TimeUnit;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class IdempotencyService {

    @Autowired
    private RedisTemplate<String, String> redisTemplate;

    public boolean isDuplicate(String key) {
    	log.info("[IdempotencyService.isDuplicate]");
        return Boolean.TRUE.equals(redisTemplate.hasKey(key));
    }

    public void saveKey(String key, String value) {
    	log.info("[IdempotencyService.saveKey]");
    	redisTemplate.opsForValue().set(key, value, 30, TimeUnit.SECONDS); // TTL : 30초
    }

    public String getSavedResponse(String key) {
    	log.info("[IdempotencyService.getSavedResponse]");
        return redisTemplate.opsForValue().get(key);
    }
}
