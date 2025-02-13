import 'package:flutter/material.dart';

// Hàm main() là điểm bắt đầu của ứng dụng.
void main() {
  runApp(MyApp());
}

// Lớp MyApp định nghĩa ứng dụng chính.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Màn hình chính của ứng dụng là SumCalculator.
      home: SumCalculator(),
    );
  }
}

// Lớp SumCalculator là widget trạng thái để thực hiện logic tính tổng.
class SumCalculator extends StatefulWidget {
  @override
  _SumCalculatorState createState() => _SumCalculatorState();
}

// Lớp _SumCalculatorState lưu trữ trạng thái của widget và chứa logic tính toán.
class _SumCalculatorState extends State<SumCalculator> {
  // Các TextEditingController để nhận giá trị từ TextField.
  final TextEditingController _firstNumberController = TextEditingController();
  final TextEditingController _secondNumberController = TextEditingController();

  // Biến lưu trữ kết quả tính tổng.
  String _result = "";

  // Hàm calculateSum() dùng để tính tổng hai số và cập nhật kết quả.
  void calculateSum() {
    // Lấy giá trị từ TextField và chuyển đổi sang số double.
    double? num1 = double.tryParse(_firstNumberController.text);
    double? num2 = double.tryParse(_secondNumberController.text);

    // Kiểm tra nếu cả hai giá trị đều hợp lệ.
    if (num1 != null && num2 != null) {
      setState(() {
        // Tính tổng và cập nhật giá trị biến _result.
        _result = (num1 + num2).toString();
      });
    } else {
      // Hiển thị thông báo lỗi nếu giá trị không hợp lệ.
      setState(() {
        _result = "Vui lòng nhập số hợp lệ!";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Thanh AppBar của ứng dụng.
      appBar: AppBar(
        backgroundColor: Colors.black, // Màu nền của AppBar.
        title: Text("Tính Tổng Hai Số"), // Tiêu đề của ứng dụng.
        centerTitle: true, // Căn giữa tiêu đề.
        foregroundColor: Colors.white,
      ),
      // Nội dung chính của ứng dụng.
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Khoảng cách từ cạnh ngoài.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Căn giữa theo chiều dọc.
          crossAxisAlignment: CrossAxisAlignment.center, // Căn giữa theo chiều ngang.
          children: [
            // TextField để nhập số đầu tiên.
            TextField(
              controller: _firstNumberController, // Kết nối với bộ điều khiển.
              keyboardType: TextInputType.number, // Chỉ cho phép nhập số.
              decoration: InputDecoration(
                labelText: "Nhập số đầu tiên", // Nhãn gợi ý.
                border: OutlineInputBorder(), // Viền xung quanh TextField.
              ),
            ),
            SizedBox(height: 16), // Khoảng cách giữa các widget.

            // TextField để nhập số thứ hai.
            TextField(
              controller: _secondNumberController, // Kết nối với bộ điều khiển.
              keyboardType: TextInputType.number, // Chỉ cho phép nhập số.
              decoration: InputDecoration(
                labelText: "Nhập số thứ hai", // Nhãn gợi ý.
                border: OutlineInputBorder(), // Viền xung quanh TextField.
              ),
            ),
            SizedBox(height: 16), // Khoảng cách giữa các widget.

            // Nút bấm để thực hiện tính toán.
            ElevatedButton(
              onPressed: calculateSum, // Gọi hàm calculateSum khi bấm.
              child: Text("Tính Tổng"), // Nội dung trên nút.
            ),
            SizedBox(height: 16), // Khoảng cách giữa các widget.

            // Hiển thị kết quả tính tổng.
            Text(
              "Kết quả: $_result", // Chuỗi hiển thị kết quả.
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), // Định dạng văn bản.
            ),
          ],
        ),
      ),
    );
  }
}
