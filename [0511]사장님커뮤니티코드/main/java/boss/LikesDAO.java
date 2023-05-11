package com.mat.zip.boss;

public interface LikesDAO {
    int checkLike(String user_id, int board_id);
    void insertLike(String user_id, int board_id);
    void deleteLike(String user_id, int board_id);
}

