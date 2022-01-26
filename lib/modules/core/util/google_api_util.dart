import 'package:muvver_app/modules/core/constant/google_api_const.dart';

class GooglePlaceUtil {
  static String getUrlAutoComplete(String inputText) {
    String url = GooglePlaceConst.URL_BASE;
    url += GooglePlaceConst.AUTO_COMPLETE + "?";
    url += GooglePlaceConst.INPUT + inputText + "&";
    url += GooglePlaceConst.TYPES + "(cities)&";
    url += GooglePlaceConst.LANGUAGE + "pt_BR&";
    url += GooglePlaceConst.KEY + "AIzaSyALFFzJQVrCULm3uH4jePX6KcxvHDlp5ak";
    return url;
  }
}
