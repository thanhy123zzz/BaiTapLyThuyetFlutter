import 'package:flutter/material.dart';

void main() {
  runApp(PrimeNumberCheckerApp());
}

class PrimeNumberCheckerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kiểm tra số nguyên tố',
      home: PrimeNumberCheckerScreen(),
    );
  }
}

class PrimeNumberCheckerScreen extends StatefulWidget {
  @override
  _PrimeNumberCheckerScreenState createState() => _PrimeNumberCheckerScreenState();
}

class _PrimeNumberCheckerScreenState extends State<PrimeNumberCheckerScreen> {
  TextEditingController numberController = TextEditingController();
  bool isPrime = false;

  bool checkPrime(int number) {
    if (number <= 1) return false;
    if (number == 2) return true;
    for (int i = 2; i <= number / 2; i++) {
      if (number % i == 0) return false;
    }
    return true;
  }

  void onCheckButtonPressed() {
    int number = int.tryParse(numberController.text) ?? 0;
    setState(() {
      isPrime = checkPrime(number);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prime Number Checker'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: numberController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Nhập 1 số nguyên',
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: onCheckButtonPressed,
              child: Text('Kiểm tra'),
            ),
            SizedBox(height: 16),
            Text(
              isPrime ? 'Đây là số nguyên tố.' : 'Đây không phải là số nguyên tố.',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
