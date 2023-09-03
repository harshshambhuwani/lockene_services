// import 'package:flutter_session_manager/flutter_session_manager.dart';
// import 'package:talent_kind/talent/models/login_model.dart';
//
// class SessionData {
//   var isLogin = false;
//   var accessToken = "";
//   var displayName = "";
//   var email = "";
//   var photoUrl = "";
//   var encId = "";
//   var tk_id = "";
//   var primaryProfession = "";
// }
//
// class SessionDataKey {
//   var isLogin = "isLogin";
//   var accessToken = "access_token ";
//   var displayName = "display_name";
//   var email = "email";
//   var photoUrl = "photo_url";
//   dynamic encId = "";
//   dynamic tk_Id = "tk_id";
//   dynamic primaryProfession = "primary_profession";
// }
//
// Future<void> setSessionData(Response response) async {
//   await SessionManager().set(SessionDataKey().isLogin, true);
//   await SessionManager()
//       .set(SessionDataKey().accessToken, response.accessToken);
//   // await SessionManager().set(SessionDataKey().displayName, response.user!.displayName);
//   await SessionManager().set(SessionDataKey().email, response.user!.email);
//   await SessionManager()
//       .set(SessionDataKey().photoUrl, response.user!.photoUrl);
//   await SessionManager().set(SessionDataKey().email, response.user!.email);
//   await SessionManager().set(SessionDataKey().encId, response.user!.encId);
//   await SessionManager().set(SessionDataKey().tk_Id, response.user!.tkId);
//   // await SessionManager().set(SessionDataKey().primaryProfession, response.user!.tkId);
// }
//
// Future<SessionData> getSessionData() async {
//   SessionData sessionData = SessionData();
//   sessionData.isLogin = await SessionManager().get(SessionDataKey().isLogin);
//   sessionData.displayName =
//       await SessionManager().get(SessionDataKey().displayName.toString());
//   sessionData.email = await SessionManager().get(SessionDataKey().email);
//   sessionData.photoUrl = await SessionManager().get(SessionDataKey().photoUrl);
//   sessionData.email = await SessionManager().get(SessionDataKey().email);
//   sessionData.encId =
//       await SessionManager().get(SessionDataKey().encId.toString());
//   sessionData.tk_id =
//       await SessionManager().get(SessionDataKey().tk_Id.toString());
//   sessionData.primaryProfession =
//       await SessionManager().get(SessionDataKey().primaryProfession.toString());
//   return sessionData;
// }
//
// clearSessionUserData() async {
//   await SessionManager().set(SessionDataKey().accessToken, "");
//   await SessionManager().set(SessionDataKey().primaryProfession, "");
//   await SessionManager().set(SessionDataKey().displayName, "");
//   await SessionManager().set(SessionDataKey().email, "");
//   await SessionManager().set(SessionDataKey().photoUrl, "");
//   await SessionManager().set(SessionDataKey().email, "");
//   await SessionManager().set(SessionDataKey().encId, "");
//   await SessionManager().set(SessionDataKey().isLogin, false);
//   // await SessionManager().set(SessionDataKey().tk_Id, "");
// }
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:service/Admin/network/model/login_model.dart';


class SessionData {
  var isLogin = false;
  var useId = "";
  var displayName = "";
  var referralCode = "";
  var tspContactNumber = "";
  var tspBussinessName = "";
  var tspEmail = "";
  var tspDetailedAddress = "";
  var tspProfileImage = "";
  var tspTimeZone = "";
  var tspAbbrevation = "";
  var tspMfrName = "";
  var tspCurrencySymbol = "";
  var tspCountryName = "";
  var tspStateName = "";
  var tspCityName = "";
  var tspLoginToken = "";
}

class SessionDataKey {
  var isLogin = "isLogin";
  var userId = "id";
  var displayName = "tsp_fname";
  var lastName = "tsp_lname";
  var referralCode = "tsp_referral_code";
  var tspContactNumber = "tsp_contact_number";
  var tspBussinessName = "tsp_business_name";
  var tspEmail = "tsp_email";
  var tspDetailedAddress = "tsp_detailed_address";
  var tspProfileImage = "tsp_profile_image";
  var tspTimeZone = "tsp_timezone";
  var tspAbbrevation = "tsp_abbreviation";
  var tspMfrName = "mfr_name";
  var tspCurrencySymbol = "currency_symbol";
  var tspCountryName = "country_name";
  var tspStateName = "state_name";
  var tspCityName = "city_name";
  var tspLoginToken = "tsp_login_token";

}

Future<void> setSessionData(LoginModel response) async {
  await SessionManager().set(SessionDataKey().isLogin, true);
  await SessionManager().set(SessionDataKey().userId, response.response?.data?.user?[0].id);
  await SessionManager().set(SessionDataKey().displayName, response.response?.data?.user?[0].tspFname);
  await SessionManager().set(SessionDataKey().lastName, response.response?.data?.user?[0].tspLname);
  await SessionManager().set(SessionDataKey().referralCode, response.response?.data?.user?[0].tspReferralCode);
  await SessionManager().set(SessionDataKey().tspContactNumber, response.response?.data?.user?[0].tspContactNumber);
  await SessionManager().set(SessionDataKey().tspBussinessName, response.response?.data?.user?[0].tspBusinessName);
  await SessionManager().set(SessionDataKey().tspEmail, response.response?.data?.user?[0].tspEmail);
  await SessionManager().set(SessionDataKey().tspDetailedAddress, response.response?.data?.user?[0].tspDetailedAddress);
  await SessionManager().set(SessionDataKey().tspProfileImage, response.response?.data?.user?[0].tspProfileImage);
  await SessionManager().set(SessionDataKey().tspTimeZone, response.response?.data?.user?[0].tspTimezone);
  await SessionManager().set(SessionDataKey().tspAbbrevation, response.response?.data?.user?[0].tspAbbreviation);
  await SessionManager().set(SessionDataKey().tspMfrName, response.response?.data?.user?[0].mfrName);
  await SessionManager().set(SessionDataKey().tspCurrencySymbol, response.response?.data?.user?[0].currencySymbol);
  await SessionManager().set(SessionDataKey().tspCountryName, response.response?.data?.user?[0].countryName);
  await SessionManager().set(SessionDataKey().tspStateName, response.response?.data?.user?[0].stateName);
  await SessionManager().set(SessionDataKey().tspCityName, response.response?.data?.user?[0].cityName);
  await SessionManager().set(SessionDataKey().tspLoginToken, response.response?.data?.user?[0].tspLoginToken);


}
//
// Future<SessionData> getSessionData() async {
//   // SessionData sessionData = SessionData();
//   // sessionData.isLogin = await SessionManager().get(SessionDataKey().isLogin);
//   // sessionData.displayName =
//   //     await SessionManager().get(SessionDataKey().displayName.toString());
//   // sessionData.email = await SessionManager().get(SessionDataKey().email);
//   // sessionData.photoUrl = await SessionManager().get(SessionDataKey().photoUrl);
//   // sessionData.email = await SessionManager().get(SessionDataKey().email);
//   // sessionData.encId =
//   //     await SessionManager().get(SessionDataKey().encId.toString());
//   // sessionData.tk_id =
//   //     await SessionManager().get(SessionDataKey().tkId.toString());
//   // sessionData.primaryProfession =
//   //     await SessionManager().get(SessionDataKey().primaryProfession.toString());
//   // sessionData.cityName = await SessionManager().get(SessionDataKey().cityName.toString());
//   // sessionData.lastLogin = await SessionManager().get(SessionDataKey().lastLogin.toString());
//   // // sessionData.cityName = await SessionManager().get(SessionDataKey().profileCompletionTabs);
//   return sessionData;
// }

clearSessionUserData() async {
  // await SessionManager().set(SessionDataKey().accessToken, "");
  // await SessionManager().set(SessionDataKey().primaryProfession, "");
  // await SessionManager().set(SessionDataKey().displayName, "");
  // await SessionManager().set(SessionDataKey().email, "");
  // await SessionManager().set(SessionDataKey().photoUrl, "");
  // await SessionManager().set(SessionDataKey().email, "");
  // await SessionManager().set(SessionDataKey().encId, "");
  // await SessionManager().set(SessionDataKey().tkId, "");
  // await SessionManager().set(SessionDataKey().lastLogin, "");
  // await SessionManager().set(SessionDataKey().isLogin, false);
  // await SessionManager().set(SessionDataKey().profileCompletionTabs, false);
  // await SessionManager().set(SessionDataKey().tk_Id, "");
}
