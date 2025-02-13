
import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class ClockScreen extends StatefulWidget {
  const ClockScreen({super.key});

  @override
  State<ClockScreen> createState() => _ClockScreenState();
}

class _ClockScreenState extends State<ClockScreen> {
  double hourAngle = 0;
  double minuteAngle = 0;
  double secondAngle = 0;
  late Timer timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    timer = Timer.periodic(Duration(milliseconds: 500), (timer) {
      DateTime now = DateTime.now();

      setState(() {
        secondAngle = (pi / 30) * now.second;
        minuteAngle = (pi / 30) * now.minute;
        hourAngle = (pi / 6 * now.hour) + (pi / 45 * minuteAngle);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF2C3E50),
        foregroundColor: Color(0xFFFFC5D3),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          const Text('Huỳnh Thiện Khải - 22139032'),
          const Text('Võ Văn Hiếu - 22139021'),
         ],
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.watch_later_outlined),
            color: Color(0xFFFFB5C0),
            tooltip: 'Show watch',
            onPressed: () {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('This is a analog watch')));
            },
          ),
        ],
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          color: Color(0xFFE9CDD0),
          child: Stack(
            children: [
              Center(child: Image.asset('images/clock.png')),
              Center(
                child: CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: 10,
                ),
              ),
              Center(
                child: Transform.rotate(
                  angle: secondAngle,
                  child: Container(
                    margin: EdgeInsets.only(bottom: 100),
                    width: 2,
                    height: 200,
                    color: Colors.red,
                  ),
                ),
              ),
              Center(
                child: Transform.rotate(
                  angle: minuteAngle,
                  child: Container(
                    margin: EdgeInsets.only(bottom: 100),
                    width: 8,
                    height: 170,
                    color: Colors.black,
                  ),
                ),
              ),
              Center(
                child: Transform.rotate(
                  angle: hourAngle,
                  child: Container(
                    margin: EdgeInsets.only(bottom: 100),
                    width: 8,
                    height: 80,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}