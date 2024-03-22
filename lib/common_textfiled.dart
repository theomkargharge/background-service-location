import 'package:flutter/material.dart';

class CommonTextField extends StatelessWidget {
  final hintText, height, width;
  const CommonTextField({super.key ,required this.hintText, required this.width, required this.height });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
      child: SizedBox(
        height: height,
        width: width,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
              color: const Color(0xFFF3F3F3),
              borderRadius: BorderRadius.circular(20)),
          child:  TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              hintStyle:const TextStyle(
                color: Color(0xFFAAAAAA),
                fontSize: 16
              ),
              fillColor: const Color(0xFFF3F3F3),
            ),
          ),
        ),
      ),
    );
  }
}
