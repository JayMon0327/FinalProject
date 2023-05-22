package com.mat.zip.boss;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.CompletableFuture;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.http.MediaType;

@Controller
@RequestMapping("/boss")
public class boss_ReviewController {
    @Autowired
    private boss_ReviewService reviewService;
    @Autowired
    private SentimentService sentimentService;

    @GetMapping(value = "/analyze/{storeId}", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public String analyzeReviews(@PathVariable String storeId) {
        try {
            storeId = URLDecoder.decode(storeId, StandardCharsets.UTF_8.name());
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        System.out.println(storeId);
        List<String> reviewContents = reviewService.TotalReview(storeId);

        JSONArray results = new JSONArray();
        List<CompletableFuture<Void>> futures = new ArrayList<>();

        for (String reviewContent : reviewContents) {
            final String content = reviewContent;  // 람다 표현식에서 사용하기 위해 final 변수로 저장
            CompletableFuture<Void> future = CompletableFuture.runAsync(() -> {
                JSONObject requestBody = new JSONObject();
                requestBody.put("content", content);  // 람다 표현식 안에서 requestBody 생성
                JSONObject analysisResult = sentimentService.analyze(requestBody.toString());
                synchronized (results) {
                    results.put(new JSONObject(analysisResult.toString()));
                }
            });
            futures.add(future);
        }

        CompletableFuture.allOf(futures.toArray(new CompletableFuture[0])).join();

        return results.toString();
    }
}

