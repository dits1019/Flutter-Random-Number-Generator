import 'package:flutter/material.dart';
import 'dart:math';
import 'package:random_number_picker/constant/color.dart';
import 'package:random_number_picker/screen/setting_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<int> randomNumbers = [];
  int maxNumber = 10000;

  @override
  void initState() {
    super.initState();

    getRandomNumbers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              renderTitle(),
              renderBody(),
              renderButton(),
            ],
          ),
        ),
      ),
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
      final number = rand.nextInt(maxNumber);

      // 임시 리스트에 추가
      tempNumbers.add(number);
    }

    // randomNumbers에 임시 리스트에 값을 넣기
    setState(() {
      randomNumbers = tempNumbers;
    });
  }

  renderTitle() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Random Number',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            IconButton(
              onPressed: () async {
                final result = await Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (_) =>
                          SettingScreen(slideVal: this.maxNumber.toDouble())),
                );

                setState(() {
                  this.maxNumber = result;
                });
              },
              splashRadius: 20.0,
              icon: Icon(
                Icons.settings,
                color: RED_COLOR,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Text(
              'Generator',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30.0,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ],
    );
  }

  renderBody() {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // 배열 번지에 따라 나누고
        // 문자열로 바꾼 후 자른다.
        // 그 후 문자에 맞는 이미지를 출력
        children: this
            .randomNumbers
            .asMap()
            .entries
            .map(
              (x) => Padding(
                padding: EdgeInsets.only(
                    bottom: x.key == this.randomNumbers.length - 1 ? 0 : 16.0),
                child: Row(
                  children: x.value
                      .toString()
                      .split('')
                      .map(
                        (y) => Image.asset(
                          'assets/$y.png',
                          height: 70.0,
                          width: 50.0,
                        ),
                      )
                      .toList(),
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  renderButton() {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: RED_COLOR,
            ),
            onPressed: this.getRandomNumbers,
            child: Text(
              'RANDOM NUMBER',
            ),
          ),
        ),
      ],
    );
  }
}
