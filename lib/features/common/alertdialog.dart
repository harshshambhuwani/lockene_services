import 'package:flutter/material.dart';
import 'package:alert_dialog/alert_dialog.dart';


class AlertDialogBox extends StatelessWidget {
  const AlertDialogBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Welcome to Flutter'),
        ),
        // body: Center(
        //   child: FlatButton(
        //     child: Text('Alert Dialog'),
        //     onPressed: () async {
        //       return alert(context, title: Text('Alert'));
        //     },
        //   ),
        // ),
      ),
    );
  }
}
