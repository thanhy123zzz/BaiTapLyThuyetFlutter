import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ỨNG DỤNG ĐỔI HÌNH NỀN',
      home: BackgroundChangerScreen(),
    );
  }
}

class BackgroundChangerScreen extends StatefulWidget {
  @override
  _BackgroundChangerScreenState createState() => _BackgroundChangerScreenState();
}

class _BackgroundChangerScreenState extends State<BackgroundChangerScreen> {
  bool isBackgroundBlue = true;

  void changeBackground() {
    setState(() {
      isBackgroundBlue = !isBackgroundBlue;
    });
  }

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = isBackgroundBlue ? Colors.blue : Colors.green;

    return Scaffold(
      appBar: AppBar(
        title: Text('ỨNG DỤNG ĐỔI HÌNH NỀN'),
      ),
      body: Container(
        color: backgroundColor,
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              changeBackground();
            },
            child: Text('Đổi hình nền'),
          ),
        ),
      ),
    );
  }
}
