
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../styles/styles.dart';
import '../../common/block_button_widget.dart';
// import '../../profile/widgets/phone_verification_bottom_sheet_widget.dart';
import '../../profile/widgets/phone_verification_bottom_sheet_widget.dart';
import '../controllers/booking_controller.dart';

class BookingActionsWidget extends GetView<BookingController> {

  const BookingActionsWidget({
    Key? key,
  }) : super(key: key);

  @override
  void initState() {
    controller;      // Add code after super
  }


  @override
  Widget build(BuildContext context) {

    return  Container(
    padding: EdgeInsets.symmetric(vertical: 10),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      boxShadow: [
        BoxShadow(color: Get.theme.focusColor.withOpacity(0.1), blurRadius: 10, offset: Offset(0, -5)),
      ],
    ),
    child: Row(
        mainAxisAlignment: MainAxisAlignment.end, children: [

        Expanded(
          child: BlockButtonWidget(
              text: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      "Update Status".tr,
                      textAlign: TextAlign.center,
                      style: Get.textTheme.headline6!.merge(
                        TextStyle(color: page),
                      ),
                    ),
                  ),
                  // Icon(Icons.check, color: page, size: 22)
                ],
              ),
              color: Colors.orange,
              onPressed: () {
                // _showAlertDialog(context,controller);
                showDialog(
                    context: context,
                    builder: (_) {
                      // return CustomDialog();
                      return CustomDialogService();
                    });

              }),
        ),
    ]).paddingSymmetric(vertical: 10, horizontal: 20),
      );

    // ;});
  }
}


class CustomDialog extends StatefulWidget {
  const CustomDialog({Key? key}) : super(key: key);

  @override
  State<CustomDialog> createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  File? file;
  File? wpart;
  File? wmachine;
  ImagePicker imagePicker = ImagePicker();
  String? valueChoose;
  List listItem = [
    'On the way',
    'In process',
    'Worked completed',
    'Not served',
  ];
  var process;

  List<XFile> imageFileList = [];
  List<XFile> wpartlist = [];
  List<XFile> wmachinelist = [];


  void selectImage() async{
    final List<XFile>? selectedImages = await imagePicker.pickMultiImage();

    setState(() {
      if(imageFileList.isEmpty){
        imageFileList.addAll(selectedImages!);
      }else{
        imageFileList.addAll(selectedImages!);
      }
    });
  }
  void selectWImage() async{
    final List<XFile>? selectedImages = await imagePicker.pickMultiImage();

    setState(() {
      if(wpartlist.isEmpty){
        wpartlist.addAll(selectedImages!);
      }else{
        wpartlist.addAll(selectedImages!);
      }
    });
  }

  void selectMImage() async{
    final List<XFile>? selectedImages = await imagePicker.pickMultiImage();

    setState(() {
      if(wmachinelist.isEmpty){
        wmachinelist.addAll(selectedImages!);
      }else{
        wmachinelist.addAll(selectedImages!);
      }
    });
  }

  getgall() async{
    var img = await imagePicker.getImage(source: ImageSource.gallery);
    setState(() {
      file = File(img!.path);
    });
  }

  getcam() async{
    var img = await imagePicker.getImage(source: ImageSource.camera);
    setState(() {
      file = File(img!.path);
    });
  }

  getwpgall() async{
    var img = await imagePicker.getImage(source: ImageSource.gallery);
    setState(() {
      wpart = File(img!.path);
    });
  }
  getwpcam() async{
    var img = await imagePicker.getImage(source: ImageSource.camera);
    setState(() {
      wpart = File(img!.path);
    });
  }
  getmpgall() async{
    var img = await imagePicker.getImage(source: ImageSource.gallery);
    setState(() {
      wmachine = File(img!.path);
    });
  }
  getmpcam() async{
    var img = await imagePicker.getImage(source: ImageSource.camera);
    setState(() {
      wmachine = File(img!.path);
    });
  }



  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return AlertDialog(
      scrollable: true,

      contentPadding: EdgeInsets.zero,
      title: Text('Update Status'),
      content: Container(
        width: size.width * 0.9,
        // height: size.height * 0.4,
        child: Column(
          children: [
            DropdownButton(
                hint: Text(
                  'Select Status',
                  style: TextStyle(fontSize: size.width * twelve),
                ),
                value: valueChoose,
                icon: Icon(Icons.arrow_drop_down),
                iconSize: 36,
                isExpanded: true,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: size.width * twelve,
                ),
                items: listItem.map((valueItem) {
                  return DropdownMenuItem(
                    value: valueItem,
                    child: Text(
                      valueItem,
                      style: TextStyle(
                          fontSize: size.width * twelve,
                          color: textColor),
                    ),
                  );
                }).toList(),
                onChanged: (
                    newValue,
                    ) {
                  setState(() {
                    valueChoose = newValue as String?;
                  });
                }).marginOnly(left: 20.0,right: 20.0,top: 20.0,bottom: 0),

            if(valueChoose=="In process")
              Container(
                // height: 80.0,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Please select image',
                      style: TextStyle(color: Colors.grey.shade700,fontWeight: FontWeight.w500,fontSize: size.width * twelve,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    if(imageFileList.isNotEmpty)
                      GestureDetector(
                        onTap: (){
                          process = "process";
                          _bottomsheet(context,process);
                        },
                        child: Row(
                          children: [
                            Text('Add more',style: TextStyle(color: Colors.orange,fontWeight: FontWeight.w500),),
                            Icon(Icons.add,color: Colors.orange,),
                          ],
                        ),
                      ),

                  ],
                ),
              ).marginOnly(left: 20.0,right: 20.0,top: 5.0,bottom: 5.0),

            if(valueChoose=="In process")
              if(imageFileList.isEmpty)
              Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      process = "process";
                      _bottomsheet(context,process);
                      },
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.image,size: 50,),
                          Text('Add Image',style: TextStyle(fontSize: 14),)
                        ],
                      ).paddingSymmetric(horizontal: 20,vertical: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey.shade400
                      ),
                    ),
                  ),
                ],
              ).paddingSymmetric(horizontal: 20,vertical: 5.0),

            if(valueChoose=="In process")
            if(imageFileList.isNotEmpty)
            Container(
                height: 120,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: GridView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: imageFileList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    ),
                    itemBuilder: (BuildContext context,int index){
                      return
                        Container(
                        decoration: BoxDecoration(color: Colors.white,),
                        child: Padding(
                          padding: const EdgeInsets.all (2.0),
                          child: Stack(
                              fit: StackFit.expand,
                              children: [
                                Image.file(
                                  File(imageFileList[index].path),
                                  fit: BoxFit.cover,
                                ), // Image.file
                                Positioned(
                                  right: 00,
                                  left: 0,
                                  child: GestureDetector(
                                    onTap: (){
                                      setState(() {
                                        imageFileList.removeAt(index);
                                      });
                                    },
                                    child: Container(
                                      color: Color.fromRGBO (167, 167, 167, 0.5019607843137255),
                                      child: Icon(Icons.delete,color: Colors.orange,),
                                    ),
                                  ), // Container
                                ),
                              ]), // Stack
                        ),
                        // Image.file(File(imageFileList[index].path),fit: BoxFit.cover,).paddingSymmetric(horizontal: 5.0,vertical: 5.0)
                      );
                    })).paddingSymmetric(horizontal: 20.0),

            if(valueChoose=="Worked completed")
              Container(
                // height: 80.0,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Please select machine image',
                      style: TextStyle(color: Colors.grey.shade700,fontWeight: FontWeight.w500,fontSize: size.width * twelve,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ).marginOnly(left: 20.0,right: 20.0,top: 5.0,bottom: 5),

            // if(valueChoose=="Worked completed")
            //   Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         Row(
            //           children: [
            //             MaterialButton(
            //               onPressed: () {
            //                 getmpcam();
            //               },
            //               height: 45,
            //               minWidth: 45,
            //               // padding: EdgeInsets.zero,
            //               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            //               color: page,
            //               child: Icon(
            //                 Icons.camera_alt_outlined,
            //                 color: Colors.black,
            //               ),
            //               elevation: 5,
            //             ),
            //             // SizedBox(width: 5.0,),
            //             Text(
            //               'OR',
            //               style: TextStyle(color: Colors.black,fontSize: size.width * twelve,
            //               ),
            //               textAlign: TextAlign.start,
            //             ).marginSymmetric(horizontal: 8.0),
            //             MaterialButton(
            //               onPressed: () {
            //                 setState(() {
            //                   getmpgall();
            //                 });
            //               },
            //               height: 40,
            //               minWidth: 40,
            //               // padding: EdgeInsets.zero,
            //               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            //               color: page,
            //               child: Icon(
            //                 Icons.image,
            //                 color: Colors.black,
            //               ),
            //               elevation: 5,
            //             ),
            //           ],
            //         ),
            //
            //         if(valueChoose=="Worked completed")
            //         // if(controller!.image != null)
            //
            //           Container(
            //             child: wmachine == null ? Center(child: Container(
            //               alignment: Alignment.center,
            //               height: 80,
            //               width: 80,
            //               child: Text("Pick Image",textAlign: TextAlign.center,),),):
            //             Container(
            //               child: Center(
            //                 child:  Image.file(
            //                   wmachine!,
            //                   height: 100,
            //                   width: 100,
            //                   fit: BoxFit.cover,
            //                 ),
            //               ),
            //             ),
            //             decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0),
            //                 border: Border.all(color: Colors.black26)),
            //           ),
            //
            //
            //       ]
            //   ).marginOnly(left: 20.0,right: 20.0,top: 0,bottom: 0),


            // if(valueChoose=="Worked completed")
            //   Container(
            //     // height: 80.0,
            //     width: double.infinity,
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         Text(
            //           'Please select part image',
            //           style: TextStyle(color: Colors.grey.shade700,fontWeight: FontWeight.w500,fontSize: size.width * twelve,
            //           ),
            //           textAlign: TextAlign.start,
            //         ),
            //         if(wpartlist.isNotEmpty)
            //           GestureDetector(
            //             onTap: (){
            //               process = "completed";
            //               _bottomsheet(context,process);
            //               },
            //             child: Row(
            //               children: [
            //                 Text('Add more',style: TextStyle(color: Colors.orange,fontWeight: FontWeight.w500),),
            //                 Icon(Icons.add,color: Colors.orange,),
            //               ],
            //             ),
            //           ),
            //       ],
            //     ),
            //   ).marginOnly(left: 20.0,right: 20.0,top: 5.0,bottom: 5.0),

            if(valueChoose=="Worked completed" && wpartlist.isEmpty)
            Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      process = "completed";
                      _bottomsheet(context, process);
                    },
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.image,
                            size: 50,
                          ),
                          Text(
                            'Add Image',
                            style: TextStyle(fontSize: 14),
                          )
                        ],
                      ).paddingSymmetric(horizontal: 20, vertical: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey.shade400),
                    ),
                  ),
                ],
              ).paddingSymmetric(horizontal: 20,vertical: 5.0),

            if(valueChoose=="Worked completed" && wpartlist.isNotEmpty)
                Container(
                    height: 120,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: GridView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: wpartlist.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                        ),
                        itemBuilder: (BuildContext context,int index){
                          return Container(
                            decoration: BoxDecoration(color: Colors.white,),
                            child: Padding(
                              padding: const EdgeInsets.all (2.0),
                              child: Stack(
                                  fit: StackFit.expand,
                                  children: [
                                    Image.file(
                                      File(wpartlist[index].path),
                                      fit: BoxFit.cover,
                                    ), // Image.file
                                    Positioned(
                                      right: 00,
                                      left: 0,
                                      child: GestureDetector(
                                        onTap: (){
                                          setState(() {
                                            wpartlist.removeAt(index);
                                          });
                                        },
                                        child: Container(
                                          color: Color.fromRGBO (167, 167, 167, 0.5019607843137255),
                                          child: Icon(Icons.delete,color: Colors.orange,),
                                        ),
                                      ), // Container
                                    ),
                                  ]), // Stack
                            ),
                            // Image.file(File(imageFileList[index].path),fit: BoxFit.cover,).paddingSymmetric(horizontal: 5.0,vertical: 5.0)
                          );
                        })).paddingSymmetric(horizontal: 20.0),

            if(valueChoose=="Worked completed")
              Container(
                // height: 80.0,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Please select machine image',
                      style: TextStyle(color: Colors.grey.shade700,fontWeight: FontWeight.w500,fontSize: size.width * twelve,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    if(wmachinelist.isNotEmpty)
                      GestureDetector(
                        onTap: (){
                          process = "wcompleted";
                          _bottomsheet(context,process);
                        },
                        child: Row(
                          children: [
                            Text('Add more',style: TextStyle(color: Colors.orange,fontWeight: FontWeight.w500),),
                            Icon(Icons.add,color: Colors.orange,),
                          ],
                        ),
                      ),
                  ],
                ),
              ).marginOnly(left: 20.0,right: 20.0,top: 5.0,bottom: 5.0),

            if(valueChoose=="Worked completed" && wmachinelist.isEmpty)
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      process = "wcompleted";
                      _bottomsheet(context, process);
                    },
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.image,
                            size: 50,
                          ),
                          Text(
                            'Add Image',
                            style: TextStyle(fontSize: 14),
                          )
                        ],
                      ).paddingSymmetric(horizontal: 20, vertical: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey.shade400),
                    ),
                  ),
                ],
              ).paddingSymmetric(horizontal: 20,vertical: 5.0),

            if(valueChoose=="Worked completed" && wmachinelist.isNotEmpty)
              Container(
                  height: 120,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: GridView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: wmachinelist.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                      ),
                      itemBuilder: (BuildContext context,int index){
                        return Container(
                          decoration: BoxDecoration(color: Colors.white,),
                          child: Padding(
                            padding: const EdgeInsets.all (2.0),
                            child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  Image.file(
                                    File(wmachinelist[index].path),
                                    fit: BoxFit.cover,
                                  ), // Image.file
                                  Positioned(
                                    right: 00,
                                    left: 0,
                                    child: GestureDetector(
                                      onTap: (){
                                        setState(() {
                                          wmachinelist.removeAt(index);
                                        });
                                      },
                                      child: Container(
                                        color: Color.fromRGBO (167, 167, 167, 0.5019607843137255),
                                        child: Icon(Icons.delete,color: Colors.orange,),
                                      ),
                                    ), // Container
                                  ),
                                ]), // Stack
                          ),
                          // Image.file(File(imageFileList[index].path),fit: BoxFit.cover,).paddingSymmetric(horizontal: 5.0,vertical: 5.0)
                        );
                      })).paddingSymmetric(horizontal: 20.0),






            TextFormField(
              minLines: 1,
              maxLines: 5,  // allow user to enter 5 line in textfield
              keyboardType: TextInputType.multiline,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                isDense: true,
                // contentPadding: EdgeInsets.only(top: 13,bottom: 13,left: 13,right: 13),
                labelText: "Remark",
                labelStyle:TextStyle(color: Colors.grey),
                hintStyle: TextStyle(color: Colors.grey),
                hintText: "Enter Remark",
                fillColor: Colors.white,
                focusColor: Colors.grey,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),//<-- SEE HERE
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),//<-- SEE HERE
                ),

              ),
            ).marginOnly(left: 20.0,right: 20.0,bottom: 5.0 ),

            GestureDetector(
              onTap: (){
                Navigator.pop(context);
                // controller!.statusUpdated(showMessage: true);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 15.0),
                child: Container(
                  alignment: Alignment.center,
                  height: 50.0,
                  child: Text(
                    'Save',
                    style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: size.width * fourteen,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.0),
                    color: Colors.orange,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );

  }

  void _bottomsheet(BuildContext context, process) {
    showModalBottomSheet(context: context, isDismissible: true,builder: (context){
      return Container(
        color: Color(0xFF737373),
        height: 120,
        child: Container(
          child: Row(
            // mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: (){
                      getcam();
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.camera_enhance_rounded,size: 40,),
                        SizedBox(height: 10,),
                        Text('Camera',style: TextStyle(color: Colors.black,fontSize: 16.0,fontWeight: FontWeight.w500),),
                      ],
                    ),
                  )
              ),
              Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: (){
                      if(process.toString()=="process"){
                        selectImage();
                      }else if(process.toString()=="completed"){
                        selectWImage();
                      }else if(process.toString()=="wcompleted"){
                        selectMImage();
                      }
                      Navigator.pop(context);

                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.image,size: 40,),
                        SizedBox(height: 10,),
                        Text('Gallery',style: TextStyle(color: Colors.black,fontSize: 16.0,fontWeight: FontWeight.w500),)
                      ],
                    ),
                  )
              ),

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

    });

  }

}

class CustomDialogService extends StatefulWidget {
  const CustomDialogService({Key? key}) : super(key: key);

  @override
  State<CustomDialogService> createState() => _CustomDialogServiceState();
}

class _CustomDialogServiceState extends State<CustomDialogService> {

  File? file;
  File? uwfile;
  File? wpart;
  File? wmachine;
  List<XFile> imageFileList = [];
  List<XFile> wpartlist = [];
  List<XFile> wmachinelist = [];
  List<XFile> unwarrantylist = [];
  ImagePicker imagePicker = ImagePicker();
  String? valueChoose;
  List listItem = [
    'On the way',
    'In process',
    'Part change required',
    'Part replacement under warranty',
    'Part replacement under non-warranty',
    'Worked completed',
    'Not served',
  ];
  bool _value = false;
  var process;

  void selectImage() async{
    final List<XFile>? selectedImages = await imagePicker.pickMultiImage();

    setState(() {
      if(imageFileList.isEmpty){
        imageFileList.addAll(selectedImages!);
      }else{
        imageFileList.addAll(selectedImages!);
      }
    });
  }

  void selectWImage() async{
    final List<XFile>? selectedImages = await imagePicker.pickMultiImage();

    setState(() {
      if(wpartlist.isEmpty){
        wpartlist.addAll(selectedImages!);
      }else{
        wpartlist.addAll(selectedImages!);
      }
    });
  }

  void selectMImage() async{
    final List<XFile>? selectedImages = await imagePicker.pickMultiImage();

    setState(() {
      if(wmachinelist.isEmpty){
        wmachinelist.addAll(selectedImages!);
      }else{
        wmachinelist.addAll(selectedImages!);
      }
    });
  }

  void selectUWImage() async{
    final List<XFile>? selectedImages = await imagePicker.pickMultiImage();
    setState(() {
      if(unwarrantylist.isEmpty){
        unwarrantylist.addAll(selectedImages!);
      }else{
        unwarrantylist.addAll(selectedImages!);
      }
    });
  }



  getgall() async{
    var img = await imagePicker.getImage(source: ImageSource.gallery);
    setState(() {
      file = File(img!.path);
    });
  }
  getcam() async{
    var img = await imagePicker.getImage(source: ImageSource.camera);
    setState(() {
      file = File(img!.path);
    });
  }
  getuwgall() async{
    var img = await imagePicker.getImage(source: ImageSource.gallery);
    setState(() {
      uwfile = File(img!.path);
    });
  }
  getuwcam() async{
    var img = await imagePicker.getImage(source: ImageSource.camera);
    setState(() {
      uwfile = File(img!.path);
    });
  }
  getwpgall() async{
    var img = await imagePicker.getImage(source: ImageSource.gallery);
    setState(() {
      wpart = File(img!.path);
    });
  }
  getwpcam() async{
    var img = await imagePicker.getImage(source: ImageSource.camera);
    setState(() {
      wpart = File(img!.path);
    });
  }
  getmpgall() async{
    var img = await imagePicker.getImage(source: ImageSource.gallery);
    setState(() {
      wmachine = File(img!.path);
    });
  }
  getmpcam() async{
    var img = await imagePicker.getImage(source: ImageSource.camera);
    setState(() {
      wmachine = File(img!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return AlertDialog(
      scrollable: true,
      contentPadding: EdgeInsets.zero,
      title: Text('Update Status'),
      content: Container(
        width: size.width * 0.9,
        // height: size.height * 0.4,
        child: Column(
          children: [
            DropdownButton(
                hint: Text(
                  'Select Status',
                  style: TextStyle(fontSize: size.width * twelve),
                ),
                value: valueChoose,
                icon: Icon(Icons.arrow_drop_down),
                iconSize: 36,
                isExpanded: true,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: size.width * twelve,
                ),
                items: listItem.map((valueItem) {
                  return DropdownMenuItem(
                    value: valueItem,
                    child: Text(
                      valueItem,
                      style: TextStyle(
                          fontSize: size.width * twelve,
                          color: textColor),
                    ),
                  );
                }).toList(),
                onChanged: (
                    newValue,
                    ) {
                  setState(() {
                    valueChoose = newValue as String?;
                  });
                }).marginOnly(left: 20.0,right: 20.0,top: 20.0,bottom: 0),

            if(valueChoose=="Part change required")
              Container(
                // height: 80.0,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Upload part image (Before)',
                      style: TextStyle(color: Colors.grey.shade700,fontWeight: FontWeight.w500,fontSize: size.width * twelve,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    if(wpartlist.isNotEmpty)
                      GestureDetector(
                        onTap: (){
                          process = "Part change required";
                          _bottomsheet(context,process);
                        },
                        child: Row(
                          children: [
                            Text('Add more',style: TextStyle(color: Colors.orange,fontWeight: FontWeight.w500),),
                            Icon(Icons.add,color: Colors.orange,),
                          ],
                        ),
                      ),
                  ],
                ),
              ).marginOnly(left: 20.0,right: 20.0,top: 5.0,bottom: 5.0),

            if(valueChoose=="Part change required" && wpartlist.isEmpty)
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      process = "Part change required";
                      _bottomsheet(context, process);
                    },
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.image,
                            size: 50,
                          ),
                          Text(
                            'Add Image',
                            style: TextStyle(fontSize: 14),
                          )
                        ],
                      ).paddingSymmetric(horizontal: 20, vertical: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey.shade400),
                    ),
                  ),
                ],
              ).paddingSymmetric(horizontal: 20,vertical: 5.0),

            if(valueChoose=="Part change required" && wpartlist.isNotEmpty)
              Container(
                  height: 120,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: GridView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: wpartlist.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                      ),
                      itemBuilder: (BuildContext context,int index){
                        return Container(
                          decoration: BoxDecoration(color: Colors.white,),
                          child: Padding(
                            padding: const EdgeInsets.all (2.0),
                            child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  Image.file(
                                    File(wpartlist[index].path),
                                    fit: BoxFit.cover,
                                  ), // Image.file
                                  Positioned(
                                    right: 00,
                                    left: 0,
                                    child: GestureDetector(
                                      onTap: (){
                                        setState(() {
                                          wpartlist.removeAt(index);
                                        });
                                      },
                                      child: Container(
                                        color: Color.fromRGBO (167, 167, 167, 0.5019607843137255),
                                        child: Icon(Icons.delete,color: Colors.orange,),
                                      ),
                                    ), // Container
                                  ),
                                ]), // Stack
                          ),
                          // Image.file(File(imageFileList[index].path),fit: BoxFit.cover,).paddingSymmetric(horizontal: 5.0,vertical: 5.0)
                        );
                      })).paddingSymmetric(horizontal: 20.0),

            if(valueChoose=="Part change required")
              Container(
                // height: 80.0,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Upload part image (After)',
                      style: TextStyle(color: Colors.grey.shade700,fontWeight: FontWeight.w500,fontSize: size.width * twelve,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    if(wmachinelist.isNotEmpty)
                      GestureDetector(
                        onTap: (){
                          process = "Part change required 1";
                          _bottomsheet(context,process);
                        },
                        child: Row(
                          children: [
                            Text('Add more',style: TextStyle(color: Colors.orange,fontWeight: FontWeight.w500),),
                            Icon(Icons.add,color: Colors.orange,),
                          ],
                        ),
                      ),
                  ],
                ),
              ).marginOnly(left: 20.0,right: 20.0,top: 5.0,bottom: 5.0),

            if(valueChoose=="Part change required" && wmachinelist.isEmpty)
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      process = "Part change required 1";
                      _bottomsheet(context, process);
                    },
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.image,
                            size: 50,
                          ),
                          Text(
                            'Add Image',
                            style: TextStyle(fontSize: 14),
                          )
                        ],
                      ).paddingSymmetric(horizontal: 20, vertical: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey.shade400),
                    ),
                  ),
                ],
              ).paddingSymmetric(horizontal: 20,vertical: 5.0),

            if(valueChoose=="Part change required" && wmachinelist.isNotEmpty)
              Container(
                  height: 120,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: GridView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: wmachinelist.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                      ),
                      itemBuilder: (BuildContext context,int index){
                        return Container(
                          decoration: BoxDecoration(color: Colors.white,),
                          child: Padding(
                            padding: const EdgeInsets.all (2.0),
                            child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  Image.file(
                                    File(wmachinelist[index].path),
                                    fit: BoxFit.cover,
                                  ), // Image.file
                                  Positioned(
                                    right: 00,
                                    left: 0,
                                    child: GestureDetector(
                                      onTap: (){
                                        setState(() {
                                          wmachinelist.removeAt(index);
                                        });
                                      },
                                      child: Container(
                                        color: Color.fromRGBO (167, 167, 167, 0.5019607843137255),
                                        child: Icon(Icons.delete,color: Colors.orange,),
                                      ),
                                    ), // Container
                                  ),
                                ]), // Stack
                          ),
                          // Image.file(File(imageFileList[index].path),fit: BoxFit.cover,).paddingSymmetric(horizontal: 5.0,vertical: 5.0)
                        );
                      })).paddingSymmetric(horizontal: 20.0),



            if(valueChoose=="Part change required")
              CheckboxListTile
                (
                title: const Text('The Partner has part available'),
                // subtitle: const Text('A computer science portal for geeks.'),
                // secondary: const Icon(Icons.code),
                controlAffinity: ListTileControlAffinity.leading,
                autofocus: false,
                activeColor: Colors.orange,
                checkColor: Colors.white,
                selected: _value,
                value: _value,
                onChanged: (value) {
                  setState(() {
                    _value = value!;
                    print(value);
                  });
                },
              ),

            if(valueChoose=="Part replacement under warranty")
              Container(
                // height: 80.0,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Please select image',
                      style: TextStyle(color: Colors.grey.shade700,fontWeight: FontWeight.w500,fontSize: size.width * twelve,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    if(imageFileList.isNotEmpty)
                      GestureDetector(
                        onTap: (){
                          process = "Part replacement under warranty";
                          _bottomsheet(context,process);
                        },
                        child: Row(
                          children: [
                            Text('Add more',style: TextStyle(color: Colors.orange,fontWeight: FontWeight.w500),),
                            Icon(Icons.add,color: Colors.orange,),
                          ],
                        ),
                      ),

                  ],
                ),
              ).marginOnly(left: 20.0,right: 20.0,top: 5.0,bottom: 5.0),

            if(valueChoose=="Part replacement under warranty" && imageFileList.isEmpty)
              // if(imageFileList.isEmpty)
                Row(
                  children: [
                    GestureDetector(
                      onTap: (){
                        process = "Part replacement under warranty";
                        _bottomsheet(context,process);                    },
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.image,size: 50,),
                            Text('Add Image',style: TextStyle(fontSize: 14),)
                          ],
                        ).paddingSymmetric(horizontal: 20,vertical: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey.shade400
                        ),
                      ),
                    ),
                  ],
                ).paddingSymmetric(horizontal: 20,vertical: 5.0),

            if(valueChoose=="Part replacement under warranty"&& imageFileList.isNotEmpty)
              // if(imageFileList.isNotEmpty)
                Container(
                    height: 120,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: GridView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: imageFileList.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                        ),
                        itemBuilder: (BuildContext context,int index){
                          return Container(
                            decoration: BoxDecoration(color: Colors.white,),
                            child: Padding(
                              padding: const EdgeInsets.all (2.0),
                              child: Stack(
                                  fit: StackFit.expand,
                                  children: [
                                    Image.file(
                                      File(imageFileList[index].path),
                                      fit: BoxFit.cover,
                                    ), // Image.file
                                    Positioned(
                                      right: 00,
                                      left: 0,
                                      child: GestureDetector(
                                        onTap: (){
                                          setState(() {
                                            imageFileList.removeAt(index);
                                          });
                                        },
                                        child: Container(
                                          color: Color.fromRGBO (167, 167, 167, 0.5019607843137255),
                                          child: Icon(Icons.delete,color: Colors.orange,),
                                        ),
                                      ), // Container
                                    ),
                                  ]), // Stack
                            ),
                            // Image.file(File(imageFileList[index].path),fit: BoxFit.cover,).paddingSymmetric(horizontal: 5.0,vertical: 5.0)
                          );
                        })).paddingSymmetric(horizontal: 20.0),

            //
            // if(valueChoose=="Part replacement under warranty")
            //   Container(
            //     // height: 80.0,
            //     width: double.infinity,
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         Text(
            //           'Please select part image',
            //           style: TextStyle(color: Colors.grey.shade700,fontWeight: FontWeight.w500,fontSize: size.width * twelve,
            //           ),
            //           textAlign: TextAlign.start,
            //         ),
            //       ],
            //     ),
            //   ).marginOnly(left: 20.0,right: 20.0,top: 5.0,bottom: 0),
            // if(valueChoose=="Part replacement under warranty")
            //   Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         Row(
            //           children: [
            //             MaterialButton(
            //               onPressed: () {
            //                 getcam();
            //               },
            //               height: 45,
            //               minWidth: 45,
            //               // padding: EdgeInsets.zero,
            //               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            //               color: page,
            //               child: Icon(
            //                 Icons.camera_alt_outlined,
            //                 color: Colors.black,
            //               ),
            //               elevation: 5,
            //             ),
            //             // SizedBox(width: 5.0,),
            //             Text(
            //               'OR',
            //               style: TextStyle(color: Colors.black,fontSize: size.width * twelve,
            //               ),
            //               textAlign: TextAlign.start,
            //             ).marginSymmetric(horizontal: 8.0),
            //             MaterialButton(
            //               onPressed: () {
            //                 setState(() {
            //                   getgall();
            //                 });
            //               },
            //               height: 40,
            //               minWidth: 40,
            //               // padding: EdgeInsets.zero,
            //               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            //               color: page,
            //               child: Icon(
            //                 Icons.image,
            //                 color: Colors.black,
            //               ),
            //               elevation: 5,
            //             ),
            //           ],
            //         ),
            //
            //         if(valueChoose=="Part replacement under warranty")
            //         // if(controller!.image != null)
            //
            //           Container(
            //             child: file == null ? Center(child: Container(
            //               alignment: Alignment.center,
            //               height: 80,
            //               width: 80,
            //               child: Text("Pick Image",textAlign: TextAlign.center,),),):
            //             Container(
            //               child: Center(
            //                 child:  Image.file(
            //                   file!,
            //                   height: 100,
            //                   width: 100,
            //                   fit: BoxFit.cover,
            //                 ),
            //               ),
            //             ),
            //             decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0),
            //                 border: Border.all(color: Colors.black26)),
            //           ),
            //
            //
            //       ]
            //   ).marginOnly(left: 20.0,right: 20.0,top: 0,bottom: 0),


            // if(valueChoose=="Part replacement under non-warranty")
            //   Container(
            //     // height: 80.0,
            //     width: double.infinity,
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         Text(
            //           'Please select part image',
            //           style: TextStyle(color: Colors.grey.shade700,fontWeight: FontWeight.w500,fontSize: size.width * twelve,
            //           ),
            //           textAlign: TextAlign.start,
            //         ),
            //       ],
            //     ),
            //   ).marginOnly(left: 20.0,right: 20.0,top: 5.0,bottom: 0),
            // if(valueChoose=="Part replacement under non-warranty")
            //   Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         Row(
            //           children: [
            //             MaterialButton(
            //               onPressed: () {
            //                 getuwcam();
            //               },
            //               height: 45,
            //               minWidth: 45,
            //               // padding: EdgeInsets.zero,
            //               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            //               color: page,
            //               child: Icon(
            //                 Icons.camera_alt_outlined,
            //                 color: Colors.black,
            //               ),
            //               elevation: 5,
            //             ),
            //             // SizedBox(width: 5.0,),
            //             Text(
            //               'OR',
            //               style: TextStyle(color: Colors.black,fontSize: size.width * twelve,
            //               ),
            //               textAlign: TextAlign.start,
            //             ).marginSymmetric(horizontal: 8.0),
            //             MaterialButton(
            //               onPressed: () {
            //                 setState(() {
            //                   getuwgall();
            //                 });
            //               },
            //               height: 40,
            //               minWidth: 40,
            //               // padding: EdgeInsets.zero,
            //               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            //               color: page,
            //               child: Icon(
            //                 Icons.image,
            //                 color: Colors.black,
            //               ),
            //               elevation: 5,
            //             ),
            //           ],
            //         ),
            //
            //         if(valueChoose=="Part replacement under non-warranty")
            //
            //           Container(
            //             child: uwfile == null ? Center(child: Container(
            //               alignment: Alignment.center,
            //               height: 80,
            //               width: 80,
            //               child: Text("Pick Image",textAlign: TextAlign.center,),),):
            //             Container(
            //               child: Center(
            //                 child:  Image.file(
            //                   uwfile!,
            //                   height: 100,
            //                   width: 100,
            //                   fit: BoxFit.cover,
            //                 ),
            //               ),
            //             ),
            //             decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0),
            //                 border: Border.all(color: Colors.black26)),
            //           ),
            //
            //
            //       ]
            //   ).marginOnly(left: 20.0,right: 20.0,top: 0,bottom: 0),

            if(valueChoose=="Part replacement under non-warranty")
              Container(
                // height: 80.0,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Please select image',
                      style: TextStyle(color: Colors.grey.shade700,fontWeight: FontWeight.w500,fontSize: size.width * twelve,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    if(imageFileList.isNotEmpty)
                      GestureDetector(
                        onTap: (){
                          process = "Part replacement under non-warranty";
                          _bottomsheet(context,process);
                        },
                        child: Row(
                          children: [
                            Text('Add more',style: TextStyle(color: Colors.orange,fontWeight: FontWeight.w500),),
                            Icon(Icons.add,color: Colors.orange,),
                          ],
                        ),
                      ),

                  ],
                ),
              ).marginOnly(left: 20.0,right: 20.0,top: 5.0,bottom: 5.0),

            if(valueChoose=="Part replacement under non-warranty" && unwarrantylist.isEmpty)
              Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      process = "Part replacement under non-warranty";
                      _bottomsheet(context,process);                    },
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.image,size: 50,),
                          Text('Add Image',style: TextStyle(fontSize: 14),)
                        ],
                      ).paddingSymmetric(horizontal: 20,vertical: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey.shade400
                      ),
                    ),
                  ),
                ],
              ).paddingSymmetric(horizontal: 20,vertical: 5.0),

            if(valueChoose=="Part replacement under non-warranty" && unwarrantylist.isNotEmpty)
            // if(imageFileList.isNotEmpty)
              Container(
                  height: 120,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: GridView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: unwarrantylist.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                      ),
                      itemBuilder: (BuildContext context,int index){
                        return Container(
                          decoration: BoxDecoration(color: Colors.white,),
                          child: Padding(
                            padding: const EdgeInsets.all (2.0),
                            child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  Image.file(
                                    File(unwarrantylist[index].path),
                                    fit: BoxFit.cover,
                                  ), // Image.file
                                  Positioned(
                                    right: 00,
                                    left: 0,
                                    child: GestureDetector(
                                      onTap: (){
                                        setState(() {
                                          unwarrantylist.removeAt(index);
                                        });
                                      },
                                      child: Container(
                                        color: Color.fromRGBO (167, 167, 167, 0.5019607843137255),
                                        child: Icon(Icons.delete,color: Colors.orange,),
                                      ),
                                    ), // Container
                                  ),
                                ]), // Stack
                          ),
                          // Image.file(File(imageFileList[index].path),fit: BoxFit.cover,).paddingSymmetric(horizontal: 5.0,vertical: 5.0)
                        );
                      })).paddingSymmetric(horizontal: 20.0),



            TextFormField(
              minLines: 1,
              maxLines: 5,  // allow user to enter 5 line in textfield
              keyboardType: TextInputType.multiline,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                isDense: true,
                // contentPadding: EdgeInsets.only(top: 13,bottom: 13,left: 13,right: 13),
                labelText: "Remark",
                labelStyle:TextStyle(color: Colors.grey),
                hintStyle: TextStyle(color: Colors.grey),
                hintText: "Enter Remark",
                fillColor: Colors.white,
                focusColor: Colors.grey,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),//<-- SEE HERE
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),//<-- SEE HERE
                ),

              ),
            ).marginOnly(left: 20.0,right: 20.0,bottom: 5.0 ),

            GestureDetector(
              onTap: (){
                if(valueChoose=="Worked completed"){
                  Navigator.pop(context);
                  print(valueChoose);
                  Get.bottomSheet(
                    isDismissible: false,
                    PhoneVerificationBottomSheetWidget(),
                    isScrollControlled: false,
                  );
                }else{
                  Navigator.pop(context);
                }
                // controller!.statusUpdated(showMessage: true);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 15.0),
                child: Container(
                  alignment: Alignment.center,
                  height: 50.0,
                  child: Text(
                    'Save',
                    style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: size.width * fourteen,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.0),
                    color: Colors.orange,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  void _bottomsheet(BuildContext context, process) {
    showModalBottomSheet(context: context, isDismissible: true,builder: (context){
      return Container(
        color: Color(0xFF737373),
        height: 120,
        child: Container(
          child: Row(
            // mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: (){
                      getcam();
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.camera_enhance_rounded,size: 40,),
                        SizedBox(height: 10,),
                        Text('Camera',style: TextStyle(color: Colors.black,fontSize: 16.0,fontWeight: FontWeight.w500),),
                      ],
                    ),
                  )
              ),
              Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: (){
                      // 'Part change required',
                      // 'Part replacement under warranty',
                      // 'Part replacement under non-warranty',
                      if(process.toString()=="Part change required"){
                        selectWImage();
                      }else if(process.toString()=="Part change required 1"){
                        selectMImage();
                      }else if(process.toString()=="Part replacement under warranty"){
                        selectImage();
                      }else if(process.toString()=="Part replacement under non-warranty"){
                        selectUWImage();
                      }
                      Navigator.pop(context);

                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.image,size: 40,),
                        SizedBox(height: 10,),
                        Text('Gallery',style: TextStyle(color: Colors.black,fontSize: 16.0,fontWeight: FontWeight.w500),)
                      ],
                    ),
                  )
              ),

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

    });

  }

}


