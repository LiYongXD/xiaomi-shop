
import 'package:flutter/material.dart';
import 'package:xmshop/app/services/sreeenAdapter.dart';

class PassTextField extends StatelessWidget {

  final String hintText;

  final void Function(String)? onChanged;

  const PassTextField({super.key, required this.hintText, this.onChanged});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      alignment: Alignment.center,
      height: ScreenAdapter.height(180),
      margin: EdgeInsets.only(top: ScreenAdapter.height(100)),
      padding: EdgeInsets.only(left: ScreenAdapter.width(40)),
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(20)
      ),
      child: TextField(
        style: TextStyle(
          fontSize: ScreenAdapter.fontSize(48)
        ),
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none
        ),
        onChanged: onChanged,
      ),
    );
  }


}