// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key? key, this.title}) : super(key: key);
//
//   final String? title;
//
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Test(),
//     );
//   }
// }
//
// class Test extends StatefulWidget {
//   @override
//   _TestState createState() => _TestState();
// }
//
// class _TestState extends State<Test> {
//   ValueNotifier<Color> currentColor = ValueNotifier(Colors.grey);
//
//   void changecolor(Color color) {
//     setState(() {
//       currentColor.value = color;
//     });
//   }
//
//   List<Widget> list = [];
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Stack(
//         children: [
//           Container(
//             height: MediaQuery.of(context).size.height,
//             width: MediaQuery.of(context).size.width,
//           ),
//           Positioned(
//             right: 50,
//             top: 50,
//             child: ElevatedButton(
//               elevation: 3.0,
//               onPressed: () {
//                 showDialog(
//                   context: context,
//                   builder: (BuildContext context) {
//                     return AlertDialog(
//                       titlePadding: const EdgeInsets.all(0.0),
//                       contentPadding: const EdgeInsets.all(0.0),
//                       content: SingleChildScrollView(
//                         child: MaterialPicker(
//                           pickerColor: currentColor.value,
//                           onColorChanged: changecolor,
//                           enableLabel: true,
//                         ),
//                       ),
//                     );
//                   },
//                 );
//               },
//               child: const Text('Change me'),
//              // color: currentColor.value,
//             ),
//           ),
//           ...list,
//           Positioned(
//             left: 50,
//             top: 50,
//             child: ElevatedButton(
//               child: Text(
//                 'Add another Color Sticker',
//                 style: TextStyle(fontSize: 10),
//               ),
//               onPressed: () {
//                 setState(
//                       () {
//                     list.add(ValueListenableBuilder(
//                         valueListenable: currentColor,
//                         builder: (BuildContext context, Color current,
//                             Widget child) {
//                           return Positioned(
//                             left: 100,
//                             top: 100,
//                             child: Container(
//                               color: current,
//                               height: 100,
//                               width: 100,
//                             ),
//                           );
//                         }));
//                   },
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
