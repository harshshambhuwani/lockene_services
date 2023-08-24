import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_image_picker_view/multi_image_picker_view.dart';

import '../styles/styles.dart';


class Demo1 extends StatefulWidget {

  const Demo1({Key? key}) : super(key: key);

  @override
  State<Demo1> createState() => _Demo1State();
}

class _Demo1State extends State<Demo1> {
  final controller = MultiImagePickerController(
      maxImages: 4, allowedImageTypes: const ['jpg', 'jpeg', 'png']);
  bool click = false;

  List<String> _selectedItems = [];

  void _showMultiSelect() async {
    // a list of selectable items
    // these items can be hard-coded or dynamically fetched from a database/API
    final List<String> items = [
      'Flutter',
      'Node.js',
      'React Native',
      'Java',
      'Docker',
      'MySQL'
    ];

    final List<String>? results = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return MultiSelect(items: items);
      },
    );

    // Update UI
    if (results != null) {
      setState(() {
        _selectedItems = results;
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: FloatingActionButton.extended(
              onPressed: () {
                // showDialog(
                //     context: context,
                //     builder: (_) {
                //       // print('CustomModal');
                //       // return CustomDialog();
                //
                //     });
                // _showMultiSelect();
                // StartT();
              },
              label: const Text('Pick Modal'),
              icon: const Icon(Icons.image),
              backgroundColor: Colors.pink,
            ),
          ),
       ),

          const Divider(
            height: 30,
          ),
          // display selected items
          Wrap(
            alignment: WrapAlignment.center,

          children: _selectedItems
                .map((e) => Padding(
            padding: const EdgeInsets.only(left: 3.0,right: 3.0),
                  child: Chip(
              label: Text(e),
            ),
                ))
                .toList(),
          ),
      if(_selectedItems.isEmpty)
      Container(height: 20,width: 20,color: Colors.orange,),
          if(_selectedItems.isNotEmpty)
            Container(height: 20,width: 20,color: Colors.black,),
          const Divider(
            height: 30,
          ),
          StartT(),

      // MultiImagePickerView(
      //   controller: controller,
      //   padding: const EdgeInsets.all(0),
      //   gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
      //       maxCrossAxisExtent: 80,
      //       childAspectRatio: 1,
      //       crossAxisSpacing: 5,
      //       mainAxisSpacing: 5),
      //   initialContainerBuilder: (context, pickerCallback) {
      //     return SizedBox(
      //       height: 170,
      //       width: double.infinity,
      //       child: Center(
      //         child: ElevatedButton(
      //           child: const Text('Add Images'),
      //           onPressed: () {
      //             pickerCallback();
      //           },
      //         ),
      //       ),
      //     );
      //   },
      //   itemBuilder: (context, file, deleteCallback) {
      //     return ImageCard(file: file, deleteCallback: deleteCallback);
      //   },
      //   addMoreBuilder: (context, pickerCallback) {
      //     return SizedBox(
      //       height: 80,
      //       width: double.infinity,
      //       child: Center(
      //         child: TextButton(
      //           style: TextButton.styleFrom(
      //             backgroundColor: Colors.blue.withOpacity(0.2),
      //             shape: CircleBorder(),
      //           ),
      //           child: Padding(
      //             padding: const EdgeInsets.all(10),
      //             child: Icon(
      //               Icons.add,
      //               color: Colors.blue,
      //               size: 30,
      //             ),
      //           ),
      //           onPressed: () {
      //             pickerCallback();
      //           },
      //         ),
      //       ),
      //     );
      //   },
      //   onChange: (list) {
      //     // print('got the list');
      //   },
      // ),

        ],
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}


class StartT extends StatefulWidget {

  @override
  State<StartT> createState() => _StartTState();


}

class _StartTState extends State<StartT> {
  int start = 30;
  bool wait = false;
  Timer? timer;
  int _remainingTime = 30;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    timer = Timer.periodic(
      oneSec,
          (Timer timer) {
        if (_remainingTime == 0) {
          timer.cancel();
          // TODO: Handle OTP timeout.
        } else {
          setState(() {
            _remainingTime--;
          });
        }
      },
    );
  }



  //   @override
  // void setState(VoidCallback fn) {
  //   // TODO: implement setState
  //   super.setState(fn);
  //       startTimer();
  //
  // }

  @override
  Widget build(BuildContext context) {
    // return Column(
    //   children: [
    //     Center(child:RichText(text: TextSpan(
    //         children: [
    //           TextSpan(text: 'Send OTP again in',style: TextStyle(fontSize: 16,color: Colors.orange)),
    //           TextSpan(text: '00:$start',style: TextStyle(fontSize: 16,color: Colors.black)),
    //           TextSpan(text: ' sec ',style: TextStyle(fontSize: 16,color: Colors.orange)),
    //         ]
    //     ))),
    //     Container(
    //       alignment: Alignment.bottomCenter,
    //       child: Padding(
    //         padding: const EdgeInsets.all(15.0),
    //         child: FloatingActionButton.extended(
    //           onPressed: /*wait?null:*/() {
    // // startTimer();
    // // setState((){
    // //   start = 30;
    // //    wait = true;
    // // });
    //
    //             // showDialog(
    //             //     context: context,
    //             //     builder: (_) {
    //             //       // print('CustomModal');
    //             //       // return CustomDialog();
    //             //
    //             //     });
    //             // _showMultiSelect();
    //           },
    //           label: const Text('Resend otp'),
    //           icon: const Icon(Icons.image),
    //           backgroundColor: Colors.pink,
    //         ),
    //       ),
    //     ),
    //
    //
    //   ],
    // );
   return Text('Remaining time: $_remainingTime seconds');
  }

  // void startTimer(){
  //   const onsec = Duration(seconds: 1);
  //   Timer timer = Timer.periodic(onsec, (timer) {
  //     if(start == 0){
  //       setState(() {
  //         timer.cancel();
  //         wait = false;
  //       });
  //     }else{
  //       setState(() {
  //         start--;
  //       });
  //     }
  //   });
  // }
}



class MultiSelect extends StatefulWidget {
  final List<String> items;
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
    return AlertDialog(
      title: const Text('Select Topics'),
      content: SingleChildScrollView(
        child: ListBody(
          children: widget.items
              .map((item) => CheckboxListTile(
            value: _selectedItems.contains(item),
            title: Text(item),
            controlAffinity: ListTileControlAffinity.leading,
            onChanged: (isChecked) => _itemChange(item, isChecked!),
          ))
              .toList(),
        ),
      ),
      actions: [
        TextButton(
          onPressed: _cancel,
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: _submit,
          child: const Text('Submit'),
        ),
      ],
    );
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
  final ImagePicker imagePicker = ImagePicker();
  List<XFile> imageFileList = [];
  String? valueChoose;

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

  getgall() async{
    var img = await imagePicker.getImage(source: ImageSource.gallery);
    setState(() {
      file = File(img!.path);
    });
  }
  getcam() async{
    final List<XFile>? selectedImages  = (await imagePicker.getImage(source: ImageSource.camera)) as List<XFile>?;
    setState(() {
      if(imageFileList.isEmpty){
        imageFileList.addAll(selectedImages!);
      }else{
        imageFileList.addAll(selectedImages!);
      }
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
  Widget build(BuildContext context){
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Please select image'),
                SizedBox(width: 5.0),
                if(imageFileList.isNotEmpty)
                GestureDetector(
                  onTap: (){
                    _bottomsheet(context);
                  },
                  child: Row(
                    children: [
                      Text('Add more',style: TextStyle(color: Colors.red,),),
                      Icon(Icons.add,color: Colors.red,),
                    ],
                  ),
                ),
              ],
            ).paddingSymmetric(horizontal: 20,vertical: 5.0),

            if(imageFileList.isEmpty)
              Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      _bottomsheet(context);
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



            GestureDetector(
              onTap: (){
                // _bottomsheet(context);
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

  void _bottomsheet(BuildContext context) {
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
                      selectImage();
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


class ImageCard extends StatelessWidget {
  const ImageCard({Key? key, required this.file, required this.deleteCallback})
      : super(key: key);

  final ImageFile file;
  final Function(ImageFile file) deleteCallback;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      children: [
        Positioned.fill(
          child: !file.hasPath
              ? Image.memory(
            file.bytes!,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return const Center(child: Text('No Preview'));
            },
          )
              : Image.file(
            File(file.path!),
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          right: 0,
          top: 0,
          child: InkWell(
            excludeFromSemantics: true,
            onLongPress: () {},
            child: Container(
                margin: const EdgeInsets.all(4),
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.close,
                  size: 20,
                )),
            onTap: () {
              deleteCallback(file);
            },
          ),
        ),
      ],
    );
  }
}

