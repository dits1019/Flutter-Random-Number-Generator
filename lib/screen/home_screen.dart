import 'package:flutter/material.dart';
import 'package:random_number_picker/constant/color.dart';
import 'dart:math';

import 'package:random_number_picker/screen/setting_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<int> randomNumbers = [123, 456, 789];
  String selectNumber = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            randomText(),
            Expanded(child: renderBody()),
            renderButton()
          ],
        ),
      ),
    );
  }

  Widget randomText() {
    TextStyle _style = TextStyle(
        fontSize: 30, fontWeight: FontWeight.w700, color: Colors.white);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Random Number', style: _style),
              Text('Generator', style: _style),
            ],
          ),
        ),
        IconButton(
            onPressed: moveSetting(context),
            // () {
            //   Navigator.push(context,
            //       MaterialPageRoute(builder: (context) => SettingScreen()));

            //   // Navigator.of(context)
            //   //     .push(MaterialPageRoute(builder: (_) => SettingScreen()));
            // },
            icon: Icon(
              Icons.settings,
              color: RED_COLOR,
            ))
      ],
    );
  }

  Widget renderBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      // 배열 번지에 따라 나누고
      // 문자열로 바꾼 후 자른다.
      // 그 후 그 문자에 맞는 이미지를 출력
      children: this
          .randomNumbers
          .map((x) => Row(
                children: x
                    .toString()
                    .split('')
                    .map((y) => Padding(
                          padding: const EdgeInsets.only(left: 3, bottom: 7),
                          child: Image.asset(
                            'assets/$y.png',
                            height: 70,
                            width: 50,
                          ),
                        ))
                    .toList(),
              ))
          .toList(),
    );
  }

  Widget renderButton() {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: getRandomNumbers,
            child: Text('RANDOME NUMBER'),
            style: ElevatedButton.styleFrom(primary: RED_COLOR),
          ),
        )
      ],
    );
  }

  // 랜덤 숫자 뽑기
  getRandomNumbers() {
    final rand = new Random();

    // 임시 리스트
    final List<int> tempNumbers = [];

    // 리스트의 길이가 3이 될 때까지 반복
    while (tempNumbers.length != 3) {
      // 랜덤 숫자 생성
      final number = rand.nextInt(int.parse(selectNumber));

      // 임시 리스트에 추가
      tempNumbers.add(number);
    }

    // randomNumbers에 임시 리스트에 값을 넣기
    setState(() {
      randomNumbers = tempNumbers;
    });
  }

  moveSetting(BuildContext context) async {
    String result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => SettingScreen()));

    selectNumber = result;
  }
}
