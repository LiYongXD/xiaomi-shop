import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xmshop/app/services/sreeenAdapter.dart';

class PinInput extends StatelessWidget {
  final TextEditingController controller;
  final bool autoFocus;
  final bool isFirst;
  const PinInput(
      {super.key,
      required this.controller,
      required this.autoFocus,
      this.isFirst = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ScreenAdapter.height(180),
      width: ScreenAdapter.height(120),
      child: TextField(
        autofocus: autoFocus,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        controller: controller,
        maxLength: 1,
        cursorColor: Theme.of(context).primaryColor,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          counterText: '',
          hintStyle: TextStyle(
              color: Colors.black, fontSize: ScreenAdapter.fontSize(40)),
        ),
        onChanged: (value) {
          print(value);
          print(Clipboard.getData(Clipboard.kTextPlain));
          if (value.isNotEmpty) {
            FocusScope.of(context).nextFocus();
          }
          if (value.isEmpty && !isFirst) {
            FocusScope.of(context).previousFocus();
          }
        },
      ),
    );
  }
}
