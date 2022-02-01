import 'package:flutter/material.dart';

class PegnancyTime extends StatelessWidget {
  final text;
  const PegnancyTime({Key? key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                "Your Pregnancy time",
                style: TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
