package utils;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import model.common.GooglePojo;
import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;

import java.io.IOException;

public class GoogleUtils {

    public static int ACC_GOOGLE = 3;

    public static String getToken(final String code) throws IOException {

        /* gửi một Request dùng phương thức POST đến Google và nhận kết quả trả về là một chuỗi JSON có chứa accessToken */
        String response_json_text = Request.Post(ConstantsString.GOOGLE_LINK_GET_TOKEN)
                .bodyForm(Form.form().add("client_id", ConstantsString.GOOGLE_CLIENT_ID)
                        .add("client_secret", ConstantsString.GOOGLE_CLIENT_SECRET)
                        .add("redirect_uri", ConstantsString.GOOGLE_REDIRECT_URI).add("code", code)
                        .add("grant_type", ConstantsString.GOOGLE_GRANT_TYPE).build())
                .execute().returnContent().asString();
        JsonObject jobj = new Gson().fromJson(response_json_text, JsonObject.class);
        String accessToken = jobj.get("access_token").toString().replaceAll("\"", "");
        return accessToken;
    }

    public static GooglePojo getUserInfor(String accessToken) throws IOException {

        String link = ConstantsString.GOOGLE_LINK_GET_USER_INFOR + accessToken;
        /* gửi một Request dùng phương thức GET đến Google và nhận kết quả trả về là một chuỗi JSON có chứa thông tin của người dùng GG */
        String response_json_text = Request.Get(link).execute().returnContent().asString();
        GooglePojo googlePojo = new Gson().fromJson(response_json_text, GooglePojo.class);
        return googlePojo;

    }


}
