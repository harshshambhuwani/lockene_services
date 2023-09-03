import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
class HtmlContentScreen extends StatelessWidget {
  final String htmlContent; // Your HTML content goes here

  HtmlContentScreen({required this.htmlContent});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HTML Content'),
      ),
      body: Container(
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: const Text("Alert Dialog Box"),
                //  content: const Text("You have raised a Alert Dialog Box"),
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
                      },
                      child: Container(
                        color: Colors.green,
                        padding: const EdgeInsets.all(14),
                        child: const Text("okay"),
                      ),
                    ),
                  ],
                ),
              );
            },
            child: const Text("Show alert Dialog box"),
          ),

// RaidedButton is deprecated and should not be used
// Instead use ElevatedButton

          // child: RaisedButton(
          // onPressed: () {
          //	 showDialog(
          //	 context: context,
          //	 builder: (ctx) => AlertDialog(
          //		 title: const Text("Alert Dialog Box"),
          //		 content: const Text("You have raised a Alert Dialog Box"),
          //		 actions: <Widget>[

          // FlatButton is deprecated and should not be used
          // Instead use TextButton

          //		 FlatButton(
          //			 onPressed: () {
          //			 Navigator.of(ctx).pop();
          //			 },
          //			 child: const Text("okay"),
          //		 ),
          //		 ],
          //	 ),
          //	 );
          // },
          // child: const Text("Show alert Dialog box"),
          // ),
        ),
      ),
      // body: SingleChildScrollView(
      //   child: Padding(
      //     padding: const EdgeInsets.all(16.0),
      //     child: Html(
      //       data: htmlContent,
      //       onLinkTap: (url, _, __, ___) {
      //         // Handle link taps if needed
      //         // For example, you can launch URLs in a web browser
      //       },
      //     ),
      //   ),
      // ),
    );
  }
}





