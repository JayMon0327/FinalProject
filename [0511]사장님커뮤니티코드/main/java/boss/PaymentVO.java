package com.mat.zip.boss;

import java.util.Date;

public class PaymentVO {
    private String storeId;
    private String orderId;
    private String orderName;
    private int amount;
    private Date requestedAt;
	public String getStoreId() {
		return storeId;
	}
	public void setStoreId(String storeId) {
		this.storeId = storeId;
	}
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public String getOrderName() {
		return orderName;
	}
	public void setOrderName(String orderName) {
		this.orderName = orderName;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public Date getRequestedAt() {
		return requestedAt;
	}
	public void setRequestedAt(Date requestedAt) {
		this.requestedAt = requestedAt;
	}
	@Override
	public String toString() {
		return "PaymentVO [storeId=" + storeId + ", orderId=" + orderId + ", orderName=" + orderName + ", amount="
				+ amount + ", requestedAt=" + requestedAt + "]";
	}

    

    
}

