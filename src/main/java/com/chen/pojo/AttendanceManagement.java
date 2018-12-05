package com.chen.pojo;

import java.util.Date;

public class AttendanceManagement {
    private Long id;

    private String attendanceno;

    private String staffno;

    private Date attendancetime;

    private Integer latenessnumber;

    private String creater;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getAttendanceno() {
        return attendanceno;
    }

    public void setAttendanceno(String attendanceno) {
        this.attendanceno = attendanceno == null ? null : attendanceno.trim();
    }

    public String getStaffno() {
        return staffno;
    }

    public void setStaffno(String staffno) {
        this.staffno = staffno == null ? null : staffno.trim();
    }

    public Date getAttendancetime() {
        return attendancetime;
    }

    public void setAttendancetime(Date attendancetime) {
        this.attendancetime = attendancetime;
    }

    public Integer getLatenessnumber() {
        return latenessnumber;
    }

    public void setLatenessnumber(Integer latenessnumber) {
        this.latenessnumber = latenessnumber;
    }

    public String getCreater() {
        return creater;
    }

    public void setCreater(String creater) {
        this.creater = creater == null ? null : creater.trim();
    }
}