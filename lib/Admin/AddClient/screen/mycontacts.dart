// import 'package:contacts_service/contacts_service.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:service/features/profile/widgets/phone_field_widget.dart';
//
// import '../../../features/common/block_button_widget.dart';
// import '../../../features/common/circular_loading_widget.dart';
// import '../../../features/common/text_field_widget.dart';
// import '../../../features/common/ui.dart';
// import '../../../routes/app_routes.dart';
// import '../../../styles/styles.dart';
// import '../controller/addclient_controller.dart';
//
//
//
// class MyContactView extends GetView<AddClientController>{
//
//   final arg = Get.arguments;
//
//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     controller.loginFormKey = new GlobalKey<FormState>();
//
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text(
//             "My Contacts".tr,
//             style: Get.textTheme.subtitle1!.merge(TextStyle(fontWeight: FontWeight.w500,color: Colors.black)),
//           ),
//           centerTitle: true,
//           // backgroundColor: Colors.orange,
//           backgroundColor: Colors.grey.shade50,
//           automaticallyImplyLeading: false,
//           elevation: 0,
//           leading: new IconButton(
//             icon: new Icon(Icons.arrow_back_ios, color: Colors.black),
//             onPressed: () => {
//               Get.back(),
//             },
//           ),
//         ),
//         body: GetHours(),
//
//       ),
//     );
//   }
// }
//
// class GetHours extends StatefulWidget {
//   const GetHours({Key? key}) : super(key: key);
//
//   @override
//   State<GetHours> createState() => _GetHoursState();
// }
//
// class _GetHoursState extends State<GetHours> {
//   List<Contact> contacts = [];
//   List<Contact> contactsFiltered = [];
//
//   TextEditingController searchController = new TextEditingController();
//
//   @override
//   void initState() {
//     super.initState();
//     getAllContacts();
//     searchController.addListener(() {
//     filterContacts();
//     });
//     // Add code after super
//   }
//
//  getAllContacts() async {
//   List<Contact> _contacts = (await ContactsService.getContacts()).toList();
//   setState(() {
//     contacts = _contacts;
//   });
//
// }
//
//    filterContacts() {
//     List<Contact> _contacts =[];
//     _contacts.addAll(contacts);
//    if(searchController.text.isNotEmpty){
//       _contacts.retainWhere((contact) {
//       String searchTerm = searchController.text.toLowerCase();
//       String contactName = contact.displayName.toLowerCase();
//       bool nameMatches = contactName.contains(searchTerm);
//       if(nameMatches== true){
//         return true;
//       }
//       var phone =  contact.phones.firstWhere((phn) {
//         return phn.value.contains(searchTerm);
//
//       },orElse: ()=> null);
//       return phone != null;
//       });
//
//       setState(() {
//         contactsFiltered =_contacts;
//       });
//    }
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     bool isSearching = searchController.text.isNotEmpty;
//     return Scaffold(
//       body: Column(
//         children: [
//           Container(
//             child: TextField(
//               controller: searchController,
//
//               decoration: InputDecoration(
//                 focusColor: Colors.grey,
//                 hoverColor: Colors.grey,
//                 contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 5.0),
//                 labelText: "Search",
//                 labelStyle: TextStyle(color: Colors.grey),
//                 border: OutlineInputBorder(
//                   borderSide: BorderSide(
//                     color: Colors.grey,
//                   ),borderRadius: BorderRadius.circular(8)
//                 ),
//
//                 focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(
//                       color: Colors.grey,
//                     ),borderRadius: BorderRadius.circular(8)
//                 ),
//
//                 prefixIcon: Icon(Icons.search,color: Colors.grey,)
//               ),
//
//             ),
//           ).marginOnly(left: 20.0,right: 20.0,top: 10,bottom: 5.0),
//           Expanded(
//             child: ListView.builder(
//                 shrinkWrap: true,
//                 itemCount:isSearching== true?contactsFiltered.length:contacts.length,
//                 itemBuilder: (BuildContext context, int index){
//                   Contact  contact = isSearching== true?contactsFiltered[index]:contacts[index];
//                   return ListTile(
//                     title: Text(contact.displayName),
//                     subtitle: Text(contact.phones.elementAt(0).value),
//                     leading: (contact.avatar != null && contact.avatar.length>0)?
//                     CircleAvatar(
//                       backgroundImage: MemoryImage(contact.avatar),
//                     ):CircleAvatar(child: Text(contact.initials()),),
//                   );
//                 },
//             ),
//           ),
//         ],
//       )
//
//     );
//   }
//
//
//
//
//
// }
//
// class Drop extends StatefulWidget {
//   const Drop({Key? key}) : super(key: key);
//
//   @override
//   State<Drop> createState() => _DropState();
// }
//
// class _DropState extends State<Drop> {
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           Container(
//             padding: EdgeInsets.only(top: 20, bottom: 10, left: 20, right: 20),
//             margin: EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 0),
//             decoration: BoxDecoration(
//                 color: page,
//                 borderRadius: BorderRadius.vertical(bottom: Radius.circular(10.0)),
//                 boxShadow: [
//                   BoxShadow(color: Get.theme.focusColor.withOpacity(0.1), blurRadius: 10, offset: Offset(0, 5)),
//                 ],
//                 border: Border.all(color: Get.theme.focusColor.withOpacity(0.05))),
//             child: Column(
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text('Full Address',style: Get.textTheme.bodyText1,
//                       textAlign: TextAlign.start,),
//                   ],
//                 ).paddingOnly(bottom: 10.0),
//                 Row(
//                   children: [
//                     // Icon(Icons.home,color: Colors.grey.shade500,).marginOnly(right: 14),
//                     Container(
//                       width: Get.height * 0.025,
//                       height: Get.height * 0.025,
//                       child: Image.network('https://cdn-icons-png.flaticon.com/512/3203/3203071.png',color: Colors.grey.shade500,),
//                     ).paddingOnly(right: 14.0),
//                     Expanded(
//                       child: TextFormField(
//                         cursorColor: Colors.orange,
//                         decoration: InputDecoration(
//                           isDense: true,
//                           contentPadding: EdgeInsets.symmetric(vertical: 5.0),
//                           hintText: 'Address Line 1',
//                           hintStyle: TextStyle(fontSize: 12),
//                           // labelText: 'Invoice title',
//                           labelStyle: TextStyle(color: Colors.black),
//                           enabledBorder: UnderlineInputBorder(
//                             borderSide: BorderSide(color: page),
//                           ),
//                           focusedBorder: UnderlineInputBorder(
//                             borderSide: BorderSide(color: page),
//                           ),
//                         ),
//                       ),
//                     )
//                   ],
//                 ).paddingOnly(bottom: 5.0),
//                 Row(
//                   children: [
//                     Container(
//                       width: Get.height * 0.025,
//                       height: Get.height * 0.025,
//                       child: Image.network('https://cdn-icons-png.flaticon.com/512/3203/3203071.png',color: Colors.grey.shade500,),
//                     ).paddingOnly(right: 14.0),
//                     Expanded(
//                       child: TextFormField(
//                         cursorColor: Colors.orange,
//                         decoration: InputDecoration(
//                           isDense: true,
//                           contentPadding: EdgeInsets.symmetric(vertical: 5.0),
//                           hintText: 'Address Line 2',
//                           hintStyle: TextStyle(fontSize: 12),
//                           // labelText: 'Invoice title',
//                           labelStyle: TextStyle(color: Colors.black),
//                           enabledBorder: UnderlineInputBorder(
//                             borderSide: BorderSide(color: page),
//                           ),
//                           focusedBorder: UnderlineInputBorder(
//                             borderSide: BorderSide(color: page),
//                           ),
//                         ),
//                       ),
//                     )
//                   ],
//                 ).paddingOnly(bottom: 5.0),
//                 Row(
//                   children: [
//                     Container(
//                       width: Get.height * 0.025,
//                       height: Get.height * 0.025,
//                       child: Image.network('https://cdn-icons-png.flaticon.com/512/2942/2942076.png',color: Colors.grey.shade500,),
//                     ).paddingOnly(right: 14.0),
//                     Expanded(
//                       child: TextFormField(
//                         cursorColor: Colors.orange,
//                         decoration: InputDecoration(
//                           isDense: true,
//                           contentPadding: EdgeInsets.symmetric(vertical: 5.0),
//                           hintText: 'City',
//                           hintStyle: TextStyle(fontSize: 12),
//                           // labelText: 'Invoice title',
//                           labelStyle: TextStyle(color: Colors.black),
//                           enabledBorder: UnderlineInputBorder(
//                             borderSide: BorderSide(color: page),
//                           ),
//                           focusedBorder: UnderlineInputBorder(
//                             borderSide: BorderSide(color: page),
//                           ),
//                         ),
//                       ),
//                     )
//                   ],
//                 ).paddingOnly(bottom: 5.0),
//                 Row(
//                   children: [
//                     Container(
//                       width: Get.height * 0.025,
//                       height: Get.height * 0.025,
//                       child: Image.network('https://cdn-icons-png.flaticon.com/512/5042/5042691.png',color: Colors.grey.shade500,),
//                     ).paddingOnly(right: 14.0),
//                     Expanded(
//                       child: TextFormField(
//                         cursorColor: Colors.orange,
//                         decoration: InputDecoration(
//                           isDense: true,
//                           contentPadding: EdgeInsets.symmetric(vertical: 5.0),
//                           hintText: 'State',
//                           hintStyle: TextStyle(fontSize: 12),
//                           // labelText: 'Invoice title',
//                           labelStyle: TextStyle(color: Colors.black),
//                           enabledBorder: UnderlineInputBorder(
//                             borderSide: BorderSide(color: page),
//                           ),
//                           focusedBorder: UnderlineInputBorder(
//                             borderSide: BorderSide(color: page),
//                           ),
//                         ),
//                       ),
//                     )
//                   ],
//                 ).paddingOnly(bottom: 5.0),
//                 Row(
//                   children: [
//                     Container(
//                         width: Get.height * 0.025,
//                         height: Get.height * 0.025,
//                         child: Icon(Icons.numbers,color: Colors.grey.shade500,)
//                     ).paddingOnly(right: 14.0),
//                     Expanded(
//                       child: TextFormField(
//                         cursorColor: Colors.orange,
//                         decoration: InputDecoration(
//                           isDense: true,
//                           contentPadding: EdgeInsets.symmetric(vertical: 5.0),
//                           hintText: 'Postal Code',
//                           hintStyle: TextStyle(fontSize: 12),
//                           // labelText: 'Invoice title',
//                           labelStyle: TextStyle(color: Colors.black),
//                           enabledBorder: UnderlineInputBorder(
//                             borderSide: BorderSide(color: page),
//                           ),
//                           focusedBorder: UnderlineInputBorder(
//                             borderSide: BorderSide(color: page),
//                           ),
//                         ),
//                       ),
//                     )
//                   ],
//                 ).paddingOnly(bottom: 5.0),
//                 Row(
//                   children: [
//                     Container(
//                       width: Get.height * 0.025,
//                       height: Get.height * 0.025,
//                       child: Image.network('https://cdn-icons-png.flaticon.com/512/44/44386.png',color: Colors.grey.shade500,),
//                     ).paddingOnly(right: 14.0),
//                     Expanded(
//                       child: TextFormField(
//                         cursorColor: Colors.orange,
//                         decoration: InputDecoration(
//                           isDense: true,
//                           contentPadding: EdgeInsets.symmetric(vertical: 5.0),
//                           hintText: 'Country',
//                           hintStyle: TextStyle(fontSize: 12),
//                           // labelText: 'Invoice title',
//                           labelStyle: TextStyle(color: Colors.black),
//                           enabledBorder: UnderlineInputBorder(
//                             borderSide: BorderSide(color: page),
//                           ),
//                           focusedBorder: UnderlineInputBorder(
//                             borderSide: BorderSide(color: page),
//                           ),
//                         ),
//                       ),
//                     )
//                   ],
//                 ).paddingOnly(bottom: 10.0),
//
//                 // TextFormField(
//                 //   cursorColor: Colors.orange,
//                 //
//                 //   decoration: InputDecoration(
//                 //     isDense: true,
//                 //     contentPadding: EdgeInsets.symmetric(vertical: 5.0),
//                 //     hintText: 'City',
//                 //     hintStyle: TextStyle(fontSize: 12),
//                 //     // labelText: 'Invoice title',
//                 //     labelStyle: TextStyle(color: Colors.black),
//                 //     enabledBorder: UnderlineInputBorder(
//                 //       borderSide: BorderSide(color: page),
//                 //     ),
//                 //     focusedBorder: UnderlineInputBorder(
//                 //       borderSide: BorderSide(color: theme1),
//                 //     ),
//                 //   ),
//                 // ).paddingOnly(bottom: 5.0),
//
//
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
// }
//
