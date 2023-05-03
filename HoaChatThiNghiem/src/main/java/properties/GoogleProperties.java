package properties;

import java.util.Properties;

public class GoogleProperties {

    static final String GG_PROP_PATH = "google.properties";

    static final Properties GG_PROP = new Properties();

    static {
        try {
            GG_PROP.load(GoogleProperties.class.getClassLoader().getResourceAsStream(GG_PROP_PATH));
        } catch (Exception e) {
            throw new RuntimeException(e.getMessage());
        }
    }

    public static String GOOGLE_CLIENT_ID() {
        return GG_PROP.getProperty("clientID");
    }

    public static String GOOGLE_CLIENT_SECRET() {
        return GG_PROP.getProperty("clientSecret");
    }

    public static String GOOGLE_REDIRECT_URL() {
        return GG_PROP.getProperty("redirectUrl");
    }

    public static String GOOGLE_LINK_GET_TOKEN() {
        return GG_PROP.getProperty("linkGetToken");
    }

    public static String GOOGLE_LINK_GET_USER_INFOR() {
        return GG_PROP.getProperty("linkGetUserInfor");
    }

    public static String GOOGLE_GRANT_TYPE() {
        return GG_PROP.getProperty("grantType");
    }

}
