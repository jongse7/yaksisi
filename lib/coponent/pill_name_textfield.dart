import 'package:flutter/material.dart';

class PillNameTextField extends StatelessWidget {
  final ValueChanged onChanged;
  final String pillName;

  const PillNameTextField(
      {required this.onChanged, required this.pillName, super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    TextStyle defaultTextStyle = TextStyle(
      color: Colors.white,
      fontSize: width * 0.03,
      fontWeight: FontWeight.w500,
    );
    return SizedBox(
      width: width * 0.2,
      height: height * 0.04,
      child: TextField(
        showCursor: false,
        style: TextStyle(color: Colors.black),
        textAlign: TextAlign.start,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          hintText: "약 이름",
          hintStyle: defaultTextStyle,
          prefixText: pillName,
          prefixStyle: defaultTextStyle,
          filled: true,
          fillColor: Colors.black,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(width * 0.02),
            ),
            borderSide: BorderSide(
              width: width * 0.0025,
              color: Colors.white,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(width * 0.02),
            ),
            borderSide: BorderSide(
              width: width * 0.0025,
              color: Colors.white,
            ),
          ),
        ),
        onChanged: onChanged,
      ),
    );
  }
}