package com.mat.zip.boss;

import com.google.gson.JsonObject;
import org.springframework.web.bind.annotation.*;
import org.springframework.ui.Model;

import java.time.LocalDateTime;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;

@Controller
@RequestMapping("/boss")
public class PaymentController {
    @Autowired
    PaymentService paymentService;
    @Autowired
    PaymentDAO dao;

    @GetMapping("/tossSuccess")
    public String processPayment(@RequestParam("paymentKey") String paymentKey, @RequestParam("amount") int amount, @RequestParam("orderId") String orderId, Model model) {
        // 결제를 처리하고 그 결과를 받습니다.
        JsonObject paymentResponse = paymentService.processPayment(paymentKey, amount, orderId);

        // 결제가 성공했다면, success 페이지로 리다이렉트합니다.
        if (paymentResponse != null) {
            // 결제 응답 정보를 model에 추가합니다.
            model.addAttribute("paymentResponse", paymentResponse);
            return "/boss/tossSuccess";
        }
        // 결제가 실패했다면, fail 페이지로 리다이렉트합니다.
        else {
            return "/boss/tossFail";
        }
    }
    
    @GetMapping("/tossFail")
    public String processPaymentFail() {
        // 결제 실패 처리 로직
        return "/boss/tossFail";
    }
    
    @Autowired
    HttpSession session;  // 세션을 사용하기 위해 주입

    @PostMapping("/payment")
    public ResponseEntity<String> insert(@RequestBody PaymentVO bag) {
        System.out.println("insert 요청됨.");
        System.out.println(bag);

        String orderName = bag.getOrderName();
        System.out.println("Order Name: " + orderName);
        String[] parts = orderName.split(" ", 2);
        System.out.println("Parts[0]: " + parts[0]);
        System.out.println("Parts[1]: " + parts[1]);
        bag.setStoreId(parts[0]);  // storeId에 parts[0] 설정
        bag.setOrderName(parts[1]);  // orderName에 parts[1] 설정
        
        String userId = (String) session.getAttribute("user_id"); // 세션에서 user_id를 가져옴
        bag.setOrderId(userId);
        dao.insert(bag);
        return ResponseEntity.ok().body("결제 정보가 성공적으로 전송되었습니다.");
    }
    
    
//    @PostMapping("/paymentSave")
//    public ResponseEntity<String> savePayment(
//            @RequestParam("storeId") String storeId,
//            @RequestParam("foodName") String foodName,
//            @RequestParam("orderId") String orderId,
//            @RequestParam("totalAmount") int totalAmount,
//            @RequestParam("requestedAt") String requestedAt) {
//
//        PaymentVO payment = new PaymentVO();
//        payment.setStoreId(storeId);
//        payment.setFoodName(foodName);
//        payment.setOrderId(orderId);
//        payment.setAmount(totalAmount);
//        payment.setRequestedAt(requestedAt);
//
//        paymentService.save(payment);
//
//        return ResponseEntity.ok("Payment saved successfully");
//    }

}
 

    




