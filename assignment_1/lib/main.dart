
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Calculator'),
        ),
        body: const CalculatorScreen(),
      ),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _output = '0';

  void _buttonPressed(String buttonText) {
    setState(() {
      // Just updating the display without any actual calculation
      if (buttonText == 'C') {
        _output = '0';
      } else if (buttonText == '=') {
        // Normally calculation would happen here, but we're just showing the interface
        _output = _output;
      } else {
        if (_output == '0') {
          _output = buttonText;
        } else {
          _output += buttonText;
        }
      }
    });
  }

  Widget _buildButton(String buttonText, {Color? color, Color? textColor}) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(5.0),
        child: ElevatedButton(
          onPressed: () => _buttonPressed(buttonText),
          style: ElevatedButton.styleFrom(
            backgroundColor: color ?? Colors.grey[200],
            foregroundColor: textColor ?? Colors.black,
            textStyle: const TextStyle(fontSize: 24.0),
            padding: const EdgeInsets.all(20.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          child: Text(buttonText),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
          child: Text(
            _output,
            style: const TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
          ),
        ),
        const Expanded(
          child: Divider(),
        ),
        Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                _buildButton('7'),
                _buildButton('8'),
                _buildButton('9'),
                _buildButton('/', color: Colors.orange, textColor: Colors.white),
              ],
            ),
            Row(
              children: <Widget>[
                _buildButton('4'),
                _buildButton('5'),
                _buildButton('6'),
                _buildButton('*', color: Colors.orange, textColor: Colors.white),
              ],
            ),
            Row(
              children: <Widget>[
                _buildButton('1'),
                _buildButton('2'),
                _buildButton('3'),
                _buildButton('-', color: Colors.orange, textColor: Colors.white),
              ],
            ),
            Row(
              children: <Widget>[
                _buildButton('C', color: Colors.red, textColor: Colors.white),
                _buildButton('0'),
                _buildButton('.'),
                _buildButton('+', color: Colors.orange, textColor: Colors.white),
              ],
            ),
            Row(
              children: <Widget>[
                _buildButton('=', color: Colors.orange, textColor: Colors.white),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
