package com.ocd.pojo;

import java.io.Serializable;

public class CustomerTrack implements Serializable {
    private long id;
    private String customer_name;
    private String customer_type;
    private Integer start;
    private Integer rows;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getCustomer_name() {
        return customer_name;
    }

    public void setCustomer_name(String customer_name) { this.customer_name = customer_name; }

    public String getCustomer_type() {
        return customer_type;
    }

    public void setCustomer_type(String customer_type) { this.customer_type = customer_type; }

    public Integer getStart() {
        return start;
    }

    public void setStart(Integer start) {
        this.start = start;
    }

    public Integer getRows() {
        return rows;
    }

    public void setRows(Integer rows) {
        this.rows = rows;
    }

    @Override
    public String toString() {
        return "CustomerTrack{" +
                "id=" + id +
                ", customer_name='" + customer_name + '\'' +
                ", customer_type=" + customer_type +
                ", start=" + start +
                ", rows=" + rows +
                '}';
    }
}