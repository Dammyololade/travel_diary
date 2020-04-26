import 'package:shared_preferences/shared_preferences.dart';


class SessionManager1 {
  static SharedPreferences sharedPreferences;

  static Future<Null> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }
  static const String KEY_DOC_ID = "document_reference";
  static const String KEY_TRIP_TITLE = "trip_title";
  static const String KEY_COUNTRY = "country";
  static const String KEY_IMAGE_URL = "image_url";
  static const String KEY_IMAGE_URL1 = "image_url1";
  static const String KEY_IMAGE_URL2 = "image_url2";
  static const String KEY_MOMENT = "moment";
  static const String KEY_DATE = "date";

  static set documentId(String id) =>
      sharedPreferences.setString(KEY_DOC_ID, id);

  static set tripTitle(String tripTitle) =>
      sharedPreferences.setString(KEY_TRIP_TITLE, tripTitle);

  static set country(String country) =>
      sharedPreferences.setString(KEY_COUNTRY, country);

  static set imageUrl(String imageUrl) =>
      sharedPreferences.setString(KEY_IMAGE_URL, imageUrl);

  static set imageUrl1(String imageUrl1) =>
      sharedPreferences.setString(KEY_IMAGE_URL1, imageUrl1);

  static set imageUrl2(String imageUrl2) =>
      sharedPreferences.setString(KEY_IMAGE_URL2, imageUrl2);

  static set moment(String moment) =>
      sharedPreferences.setString(KEY_MOMENT, moment);

  static set date(String date) =>
      sharedPreferences.setString(KEY_DATE, date);


  static String get documentId => sharedPreferences.getString(KEY_DOC_ID) ?? "";

  static String get tripTitle => sharedPreferences.getString(KEY_TRIP_TITLE) ?? "";

  static String get country => sharedPreferences.getString(KEY_COUNTRY) ?? "";

  static String get imageUrl => sharedPreferences.getString(KEY_IMAGE_URL) ?? "";

  static String get imageUrl1 => sharedPreferences.getString(KEY_IMAGE_URL1) ?? "";

  static String get imageUrl2 => sharedPreferences.getString(KEY_IMAGE_URL2) ?? "";

  static String get moment => sharedPreferences.getString(KEY_MOMENT) ?? "";

  static String get date => sharedPreferences.getString(KEY_DATE) ?? "";

}
