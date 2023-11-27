import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/material.dart';


class GroupButton extends StatelessWidget {
  final List<String> buttonLables;
  final List<int> buttonValues;
  const GroupButton({required this.buttonLables, required this.buttonValues, super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return CustomRadioButton(
      width: buttonLables[0].length >= 4 ? width * 0.2: buttonLables[0].length*width * 0.07,
      height: height * 0.055,
      spacing: width * 0.008,
      elevation: 0,
      enableShape: true,
      shapeRadius: width * 0.02,
      unSelectedColor: Color(0xff272727),
      buttonLables: buttonLables,
      buttonValues: buttonValues,
      buttonTextStyle: ButtonTextStyle(
        selectedColor: Colors.black,
        unSelectedColor: Colors.white,
        textStyle: TextStyle(
          fontSize: width * 0.035,
        ),
      ),
      radioButtonValue: (value) {
        print(value);
      },
      selectedColor: Color(0xff11CE24),
      selectedBorderColor: Colors.black,
      unSelectedBorderColor: Color(0xff676767),
    );
  }
}
