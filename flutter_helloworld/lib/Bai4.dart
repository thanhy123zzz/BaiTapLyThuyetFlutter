import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  TextEditingController number1Controller = TextEditingController();
  TextEditingController number2Controller = TextEditingController();
  double result = 0;

  void calculateResult(String operator) {
    double num1 = double.parse(number1Controller.text);
    double num2 = double.parse(number2Controller.text);

    setState(() {
      switch (operator) {
        case '+':
          result = num1 + num2;
          break;
        case '-':
          result = num1 - num2;
          break;
        case '*':
          result = num1 * num2;
          break;
        case '/':
          result = num1 / num2;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Máy tính Hello Kitty - 1080Plus'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/hello-kitty-face-pattern-background-scaled.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.25), // Độ mờ của hình ảnh (giảm độ mờ tại đây)
                BlendMode.dstATop,
              ),
          ),
        )
        ,
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Image.asset('assets/7e-2651.png',width: 200,),
            TextField(
              controller: number1Controller,
              keyboardType: TextInputType.number,
              style: TextStyle(
                color: Colors.pink
              ),
              decoration: InputDecoration(
                labelText: 'Số thứ nhất: ',
                ),
            ),
            TextField(
              controller: number2Controller,
              keyboardType: TextInputType.number,
              style: TextStyle(
                color: Colors.pink
              ),
              decoration: InputDecoration(labelText: 'Số thứ hai: '),
            ),
            SizedBox(height: 16),
            Text(
              'Kết quả: $result',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () => calculateResult('+'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.blue)),
                  child: Text('+'),
                  
                ),
                ElevatedButton(
                  onPressed: () => calculateResult('-'),
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.red)),
                  child: Text('-'),
                ),
                ElevatedButton(
                  onPressed: () => calculateResult('*'),
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green)),
                  child: Text('x'),
                ),
                ElevatedButton(
                  onPressed: () => calculateResult('/'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.yellow),
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.black), // Màu chữ khi nút không được nhấn
                    overlayColor: MaterialStateProperty.all<Color>(Colors.black),
                    ),
                  child: Text(':'),
                  
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
