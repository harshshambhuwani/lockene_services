import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class GetFilter extends StatefulWidget {
  var value;

   GetFilter(
      {Key? key,this.value}) : super(key: key);

  @override
  State<GetFilter> createState() => _GetFilterState();
}

class _GetFilterState extends State<GetFilter> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF737373),
      height: 230,
      child: Container(
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 30,
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 13, horizontal: (Get.width / 2) - 30),
              decoration: BoxDecoration(
                color: Get.theme.focusColor.withOpacity(0.1),
                borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Get.theme.focusColor.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(3),
                ),
                //child: SizedBox(height: 1,),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 20.0, horizontal: 20.0),
              child: Row(
                mainAxisAlignment:
                MainAxisAlignment.start,
                children: [
                  Text('Sort by ',
                    style: Get.textTheme.headline6!.merge(
                      TextStyle(color: Colors.orange, height: 1.2,fontWeight: FontWeight.w500),
                    ),),
                ],
              ),
            ),
            GestureDetector(
              onTap: (){
                print("hi 1");
                Navigator.pop(context);

              },
              child: ListTile(
                leading: Icon(Icons.view_compact,color: Colors.black,),
                title: Text('By Installations',
                  style: Get.textTheme.subtitle1!.merge(
                    TextStyle(color: Colors.black, height: 1.2,fontWeight: FontWeight.w500),
                  ),),
              ),
            ),
            GestureDetector(
              onTap: (){
                print("hi 2");
                Navigator.pop(context);
              },
              child: ListTile(
                leading: Icon(Icons.build_outlined,color: Colors.black,),
                title: Text('By Servicings',
                  style: Get.textTheme.subtitle1!.merge(
                    TextStyle(color: Colors.black, height: 1.2,fontWeight: FontWeight.w500),
                  ),),

              ),
            ),
            // ListTile(
            //   leading: Icon(Icons.assignment_outlined),
            //   title: Text('By all work'),
            // ),

            // RadioListTile(
            //   title: Text(
            //     'Price : Low to High',
            //     style: TextStyle(
            //         fontSize: 14.0,
            //         color: Colors.black),
            //   ),
            //   value: 1,
            //   groupValue: widget.value,
            //   onChanged: (value) {
            //     setState(() {
            //       setState(() {
            //         value = value as int;
            //         print("hi 1");
            //         Navigator.pop(context);
            //       });
            //     });
            //   },
            //   controlAffinity:
            //   ListTileControlAffinity.trailing,
            // ),
            // RadioListTile(
            //   title: Text(
            //     'Price : High to Low',
            //     style: TextStyle(
            //         fontSize: 14.0,
            //         color: Colors.black),
            //   ),
            //   value: 2,
            //   groupValue:  widget.value,
            //   onChanged: (value) {
            //     setState(() {
            //       setState(() {
            //         value = value as int;
            //         print("hi 2");
            //         Navigator.pop(context);
            //       });
            //     });
            //   },
            //   controlAffinity:
            //   ListTileControlAffinity.trailing,
            // ),
            // RadioListTile(
            //   title: Text(
            //     "By Rating's",
            //     style: TextStyle(
            //         fontSize: 14.0,
            //         color: Colors.black),
            //   ),
            //   value: 3,
            //   groupValue:  widget.value,
            //   onChanged: (value) {
            //     setState(() {
            //       setState(() {
            //         value = value as int;
            //         print("hi 3");
            //         Navigator.pop(context);
            //       });
            //     });
            //   },
            //   controlAffinity:
            //   ListTileControlAffinity.trailing,
            // ),
            // RadioListTile(
            //   title: Text(
            //     'Latest collections',
            //     style: TextStyle(
            //         fontSize: 14.0,
            //         color: Colors.black),
            //   ),
            //   value: 4,
            //   groupValue:  widget.value,
            //   onChanged: (value) {
            //     setState(() {
            //       setState(() {
            //         value = value as int;
            //         print("hi 4");
            //         Navigator.pop(context);
            //       });
            //     });
            //   },
            //   controlAffinity:
            //   ListTileControlAffinity.trailing,
            // ),
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),

        // decoration: BoxDecoration(
        //   color: Colors.white,
        //   borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
        //   boxShadow: [
        //     BoxShadow(color: Get.theme.focusColor.withOpacity(0.4), blurRadius: 30, offset: Offset(0, -30)),
        //   ],
        // ),

      ),
    );

  }
}
