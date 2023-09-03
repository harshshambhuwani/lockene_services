String baseUrl = "https://mistrichacha.com/";
String loginApiUrl = 'tsit/Fsm/FsmLogin';
String registrationUrl = 'tsit/Fsm/registerServicePartnerNew';
String sendOtp = "tsit/Fsm/SendOtpToServicePartner";
String getCountry = "tsit/Fsm/getAllCountry";
String getCostomServiceList = "tsit/Fsm/getAllCustomServices";
String forgotResetLink = "tsit/Fsm/FsmForgetPassword";
String getProfileInfo = "tsit/Fsm/getFsmProfileDetails";

class ApisPath {
  String postLogin = baseUrl + loginApiUrl;
  String postRegistrationUrl = baseUrl + registrationUrl;
  String postOtp = baseUrl + sendOtp;
  String postCountry = baseUrl + getCountry;
  String postGetCostomeServiceList = baseUrl + getCostomServiceList;
  String postForgotResetLink = baseUrl + forgotResetLink;
  String postGetProfileInfo = baseUrl + getProfileInfo;
}

