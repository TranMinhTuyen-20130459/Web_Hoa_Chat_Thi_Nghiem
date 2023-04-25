package properties;

import java.io.IOException;
import java.util.Properties;

public class FacebookProperties {

    private static final String FB_PROP_PATH = "facebook.properties";
    private static final Properties FB_PROP = new Properties();

    static {
        try {
            FB_PROP.load(FacebookProperties.class.getClassLoader().getResourceAsStream(FB_PROP_PATH));
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    public static String FACEBOOK_CLIENT_ID() {
        return FB_PROP.getProperty("clientID");
    }

    public static String FACEBOOK_CLIENT_SECRET() {
        return FB_PROP.getProperty("clientSecret");
    }

    public static String FACEBOOK_REDIRECT_URL() {
        return FB_PROP.getProperty("redirectUrl");
    }

    public static String FACEBOOK_LINK_GET_TOKEN() {
        return FB_PROP.getProperty("linkGetToken");
    }


}
