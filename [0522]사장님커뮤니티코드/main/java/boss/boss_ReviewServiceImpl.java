package com.mat.zip.boss;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class boss_ReviewServiceImpl implements boss_ReviewService {
    @Autowired
    private boss_ReviewDAO reviewDAO;

    @Override
    public List<String> TotalReview(String storeId) {
        return reviewDAO.TotalReview(storeId);
    }
    
}
