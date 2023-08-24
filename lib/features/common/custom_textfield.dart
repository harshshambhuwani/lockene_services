import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String labelText;
  final Icon PIcon;
  const CustomTextField({Key? key,required this.controller, required this.hintText, required this.labelText, required this.PIcon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 15.0),
        hintText: hintText,
        label: Text(labelText),
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black38,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black38,
          ),
        ),
          prefixIcon: PIcon,
      ),

       validator: (val){

       },
    );
  }
}
