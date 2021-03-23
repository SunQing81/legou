package com.legou.entry;

public class Notice {
    private String nId;

    private String nContent;

    private String nCreatetime;

    private String adminId;

    private Administrator administrator;

    public Notice() {
    }

    public Notice(String nId, String nContent, String nCreatetime, String adminId, Administrator administrator) {
        this.nId = nId;
        this.nContent = nContent;
        this.nCreatetime = nCreatetime;
        this.adminId = adminId;
        this.administrator = administrator;
    }

    public String getnId() {
        return nId;
    }

    public void setnId(String nId) {
        this.nId = nId == null ? null : nId.trim();
    }

    public String getnContent() {
        return nContent;
    }

    public void setnContent(String nContent) {
        this.nContent = nContent == null ? null : nContent.trim();
    }

    public String getnCreatetime() {
        return nCreatetime;
    }

    public void setnCreatetime(String nCreatetime) {
        this.nCreatetime = nCreatetime == null ? null : nCreatetime.trim();
    }

    public String getAdminId() {
        return adminId;
    }

    public void setAdminId(String adminId) {
        this.adminId = adminId == null ? null : adminId.trim();
    }

    public Administrator getAdministrator() {
        return administrator;
    }

    public void setAdministrator(Administrator administrator) {
        this.administrator = administrator;
    }

    @Override
    public String toString() {
        return "Notice{" +
                "nId='" + nId + '\'' +
                ", nContent='" + nContent + '\'' +
                ", nCreatetime='" + nCreatetime + '\'' +
                ", adminId='" + adminId + '\'' +
                ", administrator=" + administrator +
                '}';
    }
}