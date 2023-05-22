package com.mat.zip.boss;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/boss")
public class ChartController {

    private final ChartService chartService;

    @Autowired
    public ChartController(ChartService chartService) {
        this.chartService = chartService;
    }
//매출차트 
    @GetMapping("/chart/{storeId}")
    @ResponseBody
    public Map<String, List<ChartVO>> getChart(@PathVariable String storeId) {
    	//세션에서 받아온 인코딩된 storeId 디코딩처리 
        try {
            storeId = URLDecoder.decode(storeId, StandardCharsets.UTF_8.name());
        } catch (UnsupportedEncodingException e) {
            // 예외 처리
        }
        List<ChartVO> chartData = chartService.DailyTotalAmount(storeId);
        List<ChartVO> chartDataX = chartService.XTotalAmount(storeId);
        List<ChartVO> thisMonthTotal = chartService.thisMonthTotalAmount(storeId);
        List<ChartVO> lastMonthTotal = chartService.lastMonthTotalAmount(storeId);
        
        
        Map<String, List<ChartVO>> response = new HashMap<>();
        response.put("thisMonth", chartData);
        response.put("lastMonth", chartDataX);
        response.put("thisMonthTotal", thisMonthTotal);
        response.put("lastMonthTotal", lastMonthTotal);
        
        return response;
    }
// 재방문 차트    
	 // 이번달,지난달 재방문율 차트 조회
	    @GetMapping("returnCustomerCount/{storeId}")
	    public ResponseEntity<Map<String, return_CustomerCountVO>> getReturnCustomerCount(@PathVariable String storeId) {
	        try {
	            storeId = URLDecoder.decode(storeId, StandardCharsets.UTF_8.name());
	        } catch (UnsupportedEncodingException e) {
	            // 예외 처리
	        }
	       System.out.println(storeId);
	        Map<String, return_CustomerCountVO> response = new HashMap<>();
	        response.put("thisMonthNew", chartService.findthisMonthNewCustomers(storeId));
	        response.put("thisMonthReturning", chartService.findthisMonthReturningCustomers(storeId));
	        response.put("lastMonthNew", chartService.findLastMonthNewCustomers(storeId));
	        response.put("lastMonthReturning", chartService.findLastMonthReturningCustomers(storeId));
	
	        return new ResponseEntity<>(response, HttpStatus.OK);
	    }
	
	    // 주문 횟수별 고객 수 조회
	    @GetMapping("orderCount/{storeId}")
	    public ResponseEntity<Map<String, return_OrderCountVO>> getOrderCount(@PathVariable String storeId){
	        try {
	            storeId = URLDecoder.decode(storeId, StandardCharsets.UTF_8.name());
	        } catch (UnsupportedEncodingException e) {
	            // 예외 처리
	        }
	
	        Map<String, return_OrderCountVO> response = new HashMap<>();
	        response.put("twoOrders", chartService.find2Customers(storeId));
	        response.put("threeOrders", chartService.find3Customers(storeId));
	        response.put("fourOrders", chartService.find4Customers(storeId));
	        response.put("fiveOrders", chartService.find5Customers(storeId));
	
	        return new ResponseEntity<>(response, HttpStatus.OK);
	    }
	
	    // 이번달, 지난달 신규 고객과 재방문 고객의 주문 총액 조회
	    @GetMapping("orderTotal/{storeId}")
	    public ResponseEntity<Map<String, return_OrderTotalVO>> getOrderTotal(@PathVariable String storeId){
	        try {
	            storeId = URLDecoder.decode(storeId, StandardCharsets.UTF_8.name());
	        } catch (UnsupportedEncodingException e) {
	            // 예외 처리
	        }
	
	        Map<String, return_OrderTotalVO> response = new HashMap<>();
	        response.put("thisMonthNewTotal", chartService.thisMonthNewCustomerOrderTotal(storeId));
	        response.put("thisMonthReturnTotal", chartService.thisMonthReturnCustomerOrderTotal(storeId));
	        response.put("lastMonthNewTotal", chartService.lastMonthNewCustomerOrderTotal(storeId));
	        response.put("lastMonthReturnTotal", chartService.lastMonthReturnCustomerOrderTotal(storeId));
	
	        return new ResponseEntity<>(response, HttpStatus.OK);
	    }



}

