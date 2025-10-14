
import 'package:flutter/material.dart';
import 'package:xmshop/app/services/sreeenAdapter.dart';

class PassTextField extends StatelessWidget {

  final String hintText;
  final bool isPassWord;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final TextInputType? keyboardType;

  const PassTextField({this.controller, this.isPassWord = false,super.key, required this.hintText, this.onChanged,this.keyboardType = TextInputType.number});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      alignment: Alignment.center,
      height: ScreenAdapter.height(180),
      margin: EdgeInsets.only(top: ScreenAdapter.height(100)),
      padding: EdgeInsets.only(left: ScreenAdapter.width(40)),
      decoration: BoxDecoration(
        color: const Color.fromARGB(31, 78, 61, 61),
        borderRadius: BorderRadius.circular(20)
      ),
      child: TextField(
        controller: controller,
        style: TextStyle(
          fontSize: ScreenAdapter.fontSize(48)
        ),
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none
        ),
        onChanged: onChanged,
      ),
    );
  }


}