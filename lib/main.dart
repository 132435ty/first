import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  double? firstNumber;
  double? secondNumber;
  String? operator;
  String display = '';

  void buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'C') {
        display = "";
        firstNumber = 0;
        secondNumber = 0;
        operator = null;
      } else if (buttonText == '=') {
        secondNumber = double.tryParse(display);
        if (firstNumber != null && secondNumber != null && operator != null) {
          switch (operator) {
            case '+':
              display = (firstNumber! + secondNumber!).toString();
            case '-':
              display = (firstNumber! - secondNumber!).toString();
            case '*':
              display = (firstNumber! * secondNumber!).toString();
            case '/':
              display = (firstNumber! / secondNumber!).toString();
          }
        }
      } else if (['+', '-', '*', '/'].contains(buttonText)) {
        firstNumber = double.tryParse(display);
        operator = buttonText;
        display = "";
      } else {
        display += buttonText;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(display, style: TextStyle(fontSize: 52)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              FilledButton(
                  onPressed: (){
                  buttonPressed('1');
              }, child: Text('1')
              ),
              FilledButton(
                  onPressed: (){
                    buttonPressed('2');
                    }, child: Text('2')
              ),
              FilledButton(
                  onPressed: (){
                    buttonPressed('3');
                    }, child: Text('3')
              ),
              FilledButton(
                  onPressed: (){
                    buttonPressed('+');
                    }, child: Text('+')
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              FilledButton(
                  onPressed: (){
                    buttonPressed('4');
                  }, child: Text('4')
              ),FilledButton(
                  onPressed: (){
                    buttonPressed('5');
                  }, child: Text('5')
              ),FilledButton(
                  onPressed: (){
                    buttonPressed('6');
                  }, child: Text('6')
              ),FilledButton(
                  onPressed: (){
                    buttonPressed('-');
                  }, child: Text('-')
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              FilledButton(
                  onPressed: (){
                    buttonPressed('7');
                  }, child: Text('7')
              ),FilledButton(
                  onPressed: (){
                    buttonPressed('8');
                  }, child: Text('8')
              ),FilledButton(
                  onPressed: (){
                    buttonPressed('9');
                  }, child: Text('9')
              ),FilledButton(
                  onPressed: (){
                    buttonPressed('*');
                  }, child: Text('*')
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              FilledButton(
                  onPressed: (){
                    buttonPressed('c');
                  }, child: Text('c')
              ),FilledButton(
                  onPressed: (){
                    buttonPressed('0');
                  }, child: Text('0')
              ),FilledButton(
                  onPressed: (){
                    buttonPressed('=');
                  }, child: Text('=')
              ),FilledButton(
                  onPressed: (){
                    buttonPressed('/');
                  }, child: Text('/')
              ),
            ],
          ),
        ],
      ),
    );
  }
}