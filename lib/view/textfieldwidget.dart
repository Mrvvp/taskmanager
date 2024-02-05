import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    Key? key,
    required this.maxLine,
    required this.hintText,
    required this.txtController,
  }) : super(key: key);

  final String hintText;
  final int maxLine;
  final TextEditingController txtController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: const Color(0xFF262626),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        keyboardType: TextInputType.none,
        textInputAction: TextInputAction.next,
        controller: txtController,
        style: const TextStyle(color: Color(0xffFFFFFF)),
        decoration: InputDecoration(
          enabledBorder: InputBorder.none,
          hintText: hintText,
          hintStyle: const TextStyle(color: Color(0xFF7F7F7F)),
        ),
        maxLines: maxLine,
      ),
    );
  }
}