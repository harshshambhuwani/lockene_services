import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:slide_to_act/slide_to_act.dart';

import '../../../styles/styles.dart';
import '../../common/ui.dart';


class GetAttendenceNew extends StatefulWidget {
  const GetAttendenceNew({Key? key}) : super(key: key);

  @override
  State<GetAttendenceNew> createState() => _GetAttendenceNewState();
}

class _GetAttendenceNewState extends State<GetAttendenceNew> {
  bool intime = false;
  bool outtime = false;
  String location = 'Null,Press Button';
  String Address = 'search';




  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {

        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  Future<void> GetAddressFromLatLong(Position position) async{
    List<Placemark> placemark = await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemark);
    Placemark place = placemark[0];
    Placemark place1 = placemark[1];
    Address = "${place.street},${place1.thoroughfare},${place1.postalCode},${place1.country}";

    setState(() {
      print(Address);
    });

  }


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      width: double.infinity,
      decoration: Ui.getBoxDecoration(color: page),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    flex: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        if(!intime)
                          GestureDetector(
                          onTap: (){
                            setState(() async{
                              // Position position = await _determinePosition();
                              // // print(position.latitude);
                              // location = "Lat : ${position.latitude} , Long : ${position.longitude}";
                              // GetAddressFromLatLong(position);
                              // setState(() {
                              //   print(Address);
                              // });
                              // Get.showSnackbar(Ui.SuccessSnackBar(message: "Check In-time marked Successfully".tr));
                              //
                              // intime = true;
                              // print('hi');
                            });
                          },
                          child: Container(
                            height: 138,
                          decoration: BoxDecoration(
                            // borderRadius: BorderRadius.all(Radius.circular(10)),
                            // border: Border.all(color: Colors.grey, width: 1),
                          ),
                            child:Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // SizedBox(height: 5.0,),
                                Container(
                                  height: 70,
                                  child: Image.network("https://cdn-icons-png.flaticon.com/512/9300/9300475.png",color: Colors.green.shade700,)
                                ),
                                SizedBox(height: 20.0,),
                                  Text('Mark In-time',
                                style: Get.textTheme.subtitle1!.merge(TextStyle(color:Colors.green.shade700,)),),

                              ],
                            ),
                  ),
                        ),
                        if(intime)
                          Container(
                            // alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('CHECK IN',
                                style: Get.textTheme.subtitle1!.merge(TextStyle(color:Colors.black,fontWeight: FontWeight.w500)),),
                              SizedBox(height:10.0,),

                              Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(Icons.arrow_downward,color: Colors.green.shade700,size: 20,),
                                    SizedBox(width:3.0,),
                                    Text('10:30 AM',
                                      style: Get.textTheme.subtitle2!.merge(TextStyle(color:Colors.green.shade700,fontWeight: FontWeight.w500)),textAlign: TextAlign.start,),
                                  ],
                                ),
                              SizedBox(height:5.0,),

                              Row(
                                children: [

                                  SizedBox(width: 5),
                                  Flexible(
                                    child: Text(
                                      "Plot No.64, Shankar Nagar,Nagpur.",
                                      maxLines: 4,
                                      overflow: TextOverflow.fade,
                                      // softWrap: false,
                                      style: Get.textTheme.bodyText1!.merge(TextStyle(color: Colors.grey.shade500)),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ).paddingSymmetric(horizontal: 5.0),
                      ],
                    ),),
                Expanded(
                    flex: 4,
                    child: Container(
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.watch_later_rounded,size: 70,color: Colors.orange,),
                        Padding(
                          padding: const EdgeInsets.only(top:0.0),
                          child: Text('9 Hours',
                            style: Get.textTheme.subtitle1!.merge(TextStyle(color:Colors.orange,fontWeight: FontWeight.w500)),textAlign: TextAlign.center,),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 0.0),
                          child: Text('Working Time',
                            style: Get.textTheme.subtitle1!.merge(TextStyle(color:Colors.black,fontWeight: FontWeight.w500)),textAlign: TextAlign.center,),
                        ),
                      ],
                    ),

                )),
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      if(!outtime || !intime)
                        GestureDetector(
                          onTap: (){
                            // setState(() async{
                            //   Position position = await _determinePosition();
                            //   // print(position.latitude);
                            //   location = "Lat : ${position.latitude} , Long : ${position.longitude}";
                            //   GetAddressFromLatLong(position);
                            //   setState(() {
                            //     print(Address);
                            //   });
                            //   if(intime){
                            //     outtime = true;
                            //     Get.showSnackbar(Ui.SuccessSnackBar(message: "Check Out-time marked Successfully".tr));
                            //
                            //   }else{
                            //     // print('hi1');
                            //     Get.showSnackbar(Ui.ErrorSnackBar(message: "Please mark in-time first.".tr));
                            //
                            //   }
                            // });
                          },
                          child: Container(
                            height: 138,
                            decoration: BoxDecoration(
                              // borderRadius: BorderRadius.all(Radius.circular(10)),
                              // border: Border.all(color: Colors.grey, width: 1),
                            ),
                            child:Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // SizedBox(height: 5.0,),
                                Container(
                                    height: 70,
                                    child: Image.network("https://cdn-icons-png.flaticon.com/512/9300/9300475.png",color: Colors.red.shade700,)
                                ),
                                SizedBox(height: 20.0,),
                                Text('Mark Out',
                                  style: Get.textTheme.subtitle1!.merge(TextStyle(color:Colors.red.shade700,)),),

                              ],
                            ),
                          ),
                        ),
                      if(outtime)
                        Container(
                          // alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('CHECK OUT',
                                style: Get.textTheme.subtitle1!.merge(TextStyle(color:Colors.black,fontWeight: FontWeight.w500)),),
                              SizedBox(height:10.0,),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.arrow_upward,color: Colors.red.shade700,size: 20,),
                                  SizedBox(width:3.0,),
                                  Text('10:30 AM',
                                    style: Get.textTheme.subtitle2!.merge(TextStyle(color:Colors.red.shade700,fontWeight: FontWeight.w500)),textAlign: TextAlign.start,),
                                ],
                              ),
                              SizedBox(height:5.0,),

                              Row(
                                children: [

                                  SizedBox(width: 5),
                                  Flexible(
                                    child: Text(
                                      "Plot No.64, Shankar Nagar,Nagpur.",
                                      maxLines: 4,
                                      overflow: TextOverflow.fade,
                                      // softWrap: false,
                                      style: Get.textTheme.bodyText1!.merge(TextStyle(color: Colors.grey.shade500)),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ).paddingSymmetric(horizontal: 5.0),
                    ],
                  ),),


              ],
            ),
            // if(!intime)
            //   Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: SlideAction(
            //     borderRadius: 8,
            //     elevation: 0,
            //     outerColor: Colors.orange,
            //     sliderButtonIcon: Icon(Icons.work_outline_outlined,color: Colors.green.shade300,),
            //     text: 'Slide to Mark-In',
            //     textStyle: TextStyle(fontSize: 18,color: Colors.white),
            //     onSubmit: (){
            //       setState(() async{
            //         Position position = await _determinePosition();
            //         // print(position.latitude);
            //         location = "Lat : ${position.latitude} , Long : ${position.longitude}";
            //         GetAddressFromLatLong(position);
            //         setState(() {
            //           print(Address);
            //         });
            //         Get.showSnackbar(Ui.SuccessSnackBar(message: "Check In-time marked Successfully".tr));
            //
            //         intime = true;
            //         print('hi');
            //       });
            //     },
            //   ),
            // ),
            //
            //

            // if(intime && !outtime)
            //   Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: SlideAction(
            //     borderRadius: 8,
            //     elevation: 0,
            //     outerColor: Colors.orange,
            //     sliderButtonIcon: Icon(Icons.work_outline_outlined,color: Colors.red.shade500,),
            //     text: 'Slide to Mark-Out',
            //     textStyle: TextStyle(fontSize: 18,color: Colors.white),
            //     onSubmit: (){
            //       setState(() async{
            //         Position position = await _determinePosition();
            //         // print(position.latitude);
            //         location = "Lat : ${position.latitude} , Long : ${position.longitude}";
            //         GetAddressFromLatLong(position);
            //         setState(() {
            //           print(Address);
            //         });
            //         if(intime){
            //           outtime = true;
            //           Get.showSnackbar(Ui.SuccessSnackBar(message: "Check Out-time marked Successfully".tr));
            //
            //         }else{
            //           // print('hi1');
            //           Get.showSnackbar(Ui.ErrorSnackBar(message: "Please mark in-time first.".tr));
            //
            //         }
            //       });
            //     },
            //   ),
            // ),

          ],
        ),
      ),

    );
  }
}
