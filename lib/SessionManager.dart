import 'package:shared_preferences/shared_preferences.dart';

/// description:
/// project: travel_diary
/// @package:
/// @author: dammyololade
/// created on: 22/04/2020
class SessionManager {
  static SharedPreferences sharedPreferences;

  static Future<Null> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static const String KEY_USER_NAME = "display_name";
  static const String KEY_EMAIL = "email";
  static const String KEY_ADDRESS = "address";
  static const String KEY_IMAGE_URL = "image_url";
  static const String KEY_IS_LOGGED_IN = "is_logged_in";
  static const String KEY_DOC_ID = "document_reference";

  static set email(String email) =>
      sharedPreferences.setString(KEY_EMAIL, email);

  static set address(String address) =>
      sharedPreferences.setString(KEY_ADDRESS, address);

  static set userName(String name) =>
      sharedPreferences.setString(KEY_USER_NAME, name);

  static set imageUrl(String imageUrl) =>
      sharedPreferences.setString(KEY_IMAGE_URL, imageUrl);

  static set documentId(String id) =>
      sharedPreferences.setString(KEY_DOC_ID, id);

  static set isLoggedIn(bool value) =>
      sharedPreferences.setBool(KEY_IS_LOGGED_IN, value);

  static String get email => sharedPreferences.getString(KEY_EMAIL) ?? "";

  static String get address => sharedPreferences.getString(KEY_ADDRESS) ?? "";

  static String get userName =>
      sharedPreferences.getString(KEY_USER_NAME) ?? "";

  static String get imageUrl =>
      sharedPreferences.getString(KEY_IMAGE_URL) ?? "";

  static String get documentId => sharedPreferences.getString(KEY_DOC_ID) ?? "";

  static bool get isLoggedIn =>
      sharedPreferences.getBool(KEY_IS_LOGGED_IN) ?? false;
}
