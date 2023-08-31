import 'package:get/get.dart';
import 'package:service/Admin/AddJob/binding/addquote_binding.dart';
import 'package:service/Admin/AddMember/screen/addsuccess_view.dart';
import 'package:service/Admin/ManageProduct/bindings/productmanage_binding.dart';
// import 'package:service/Admin/ManageProduct/screen/allteam_view.dart';
import 'package:service/Admin/MyQuote/bindings/viewquote_binding.dart';
import 'package:service/Admin/Registration/controller/companydetails_controller.dart';
import 'package:service/features/attendence/bindings/attendence_binding.dart';
import 'package:service/features/splashfront/screen/splashfront.dart';
import 'package:service/features/technician/screen/forgot_password_view.dart';
import 'package:service/features/technician/screen/login.dart';
import 'package:service/features/techniciandashboard/screen/techdashboard.dart';
import 'package:service/features/trackstatus/views/trackstatus_view.dart';



import '../Admin/AddClient/binding/addclient_binding.dart';
import '../Admin/AddClient/screen/addclient_view.dart';
import '../Admin/AddClient/screen/allclient_view.dart';
import '../Admin/AddClient/screen/mycontacts.dart';
import '../Admin/AddInvoice/binding/addinvoice_binding.dart';
import '../Admin/AddInvoice/screen/addinvoice_view.dart';
import '../Admin/AddInvoice/screen/editinvoice_view.dart';
import '../Admin/AddJob/screen/addjob_view.dart';
import '../Admin/AddJob/screen/editjob_view.dart';
import '../Admin/AddKyc/binding/kyc_binding.dart';
import '../Admin/AddKyc/screen/kyc_view.dart';
import '../Admin/AddMember/binding/addmember_binding.dart';
import '../Admin/AddMember/screen/addmember_view.dart';
import '../Admin/AddQuote/binding/addquote_binding.dart';
import '../Admin/AddQuote/screen/addquote_view.dart';
import '../Admin/AddQuote/screen/editquote_view.dart';
import '../Admin/AddTax/binding/addtax_binding.dart';
import '../Admin/AddTax/screen/addtax_view.dart';
import '../Admin/AdminLogin/bindings/auth_binding.dart';
import '../Admin/AdminLogin/screen/forgot_password_view.dart';
import '../Admin/AdminLogin/screen/login.dart';
import '../Admin/AllMembers/binding/allmember_binding.dart';
import '../Admin/AllMembers/screen/search_view.dart';
import '../Admin/Discount & Deposite/binding/discount_binding.dart';
import '../Admin/Discount & Deposite/screen/deposite_view.dart';
import '../Admin/Discount & Deposite/screen/discount_view.dart';
import '../Admin/Employee/binding/employee_binding.dart';
import '../Admin/Employee/screen/editmember_view.dart';
import '../Admin/Employee/screen/employeeprofile_view.dart';
import '../Admin/Employee/screen/employeereport_view.dart';
import '../Admin/Line/binding/allline_binding.dart';
import '../Admin/Line/screen/addlineitem_view.dart';
import '../Admin/Line/screen/alllines_view.dart';
import '../Admin/Line/screen/editlineitem_view.dart';
import '../Admin/ManageProduct/screen/manageproduct_view.dart';
import '../Admin/ManageService/bindings/servicemanage_binding.dart';
import '../Admin/ManageService/screen/manageservice_view.dart';
import '../Admin/MyAboutUs/binding/aboutus_binding.dart';
import '../Admin/MyAboutUs/screen/aboutus_view.dart';
import '../Admin/MyCommission/binding/commission_binding.dart';
import '../Admin/MyCommission/screen/commission_view.dart';
import '../Admin/MyNotification/binding/notif_binding.dart';
import '../Admin/MyNotification/screen/notif_view.dart';
import '../Admin/MyPayment/binding/payment_binding.dart';
import '../Admin/MyPayment/screen/payment_view.dart';
import '../Admin/MyQuote/screen/allquote_view.dart';
import '../Admin/MyQuote/screen/invoice_send.dart';
import '../Admin/MyQuote/screen/invoice_view.dart';
import '../Admin/MyQuote/screen/invoice_viewform.dart';
import '../Admin/MyQuote/screen/job_view.dart';
import '../Admin/MyQuote/screen/quote_view.dart';
import '../Admin/MySupport/binding/support_binding.dart';
import '../Admin/MySupport/screen/addquery_view.dart';
import '../Admin/MySupport/screen/support_view.dart';
import '../Admin/Registration/bindings/regist_binding.dart';
import '../Admin/Registration/screen/register_view.dart';
import '../Admin/Registration/screen/register_view1.dart';
import '../Admin/Registration/screen/register_view2.dart';
import '../Admin/Subscriptions/binding/subscription_binding.dart';
import '../Admin/Subscriptions/screen/mysubscriptions_view.dart';
import '../Admin/Subscriptions/screen/subscriptionhistory_view.dart';
import '../Admin/Subscriptions/screen/subscriptions_view.dart';
import '../Admin/TeamAttendence/screen/allteam_view.dart';
import '../Admin/TeamAttendence/screen/specificmember_view.dart';
import '../features/Work Details/views/workdetails_view.dart';
import '../features/attendence/views/attendence_view.dart';
import '../features/attendence/views/mark_attendence.dart';
import '../features/bookings/views/booking_view.dart';
import '../features/imagezoom/bindings/attendence_binding.dart';
import '../features/imagezoom/views/zoom_image.dart';
import '../features/profile/bindings/profile_binding.dart';
import '../features/profile/views/edit_teamprofile_view.dart';
import '../features/profile/views/profile_view.dart';
import '../features/reviews/views/review_view.dart';
import '../features/technician/bindings/auth_binding.dart';
import '../features/techniciandashboard/service/root_binding.dart';
import '../features/trackstatus/bindings/track_binding.dart';
import 'app_routes.dart';

class Theme1AppPages {
  // static final INITIAL = Get.find<AuthService>().user.value.isProvider ? Routes.ROOT : Routes.LOGIN;

  static final routes = [

    GetPage(name: Routes.ADLOGIN, page: () => AdminLogin(), binding: AuthADBinding()),
    GetPage(name: Routes.REGISTER, page: () => RegisterView(), binding: RegistBinding()),
    // GetPage(name: Routes.COMPANY, page: () => CompanyView(), binding: RegistBinding()),
    GetPage(name: Routes.COMPANY, page: () => CompanyViewNew(), binding: RegistBinding()),
    GetPage(name: Routes.ALLTEAM, page: () => AllTeamMembView(), binding: AllMembBinding()),
    GetPage(name: Routes.SPECIFICMEMB, page: () => SpecificMembView(), binding: AllMembBinding()),
    GetPage(name: Routes.MANAGEPRODUCT, page: () => ManageProductView(), binding: ProductManageBinding()),
    GetPage(name: Routes.ADFORGOT_PASSWORD, page: () => AdminForgotPasswordView(), binding: AuthADBinding()),
    GetPage(name: Routes.LOGIN, page: () => ProviderLogin(), binding: AuthBinding()),
    GetPage(name: Routes.FORGOT_PASSWORD, page: () => ForgotPasswordView(), binding: AuthBinding()),
    GetPage(name: Routes.SPLASHFRONT, page: () => SplashFrontNew(), binding: AuthBinding()),
    GetPage(name: Routes.TECHDASHBOARD, page: () => TechDash(), binding: RootBinding()),
    GetPage(name: Routes.REVIEW, page: () => ReviewView(), binding: RootBinding()),
    GetPage(name: Routes.BOOKING, page: () => BookingView(), binding: RootBinding()),
    GetPage(name: Routes.SLIDE_DETAILS, page: () => WorkDetailsView(), binding: RootBinding()),
    GetPage(name: Routes.SUPPORT, page: () => SupportView(), binding: SupportBinding()),
    GetPage(name: Routes.ASKQUERY, page: () => AskQueryView(), binding: SupportBinding()),
    GetPage(name: Routes.ABOUTUS, page: () => AboutUsView(), binding: AboutUsBinding()),
    GetPage(name: Routes.PROFILE, page: () => ProfileView(), binding: ProfileBinding()),
    GetPage(name: Routes.EDITPROFILE, page: () => EditProfileView(), binding: ProfileBinding()),
    GetPage(name: Routes.ATTENDENCE, page: () => AttendenceView(), binding: AttendenceBinding()),
    GetPage(name: Routes.MARKATTENDENCE, page: () => MarkAttendence(), binding: AttendenceBinding()),
    GetPage(name: Routes.ZOOMVIEW, page: () => ZoomView(), binding: ZoomViewBinding()),
    GetPage(name: Routes.TRACKSTATUS, page: () => TrackStatusView(), binding: TrackBinding()),
    GetPage(name: Routes.ADD_MEMBER, page: () => AddMemberView(), binding: AddMemberBinding()),
    GetPage(name: Routes.SUCCESS_MEMBER, page: () => AddSuccessView(), binding: AddMemberBinding()),
   // GetPage(name: Routes.ALL_MEMBER, page: () => SearchView(), binding: AllMembBinding()),
    GetPage(name: Routes.ADD_QUOTE, page: () => AddQuoteView(), binding: AddQuoteBinding()),
    GetPage(name: Routes.ADD_JOB, page: () => AddJobView(), binding: AddJobBinding()),
    GetPage(name: Routes.ADD_INVOICE, page: () => AddInvoiceView(), binding: AddInvoiceBinding()),
    GetPage(name: Routes.PAYMENT, page: () => PaymentView(), binding: PaymentBinding()),
    GetPage(name: Routes.MANAGESERVICE, page: () => ManageServiceView(), binding: ManageServiceBinding()),
    GetPage(name: Routes.EMPLOYEEPROFILE, page: () => EmployeeProfileView(), binding: EmployeeBinding()),
    GetPage(name: Routes.EMPLOYEEREPORT, page: () => EmployeeReportView(), binding: EmployeeBinding()),
    GetPage(name: Routes.EDITEMPLOYEE, page: () => EditMemberView(), binding: EmployeeBinding()),
    GetPage(name: Routes.COMMISSION, page: () => CommissionView(), binding: CommissionBinding()),
    GetPage(name: Routes.SUBSCRIPTIONSPACKAGES, page: () => SubscriptionView(), binding: SubscriptionBinding()),
    GetPage(name: Routes.MYSUBSCRIPTION, page: () => MySubscriptionView(), binding: SubscriptionBinding()),
    GetPage(name: Routes.SUBSCRIPTIONHISTORY, page: () => SubscriptionHistory(), binding: SubscriptionBinding()),

    GetPage(name: Routes.EDIT_QUOTE, page: () => EditQuoteView(), binding: AddQuoteBinding()),
    GetPage(name: Routes.EDIT_JOB, page: () => EditJobView(), binding: AddJobBinding()),
    GetPage(name: Routes.EDIT_INVOICE, page: () => EditInvoiceView(), binding: AddInvoiceBinding()),

    GetPage(name: Routes.ALL_LINE, page: () => AllLineView(), binding: AllLineBinding()),
    GetPage(name: Routes.NEW_LINE, page: () => AddLineitemView(), binding: AllLineBinding()),
    GetPage(name: Routes.EDIT_LINE, page: () => EditLineitemView(), binding: AllLineBinding()),
    GetPage(name: Routes.DISCT_QUOTE, page: () => DiscountView(), binding: DiscountBinding()),
    GetPage(name: Routes.TAX_QUOTE, page: () => AddTaxView(), binding: AddTaxBinding()),
    GetPage(name: Routes.DEPOSIT_QUOTE, page: () => DepositeView(), binding: DiscountBinding()),
    GetPage(name: Routes.NOTIFICATIONS , page: () => MyNotificationView(), binding: MyNotificationBinding()),
    GetPage(name: Routes.ALL_CLIENT , page: () => AllClientView(), binding: AddClientBinding()),
    GetPage(name: Routes.ADD_CLIENT , page: () => AddClientView(), binding: AddClientBinding()),
    // GetPage(name: Routes.MY_CONTACT , page: () => MyContactView(), binding: AddClientBinding()),
    GetPage(name: Routes.ADD_KYC , page: () => KycView(), binding: KycBinding()),
    GetPage(name: Routes.VIEW_QUOTE , page: () => QuoteView(), binding: ViewQuoteBinding()),
    GetPage(name: Routes.VIEW_JOB , page: () => JobView(), binding: ViewQuoteBinding()),
    GetPage(name: Routes.VIEW_INVOICE , page: () => InvoiceView(), binding: ViewQuoteBinding()),
    GetPage(name: Routes.REVIEW_INVOICE , page: () => InvoiceReview(), binding: ViewQuoteBinding()),
    GetPage(name: Routes.SEND_INVOICE , page: () => InvoiceSend(), binding: ViewQuoteBinding()),
    GetPage(name: Routes.All_QUOTE , page: () => AllQuoteView(), binding: ViewQuoteBinding()),
  ];
}
