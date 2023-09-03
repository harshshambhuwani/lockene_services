import 'dart:io';

import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:service/Admin/network/model/costome_service_model.dart';
import 'package:service/Admin/network/model/country_model.dart';
import 'package:service/Admin/new_modified_files/login_module/new_login_screen.dart';
import 'package:service/drop_down_search.dart';
import 'package:service/features/bookings/widgets/otp_text_field_widget.dart';
import 'package:service/features/common/block_button_widget.dart';
import 'package:service/features/common/ui.dart';
import 'package:service/network/api_interface.dart';
import 'package:service/routes/app_routes.dart';
import 'package:service/styles/styles.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';

class CompanyView extends StatefulWidget {
  String? fullName;
  String? companyName;
  String? emailAddress;
  String? passwordValue;
  CompanyView(
      {Key? key,
      this.fullName,
      this.companyName,
      this.emailAddress,
      this.passwordValue})
      : super(key: key);

  @override
  State<CompanyView> createState() => _CompanyViewState();
}

class _CompanyViewState extends State<CompanyView> {
  String? valueChoose;
  List listItem = [
    'Authorized',
    'Private',
  ];
  String? valueChoose1;
  List listItem1 = [
    'Redmi',
    'Videocon',
    'Onida',
    'Sony',
    'Samsung',
  ];
  bool last = false;
  var click = "";

  File? file;
  File? wpart;
  ImagePicker imagePicker = ImagePicker();

  BorderRadius get buildBorderRadius {
    if (last) {
      return const BorderRadius.vertical(bottom: Radius.circular(0));
    }
    if (!last) {
      return const BorderRadius.vertical(bottom: Radius.circular(10));
    }
    return const BorderRadius.all(Radius.circular(10));
  }

  String htmlContent  = "<div helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\"><h2><p class=\"MsoNormal\" style=\"line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><br></p></h2><h6 style=\"margin-bottom: 12.55pt; line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><ol start=\"I\" type=\"disc\"><li class=\"MsoNormal\" style=\"color: black; line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><p class=\"MsoNormal\" style=\"line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span style=\"font-size:12.0pt;font-family:\" arial\",\"sans-serif\";mso-fareast-font-family:\"times=\"\" new=\"\" roman\";color:black\"=\"\">This Privacy Policy statement is made by the Lockene Group consisting of all the entities listed(collectively, <b>\"Lockene\"</b>, <b>\"we\"</b>, <b>\"us\"</b> or <b>\"our\"</b>).<o:p></o:p></span></p> <p class=\"\" style=\"line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><b><span style=\"font-size:12.0pt;font-family:\" arial\",\"sans-serif\";=\"\" mso-fareast-font-family:\"times=\"\" new=\"\" >Lockene’s Privacy Commitment</span></b><span style=\"font-size:12.0pt;font-family:\" arial\",\"sans-serif\";mso-fareast-font-family:=\"\" \"times=\"\" new=\"\" ><o:p></o:p></span></p> <p class=\"MsoNormal\" style=\"margin-left: 40.5pt; text-indent: -0.25in; line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;font-family:\" arial\",\"sans-serif\";mso-fareast-font-family:=\"\" arial;color:black\"=\"\"><span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \" times=\"\" new=\"\" roman\";\"=\"\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span><!--[endif]--><span style=\"font-size:12.0pt;font-family:\" arial\",\"sans-serif\";=\"\" mso-fareast-font-family:\"times=\"\" new=\"\" roman\";color:black\"=\"\">Lockene has worried about customer and user privacy for almost 15 years, long before it became fashionable, politically correct, or legally binding to take such a position. We ask for only the least amount of information necessary, gathering only what we believe is essential for doing business, or for the specific transaction at hand. We let customers know the information we have on them and allow them to opt out of specific engagements. But, by far, our biggest commitment is that we do not make a single dollar from advertising revenue—never have, never will—even from the free editions of our products. This means we avoid the fundamental conflict of interest between gathering customer information and fueling advertising revenue, and the unavoidable compromises in customer privacy that it brings.<br><br>The goal of this policy is to make explicit the information we gather, how we will use it, and how we will not. This policy is unfortunately longer than we would like, but we must unambiguously address all the relevant cases. We will try and keep the language simple and direct as much as possible.<o:p></o:p></span></p> <p class=\"\" style=\"line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><b><span style=\"font-size:12.0pt;font-family:\" arial\",\"sans-serif\";=\"\" mso-fareast-font-family:\"times=\"\" new=\"\" >Scope of this Privacy Policy</span></b><span style=\"font-size:12.0pt;font-family:\" arial\",\"sans-serif\";mso-fareast-font-family:=\"\" \"times=\"\" new=\"\" ><o:p></o:p></span></p><p class=\"MsoNormal\" style=\"margin-left: 40.5pt; text-indent: -0.25in; line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;font-family:\" arial\",\"sans-serif\";mso-fareast-font-family:=\"\" arial;color:black\"=\"\"><span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \" times=\"\" new=\"\" roman\";\"=\"\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span><!--[endif]--><span style=\"font-size:12.0pt;font-family:\" arial\",\"sans-serif\";=\"\" mso-fareast-font-family:\"times=\"\" new=\"\" roman\";color:black\"=\"\">This Privacy Policy applies to all Lockene websites that link to it. It also applies to the products and services provided by Lockene through these websites, our mobile applications, and applications posted by Lockene on Lockene’s online marketplace and in other third-party online marketplaces. This Privacy Policy does not apply to any of our websites, products or services that have a separate privacy policy.<br><br>This Privacy Policy is divided into three parts:<br><br>Part I – Information Lockene collects and controls<br><br>This part deals with how Lockene collects and uses information about website visitors, potential customers, users of Lockene’s products and services, and others who contact Lockene through forms or email addresses published on or linked to our websites.<br><br>Part II – Information that Lockene processes on your behalf<br><br>This part deals with how Lockene handles data that you entrust to Lockene when you use our products and services, or when you share any personal or confidential information with us while requesting customer support.<br>Part III – General<br><br>This part deals with topics that are relevant to both Parts I and II, and other general topics such as Lockene’s security commitments and how we will inform you when we change this Privacy Policy.<br><br>Part I – Information Lockene collects and controls<br><br>What information Lockene collects<br><br>We collect information about you only if we need the information for some legitimate purpose. Lockene will have information about you only if (a) you have provided the information yourself, (b) Lockene has automatically collected the information, or (c) Lockene has obtained the information from a third party. Below we describe the various scenarios that fall under each of those three categories and the information collected in each one.<o:p></o:p></span></p> <p class=\"\" style=\"line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><b><span style=\"font-size:12.0pt;font-family:\" arial\",\"sans-serif\";=\"\" mso-fareast-font-family:\"times=\"\" new=\"\" >Information that you provide us</span></b><span style=\"font-size:12.0pt;font-family:\" arial\",\"sans-serif\";mso-fareast-font-family:=\"\" \"times=\"\" new=\"\" ><o:p></o:p></span></p><p class=\"MsoNormal\" style=\"margin-left: 40.5pt; text-indent: -0.25in; line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;font-family:\" arial\",\"sans-serif\";mso-fareast-font-family:=\"\" arial;color:black\"=\"\"><span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \" times=\"\" new=\"\" roman\";\"=\"\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span><!--[endif]--><span style=\"font-size:12.0pt;font-family:\" arial\",\"sans-serif\";=\"\" mso-fareast-font-family:\"times=\"\" new=\"\" roman\";color:black\"=\"\">Account signup: When you sign up for an account to access one or more of our services, we ask for information like your name, contact number, email address, company name and country to complete the account signup process. You’ll also be required to choose a unique username and a password for accessing the created account. You may also provide us with more information such as your photo, time zone and language, but we don’t require that information to sign up for an account. After signing up, you will have the option of choosing a security question and an answer to the security question — if you provide these, they will be used only while resetting your password.<br><br>Event registrations and other form submissions: We record information that you submit when you (i) register for any event, including webinars or seminars, (ii) subscribe to our newsletter or any other mailing list, (iii) submit a form in order to download any product, whitepaper, or other materials, (iv) participate in contests or respond to surveys, or (v) submit a form to request customer support, get a quote or to contact Lockene for any other purpose.iii. Payment processing: When you buy something from us, we ask you to provide your name, contact information, and credit card information or other payment account information. When you submit your card information, we store the name and address of the cardholder, the expiry date and the last four digits of the credit card number. We do not store the actual credit card number. For quick processing of future payments, if you have given us your approval, we may store your credit card information or other payment information in an encrypted format in the secured servers of our Payment Gateway Service Providers.<br><br>Testimonials: When you authorize us to post testimonials about our products and services on websites, we may include your name and other personal information in the testimonial. You will be given an opportunity to review and approve the testimonial before we post it. If you wish to update or delete your testimonial, you can contact us at info@lockene.us<br><br>Interactions with Lockene : We may record, analyze and use your interactions with us, including email, telephone, and chat conversations with our sales and customer support professionals, for improving our interactions with you and other customers.<br><br>Information that we collect automatically<br><br>Information from browsers, devices and servers: When you visit our websites, we collect information that web browsers, mobile devices and servers make available, such as the internet protocol address, browser type, language preference, time zone, referring URL, date and time of access, operating system, mobile device manufacturer and mobile network information. We include these in our log files to understand more about visitors to our websites.Information from cookies and tracking technologies: We use temporary and permanent cookies to identify users of our services and to enhance user experience. We embed unique identifiers in our downloadable products to track usage of the products. We also use cookies, beacons, tags, scripts, and other similar technologies to identify visitors, track website navigation, gather demographic information about visitors and users, understand email campaign effectiveness and for targeted visitor and user engagement by tracking your activities on our websites. We mostly use first-party cookies and do not use third-party cookies or other third-party tracking technologies on our websites for non-essential or intrusive tracking.iii. Information from application logs and mobile analytics: We collect information about your use of our products, services and mobile applications from application logs and in-house usage analytics tools, and use it to understand how your use and needs can improve our products. This information includes clicks, scrolls, features accessed, access time and frequency, errors generated, performance data, storage utilized, user settings and configurations, and devices used to access and their locations.<o:p></o:p></span></p> <p class=\"\" style=\"line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><b><span style=\"font-size:12.0pt;font-family:\" arial\",\"sans-serif\";=\"\" mso-fareast-font-family:\"times=\"\" new=\"\" >Information that we collect from third parties</span></b><span style=\"font-size:12.0pt;font-family:\" arial\",\"sans-serif\";mso-fareast-font-family:=\"\" \"times=\"\" new=\"\" ><o:p></o:p></span></p><p class=\"MsoNormal\" style=\"margin-left: 40.5pt; text-indent: -0.25in; line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;font-family:\" arial\",\"sans-serif\";mso-fareast-font-family:=\"\" arial;color:black\"=\"\"><span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \" times=\"\" new=\"\" roman\";\"=\"\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span><!--[endif]--><span style=\"font-size:12.0pt;font-family:\" arial\",\"sans-serif\";=\"\" mso-fareast-font-family:\"times=\"\" new=\"\" roman\";color:black\"=\"\">Signups using federated authentication service providers: You can log in to Lockene Services using supported federated authentication service providers such as LinkedIn, Microsoft and Google. These services will authenticate your identity and give you the option to share certain personal information with us, such as your name and email address.<br><br>Referrals: If someone has referred any of our products or services to you through any of our referral programs, that person may have provided us your name, email address and other personal information. You may contact us at info@lockene.us to request that we remove your information from our database. If you provide us information about another person, or if another person gives us your information, we will only use that information for the specific reason for which it was provided to us.<br><br>iii. Information from our reselling partners and service providers: If you contact any of our reselling partners, or otherwise express interest in any of our products or services to them, the reselling partner may pass your name, email address, company name and other information to Lockene. If you register for or attend an event that is sponsored by Lockene, the event organizer may share your information with us. Lockene may also receive information about you from review sites if you comment on any review of our products and services, and from other third-party service providers that we engage for marketing our products and services.<br><br>Information from social media sites and other publicly available sources : When you provide feedback or reviews about our products, interact, or engage with us on marketplaces, review sites or social media sites such as Facebook, Twitter, LinkedIn and Instagram through posts, comments, questions and other interactions, we may collect such publicly available information, including profile information, to allow us to connect with you, improve our products, better understand user reactions and issues, or to reproduce and publish your feedback on our websites. We must tell you that once collected, this information may remain with us even if you delete it from these sites. Lockene may also add and update information about you, from other publicly available sources.<o:p></o:p></span></p> <p class=\"\" style=\"line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><b><span style=\"font-size:12.0pt;font-family:\" arial\",\"sans-serif\";=\"\" mso-fareast-font-family:\"times=\"\" new=\"\" >Purposes for using information</span></b><span style=\"font-size:12.0pt;font-family:\" arial\",\"sans-serif\";mso-fareast-font-family:=\"\" \"times=\"\" new=\"\" ><o:p></o:p></span></p><p class=\"MsoNormal\" style=\"margin-left: 40.5pt; text-indent: -0.25in; line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;font-family:\" arial\",\"sans-serif\";mso-fareast-font-family:=\"\" arial;color:black\"=\"\"><span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \" times=\"\" new=\"\" roman\";\"=\"\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span><!--[endif]--><span style=\"font-size:12.0pt;font-family:\" arial\",\"sans-serif\";=\"\" mso-fareast-font-family:\"times=\"\" new=\"\" roman\";color:black\"=\"\">In addition to the purposes mentioned above, we may use your information for the following purposes:<br><br>To communicate with you (such as through email) about products that you have downloaded and services that you have signed up for, changes to this Privacy Policy, changes to the Terms of Service, or important notices;<br>To keep you posted on new products and services, upcoming events, offers, promotions and other information that we think will be of interest to you;<br>To ask you to participate in surveys, or to solicit feedback on our products and services;<br>To set up and maintain your account, and to do all other things required for providing our services, such as enabling collaboration, providing website and mail hosting, and backing up and restoring your data;<br>To understand how users use our products and services, to monitor and prevent problems, and to improve our products and services;<br>To provide customer support, and to analyze and improve our interactions with customers;<br>To detect and prevent fraudulent transactions and other illegal activities, to report spam, and to protect the rights and interests of Lockene, Lockene’s users, third parties and the public;<br>To update, expand and analyze our records, identify new customers, and provide products and services that may be of interest to you;<br>To analyze trends, administer our websites, and track visitor navigations on our websites to understand what visitors are looking for and to better help them;<br>To monitor and improve marketing campaigns and make suggestions relevant to the user.Legal bases for collecting and using information<br><br>Legal processing bases applicable to Lockene : If you are an individual from the European Economic Area (EEA), our legal basis for information collection and use depends on the personal information concerned and the context in which we collect it. Most of our information collection and processing activities are typically based on (i) contractual necessity, (ii) one or more legitimate interests of Lockene or a third party that are not overridden by your data protection interests, or (iii) your consent. Sometimes, we may be legally required to collect your information, or may need your personal information to protect your vital interests or those of another person.<br><br>Withdrawal of consent: Where we rely on your consent as the legal basis, you have the right to withdraw your consent at any time, but this will not affect any processing that has already taken place.<br><br>Legitimate interests notice: Where we rely on legitimate interests as the legal basis and those legitimate interests are not specified above, we will clearly explain to you what those legitimate interests are at the time that we collect your information.<o:p></o:p></span></p> <p class=\"\" style=\"line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><b><span style=\"font-size:12.0pt;font-family:\" arial\",\"sans-serif\";=\"\" mso-fareast-font-family:\"times=\"\" new=\"\" >Your choice in information use</span></b><span style=\"font-size:12.0pt;font-family:\" arial\",\"sans-serif\";mso-fareast-font-family:=\"\" \"times=\"\" new=\"\" ><o:p></o:p></span></p><p class=\"MsoNormal\" style=\"margin-left: 40.5pt; text-indent: -0.25in; line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;font-family:\" arial\",\"sans-serif\";mso-fareast-font-family:=\"\" arial;color:black\"=\"\"><span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \" times=\"\" new=\"\" roman\";\"=\"\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span><!--[endif]--><span style=\"font-size:12.0pt;font-family:\" arial\",\"sans-serif\";=\"\" mso-fareast-font-family:\"times=\"\" new=\"\" roman\";color:black\"=\"\">Opt out of non-essential electronic communications: You may opt out of receiving newsletters and other non-essential messages by using the ‘unsubscribe’ function included in all such messages. However, you will continue to receive essential notices and emails such as account notification emails (password change, renewal reminders, etc.), security incident alerts, security and privacy update notifications, and essential transactional and payment related emails.<br><br>Disable cookies: You can disable browser cookies before visiting our websites. However, if you do so, you may not be able to use certain features of the websites properly.<br><br>Optional information: You can choose not to provide optional profile information such as your photo. You can also delete or change your optional profile information. You can always choose not to fill in non-mandatory fields when you submit any form linked to our websites.<o:p></o:p></span></p> <p class=\"\" style=\"line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><b><span style=\"font-size:12.0pt;font-family:\" arial\",\"sans-serif\";=\"\" mso-fareast-font-family:\"times=\"\" new=\"\" >Who we share your information with</span></b><span style=\"font-size:12.0pt;font-family:\" arial\",\"sans-serif\";mso-fareast-font-family:=\"\" \"times=\"\" new=\"\" ><o:p></o:p></span></p><p class=\"MsoNormal\" style=\"margin-left: 40.5pt; text-indent: -0.25in; line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;font-family:\" arial\",\"sans-serif\";mso-fareast-font-family:=\"\" arial;color:black\"=\"\"><span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \" times=\"\" new=\"\" roman\";\"=\"\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span><!--[endif]--><span style=\"font-size:12.0pt;font-family:\" arial\",\"sans-serif\";=\"\" mso-fareast-font-family:\"times=\"\" new=\"\" roman\";color:black\"=\"\">All Lockene group entities listed here have access to the information covered in Part I. We do not sell any personal information. We share your information only in the ways that are described in this Privacy Policy, and only with parties who adopt appropriate confidentiality and security measures.<br><br>Employees and independent contractors: Employees and independent contractors of relevant Lockene group entities have access to the information covered in Part I on a need-to-know basis. We require all employees and independent contractors of Lockene group entities to follow this Privacy Policy for personal information that we share with them.<br><br>Third-party service providers: We may need to share your personal information and aggregated or de-identified information with third-party service providers that we engage, such as marketing and advertising partners, event organizers, web analytics providers and payment processors. These service providers are authorized to use your personal information only as necessary to provide these services to us.<br><br>Domain registrars: When you register a domain through Lockene from domain name registrars, we share your name and contact information such as your physical address, email address and phone number with them as per the ICANN domain registration rules.<br><br>Reselling partners: We may share your personal information with our authorized reselling partners in your region, solely for the purpose of contacting you about products that you have downloaded or services that you have signed up for. We will give you an option to opt out of continuing to work with that partner.<br><br>Marketplace application developers: When you install or purchase any application developed using Lockene’s APIs that is posted on Lockene’s online marketplace, your name and email address will be shared with the developer of the application, so they may engage with you directly as the provider of that application or service. Lockene does not control the use of your personal information by the developers, which will be based on their own privacy policies.<br><br>Other cases: Other scenarios in which we may share the same information covered under Parts I and II are described in Part III.<br><br>Your rights with respect to information we hold about you as a controller<br><br>If you are in the European Economic Area (EEA), you have the following rights with respect to information that Lockene holds about you. Lockene undertakes to provide you the same rights no matter where you choose to live.<br><br>Right to access: You have the right to access (and obtain a copy of, if required) the categories of personal information that we hold about you, including the information’s source, purpose and period of processing, and the persons to whom the information is shared<br><br>Right to rectification: You have the right to update the information we hold about you or to rectify any inaccuracies. Based on the purpose for which we use your information, you can instruct us to add supplemental information about you in our database.<br><br>Right to erasure: You have the right to request that we delete your personal information in certain circumstances, such as when it is no longer necessary for the purpose for which it was originally collected.<br><br>Right to restriction of processing: You may also have the right to request to restrict the use of your information in certain circumstances, such as when you have objected to our use of your data but we need to verify whether we have overriding legitimate grounds to use it.<br><br>Right to data portability: You have the right to transfer your information to a third party in a structured, commonly used and machine-readable format, in circumstances where the information is processed with your consent or by automated means.<br><br>Right to object: You have the right to object to the use of your information in certain circumstances, such as the use of your personal information for direct marketing.<br><br>Right to complain: You have the right to complain to the appropriate supervisory authority if you have any grievance against the way we collect, use or share your information. This right may not be available to you if there is no supervisory authority dealing with data protection in your country.<o:p></o:p></span></p> <p class=\"\" style=\"line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><b><span style=\"font-size:12.0pt;font-family:\" arial\",\"sans-serif\";=\"\" mso-fareast-font-family:\"times=\"\" new=\"\" >Retention of information</span></b><span style=\"font-size:12.0pt;font-family:\" arial\",\"sans-serif\";mso-fareast-font-family:=\"\" \"times=\"\" new=\"\" ><o:p></o:p></span></p><p class=\"MsoNormal\" style=\"margin-left: 40.5pt; text-indent: -0.25in; line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;font-family:\" arial\",\"sans-serif\";mso-fareast-font-family:=\"\" arial;color:black\"=\"\"><span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \" times=\"\" new=\"\" roman\";\"=\"\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span><!--[endif]--><span style=\"font-size:12.0pt;font-family:\" arial\",\"sans-serif\";=\"\" mso-fareast-font-family:\"times=\"\" new=\"\" roman\";color:black\"=\"\">We retain your personal information for as long as it is required for the purposes stated in this Privacy Policy. Sometimes, we may retain your information for longer periods as permitted or required by law, such as to maintain suppression lists, prevent abuse, if required in connection with a legal claim or proceeding, to enforce our agreements, for tax, accounting, or to comply with other legal obligations. When we no longer have a legitimate need to process your information, we will delete or anonymize your information from our active databases. We will also securely store the information and isolate it from further processing on backup discs until deletion is possible.<br><br>Part II – Information that Lockene processes on your behalf<o:p></o:p></span></p> <p class=\"\" style=\"line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><b><span style=\"font-size:12.0pt;font-family:\" arial\",\"sans-serif\";=\"\" mso-fareast-font-family:\"times=\"\" new=\"\" >Information entrusted to Lockene and purpose</span></b><span style=\"font-size:12.0pt;font-family:\" arial\",\"sans-serif\";mso-fareast-font-family:=\"\" \"times=\"\" new=\"\" ><o:p></o:p></span></p><p class=\"MsoNormal\" style=\"margin-left: 40.5pt; text-indent: -0.25in; line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;font-family:\" arial\",\"sans-serif\";mso-fareast-font-family:=\"\" arial;color:black\"=\"\"><span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \" times=\"\" new=\"\" roman\";\"=\"\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span><!--[endif]--><span style=\"font-size:12.0pt;font-family:\" arial\",\"sans-serif\";=\"\" mso-fareast-font-family:\"times=\"\" new=\"\" roman\";color:black\"=\"\">Information provided in connection with services: You may entrust information that you or your organization (\"you\") control, to Lockene in connection with use of our services or for requesting technical support for our products. This includes information regarding your customers and your employees (if you are a controller) or data that you hold and use on behalf of another person for a specific purpose, such as a customer to whom you provide services (if you are a processor). The data may either be stored on our servers when you use our services, or transferred or shared to us as part of a request for technical support or other services.<br><br>Information from mobile devices: When you elect to allow it, some of our mobile applications have access to the camera, call history, contact information, photo library, and other information stored on your mobile device. Our applications require such access to provide their services. Similarly, when you elect to provide access, location-based information is also collected for purposes including, but not limited to, locating nearby contacts or setting location-based reminders. This information will be exclusively shared with our mapping providers and will be used only for mapping user locations. You may disable the mobile applications’ access to this information at any time by editing the settings on your mobile device. The data stored on your mobile device and their location information to which the mobile applications have access will be used in the context of the mobile application, and transferred to and associated with your account in the corresponding services (in which case the data will be stored on our servers) or products (in which case the data will remain with you unless you share it with us).<br><br>(All the information entrusted to Lockene is collectively termed \"service data\")<o:p></o:p></span></p> <p class=\"\" style=\"line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><b><span style=\"font-size:12.0pt;font-family:\" arial\",\"sans-serif\";=\"\" mso-fareast-font-family:\"times=\"\" new=\"\" >Ownership and control of your service data</span></b><span style=\"font-size:12.0pt;font-family:\" arial\",\"sans-serif\";mso-fareast-font-family:=\"\" \"times=\"\" new=\"\" ><o:p></o:p></span></p><p class=\"MsoNormal\" style=\"margin-left: 40.5pt; text-indent: -0.25in; line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;font-family:\" arial\",\"sans-serif\";mso-fareast-font-family:=\"\" arial;color:black\"=\"\"><span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \" times=\"\" new=\"\" roman\";\"=\"\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span><!--[endif]--><span style=\"font-size:12.0pt;font-family:\" arial\",\"sans-serif\";=\"\" mso-fareast-font-family:\"times=\"\" new=\"\" roman\";color:black\"=\"\">We recognize that you own your service data. We provide you complete control of your service data by providing you the ability to (i) access your service data, (ii) share your service data through supported third-party integrations, and (iii) request export or deletion of your service data.<o:p></o:p></span></p> <p class=\"\" style=\"line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><b><span style=\"font-size:12.0pt;font-family:\" arial\",\"sans-serif\";=\"\" mso-fareast-font-family:\"times=\"\" new=\"\" >How we use service data</span></b><span style=\"font-size:12.0pt;font-family:\" arial\",\"sans-serif\";mso-fareast-font-family:=\"\" \"times=\"\" new=\"\" ><o:p></o:p></span></p><p class=\"MsoNormal\" style=\"margin-left: 40.5pt; text-indent: -0.25in; line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;font-family:\" arial\",\"sans-serif\";mso-fareast-font-family:=\"\" arial;color:black\"=\"\"><span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \" times=\"\" new=\"\" roman\";\"=\"\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span><!--[endif]--><span style=\"font-size:12.0pt;font-family:\" arial\",\"sans-serif\";=\"\" mso-fareast-font-family:\"times=\"\" new=\"\" roman\";color:black\"=\"\">We process your service data when you provide us instructions through the various modules of our services. For example, when you generate an invoice using our invoicing service, information such as the name and address of your customer will be used to generate the invoice; and when you use our campaign management service for email marketing, the email addresses of the persons on your mailing list will be used for sending the emails.<o:p></o:p></span></p> <p class=\"\" style=\"line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><b><span style=\"font-size:12.0pt;font-family:\" arial\",\"sans-serif\";=\"\" mso-fareast-font-family:\"times=\"\" new=\"\" >Push notifications</span></b><span style=\"font-size:12.0pt;font-family:\" arial\",\"sans-serif\";mso-fareast-font-family:=\"\" \"times=\"\" new=\"\" ><o:p></o:p></span></p><p class=\"MsoNormal\" style=\"margin-left: 40.5pt; text-indent: -0.25in; line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;font-family:\" arial\",\"sans-serif\";mso-fareast-font-family:=\"\" arial;color:black\"=\"\"><span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \" times=\"\" new=\"\" roman\";\"=\"\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span><!--[endif]--><span style=\"font-size:12.0pt;font-family:\" arial\",\"sans-serif\";=\"\" mso-fareast-font-family:\"times=\"\" new=\"\" roman\";color:black\"=\"\">If you have enabled notification on our desktop and mobile applications, we will push notifications through a push notification provider such as Apple Push Notification Service, Google Cloud Messaging or Windows Push Notification Services. You can manage your push notification preferences or deactivate these notifications by turning off notifications in the application or device settings.<o:p></o:p></span></p> <p class=\"\" style=\"line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><b><span style=\"font-size:12.0pt;font-family:\" arial\",\"sans-serif\";=\"\" mso-fareast-font-family:\"times=\"\" new=\"\" >Who we share service data with</span></b><span style=\"font-size:12.0pt;font-family:\" arial\",\"sans-serif\";mso-fareast-font-family:=\"\" \"times=\"\" new=\"\" ><o:p></o:p></span></p><p class=\"MsoNormal\" style=\"margin-left: 40.5pt; text-indent: -0.25in; line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;font-family:\" arial\",\"sans-serif\";mso-fareast-font-family:=\"\" arial;color:black\"=\"\"><span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \" times=\"\" new=\"\" roman\";\"=\"\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span><!--[endif]--><span style=\"font-size:12.0pt;font-family:\" arial\",\"sans-serif\";=\"\" mso-fareast-font-family:\"times=\"\" new=\"\" roman\";color:black\"=\"\">Lockene group and third-party sub-processors: In order to provide services and technical support for our products, the contracting entity within the Lockene group engages other group entities and third parties.<br><br>Employees and independent contractors : We may provide access to your service data to our employees and individuals who are independent contractors of the Lockene group entities involved in providing the services (collectively our \"employees\") so that they can (i) identify, analyze and resolve errors, (ii) manually verify emails reported as spam to improve spam detection, or (iii) manually verify scanned images that you submit to us to verify the accuracy of optical character recognition. We ensure that access by our employees to your service data is restricted to specific individuals, and is logged and audited. Our employees will also have access to data that you knowingly share with us for technical support or to import data into our products or services. We communicate our privacy and security guidelines to our employees and strictly enforce privacy safeguards within the Lockene group.<br><br>Collaborators and other users: Some of our products or services allow you to collaborate with other users or third parties. Initiating collaboration may enable other collaborators to view some or all of your profile information. For example, when you edit a document that you have shared with other persons for collaboration, your name and profile picture will be displayed next to your edits to allow your collaborators to know that you made those edits.<br><br>Third-party integrations you have enabled: Most of our products and services support integrations with third-party products and services. If you choose to enable any third-party integrations, you may be allowing the third party to access your service data and personal information about you. We encourage you to review the privacy practices of the third-party services and products before you enable integrations with them.<br><br>Other cases: Other scenarios in which we may share information that are common to information covered under Parts I and II are described in Part III.<o:p></o:p></span></p> <p class=\"\" style=\"line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><b><span style=\"font-size:12.0pt;font-family:\" arial\",\"sans-serif\";=\"\" mso-fareast-font-family:\"times=\"\" new=\"\" >Retention of information</span></b><span style=\"font-size:12.0pt;font-family:\" arial\",\"sans-serif\";mso-fareast-font-family:=\"\" \"times=\"\" new=\"\" ><o:p></o:p></span></p><p class=\"MsoNormal\" style=\"margin-left: 40.5pt; text-indent: -0.25in; line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;font-family:\" arial\",\"sans-serif\";mso-fareast-font-family:=\"\" arial;color:black\"=\"\"><span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \" times=\"\" new=\"\" roman\";\"=\"\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span><!--[endif]--><span style=\"font-size:12.0pt;font-family:\" arial\",\"sans-serif\";=\"\" mso-fareast-font-family:\"times=\"\" new=\"\" roman\";color:black\"=\"\">We hold the data in your account as long as you choose to use Lockene Services. Once you terminate your Lockene user account, your data will eventually get deleted from active database during the next clean-up that occurs once in 6 months. The data deleted from active database will be deleted from backups after 3 months.<o:p></o:p></span></p> <p class=\"\" style=\"line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><b><span style=\"font-size:12.0pt;font-family:\" arial\",\"sans-serif\";=\"\" mso-fareast-font-family:\"times=\"\" new=\"\" >Data subject requests</span></b><span style=\"font-size:12.0pt;font-family:\" arial\",\"sans-serif\";mso-fareast-font-family:=\"\" \"times=\"\" new=\"\" ><o:p></o:p></span></p><p class=\"MsoNormal\" style=\"margin-left: 40.5pt; text-indent: -0.25in; line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;font-family:\" arial\",\"sans-serif\";mso-fareast-font-family:=\"\" arial;color:black\"=\"\"><span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \" times=\"\" new=\"\" roman\";\"=\"\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span><!--[endif]--><span style=\"font-size:12.0pt;font-family:\" arial\",\"sans-serif\";=\"\" mso-fareast-font-family:\"times=\"\" new=\"\" roman\";color:black\"=\"\">If you are from the European Economic Area and you believe that we store, use or process your information on behalf of one of our customers, please contact the customer if you would like to access, rectify, erase, restrict or object to processing, or export your personal data. We will extend our support to our customer in responding to your request within a reasonable timeframe.<br><br>Part III – General<o:p></o:p></span></p> <p class=\"\" style=\"line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><b><span style=\"font-size:12.0pt;font-family:\" arial\",\"sans-serif\";=\"\" mso-fareast-font-family:\"times=\"\" new=\"\" >Children’s personal information</span></b><span style=\"font-size:12.0pt;font-family:\" arial\",\"sans-serif\";mso-fareast-font-family:=\"\" \"times=\"\" new=\"\" ><o:p></o:p></span></p><p class=\"MsoNormal\" style=\"margin-left: 40.5pt; text-indent: -0.25in; line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;font-family:\" arial\",\"sans-serif\";mso-fareast-font-family:=\"\" arial;color:black\"=\"\"><span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \" times=\"\" new=\"\" roman\";\"=\"\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span><!--[endif]--><span style=\"font-size:12.0pt;font-family:\" arial\",\"sans-serif\";=\"\" mso-fareast-font-family:\"times=\"\" new=\"\" roman\";color:black\"=\"\">Our products and services are not directed to individuals under 16. Lockene does not knowingly collect personal information from children who are under 16 years of age for its own purposes. If we become aware that a child under 16 has provided us with personal information, we will take steps to delete such information. If you believe that a child under 16 years has provided personal information to us, please write to info@lockene.us with the details, and we will take the necessary steps to delete the information we hold about that child. However, using our products, you can collect information about individuals who may be children. If you process information relating to children, you acknowledge and agree that you will be responsible for complying with the applicable laws and regulations related to protection of such personal information.<o:p></o:p></span></p> <p class=\"\" style=\"line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><b><span style=\"font-size:12.0pt;font-family:\" arial\",\"sans-serif\";=\"\" mso-fareast-font-family:\"times=\"\" new=\"\" >How secure is your information</span></b><span style=\"font-size:12.0pt;font-family:\" arial\",\"sans-serif\";mso-fareast-font-family:=\"\" \"times=\"\" new=\"\" ><o:p></o:p></span></p><p class=\"MsoNormal\" style=\"margin-left: 40.5pt; text-indent: -0.25in; line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;font-family:\" arial\",\"sans-serif\";mso-fareast-font-family:=\"\" arial;color:black\"=\"\"><span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \" times=\"\" new=\"\" roman\";\"=\"\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span><!--[endif]--><span style=\"font-size:12.0pt;font-family:\" arial\",\"sans-serif\";=\"\" mso-fareast-font-family:\"times=\"\" new=\"\" roman\";color:black\"=\"\">At Lockene, we take data security very seriously. That’s why we have gotten certified for industry standards mentioned here. We have taken steps to implement appropriate administrative, technical & physical safeguards to prevent unauthorized access, use, modification, disclosure or destruction of the information you entrust to us. If you have any concerns regarding the security of your data, we encourage you to write to us at info@lockene.us with any questions.<o:p></o:p></span></p> <p class=\"\" style=\"line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><b><span style=\"font-size:12.0pt;font-family:\" arial\",\"sans-serif\";=\"\" mso-fareast-font-family:\"times=\"\" new=\"\" >Data Protection Officer</span></b><span style=\"font-size:12.0pt;font-family:\" arial\",\"sans-serif\";mso-fareast-font-family:=\"\" \"times=\"\" new=\"\" ><o:p></o:p></span></p><p class=\"MsoNormal\" style=\"margin-left: 40.5pt; text-indent: -0.25in; line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;font-family:\" arial\",\"sans-serif\";mso-fareast-font-family:=\"\" arial;color:black\"=\"\"><span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \" times=\"\" new=\"\" roman\";\"=\"\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span><!--[endif]--><span style=\"font-size:12.0pt;font-family:\" arial\",\"sans-serif\";=\"\" mso-fareast-font-family:\"times=\"\" new=\"\" roman\";color:black\"=\"\">We have appointed a Data Protection Officer to oversee our management of your personal information in accordance with this Privacy Policy. If you have any questions or concerns about our privacy practices with respect to your personal information, you can reach out to our Data Protection Officer by sending an email to info@lockene.us<o:p></o:p></span></p> <p class=\"\" style=\"line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><b><span style=\"font-size:12.0pt;font-family:\" arial\",\"sans-serif\";=\"\" mso-fareast-font-family:\"times=\"\" new=\"\" >Locations and international transfers</span></b><span style=\"font-size:12.0pt;font-family:\" arial\",\"sans-serif\";mso-fareast-font-family:=\"\" \"times=\"\" new=\"\" ><o:p></o:p></span></p><p class=\"MsoNormal\" style=\"margin-left: 40.5pt; text-indent: -0.25in; line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;font-family:\" arial\",\"sans-serif\";mso-fareast-font-family:=\"\" arial;color:black\"=\"\"><span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \" times=\"\" new=\"\" roman\";\"=\"\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span><!--[endif]--><span style=\"font-size:12.0pt;font-family:\" arial\",\"sans-serif\";=\"\" mso-fareast-font-family:\"times=\"\" new=\"\" roman\";color:black\"=\"\">We share your personal information and service data within the Lockene Group and with third parties engaged by Lockene Group for the purposes described above. By accessing or using our products and services or otherwise providing personal information or service data to us, you understand that the processing, transfer, and storage of your personal information or Service Data within the United States of America, the European Economic Area (EEA) and other countries where Lockene operates. Such transfers are subject to appropriate data protection agreements such as a group company agreement that is based on EU Commission’s Model Contractual Clauses for data processing activities to which GDPR applies. You can write to legal@Lockene Chachacorp.com for obtaining a copy of the agreements on the basis of which we transfer your data within Lockene Group and with the third parties engaged by us.<o:p></o:p></span></p> <p class=\"\" style=\"line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><b><span style=\"font-size:12.0pt;font-family:\" arial\",\"sans-serif\";=\"\" mso-fareast-font-family:\"times=\"\" new=\"\" >Automation and Artificial Intelligence</span></b><span style=\"font-size:12.0pt;font-family:\" arial\",\"sans-serif\";mso-fareast-font-family:=\"\" \"times=\"\" new=\"\" ><o:p></o:p></span></p><p class=\"MsoNormal\" style=\"margin-left: 40.5pt; text-indent: -0.25in; line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;font-family:\" arial\",\"sans-serif\";mso-fareast-font-family:=\"\" arial;color:black\"=\"\"><span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \" times=\"\" new=\"\" roman\";\"=\"\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span><!--[endif]--><span style=\"font-size:12.0pt;font-family:\" arial\",\"sans-serif\";=\"\" mso-fareast-font-family:\"times=\"\" new=\"\" roman\";color:black\"=\"\">In order to provide enhanced productivity and predictive capabilities to our users, we employ a variety of technologies such as regex parsing, template matching, artificial intelligence and machine learning. In keeping with Lockene’s promise not to exploit your data in a way that is not respectful of your privacy and confidentiality expectations, we make only the following limited use of service data for these technologies: (i) using anonymized crops of service data to improve accuracy of the algorithms; and (ii) using your organization’s data for developing models specific for your organization. Our automation and artificial intelligence technologies are mostly powered by our own organization’s data such as internal communications, communications with customers and internal documents as well as free and paid external sources.<o:p></o:p></span></p> <p class=\"\" style=\"line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><b><span style=\"font-size:12.0pt;font-family:\" arial\",\"sans-serif\";=\"\" mso-fareast-font-family:\"times=\"\" new=\"\" >Do Not Track (DNT) requests</span></b><span style=\"font-size:12.0pt;font-family:\" arial\",\"sans-serif\";mso-fareast-font-family:=\"\" \"times=\"\" new=\"\" ><o:p></o:p></span></p><p class=\"MsoNormal\" style=\"margin-left: 40.5pt; text-indent: -0.25in; line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;font-family:\" arial\",\"sans-serif\";mso-fareast-font-family:=\"\" arial;color:black\"=\"\"><span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \" times=\"\" new=\"\" roman\";\"=\"\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span><!--[endif]--><span style=\"font-size:12.0pt;font-family:\" arial\",\"sans-serif\";=\"\" mso-fareast-font-family:\"times=\"\" new=\"\" roman\";color:black\"=\"\">Some internet browsers have enabled ‘Do Not Track’ (DNT) features, which send out a signal (called the DNT signal) to the websites that you visit indicating that you don’t wish to be tracked. Currently, there is no standard that governs what websites can or should do when they receive these signals. For now, we do not take action in response to these signals.<o:p></o:p></span></p> <p class=\"\" style=\"line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><b><span style=\"font-size:12.0pt;font-family:\" arial\",\"sans-serif\";=\"\" mso-fareast-font-family:\"times=\"\" new=\"\" >External links on our websites</span></b><span style=\"font-size:12.0pt;font-family:\" arial\",\"sans-serif\";mso-fareast-font-family:=\"\" \"times=\"\" new=\"\" ><o:p></o:p></span></p><p class=\"MsoNormal\" style=\"margin-left: 40.5pt; text-indent: -0.25in; line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;font-family:\" arial\",\"sans-serif\";mso-fareast-font-family:=\"\" arial;color:black\"=\"\"><span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \" times=\"\" new=\"\" roman\";\"=\"\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span><!--[endif]--><span style=\"font-size:12.0pt;font-family:\" arial\",\"sans-serif\";=\"\" mso-fareast-font-family:\"times=\"\" new=\"\" roman\";color:black\"=\"\">Some pages of our websites may contain links to websites that are not linked to this Privacy Policy. If you submit your personal information to any of these third-party sites, your personal information is governed by their privacy policies. As a safety measure, we recommend that you not share any personal information with these third parties unless you’ve checked their privacy policies and assured yourself of their privacy practices.<o:p></o:p></span></p> <p class=\"\" style=\"line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><b><span style=\"font-size:12.0pt;font-family:\" arial\",\"sans-serif\";=\"\" mso-fareast-font-family:\"times=\"\" new=\"\" >Blogs and forums</span></b><span style=\"font-size:12.0pt;font-family:\" arial\",\"sans-serif\";mso-fareast-font-family:=\"\" \"times=\"\" new=\"\" ><o:p></o:p></span></p><p class=\"MsoNormal\" style=\"margin-left: 40.5pt; text-indent: -0.25in; line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;font-family:\" arial\",\"sans-serif\";mso-fareast-font-family:=\"\" arial;color:black\"=\"\"><span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \" times=\"\" new=\"\" roman\";\"=\"\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span><!--[endif]--><span style=\"font-size:12.0pt;font-family:\" arial\",\"sans-serif\";=\"\" mso-fareast-font-family:\"times=\"\" new=\"\" roman\";color:black\"=\"\">We offer publicly accessible blogs and forums on our websites. Please be aware that any information you provide on these blogs and forums may be used to contact you with unsolicited messages. We urge you to be cautious in disclosing personal information in our blogs and forums. Lockene is not responsible for the personal information you elect to disclose publicly. Your posts and certain profile information may remain even after you terminate your account with Lockene. To request the removal of your information from our blogs and forums, you can contact us at info@lockene.us<o:p></o:p></span></p> <p class=\"\" style=\"line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><b><span style=\"font-size:12.0pt;font-family:\" arial\",\"sans-serif\";=\"\" mso-fareast-font-family:\"times=\"\" new=\"\" >Social media widgets</span></b><span style=\"font-size:12.0pt;font-family:\" arial\",\"sans-serif\";mso-fareast-font-family:=\"\" \"times=\"\" new=\"\" ><o:p></o:p></span></p><p class=\"MsoNormal\" style=\"margin-left: 40.5pt; text-indent: -0.25in; line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;font-family:\" arial\",\"sans-serif\";mso-fareast-font-family:=\"\" arial;color:black\"=\"\"><span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \" times=\"\" new=\"\" roman\";\"=\"\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span><!--[endif]--><span style=\"font-size:12.0pt;font-family:\" arial\",\"sans-serif\";=\"\" mso-fareast-font-family:\"times=\"\" new=\"\" roman\";color:black\"=\"\">Our websites include social media widgets such as Facebook \"like\" buttons and Twitter \"tweet\" buttons that let you share articles and other information. These widgets may collect information such as your IP address and the pages you navigate in the website, and may set a cookie to enable the widgets to function properly. Your interactions with these widgets are governed by the privacy policies of the companies providing them.<o:p></o:p></span></p> <p class=\"\" style=\"line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><b><span style=\"font-size:12.0pt;font-family:\" arial\",\"sans-serif\";=\"\" mso-fareast-font-family:\"times=\"\" new=\"\" >Disclosures in compliance with legal obligations</span></b><span style=\"font-size:12.0pt;font-family:\" arial\",\"sans-serif\";mso-fareast-font-family:=\"\" \"times=\"\" new=\"\" ><o:p></o:p></span></p><p class=\"MsoNormal\" style=\"margin-left: 40.5pt; text-indent: -0.25in; line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;font-family:\" arial\",\"sans-serif\";mso-fareast-font-family:=\"\" arial;color:black\"=\"\"><span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \" times=\"\" new=\"\" roman\";\"=\"\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span><!--[endif]--><span style=\"font-size:12.0pt;font-family:\" arial\",\"sans-serif\";=\"\" mso-fareast-font-family:\"times=\"\" new=\"\" roman\";color:black\"=\"\">We may be required by law to preserve or disclose your personal information and service data to comply with any applicable law, regulation, legal process or governmental request, including to meet national security requireme',";

  getcam() async {
    var img = await imagePicker.getImage(source: ImageSource.camera);
    setState(() {
      file = File(img!.path);
    });
  }

  getgall() async {
    var img = await imagePicker.getImage(source: ImageSource.gallery);
    // wpart = File(img!.path);
    setState(() {
      file = File(img!.path);
    });
  }

  getpcam() async {
    var img = await imagePicker.getImage(source: ImageSource.camera);
    setState(() {
      wpart = File(img!.path);
    });
  }

  getpgall() async {
    var img = await imagePicker.getImage(source: ImageSource.gallery);
    // wpart = File(img!.path);
    setState(() {
      wpart = File(img!.path);
    });
  }

  var process;

  List<String> selectedFruits = [];

  List<String> _selectedItems = [];

  bool radius = true;
  List<Data>? data;
  String? countryName;
  String selectedCoverIndustry = '';

  CountryModel? countryModel;

  String countryValue = "";
  String stateValue = "";
  String cityValue = "";
  String address = "";
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController companyAddressController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  List<ServiceData>? serviceData;
  List<String> selectIndustry = [];
  bool isLoading = true;
  bool isLoading1 = false;
  bool agree = false;
  List<String> selectedItems = [];
  List<String?>? companyIndustryList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ApiInterface().getCostomeServiceList().then((value) => {
          if (value.status == "success")
            {
              serviceData = value.data,
              companyIndustryList =
                  serviceData?.map((e) => e.customService).toList(),
              setState(() {
                isLoading = false;
              }),
            }
        });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Admin Register",
          style:
              Get.textTheme.headline6!.merge(TextStyle(color: Colors.orange)),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey.shade50,
        automaticallyImplyLeading: false,
        elevation: 0,
        // leading: new IconButton(
        //   icon: new Icon(Icons.arrow_back_ios, color: page),
        //   onPressed: () => {Get.find<RootController>().changePageOutRoot(0)},
        // ),
      ),
      body: isLoading
          ? const Center(
              child: SizedBox(
                  height: 30, width: 30, child: CircularProgressIndicator()),
            )
          : ListView(
              primary: true,
              children: [
                Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    Container(
                      decoration: Ui.getBoxDecoration(
                          radius: 14,
                          border: Border.all(width: 5, color: page),
                          color: Colors.black),
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.network(
                            'https://cdn-icons-png.flaticon.com/512/3188/3188580.png',
                            fit: BoxFit.fitWidth,
                            width: 90,
                            height: 90,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  'Step  2 of 2'.tr,
                  style: Get.textTheme.subtitle1!.merge(const TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.w500)),
                ).paddingOnly(top: 15, bottom: 5, right: 20, left: 20),
                Text(
                  'Set Up Your \nCompany'.tr,
                  style: Get.textTheme.headline6!.merge(const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
                ).paddingOnly(top: 0, bottom: 0, right: 20, left: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(
                          top: 20, bottom: 14, left: 20, right: 20),
                      margin: const EdgeInsets.only(
                          left: 20, right: 20, top: 20, bottom: 0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          //borderRadius: buildBorderRadius,
                          boxShadow: [
                            BoxShadow(
                                color: Get.theme.focusColor.withOpacity(0.1),
                                blurRadius: 10,
                                offset: Offset(0, 5)),
                          ],
                          border: Border.all(
                              color: Get.theme.focusColor.withOpacity(0.05))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            "Phone Number" ?? "",
                            style: Get.textTheme.bodyText1,
                            textAlign: TextAlign.start,
                          ),
                          IntlPhoneField(
                              controller: phoneNumberController,
                              keyboardType: TextInputType.phone,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(10),
                              ],
                              showDropdownIcon: false,
                              pickerDialogStyle: PickerDialogStyle(
                                  countryNameStyle: Get.textTheme.bodyText2),
                              style: Get.textTheme.bodyText2,
                              textAlign: TextAlign.start,
                              disableLengthCheck: true,
                              autovalidateMode: AutovalidateMode.disabled,
                              decoration: InputDecoration(
                                hintText: "Phone Number" ?? '',
                                hintStyle: Get.textTheme.caption,
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                contentPadding: EdgeInsets.all(0),
                                border: const OutlineInputBorder(
                                    borderSide: BorderSide.none),
                                focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide.none),
                                enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide.none),
                                // suffixIcon: suffixIcon,
                                // suffix: suffix,
                                // errorText: errorText,
                              )),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(
                              top: 20, bottom: 10, left: 20, right: 20),
                          margin: const EdgeInsets.only(
                              left: 20, right: 20, top: 0, bottom: 0),
                          decoration: BoxDecoration(
                              color: page,
                              // borderRadius: buildBorderRadius,
                              boxShadow: [
                                BoxShadow(
                                    color:
                                        Get.theme.focusColor.withOpacity(0.1),
                                    blurRadius: 10,
                                    offset: Offset(0, 5)),
                              ],
                              border: Border.all(
                                  color:
                                      Get.theme.focusColor.withOpacity(0.05))),
                          child: Column(
                            children: [
                              Container(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    'Company Type',
                                    style: Get.textTheme.bodyText1,
                                    textAlign: TextAlign.start,
                                  )),
                              Row(
                                children: [
                                  Icon(
                                    Icons.apartment_outlined,
                                    color: Colors.grey.shade500,
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: DropdownButton(
                                            underline: const SizedBox(),
                                            hint: Text(
                                              'Please select company type',
                                              style: TextStyle(
                                                  fontSize:
                                                      size.width * thirteen),
                                            ),
                                            value: valueChoose,
                                            icon: Icon(Icons.arrow_drop_down),
                                            // iconSize: 36,
                                            isExpanded: true,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: size.width * thirteen,
                                                fontWeight: FontWeight.w500),
                                            items: listItem.map((valueItem) {
                                              return DropdownMenuItem(
                                                value: valueItem,
                                                child: Text(
                                                  valueItem,
                                                  style: TextStyle(
                                                      fontSize:
                                                          size.width * thirteen,
                                                      color: textColor),
                                                ),
                                              );
                                            }).toList(),
                                            onChanged: (
                                              newValue,
                                            ) {
                                              setState(() {
                                                valueChoose =
                                                    newValue as String?;
                                                if (valueChoose.toString() ==
                                                    "Private") {
                                                  last = false;
                                                  click = "false";
                                                  radius = true;
                                                  print(click);
                                                } else {
                                                  last = true;
                                                  click = 'true';
                                                  print(click);
                                                  radius = false;
                                                }
                                              });
                                            })
                                        .marginOnly(
                                            left: 14.0,
                                            right: 0.0,
                                            top: 0.0,
                                            bottom: 0),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        valueChoose.toString() == "Private"
                            ? Container(
                                padding: const EdgeInsets.only(
                                    top: 20, bottom: 10, left: 20, right: 20),
                                margin: const EdgeInsets.only(
                                    left: 20, right: 20, top: 0, bottom: 0),
                                decoration: BoxDecoration(
                                    color: page,
                                    // borderRadius: buildBorderRadius,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Get.theme.focusColor
                                              .withOpacity(0.1),
                                          blurRadius: 10,
                                          offset: Offset(0, 5)),
                                    ],
                                    border: Border.all(
                                        color: Get.theme.focusColor
                                            .withOpacity(0.05))),
                                child: GestureDetector(
                                  onTap: () {
                                    print("fromOnTap");
                                    _showMultiSelect(companyIndustryList);
                                    },
                                  child: Column(
                                    children: [
                                      Container(
                                          alignment: Alignment.bottomLeft,
                                          child: Text(
                                            'Company Industry',
                                            style: Get.textTheme.bodyText1,
                                            textAlign: TextAlign.start,
                                          )),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10.0, bottom: 15),
                                        child: Row(
                                          children: [
                                            _selectedItems.isEmpty
                                                ? const Icon(
                                                    Icons.work,
                                                    color: Colors.grey,
                                                    // size: 20.09,
                                                  )
                                                : Container(),
                                            _selectedItems.isEmpty
                                                ? Expanded(
                                                    flex: 1,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 14.0),
                                                      child: Text(
                                                        'Select your industry',
                                                        style: TextStyle(
                                                            fontSize:
                                                                size.width *
                                                                    thirteen,
                                                            color: Colors
                                                                .grey.shade600),
                                                      ),
                                                    ),
                                                  )
                                                : Expanded(
                                                    flex: 1,
                                                    child: Wrap(
                                                      // alignment: WrapAlignment.center,
                                                      children: _selectedItems
                                                          .map((e) => Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            3.0,
                                                                        right:
                                                                            3.0),
                                                                child: Chip(
                                                                  label:
                                                                      Text(e),
                                                                ),
                                                              ))
                                                          .toList(),
                                                    ),
                                                  ),
                                            Icon(
                                              Icons.arrow_drop_down,
                                              color: Colors.grey,
                                              // size: 20.09,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            : Container(),
                        click.toString() == "true"
                            ? Container(
                                padding: EdgeInsets.only(
                                    top: 20, bottom: 10, left: 20, right: 20),
                                margin: EdgeInsets.only(
                                    left: 20, right: 20, top: 0, bottom: 0),
                                decoration: BoxDecoration(
                                    color: page,
                                    borderRadius: buildBorderRadius,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Get.theme.focusColor
                                              .withOpacity(0.1),
                                          blurRadius: 10,
                                          offset: Offset(0, 5)),
                                    ],
                                    border: Border.all(
                                        color: Get.theme.focusColor
                                            .withOpacity(0.05))),
                                child: Column(children: [
                                  Container(
                                      alignment: Alignment.bottomLeft,
                                      child: Text(
                                        'Company Name',
                                        style: Get.textTheme.bodyText1,
                                        textAlign: TextAlign.start,
                                      )),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.build_circle_outlined,
                                        color: Colors.grey.shade500,
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: DropdownButton(
                                                underline: SizedBox(),
                                                hint: Text(
                                                  'Please select company name',
                                                  style: TextStyle(
                                                      fontSize: size.width *
                                                          thirteen),
                                                ),
                                                value: valueChoose1,
                                                icon: Icon(Icons.arrow_drop_down),
                                                // iconSize: 36,
                                                isExpanded: true,
                                                style:
                                                    TextStyle(
                                                        color: Colors.black,
                                                        fontSize: size.width *
                                                            thirteen,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                items: listItem1.map((valueItem) {
                                                  return DropdownMenuItem(
                                                    value: valueItem,
                                                    child: Text(
                                                      valueItem,
                                                      style: TextStyle(
                                                          fontSize: size.width *
                                                              thirteen,
                                                          color: textColor),
                                                    ),
                                                  );
                                                }).toList(),
                                                onChanged: (
                                                  newValue,
                                                ) {
                                                  setState(() {
                                                    valueChoose1 =
                                                        newValue as String?;
                                                    // if(valueChoose.toString()=="Private"){
                                                    //   last = false;
                                                    //   // click = "false";
                                                    //   print(click);
                                                    //
                                                    // }else{
                                                    //   last = true;
                                                    //   click = 'true';
                                                    //   print(click);
                                                    //
                                                    // }
                                                  });
                                                })
                                            .marginOnly(
                                                left: 14.0,
                                                right: 0.0,
                                                top: 0.0,
                                                bottom: 0),
                                      ),
                                    ],
                                  ),
                                ]))
                            : Container(),
                        Container(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 20),
                          margin: const EdgeInsets.only(
                              top: 0, left: 20, right: 20, bottom: 0),
                          decoration: BoxDecoration(
                              color: page,
                              boxShadow: [
                                BoxShadow(
                                    color:
                                        Get.theme.focusColor.withOpacity(0.1),
                                    blurRadius: 10,
                                    offset: const Offset(0, 5)),
                              ],
                              border: Border.all(
                                  color:
                                      Get.theme.focusColor.withOpacity(0.05))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                "Address Details" ?? "",
                                style: Get.textTheme.bodyText1!
                                    .merge(const TextStyle(letterSpacing: 2)),
                                textAlign: TextAlign.start,
                              ),
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 10, top: 10),
                                    child: CSCPicker(
                                      showStates: true,
                                      showCities: true,
                                      flagState: CountryFlag.DISABLE,
                                      dropdownDecoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10)),
                                          color: Colors.white,
                                          border: Border.all(
                                              color: Colors.grey.shade300,
                                              width: 1)),
                                      disabledDropdownDecoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10)),
                                          color: Colors.grey.shade300,
                                          border: Border.all(
                                              color: Colors.grey.shade300,
                                              width: 1)),
                                      countrySearchPlaceholder: "Country",
                                      stateSearchPlaceholder: "State",
                                      citySearchPlaceholder: "City",
                                      countryDropdownLabel: "Country",
                                      stateDropdownLabel: "State",
                                      cityDropdownLabel: "City",
                                      countryFilter: const [
                                        CscCountry.Afghanistan,
                                        CscCountry.Aland_Islands,
                                        CscCountry.Albania,
                                        CscCountry.Algeria,
                                        CscCountry.American_Samoa,
                                        CscCountry.Andorra,
                                        CscCountry.Angola,
                                        CscCountry.Anguilla,
                                        CscCountry.Antarctica,
                                        CscCountry.Antigua_And_Barbuda,
                                        CscCountry.Argentina,
                                        CscCountry.Armenia,
                                        CscCountry.Aruba,
                                        CscCountry.Australia,
                                        CscCountry.Austria,
                                        CscCountry.Azerbaijan,
                                        CscCountry.Bahamas_The,
                                        CscCountry.Bahrain,
                                        CscCountry.Bangladesh,
                                        CscCountry.Barbados,
                                        CscCountry.Belarus,
                                        CscCountry.Belgium,
                                        CscCountry.Belize,
                                        CscCountry.Benin,
                                        CscCountry.Bermuda,
                                        CscCountry.Bhutan,
                                        CscCountry.Bolivia,
                                        CscCountry.Bosnia_and_Herzegovina,
                                        CscCountry.Botswana,
                                        CscCountry.Bouvet_Island,
                                        CscCountry.Brazil,
                                        CscCountry.British_Indian_Ocean_Territory,
                                        CscCountry.Brunei,
                                        CscCountry.Bulgaria,
                                        CscCountry.Burkina_Faso,
                                        CscCountry.Burundi,
                                        CscCountry.Cambodia,
                                        CscCountry.Cameroon,
                                        CscCountry.Canada,
                                        CscCountry.Cape_Verde,
                                        CscCountry.Cayman_Islands,
                                        CscCountry.Central_African_Republic,
                                        CscCountry.Chad,
                                        CscCountry.Chile,
                                        CscCountry.China,
                                        CscCountry.Christmas_Island,
                                        CscCountry.Cocos_Keeling_Islands,
                                        CscCountry.Colombia,
                                        CscCountry.Comoros,
                                        CscCountry.Congo,
                                        CscCountry.Congo_The_Democratic_Republic_Of_The,
                                        CscCountry.Cook_Islands,
                                        CscCountry.Costa_Rica,
                                        CscCountry.Cote_D_Ivoire_Ivory_Coast,
                                        CscCountry.Croatia_Hrvatska,
                                        CscCountry.Cuba,
                                        CscCountry.Cyprus,
                                        CscCountry.Czech_Republic,
                                        CscCountry.Denmark,
                                        CscCountry.Djibouti,
                                        CscCountry.Dominica,
                                        CscCountry.Dominican_Republic,
                                        CscCountry.East_Timor,
                                        CscCountry.Ecuador,
                                        CscCountry.Egypt,
                                        CscCountry.El_Salvador,
                                        CscCountry.Equatorial_Guinea,
                                        CscCountry.Eritrea,
                                        CscCountry.Estonia,
                                        CscCountry.Ethiopia,
                                        CscCountry.Falkland_Islands,
                                        CscCountry.Faroe_Islands,
                                        CscCountry.Fiji_Islands,
                                        CscCountry.Finland,
                                        CscCountry.France,
                                        CscCountry.French_Guiana,
                                        CscCountry.French_Polynesia,
                                        CscCountry.French_Southern_Territories,
                                        CscCountry.Gabon,
                                        CscCountry.Gambia_The,
                                        CscCountry.Georgia,
                                        CscCountry.Germany,
                                        CscCountry.Ghana,
                                        CscCountry.Gibraltar,
                                        CscCountry.Greece,
                                        CscCountry.Greenland,
                                        CscCountry.Grenada,
                                        CscCountry.Guadeloupe,
                                        CscCountry.Guam,
                                        CscCountry.Guatemala,
                                        CscCountry.Guernsey_and_Alderney,
                                        CscCountry.Guinea,
                                        CscCountry.Guinea_Bissau,
                                        CscCountry.Guyana,
                                        CscCountry.Haiti,
                                        CscCountry.Heard_Island_and_McDonald_Islands,
                                        CscCountry.Honduras,
                                        CscCountry.Hong_Kong_S_A_R,
                                        CscCountry.Hungary,
                                        CscCountry.Iceland,
                                        CscCountry.India,
                                        CscCountry.Indonesia,
                                        CscCountry.Iran,
                                        CscCountry.Iraq,
                                        CscCountry.Ireland,
                                        CscCountry.Israel,
                                        CscCountry.Italy,
                                        CscCountry.Jamaica,
                                        CscCountry.Japan,
                                        CscCountry.Jersey,
                                        CscCountry.Jordan,
                                        CscCountry.Kazakhstan,
                                        CscCountry.Kenya,
                                        CscCountry.Kiribati,
                                        CscCountry.Korea_North,
                                        CscCountry.Korea_South,
                                        CscCountry.Kuwait,
                                        CscCountry.Kyrgyzstan,
                                        CscCountry.Laos,
                                        CscCountry.Latvia,
                                        CscCountry.Lebanon,
                                        CscCountry.Lesotho,
                                        CscCountry.Liberia,
                                        CscCountry.Libya,
                                        CscCountry.Liechtenstein,
                                        CscCountry.Lithuania,
                                        CscCountry.Luxembourg,
                                        CscCountry.Macau_S_A_R,
                                        CscCountry.Macedonia,
                                        CscCountry.Madagascar,
                                        CscCountry.Malawi,
                                        CscCountry.Malaysia,
                                        CscCountry.Maldives,
                                        CscCountry.Mali,
                                        CscCountry.Malta,
                                        CscCountry.Man_Isle_of,
                                        CscCountry.Marshall_Islands,
                                        CscCountry.Martinique,
                                        CscCountry.Mauritania,
                                        CscCountry.Mauritius,
                                        CscCountry.Mayotte,
                                        CscCountry.Mexico,
                                        CscCountry.Micronesia,
                                        CscCountry.Moldova,
                                        CscCountry.Monaco,
                                        CscCountry.Mongolia,
                                        CscCountry.Montenegro,
                                        CscCountry.Montserrat,
                                        CscCountry.Morocco,
                                        CscCountry.Mozambique,
                                        CscCountry.Myanmar,
                                        CscCountry.Namibia,
                                        CscCountry.Nauru,
                                        CscCountry.Nepal,
                                        CscCountry.Bonaire_Sint_Eustatius_and_Saba,
                                        CscCountry.Netherlands_The,
                                        CscCountry.New_Caledonia,
                                        CscCountry.New_Zealand,
                                        CscCountry.Nicaragua,
                                        CscCountry.Niger,
                                        CscCountry.Nigeria,
                                        CscCountry.Niue,
                                        CscCountry.Norfolk_Island,
                                        CscCountry.Northern_Mariana_Islands,
                                        CscCountry.Norway,
                                        CscCountry.Oman,
                                        CscCountry.Pakistan,
                                        CscCountry.Palau,
                                        CscCountry.Palestinian_Territory_Occupied,
                                        CscCountry.Panama,
                                        CscCountry.Papua_new_Guinea,
                                        CscCountry.Paraguay,
                                        CscCountry.Peru,
                                        CscCountry.Philippines,
                                        CscCountry.Pitcairn_Island,
                                        CscCountry.Poland,
                                        CscCountry.Portugal,
                                        CscCountry.Puerto_Rico,
                                        CscCountry.Qatar,
                                        CscCountry.Reunion,
                                        CscCountry.Romania,
                                        CscCountry.Russia,
                                        CscCountry.Rwanda,
                                        CscCountry.Saint_Helena,
                                        CscCountry.Saint_Kitts_And_Nevis,
                                        CscCountry.Saint_Lucia,
                                        CscCountry.Saint_Pierre_and_Miquelon,
                                        CscCountry.Saint_Vincent_And_The_Grenadines,
                                        CscCountry.Saint_Barthelemy,
                                        CscCountry.Saint_Martin_French_part,
                                        CscCountry.Samoa,
                                        CscCountry.San_Marino,
                                        CscCountry.Sao_Tome_and_Principe,
                                        CscCountry.Saudi_Arabia,
                                        CscCountry.Senegal,
                                        CscCountry.Serbia,
                                        CscCountry.Seychelles,
                                        CscCountry.Sierra_Leone,
                                        CscCountry.Singapore,
                                        CscCountry.Slovakia,
                                        CscCountry.Slovenia,
                                        CscCountry.Solomon_Islands,
                                        CscCountry.Somalia,
                                        CscCountry.South_Africa,
                                        CscCountry.South_Georgia,
                                        CscCountry.South_Sudan,
                                        CscCountry.Spain,
                                        CscCountry.Sri_Lanka,
                                        CscCountry.Sudan,
                                        CscCountry.Suriname,
                                        CscCountry.Svalbard_And_Jan_Mayen_Islands,
                                        CscCountry.Swaziland,
                                        CscCountry.Sweden,
                                        CscCountry.Switzerland,
                                        CscCountry.Syria,
                                        CscCountry.Taiwan,
                                        CscCountry.Tajikistan,
                                        CscCountry.Tanzania,
                                        CscCountry.Thailand,
                                        CscCountry.Togo,
                                        CscCountry.Tokelau,
                                        CscCountry.Tonga,
                                        CscCountry.Trinidad_And_Tobago,
                                        CscCountry.Tunisia,
                                        CscCountry.Turkey,
                                        CscCountry.Turkmenistan,
                                        CscCountry.Turks_And_Caicos_Islands,
                                        CscCountry.Tuvalu,
                                        CscCountry.Uganda,
                                        CscCountry.Ukraine,
                                        CscCountry.United_Arab_Emirates,
                                        CscCountry.United_Kingdom,
                                        CscCountry.United_States,
                                        CscCountry.United_States_Minor_Outlying_Islands,
                                        CscCountry.Uruguay,
                                        CscCountry.Uzbekistan,
                                        CscCountry.Vanuatu,
                                        CscCountry.Vatican_City_State_Holy_See,
                                        CscCountry.Venezuela,
                                        CscCountry.Vietnam,
                                        CscCountry.Virgin_Islands_British,
                                        CscCountry.Virgin_Islands_US,
                                        CscCountry.Wallis_And_Futuna_Islands,
                                        CscCountry.Western_Sahara,
                                        CscCountry.Yemen,
                                        CscCountry.Zambia,
                                        CscCountry.Zimbabwe,
                                        CscCountry.Kosovo,
                                        CscCountry.Curacao,
                                        CscCountry.Sint_Maarten_Dutch_part,
                                      ],
                                      selectedItemStyle: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                      ),
                                      dropdownHeadingStyle: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                      dropdownItemStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                      ),
                                      dropdownDialogRadius: 10.0,
                                      searchBarRadius: 10.0,
                                      onCountryChanged: (value) {
                                        setState(() {
                                          countryValue = value;
                                        });
                                      },
                                      onStateChanged: (value) {
                                        setState(() {
                                          stateValue = value ?? "";
                                        });
                                      },
                                      onCityChanged: (value) {
                                        setState(() {
                                          cityValue = value ?? "";
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 80,
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 10),
                          margin: const EdgeInsets.only(
                              top: 0, left: 20, right: 20, bottom: 0),
                          decoration: BoxDecoration(
                              color: page,
                              // borderRadius: const BorderRadius.vertical(
                              //     top: Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                    color:
                                        Get.theme.focusColor.withOpacity(0.1),
                                    blurRadius: 10,
                                    offset: const Offset(0, 5)),
                              ],
                              border: Border.all(
                                  color:
                                      Get.theme.focusColor.withOpacity(0.05))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                "Pin code" ?? "",
                                style: Get.textTheme.bodyText1!
                                    .merge(const TextStyle(letterSpacing: 2)),
                                textAlign: TextAlign.start,
                              ),
                              TextFormField(
                                keyboardType: TextInputType.number,
                                maxLength:6,
                                controller: pincodeController,
                                style: Get.textTheme.bodyText2,
                                obscureText: false,
                                textAlign: TextAlign.start,
                                cursorColor: Colors.orange,
                                decoration: Ui.getInputDecoration(
                                  hintText: "Enter your pin code" ?? '',
                                  iconData: Icons.lock_outline,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 80,
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 10),
                          margin: const EdgeInsets.only(
                              top: 0, left: 20, right: 20, bottom: 0),
                          decoration: BoxDecoration(
                              color: page,
                              boxShadow: [
                                BoxShadow(
                                    color:
                                        Get.theme.focusColor.withOpacity(0.1),
                                    blurRadius: 10,
                                    offset: const Offset(0, 5)),
                              ],
                              border: Border.all(
                                  color:
                                      Get.theme.focusColor.withOpacity(0.05))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                "Company Address" ?? "",
                                style: Get.textTheme.bodyText1!
                                    .merge(const TextStyle(letterSpacing: 2)),
                                textAlign: TextAlign.start,
                              ),
                              TextFormField(
                                keyboardType: TextInputType.text,
                                controller: companyAddressController,
                                style: Get.textTheme.bodyText2,
                                obscureText: false,
                                textAlign: TextAlign.start,
                                cursorColor: Colors.orange,
                                decoration: Ui.getInputDecoration(
                                  hintText: "Enter your Company Address" ?? '',
                                  iconData: Icons.location_on,
                                ),
                              ),
                            ],
                          ),
                        ),
                        click.toString() == "true"
                            ? Container(
                                padding: const EdgeInsets.only(
                                    top: 20, bottom: 20, left: 20, right: 20),
                                margin: const EdgeInsets.only(
                                    left: 20, right: 20, top: 0, bottom: 0),
                                decoration: BoxDecoration(
                                    color: page,
                                    // borderRadius: buildBorderRadius,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Get.theme.focusColor
                                              .withOpacity(0.1),
                                          blurRadius: 10,
                                          offset: Offset(0, 5)),
                                    ],
                                    border: Border.all(
                                        color: Get.theme.focusColor
                                            .withOpacity(0.05))),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 10.0),
                                      child: Container(
                                          alignment: Alignment.bottomLeft,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Authorized Certificate Image',
                                                style: Get.textTheme.bodyText1,
                                                textAlign: TextAlign.start,
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  process = "proof";
                                                  _bottomsheet(
                                                      context, process);
                                                },
                                                child: Text(
                                                  'Change',
                                                  style:
                                                      Get.textTheme.bodyText1,
                                                  textAlign: TextAlign.start,
                                                ),
                                              ),
                                            ],
                                          )),
                                    ),
                                    file == null
                                        ? Row(
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  process = "proof";
                                                  _bottomsheet(
                                                      context, process);
                                                },
                                                child: Container(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      color:
                                                          Colors.grey.shade400),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: const [
                                                      Icon(
                                                        Icons.image,
                                                        size: 30,
                                                      ),
                                                      Text(
                                                        'Add Image',
                                                        style: TextStyle(
                                                            fontSize: 14),
                                                      )
                                                    ],
                                                  ).paddingSymmetric(
                                                      horizontal: 20,
                                                      vertical: 20),
                                                ),
                                              ),
                                            ],
                                          )
                                        : Row(
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                child: Center(
                                                  child: Image.file(
                                                    file!,
                                                    height: 100,
                                                    width: 100,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                  ],
                                ),
                              )
                            : Container(),
                        click.toString() == "true"
                            ? Container(
                                padding: const EdgeInsets.only(
                                    top: 20, bottom: 20, left: 20, right: 20),
                                margin: const EdgeInsets.only(
                                    left: 20, right: 20, top: 0, bottom: 0),
                                decoration: BoxDecoration(
                                    color: page,
                                    borderRadius: const BorderRadius.vertical(
                                        bottom: Radius.circular(10.0)),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Get.theme.focusColor
                                              .withOpacity(0.1),
                                          blurRadius: 10,
                                          offset: Offset(0, 5)),
                                    ],
                                    border: Border.all(
                                        color: Get.theme.focusColor
                                            .withOpacity(0.05))),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 10.0),
                                      child: Container(
                                          alignment: Alignment.bottomLeft,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Passport Size Photo',
                                                style: Get.textTheme.bodyText1,
                                                textAlign: TextAlign.start,
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  process = "passport";
                                                  _bottomsheet(
                                                      context, process);
                                                },
                                                child: Text(
                                                  'Change',
                                                  style:
                                                      Get.textTheme.bodyText1,
                                                  textAlign: TextAlign.start,
                                                ),
                                              ),
                                            ],
                                          )),
                                    ),
                                    wpart == null
                                        ? Row(
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  process = "passport";
                                                  _bottomsheet(
                                                      context, process);
                                                },
                                                child: Container(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      color:
                                                          Colors.grey.shade400),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: const [
                                                      Icon(
                                                        Icons.image,
                                                        size: 30,
                                                      ),
                                                      Text(
                                                        'Add Image',
                                                        style: TextStyle(
                                                            fontSize: 14),
                                                      )
                                                    ],
                                                  ).paddingSymmetric(
                                                      horizontal: 20,
                                                      vertical: 20),
                                                ),
                                              ),
                                            ],
                                          )
                                        : Row(
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                child: Center(
                                                  child: Image.file(
                                                    wpart!,
                                                    height: 100,
                                                    width: 100,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                  ],
                                ),
                              )
                            : Container(),
                      ],
                    ),
                    // BlockButtonWidget(
                    //   onPressed: () {
                    //     // showDialog(
                    //     //     barrierDismissible: false,
                    //     //     context: context,
                    //     //     builder: (_) {
                    //     //       // return CustomDialog();
                    //     //
                    //     //       return Alert();
                    //     //     });
                    //
                    //     print("fromOnTap");
                    //
                    //     if (phoneNumberController.text == "") {
                    //       showToast("Please enter phone number");
                    //     } else if (click == "") {
                    //       showToast("Please choose company type first");
                    //     } else if (countryValue == "") {
                    //       showToast("Please select the country");
                    //     } else if (stateValue == "") {
                    //       showToast("Please select the state");
                    //     } else if (cityValue == "") {
                    //       showToast("Please select the cityValue");
                    //     } else if (pincodeController.text == "") {
                    //       showToast("Please enter the pincode");
                    //     } else if (companyAddressController.text == "") {
                    //       showToast("Please enter the company address");
                    //     } else {
                    //       ApiInterface().registerPrivateFsm(
                    //           widget.fullName
                    //           ,widget.companyName,
                    //           widget.emailAddress,
                    //           widget.passwordValue,
                    //           phoneNumberController.text,
                    //           countryValue,
                    //           stateValue,
                    //           cityValue,
                    //           pincodeController.text,
                    //           companyAddressController.text
                    //       ).then((value) => {
                    //         print("fromApiCallSomething ${value.response?.status}"),
                    //         if(value.response?.status == "success"){
                    //           Get.to(const NewLoginScreen()),
                    //         }else if(value.response?.status == "0"){
                    //           showToast("Something went wrong"),
                    //     }
                    //       });
                    //     }
                    //   },
                    //   color: Colors.orange,
                    //   text: Text(
                    //     "Submit".tr,
                    //     style: Get.textTheme.headline6!
                    //         .merge(TextStyle(color: Colors.white)),
                    //   ),
                    // ).paddingOnly(top: 25, bottom: 25, right: 20, left: 20),
                    Row(
                      children: [
                        Material(
                          child: Checkbox(
                            activeColor: Colors.orange,
                            checkColor: Colors.white,
                            value: agree,
                            onChanged: (value) {
                              setState(() {
                                agree = value ?? false;
                              });
                            },
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            showDialog(
                              context: context,
                              builder: (ctx) => AlertDialog(
                                title: const Text("Terms and Conditions !!"),
                                content: SingleChildScrollView(
                                  child: Html(
                                    data: htmlContent,
                                    onLinkTap: (url, _, __, ___) {
                                      // Handle link taps if needed
                                      // For example, you can launch URLs in a web browser
                                    },
                                  ),
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(ctx).pop();
                                      agree = true;
                                    },
                                    child: Container(
                                      color: Colors.orange,
                                      padding: const EdgeInsets.all(14),
                                      child: const Text("Accept",style: TextStyle(color: Colors.black),),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          child: const Text(
                            'I have read and accept terms and conditions',
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                      ],
                    ).paddingOnly(top: 0, bottom: 0, right: 20, left: 20),
                    Container(
                      width: Get.size.width,
                      height: 52,
                      //color: Colors.orange,
                      decoration: const BoxDecoration(
                          color: Colors.orange,
                          borderRadius:
                          BorderRadius.all(Radius.circular(10))),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent),
                        onPressed: () async {
                          print("onTapssss");
                          setState(() {
                            isLoading1 = true;
                          });
                          await Future.delayed(const Duration(seconds: 2));
                          setState(() {
                            isLoading1 = false;
                          });
                          if (isLoading1 == false) {
                            if (phoneNumberController.text == "") {
                              showToast("Please enter phone number");
                            }
                            else if (click == "") {
                              showToast("Please choose company type first");
                            }
                            else if (countryValue == "")
                            {
                              showToast("Please select the country");
                            } else if (stateValue == "")
                            {
                              showToast("Please select the state");
                            } else if (cityValue == "") {
                              showToast("Please select the cityValue");
                            }
                            else if (pincodeController.text == "") {
                              showToast("Please enter the pincode");
                            }
                            else if (companyAddressController.text == "") {
                              showToast("Please enter the company address");
                            }
                            else if (agree !=true) {
                              showToast("Please accept the terms and conditions");
                            }
                            else {
                              ApiInterface().registerPrivateFsm(
                                  widget.fullName
                                  ,widget.companyName,
                                  widget.emailAddress,
                                  widget.passwordValue,
                                  phoneNumberController.text,
                                  countryValue,
                                  stateValue,
                                  cityValue,
                                  pincodeController.text,
                                  companyAddressController.text
                              ).then((value) => {

                                if(value.response?.status == "success"){
                                  //showToast(value.response?.message.toString() ?? "Registered Successfully!"),
                                showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return  AlertDialog(
                                      scrollable: true,
                                      contentPadding: EdgeInsets.zero,
                                      content: SizedBox(
                                        width: size.width * 0.9,
                                        child: Column(
                                          children: [
                                            SizedBox(
                                                height: size.width * 0.4,
                                                width: size.width * 0.4,
                                                child: Lottie.network(
                                                    'https://assets4.lottiefiles.com/packages/lf20_sjeuhlxx.json')),
                                            Text(
                                              'Registration Successful'.tr,
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 20),
                                            ),
                                            ElevatedButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                                Get.to( NewLoginScreen());
                                                // Get.back();
                                              },
                                              style: ElevatedButton.styleFrom(
                                                  shape: const StadiumBorder(), primary: Colors.orange),
                                              child: const Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 15.0, vertical: 5.0),
                                                child: Text('Ok',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight: FontWeight.w500,
                                                        fontSize: 16)),
                                              ),
                                            ).marginOnly(bottom: 20.0, top: 8.0),
                                          ],
                                        ),
                                      ));
                                },
                              )
                            }else if(value.response?.status == "0"){
                                  showToast(value.response?.message.toString() ?? "Entered Mobile Number Already Exists!"),
                                }else{
                                  showToast("Something went wrong!"),
                                }
                              });
                            }
                          }
                        },
                        child: (isLoading1)
                            ? const SizedBox(
                            width: 16,
                            height: 16,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 1.5,
                            ))
                            : const Text("Submit",
                            style: TextStyle(fontSize: 20,color: Colors.white)),
                      ),
                    ).paddingOnly(top: 5, bottom: 25, right: 20, left: 20),
                  ],
                )
              ],
            ),
    );
  }

  void _bottomsheet(BuildContext context, process) {
    showModalBottomSheet(
        context: context,
        isDismissible: true,
        builder: (context) {
          return Container(
            color: const Color(0xFF737373),
            height: 120,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Row(
                // mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          if (process.toString() == "process") {
                            getcam();
                          } else if (process.toString() == "passport") {
                            getpcam();
                          }
                        },
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.camera_enhance_rounded,
                              size: 40,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Camera',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          if (process.toString() == "proof") {
                            getgall();
                          } else if (process.toString() == "passport") {
                            getpgall();
                          }
                          Navigator.pop(context);
                        },
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.image,
                              size: 40,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Gallery',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      )),
                ],
              ),
            ),
          );
        });
  }

  void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
    );
  }

  void _submit() {
    Navigator.pop(context, _selectedItems);
  }

  void _showMultiSelect(List<String?>? items) async {
    final List<String>? results = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return MultiSelect(items: items ?? []);
      },
    );

    // Update UI
    if (results != null) {
      setState(() {
        _selectedItems = results;
      });
    }
    //}
  }
}

class MultiSelect extends StatefulWidget {
  final List<String?>? items;
  const MultiSelect({Key? key, required this.items}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MultiSelectState();
}

class _MultiSelectState extends State<MultiSelect> {
  // this variable holds the selected items
  final List<String> _selectedItems = [];

// This function is triggered when a checkbox is checked or unchecked
  void _itemChange(String itemValue, bool isSelected) {
    setState(() {
      if (isSelected) {
        _selectedItems.add(itemValue);
      } else {
        _selectedItems.remove(itemValue);
      }
    });
  }

  // this function is called when the Cancel button is pressed
  void _cancel() {
    Navigator.pop(context);
  }

// this function is called when the Submit button is tapped
  void _submit() {
    Navigator.pop(context, _selectedItems);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return AlertDialog(
      title: const Text('Select your industry'),
      content: Container(
        width: size.width * 0.9,
        child: SingleChildScrollView(
          child: ListBody(
            children: widget.items!
                .map((item) => CheckboxListTile(
                      value: _selectedItems.contains(item),
                      title: Text(item!),
                      controlAffinity: ListTileControlAffinity.leading,
                      onChanged: (isChecked) => _itemChange(item, isChecked!),
                    ))
                .toList(),
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: _cancel,
          child: const Text(
            'Cancel',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 15.0),
          child: ElevatedButton(
            onPressed: _submit,
            child: const Text('Submit'),
            style: ElevatedButton.styleFrom(
              primary: Colors.orange,
              //onPrimary: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}

class Alert extends StatefulWidget {
  const Alert({Key? key}) : super(key: key);

  @override
  State<Alert> createState() => _AlertState();
}

class _AlertState extends State<Alert> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return AlertDialog(
        scrollable: true,
        contentPadding: EdgeInsets.zero,
        // title: Text('Update Status'),
        content: Container(
          width: size.width * 0.9,
          child: Column(
            children: [
              Container(
                  height: size.width * 0.4,
                  width: size.width * 0.4,
                  child: Lottie.network(
                      'https://assets4.lottiefiles.com/packages/lf20_sjeuhlxx.json')),
              Text(
                'Registration Successful'.tr,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 20),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Get.to( NewLoginScreen());
                  // Get.back();
                },
                style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(), primary: Colors.orange),
                child: const Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 5.0),
                  child: Text('Ok',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 16)),
                ),
              ).marginOnly(bottom: 20.0, top: 8.0),
            ],
          ),
        ));
  }
}
