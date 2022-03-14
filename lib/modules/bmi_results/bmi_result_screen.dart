import 'package:flutter/material.dart';

class BmiResultScreen extends StatelessWidget {

  final bool isMale;
  final double result;
  final double age;

  BmiResultScreen({
    required this.isMale,
    required this.result,
    required this.age,
});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI RESULT',
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'GENDER IS : ${isMale ? 'MALE':'FEMALE'}',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Text(
              'RESULT IS : ${result.round()}',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Text(
              'AGE IS : ${age.round()}',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
