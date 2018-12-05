package com.chen.pojo;

import java.math.BigDecimal;
import java.util.Date;

public class EmployeeInfo {
    private Long id;

    private String staffno;

    private String department;

    private String password;

    private String post;

    private String basicwages;

    private String name;

    private BigDecimal floatingbonus;

    private String sex;

    private Date brithday;

    private Date createtime;

    private String creater;

    private String politicalaspects;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getStaffno() {
        return staffno;
    }

    public void setStaffno(String staffno) {
        this.staffno = staffno == null ? null : staffno.trim();
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department == null ? null : department.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getPost() {
        return post;
    }

    public void setPost(String post) {
        this.post = post == null ? null : post.trim();
    }

    public String getBasicwages() {
        return basicwages;
    }

    public void setBasicwages(String basicwages) {
        this.basicwages = basicwages == null ? null : basicwages.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public BigDecimal getFloatingbonus() {
        return floatingbonus;
    }

    public void setFloatingbonus(BigDecimal floatingbonus) {
        this.floatingbonus = floatingbonus;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex == null ? null : sex.trim();
    }

    public Date getBrithday() {
        return brithday;
    }

    public void setBrithday(Date brithday) {
        this.brithday = brithday;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public String getCreater() {
        return creater;
    }

    public void setCreater(String creater) {
        this.creater = creater == null ? null : creater.trim();
    }

    public String getPoliticalaspects() {
        return politicalaspects;
    }

    public void setPoliticalaspects(String politicalaspects) {
        this.politicalaspects = politicalaspects == null ? null : politicalaspects.trim();
    }
}