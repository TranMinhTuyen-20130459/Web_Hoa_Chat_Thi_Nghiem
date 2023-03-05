package bean;

import org.jdbi.v3.core.Jdbi;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Map;

public class Log extends AbBean<Log> implements Serializable {
    private long id_log;

    private int id_level;
    private long user_id;
    private String src;
    private String content;
    private String ip_address;
    private String web_browser;
    private Timestamp create_at;
    private String status;
    public Log(int id_level, long user_id, String src, String content, String ip_address, String web_browser, String status) {
        this.id_level = id_level;
        this.user_id = user_id;
        this.src = src;
        this.content = content;
        this.ip_address = ip_address;
        this.web_browser = web_browser;
        this.status = status;
    }

    public static final Map<Integer, String> levelMapping = new HashMap<>();

    static {
        levelMapping.put(0, "INFO");
        levelMapping.put(1, "ALERT");
        levelMapping.put(2, "WARNING");
        levelMapping.put(3, "DANGER");
    }

    public static int INFO = 1;

    public static int ALERT = 2;
    public static int WARNING = 3;
    public static int DANGER = 4;
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

    public Log() {
    }

    public String getLevelWithName() {
        return levelMapping.get(levelMapping.containsKey(this.id_level) ? this.id_level : 0);
    }


    public boolean insert(Jdbi db) {
        Integer i = db.withHandle(handle ->
                handle.execute("INSERT INTO logs(`id_level`, `user_id`, src, content, ip_address, web_browser, create_at, `status`)  VALUES(?,?,?,?,?,?,NOW(),?)",
                        this.id_level, getUser_id() == -1 ? null : getUser_id(), this.src, this.content, this.ip_address
                        , this.web_browser, this.status)
        );
        return i == 1;
    }

    @Override
    public boolean delete(Jdbi db) {
        return false;
    }

    @Override
    public boolean update(Jdbi db) {
        return false;
    }


}
