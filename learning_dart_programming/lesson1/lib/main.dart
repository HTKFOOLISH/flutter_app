import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AdditionApp(),
    );
  }
}

class AdditionApp extends StatefulWidget {
  @override
  _AdditionAppState createState() => _AdditionAppState();
}

class _AdditionAppState extends State<AdditionApp> {
  final TextEditingController _num1Controller = TextEditingController();
  final TextEditingController _num2Controller = TextEditingController();
  String _result = "";

  void _calculateSum() {
    setState(() {
      // Lấy giá trị từ các TextField và thực hiện phép cộng
      double num1 = double.tryParse(_num1Controller.text) ?? 0.0;
      double num2 = double.tryParse(_num2Controller.text) ?? 0.0;
      double sum = num1 + num2;
      _result = "Kết quả: $sum";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SUM CALCULATOR"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _num1Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Nhập số thứ nhất",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _num2Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Nhập số thứ hai",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _calculateSum,
              child: Text("Tính tổng"),
            ),
            SizedBox(height: 16.0),
            Text(
              _result,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
