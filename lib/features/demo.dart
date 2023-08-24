import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_image_picker_view/multi_image_picker_view.dart';
import 'package:video_player/video_player.dart';

import '../routes/app_routes.dart';
import '../styles/styles.dart';
import 'common/block_button_widget.dart';


class Demo extends StatefulWidget {

  const Demo({Key? key}) : super(key: key);

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  late VideoPlayerController _controller;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(
        'assets/videos/vid.mp4')
      ..initialize().then((_) {
        _controller.setVolume(0.0);
        _controller.setLooping(true);
        _controller.play();
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  // final controller = MultiImagePickerController(
  //     maxImages: 5, allowedImageTypes: const ['jpg', 'jpeg', 'png']);


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width * 1,
        height: size.height * 1,
          child: Column(
            children: [
              Container(
                width: size.width * 1,
                height: size.height * 0.7,
                // color: Colors.orange,
                child: VideoPlayer(_controller),
              ),
              Container(
                width: size.width * 1,
                height: size.height * 0.3,
                color: Colors.black,
                child: Column(
                   children: [
                     Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         GestureDetector(
                           onTap: (){
                             Get.toNamed(Routes.ADLOGIN);
                           },
                           child:  Container(
                             child: Image.asset("assets/images/admin.png",fit: BoxFit.cover,),
                             // decoration: BoxDecoration(
                             //     borderRadius: BorderRadius.circular(50),
                             //     color: Colors.white
                             // ),
                             width: size.height * 0.15,
                           ),
                         ),

                         SizedBox(width: size.height * 0.08,),
                         GestureDetector(
                           onTap: (){
                             Get.toNamed(Routes.LOGIN);
                           },
                           child: Container(
                             child: Image.asset("assets/images/team.png",fit: BoxFit.cover,),
                             // decoration: BoxDecoration(
                             //     borderRadius: BorderRadius.circular(50),
                             //     color: Colors.white
                             // ),
                             width: size.height * 0.15,
                           ),
                         ),
                       ],
                     ),
                     SizedBox(height: size.height * 0.02,),
                     SizedBox(
                       height: size.height * 0.06,
                       width: size.width * 1,
                       child: ElevatedButton(
                         style: ElevatedButton.styleFrom(
                           primary: Colors.orange, // background
                           onPrimary: Colors.white, //
                             shape: RoundedRectangleBorder(
                                 borderRadius: BorderRadius.circular(10.0)
                             ),// foreground
                         ),
                         onPressed: () {},
                         child: Text('Sign Up',
                             style: Get.textTheme.headline6!.merge(TextStyle(color: Colors.white)),
                       ),
                     ),),

                   ],
                ).marginOnly(top: size.width * 0.05,bottom: size.width * 0.05,left: size.width * 0.05,right: size.width * 0.05),
              ),
            ],
          ),
      ),
      // body: Column(
      //   children: [
      //     Container(
      //       alignment: Alignment.bottomCenter,
      //     child: Padding(
      //       padding: const EdgeInsets.all(15.0),
      //       child: FloatingActionButton.extended(
      //         onPressed: () {
      //           showDialog(
      //               context: context,
      //               builder: (_) {
      //                 // print('CustomModal');
      //                 return CustomDialog();
      //
      //               });
      //         },
      //         label: const Text('Pick Modal'),
      //         icon: const Icon(Icons.image),
      //         backgroundColor: Colors.pink,
      //       ),
      //     ),
      //  ),
      //
      // // MultiImagePickerView(
      // //   controller: controller,
      // //   padding: const EdgeInsets.all(0),
      // //   gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
      // //       maxCrossAxisExtent: 80,
      // //       childAspectRatio: 1,
      // //       crossAxisSpacing: 5,
      // //       mainAxisSpacing: 5),
      // //   initialContainerBuilder: (context, pickerCallback) {
      // //     return SizedBox(
      // //       height: 170,
      // //       width: double.infinity,
      // //       child: Center(
      // //         child: ElevatedButton(
      // //           child: const Text('Add Images'),
      // //           onPressed: () {
      // //             pickerCallback();
      // //           },
      // //         ),
      // //       ),
      // //     );
      // //   },
      // //   itemBuilder: (context, file, deleteCallback) {
      // //     return ImageCard(file: file, deleteCallback: deleteCallback);
      // //   },
      // //   addMoreBuilder: (context, pickerCallback) {
      // //     return SizedBox(
      // //       height: 80,
      // //       width: double.infinity,
      // //       child: Center(
      // //         child: TextButton(
      // //           style: TextButton.styleFrom(
      // //             backgroundColor: Colors.blue.withOpacity(0.2),
      // //             shape: CircleBorder(),
      // //           ),
      // //           child: Padding(
      // //             padding: const EdgeInsets.all(10),
      // //             child: Icon(
      // //               Icons.add,
      // //               color: Colors.blue,
      // //               size: 30,
      // //             ),
      // //           ),
      // //           onPressed: () {
      // //             pickerCallback();
      // //           },
      // //         ),
      // //       ),
      // //     );
      // //   },
      // //   onChange: (list) {
      // //     // print('got the list');
      // //   },
      // // ),
      //
      //   ],
      // ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
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
            GestureDetector(
              onTap: (){
                _bottomsheet(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Please select image'),
                  SizedBox(width: 5.0),
                  Icon(Icons.image),
                ],
              ).paddingSymmetric(horizontal: 20,vertical: 5.0),
            ),
            
            Container(
                height: 120,
                width: double.infinity,
                child: GridView.builder(
                  scrollDirection: Axis.vertical,
                itemCount: imageFileList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                ),
                itemBuilder: (BuildContext context,int index){
                  return Container(
                      decoration: BoxDecoration(color: Colors.grey,),
                      child: Image.file(File(imageFileList[index].path),fit: BoxFit.cover,).paddingSymmetric(horizontal: 5.0,vertical: 5.0));
                })),
            SizedBox(height: 20.0,),
            if(imageFileList.length!=0)
            MaterialButton(
                color:Colors.blue,
                child:Text('Add more'),

                onPressed: (){
                  _bottomsheet(context);
            }),


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
        height: 180,
        child: Container(
          child: Row(
            // mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.camera_enhance_rounded,size: 70,),
                      SizedBox(height: 10,),
                      Text('Camera',style: TextStyle(color: Colors.black,fontSize: 16.0,fontWeight: FontWeight.w500),),
                    ],
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
                        Icon(Icons.image,size: 70,),
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

