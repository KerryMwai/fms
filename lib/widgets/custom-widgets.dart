import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
    IconData prefixicon;
    TextEditingController textEditingController;
    String hintText;
    bool isObsecure;
   CustomTextField({super.key, required this.textEditingController, required this.hintText, required this.isObsecure, required this.prefixicon});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.only(left: 10, right: 5),
      width: size.width * 0.9,
      decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(10),
          border: const Border.symmetric(
              vertical: BorderSide(color: Colors.black),
              horizontal: BorderSide(color: Colors.black))),
      child:  TextField(
        
        obscureText: isObsecure,
        controller: textEditingController,
        cursorColor: Colors.black,
        decoration:
            InputDecoration(border: InputBorder.none, hintText: hintText, prefixIcon: Icon(prefixicon, color: Colors.black,)),
      ),
    );
  }
}
