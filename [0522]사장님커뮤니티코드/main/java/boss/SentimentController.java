//package com.mat.zip.boss;
//
//import java.util.Map;
//
//import javax.inject.Inject;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.http.MediaType;
//import org.springframework.stereotype.Component;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestBody;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RestController;
//
//@RestController
//@RequestMapping("/boss")
//@Component
//public class SentimentController {
//
//    private final SentimentService sentimentService;
//
//    @Autowired
//    public SentimentController(SentimentService sentimentService) {
//        this.sentimentService = sentimentService;
//    }
//
//    @PostMapping(value = "/analyze", produces = MediaType.APPLICATION_JSON_VALUE)
//    public String analyze(@RequestBody Map<String, String> reviewContent) {
//        return sentimentService.analyze(reviewContent);
//    }
//}

