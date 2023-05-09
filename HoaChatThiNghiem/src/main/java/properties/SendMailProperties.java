package properties;

import java.util.Properties;

public class SendMailProperties {
    static final String SEND_MAIL_PROP_PATH = "sendMail.properties";

    static final Properties SEND_MAIL_PROPERTIES = new Properties();

    static {
        try {
            SEND_MAIL_PROPERTIES.load(SendMailProperties.class.getClassLoader().getResourceAsStream(SEND_MAIL_PROP_PATH));
        } catch (Exception e) {
            throw new RuntimeException(e.getMessage());
        }
    }
    public static String getDomain(){
        return SEND_MAIL_PROPERTIES.getProperty("domain");
    }
}
