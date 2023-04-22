package properties;

import java.io.IOException;
import java.util.Properties;

public class FacebookProperties {

    private static final String PROP_PATH = "facebook.properties";
    private static final Properties PROP = new Properties();

    static {
        try {
            PROP.load(FacebookProperties.class.getClassLoader().getResourceAsStream(PROP_PATH));
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    public static String FACEBOOK_CLIENT_ID() {
        return PROP.getProperty("clientID");
    }

    public static String FACEBOOK_CLIENT_SECRET() {
        return PROP.getProperty("clientSecret");
    }

    public static String FACEBOOK_REDIRECT_URL() {
        return PROP.getProperty("redirectUrl");
    }

    public static String FACEBOOK_LINK_GET_TOKEN() {
        return PROP.getProperty("linkGetToken");
    }


}
