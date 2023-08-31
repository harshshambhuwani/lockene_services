// /*
//  * Copyright (c) 2020 .
//  */
//
// import 'dart:ui';
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
//
// class FilterBottomSheetWidget extends GetView<SearchController> {
//   // int _value = 1;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: Get.height*0.45,
//       decoration: BoxDecoration(
//         color:Colors.white,
//         borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
//         boxShadow: [
//           BoxShadow(color: Get.theme.focusColor.withOpacity(0.4), blurRadius: 30, offset: Offset(0, -30)),
//         ],
//       ),
//       child: ListView(children: [
//             Container(
//               height: 30,
//               width: double.infinity,
//               padding: EdgeInsets.symmetric(vertical: 13, horizontal: (Get.width / 2) - 30),
//               decoration: BoxDecoration(
//                 color: Get.theme.focusColor.withOpacity(0.1),
//                 borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
//               ),
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: Get.theme.focusColor.withOpacity(0.5),
//                   borderRadius: BorderRadius.circular(3),
//                 ),
//                 //child: SizedBox(height: 1,),
//               ),
//             ),
//
//         RadioList(),
//         ]));
//   }
// }
//
// class RadioList extends StatefulWidget {
//   const RadioList({Key? key}) : super(key: key);
//
//   @override
//   State<RadioList> createState() => _RadioListState();
// }
//
// class _RadioListState extends State<RadioList> {
//   int? _selectedValue;
//
//   List<Widget> _buildRadioListTiles() {
//     return [
//       Container(
//         padding: EdgeInsets.only(top: 10,bottom: 5.0),
//         child: Row(
//           children: [
//             Expanded(child: Text("Filter".tr, style: Get.textTheme.headline5!.merge(TextStyle(color: Colors.black)))),
//             MaterialButton(
//               onPressed: () {
//                 // controller.searchEServices(keywords: controller.textEditingController!.text);
//                 Get.back();
//                 print(_selectedValue);
//               },
//               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//               color: Colors.orange,
//               child: Text("Apply".tr, style: Get.textTheme.subtitle1!.merge(TextStyle(color: Colors.white))),
//               elevation: 0,
//             ),
//           ],
//         ),
//       ),
//       Container(
//         color: Colors.grey,
//         height: Get.height * 0.002,
//       ).paddingSymmetric(vertical: 5.0),
//       RadioListTile(
//         contentPadding: EdgeInsets.zero,
//         title: Text('All',
//           style: Get.textTheme.subtitle1!
//               .merge(TextStyle(fontWeight: FontWeight.w400)),
//         ),
//         value: 0,
//         groupValue: _selectedValue,
//         onChanged: (value) {
//           setState(() {
//             _selectedValue = value as int?;
//           });
//         },
//         controlAffinity:
//         ListTileControlAffinity.trailing,
//         activeColor: Colors.orange,
//
//       ),
//       RadioListTile(
//         contentPadding: EdgeInsets.zero,
//         title: Text('Quotes',
//           style: Get.textTheme.subtitle1!
//               .merge(TextStyle(fontWeight: FontWeight.w400)),
//         ),
//         value: 1,
//         groupValue: _selectedValue,
//         onChanged: (value) {
//           setState(() {
//             _selectedValue = value as int?;
//           });
//         },
//         controlAffinity:
//         ListTileControlAffinity.trailing,
//         activeColor: Colors.orange,
//
//       ),
//       RadioListTile(
//         contentPadding: EdgeInsets.zero,
//
//         title: Text('Scheduled Jobs',
//           style: Get.textTheme.subtitle1!
//               .merge(TextStyle(fontWeight: FontWeight.w400)),
//         ),
//         value: 2,
//         groupValue: _selectedValue,
//         onChanged: (value) {
//           setState(() {
//             _selectedValue = value as int?;
//           });
//         },
//         controlAffinity:
//         ListTileControlAffinity.trailing,
//         activeColor: Colors.orange,
//
//       ),
//       RadioListTile(
//         contentPadding: EdgeInsets.zero,
//
//         title: Text('Invoices',
//           style: Get.textTheme.subtitle1!
//               .merge(TextStyle(fontWeight: FontWeight.w400)),
//         ),
//         value: 3,
//         groupValue: _selectedValue,
//
//         onChanged: (value) {
//           setState(() {
//             _selectedValue = value as int?;
//           });
//         },
//         controlAffinity:
//         ListTileControlAffinity.trailing,
//         // selectedTileColor: Colors.orange,
//         activeColor: Colors.orange,
//       ),
//       RadioListTile(
//         contentPadding: EdgeInsets.zero,
//
//         title: Text('Installations',
//           style: Get.textTheme.subtitle1!
//               .merge(TextStyle(fontWeight: FontWeight.w400)),
//         ),
//         value: 4,
//         groupValue: _selectedValue,
//
//         onChanged: (value) {
//           setState(() {
//             _selectedValue = value as int?;
//           });
//         },
//         controlAffinity:
//         ListTileControlAffinity.trailing,
//         // selectedTileColor: Colors.orange,
//         activeColor: Colors.orange,
//       ),
//       RadioListTile(
//         contentPadding: EdgeInsets.zero,
//
//         title: Text('Services',
//           style: Get.textTheme.subtitle1!
//               .merge(TextStyle(fontWeight: FontWeight.w400)),
//         ),
//         value: 5,
//         groupValue: _selectedValue,
//
//         onChanged: (value) {
//           setState(() {
//             _selectedValue = value as int?;
//           });
//         },
//         controlAffinity:
//         ListTileControlAffinity.trailing,
//         // selectedTileColor: Colors.orange,
//         activeColor: Colors.orange,
//       ),
//     ];
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children:  _buildRadioListTiles(),).paddingOnly(top: 00, bottom: 0, left: 20, right: 20);
//   }
// }
//
// // children:  _buildRadioListTiles(),).paddingOnly(top: 00, bottom: 0, left: 4, right: 4);
