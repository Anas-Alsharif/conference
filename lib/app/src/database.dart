import 'package:get_storage/get_storage.dart';

class Database {
  Map<String, String> headers = {
    "Accept": "application/json",
    "Authorization": "Bearer ${GetStorage().read("token")}"
  };
  static const String baseUrl = "https://conference.aone.sa/api/";

  // AUTH:
  static const String login = "${baseUrl}auth/request-otp";
  static const String signup = "${baseUrl}auth/register";
  static const String otp = "${baseUrl}auth/verify-otp";
  static const String logout = "${baseUrl}auth/logout";
  static const String refresh = "${baseUrl}auth/refresh";
  static const String resendOtp = "${baseUrl}auth/resend-verification-email";
  static const String profile = "${baseUrl}auth/user-profile";
  static const String updateProfile = "${baseUrl}auth/update-profile";
  static const String fcmToken = "${baseUrl}auth/fcm-token";

  // ATTENDANCES:
  static const String attendances = "${baseUrl}attendances";
  static const String speakers = "${baseUrl}attendances/speakers";
  static const String speakersFeatured = "${baseUrl}attendances/speakers/featured";

  // CONFERENCE:
  static const String hall = "${baseUrl}hall";
  static const String conference = "${baseUrl}conference";
  // static const String attend = "${baseUrl}conference/1/attend";
  // static const String unattend = "${baseUrl}conference/1/unattend";

  // EVENTS:
  static const String event = "${baseUrl}event";
  static const String floorPlan = "${baseUrl}floor_plan";
  static const String fqa = "${baseUrl}fqa";
  static const String mediaHub = "${baseUrl}media-hub";
  static const String topics = "${baseUrl}topics";
  static const String sponsors = "${baseUrl}sponsors";
}
