import 'package:flutter/material.dart';
import 'package:random_number_picker/constant/color.dart';

class SettingScreen extends StatefulWidget {
  final double slideVal;

  SettingScreen({
    required this.slideVal,
  });

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  double slideVal = 10000;

  @override
  void initState() {
    super.initState();

    this.slideVal = widget.slideVal;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      body: SafeArea(
        child: Column(
          children: [
            renderBody(),
            renderSlider(),
            renderButton(),
          ],
        ),
      ),
    );
  }

  renderBody() {
    return Expanded(
      child: Row(
        children: this
            .slideVal
            .toInt()
            .toString()
            .split('')
            .map(
              (x) => Image.asset(
                'assets/$x.png',
                width: 50.0,
                height: 70.0,
              ),
            )
            .toList(),
      ),
    );
  }

  renderSlider() {
    return Container(
      height: 60.0,
      child: Slider(
        min: 10000,
        max: 10000000,
        value: slideVal,
        onChanged: (double val) {
          setState(() {
            slideVal = val;
          });
        },
      ),
    );
  }

  renderButton() {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: RED_COLOR,
              ),
              onPressed: () {
                Navigator.of(context).pop(this.slideVal.toInt());
              },
              child: Text(
                'SAVE',
              ),
            ),
          ),
        ),
      ],
    );
  }
}
