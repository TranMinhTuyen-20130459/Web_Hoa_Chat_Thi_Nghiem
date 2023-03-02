package model.admin;

import java.io.Serializable;
import java.sql.Timestamp;

public class Log implements Serializable {
    private long id_log;
    private int id_level;
    private long user_id;
    private String src;
    private String content;
    private String ip_address;
    private String web_browser;
    private Timestamp create_at;
    private String status;

    public Log(long id_log, int id_level, long user_id, String src, String content, String ip_address, String web_browser, Timestamp create_at, String status) {
        this.id_log = id_log;
        this.id_level = id_level;
        this.user_id = user_id;
        this.src = src;
        this.content = content;
        this.ip_address = ip_address;
        this.web_browser = web_browser;
        this.create_at = create_at;
        this.status = status;
    }

    public Log() {
    }

    public long getId_log() {
        return id_log;
    }

    public void setId_log(long id_log) {
        this.id_log = id_log;
    }

    public int getId_level() {
        return id_level;
    }

    public void setId_level(int id_level) {
        this.id_level = id_level;
    }

    public long getUser_id() {
        return user_id;
    }

    public void setUser_id(long user_id) {
        this.user_id = user_id;
    }

    public String getSrc() {
        return src;
    }

    public void setSrc(String src) {
        this.src = src;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getIp_address() {
        return ip_address;
    }

    public void setIp_address(String ip_address) {
        this.ip_address = ip_address;
    }

    public String getWeb_browser() {
        return web_browser;
    }

    public void setWeb_browser(String web_browser) {
        this.web_browser = web_browser;
    }

    public Timestamp getCreate_at() {
        return create_at;
    }

    public void setCreate_at(Timestamp create_at) {
        this.create_at = create_at;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Log{" +
                "id_log=" + id_log +
                ", id_level=" + id_level +
                ", user_id=" + user_id +
                ", src='" + src + '\'' +
                ", content='" + content + '\'' +
                ", ip_address='" + ip_address + '\'' +
                ", web_browser='" + web_browser + '\'' +
                ", create_at=" + create_at +
                ", status='" + status + '\'' +
                '}';
    }
}
