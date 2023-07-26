import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Profile',
      home: ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String fullNameAndClass = 'Họ và tên - lớp';
  bool isFullNameAndClassUpdated = false;

  void updateFullNameAndClass() {
    setState(() {
      if (!isFullNameAndClassUpdated) {
        fullNameAndClass = 'Nguyễn Thanh Ý - 08_ĐH_CNPM';
      } else {
        fullNameAndClass = 'Họ và tên - lớp';
      }
      isFullNameAndClassUpdated = !isFullNameAndClassUpdated;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              fullNameAndClass,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ColoredBox(color: Colors.blue, child: SizedBox(width: 100, height: 100)),
                ColoredBox(color: Colors.green, child: SizedBox(width: 100, height: 100)),
                ColoredBox(color: Colors.yellow, child: SizedBox(width: 100, height: 100)),
              ],
            ),
            SizedBox(height: 20),
            Image.asset(
              'assets/hello-kitty-face-pattern-background-scaled.jpg', // Đường dẫn đến hình ảnh của bạn
              width: 150,
              height: 150,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                updateFullNameAndClass(); // Gọi hàm cập nhật họ và tên - lớp khi nút được nhấn
              },
              child: Text('Chuyển họ tên và lớp'),
            ),
          ],
        ),
      ),
    );
  }
}
