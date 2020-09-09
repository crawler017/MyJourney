package com.ocd.constant;

public enum  CustomerConstant {

    FROM_TYPE("002"),
    INDUSTRY_TYPE("001"),
    LEVEL_TYPE("006");
    private String value;

    private CustomerConstant(String value) {
        this.value = value;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }
}
