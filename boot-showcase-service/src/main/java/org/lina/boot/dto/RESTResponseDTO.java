package org.lina.boot.dto;

import java.io.Serializable;


public class RESTResponseDTO implements Serializable {
	private static final long serialVersionUID = 1L;
	

	private int procCode;
	private Object payload;
	private String message;
	

	public Object getPayload() {
		return payload;
	}
	public void setPayload(Object payload) {
		this.payload = payload;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}

    public int getProcCode() {
        return procCode;
    }

    public void setProcCode(int procCode) {
        this.procCode = procCode;
    }
}
