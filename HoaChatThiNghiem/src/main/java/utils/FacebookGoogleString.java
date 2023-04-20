package utils;

public class FacebookGoogleString {

    public static final String FACEBOOK_CLIENT_ID = "1572977559871866";
    public static final String FACEBOOK_CLIENT_SECRET = "32d5f3287e8625be35aceabba0265481";
    public static final String FACEBOOK_REDIRECT_URL = "https://localhost:8080/it-nlu/FacebookLoginServlet";
    public static final String FACEBOOK_LINK_GET_TOKEN = "https://graph.facebook.com/oauth/access_token?client_id=%s&client_secret=%s&redirect_uri=%s&code=%s";

    public static final String GOOGLE_CLIENT_ID = "482392281996-220kv6ebj29hqk0ot270448ea6mrtj2i.apps.googleusercontent.com";

    public static final String GOOGLE_CLIENT_SECRET = "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";

    public static final String GOOGLE_REDIRECT_URL = "https://localhost:8080/it-nlu/GoogleLoginServlet";

    public static final String GOOGLE_LINK_GET_TOKEN = "https://accounts.google.com/o/oauth2/token";

    public static final String GOOGLE_LINK_GET_USER_INFOR = "https://www.googleapis.com/oauth2/v1/userinfo?access_token=";

    public static final String GOOGLE_GRANT_TYPE = "authorization_code";


}
