import 'package:flutter/material.dart';
import 'package:random_number_picker/constant/color.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  double maxVal = 100000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [renderBody(), renderSlider(), renderButton()],
        ),
      ),
    );
  }

  Widget renderBody() {
    return Row(
      children: this
          .maxVal
          .toInt()
          .toString()
          .split('')
          .map((e) => Image.asset(
                'assets/$e.png',
                height: 70,
                width: 50,
              ))
          .toList(),
    );
  }

  Widget renderSlider() {
    return Slider(
        value: maxVal,
        min: 1,
        max: 999999,
        onChanged: (value) {
          setState(() {
            maxVal = value;
          });
        });
  }

  Widget renderButton() {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context, (maxVal.toInt()).toString());
            },
            child: Text('SAVE'),
            style: ElevatedButton.styleFrom(primary: RED_COLOR),
          ),
        )
      ],
    );
  }
}
