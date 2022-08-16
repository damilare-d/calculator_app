import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MaterialApp(
    home: CalculatorScreen(),
  ));
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  int? firstNum;
  int? secondNum;
  String? history = '00';
  String? textToDisplay = '0';
  String? res;
  String? operation;

  void btnOnClick(String btnVal) {
    if (btnVal == 'C') {
      textToDisplay = '';
      firstNum = 0;
      secondNum = 0;
      res = '';
    } else if (btnVal == '<') {
      res = textToDisplay?.substring(0, textToDisplay!.length - 1);
    } else if (btnVal == '+' ||
        btnVal == '-' ||
        btnVal == '*' ||
        btnVal == '/') {
      firstNum = int.parse(textToDisplay!);
      res = '';
      operation = btnVal;
    } else if (btnVal == '=') {
      secondNum = int.parse(textToDisplay!);
      if (operation == '+') {
        res = (firstNum! + secondNum!).toString();
        history =
            firstNum.toString() + operation.toString() + secondNum.toString();
      }
      if (operation == '-') {
        res = (firstNum! - secondNum!).toString();
        history =
            firstNum.toString() + operation.toString() + secondNum.toString();
      }
      if (operation == '*') {
        res = (firstNum! * secondNum!).toString();
        history =
            firstNum.toString() + operation.toString() + secondNum.toString();
      }
      if (operation == '/') {
        res = (firstNum! / secondNum!).toString();
        history =
            firstNum.toString() + operation.toString() + secondNum.toString();
      }
    } else {
      res = int.parse(textToDisplay! + btnVal).toString();
    }
    setState(() {
      textToDisplay = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calculator')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            alignment: const Alignment(1.0, 1.0),
            child: Text(history ?? '00',
                style: GoogleFonts.rubik(
                    textStyle:
                        const TextStyle(fontSize: 24, color: Colors.blueGrey))),
          ),
          Container(
            padding: const EdgeInsets.all(12),
            alignment: const Alignment(1.0, 1.0),
            child: Text(textToDisplay ?? '0',
                style: GoogleFonts.rubik(
                    textStyle:
                        const TextStyle(fontSize: 48, color: Colors.blueGrey))),
          ),
          Row(children: [
            CalculatorButton(
              buttonText: 'C',
              buttonOnPressed: btnOnClick,
              buttonColor: Colors.yellow.shade200,
              textColor: Colors.black,
            ),
            CalculatorButton(
              buttonText: '(',
              buttonOnPressed: btnOnClick,
              buttonColor: Colors.yellow.shade200,
              textColor: Colors.black,
            ),
            CalculatorButton(
              buttonText: ')',
              buttonOnPressed: btnOnClick,
              buttonColor: Colors.yellow.shade200,
              textColor: Colors.black,
            ),
            CalculatorButton(
              buttonText: '*',
              buttonOnPressed: btnOnClick,
              buttonColor: Colors.purpleAccent,
              textColor: Colors.black,
            )
          ]),
          Row(children: [
            CalculatorButton(
              buttonText: '7',
              buttonOnPressed: btnOnClick,
              buttonColor: Colors.white,
              textColor: Colors.black,
            ),
            CalculatorButton(
              buttonText: '8',
              buttonOnPressed: btnOnClick,
              buttonColor: Colors.white,
              textColor: Colors.black,
            ),
            CalculatorButton(
              buttonText: '9',
              buttonOnPressed: btnOnClick,
              buttonColor: Colors.white,
              textColor: Colors.black,
            ),
            CalculatorButton(
              buttonText: '/',
              buttonOnPressed: btnOnClick,
              buttonColor: Colors.purpleAccent,
              textColor: Colors.black,
            )
          ]),
          Row(children: [
            CalculatorButton(
              buttonText: '4',
              buttonOnPressed: btnOnClick,
              buttonColor: Colors.white,
              textColor: Colors.black,
            ),
            CalculatorButton(
              buttonText: '5',
              buttonOnPressed: btnOnClick,
              buttonColor: Colors.white,
              textColor: Colors.black,
            ),
            CalculatorButton(
              buttonText: '6',
              buttonOnPressed: btnOnClick,
              buttonColor: Colors.white,
              textColor: Colors.black,
            ),
            CalculatorButton(
              buttonText: '-',
              buttonOnPressed: btnOnClick,
              buttonColor: Colors.purpleAccent,
              textColor: Colors.black,
            )
          ]),
          Row(children: [
            CalculatorButton(
              buttonText: '1',
              buttonOnPressed: btnOnClick,
              buttonColor: Colors.white,
              textColor: Colors.black,
            ),
            CalculatorButton(
              buttonText: '2',
              buttonOnPressed: btnOnClick,
              buttonColor: Colors.white,
              textColor: Colors.black,
            ),
            CalculatorButton(
              buttonText: '3',
              buttonOnPressed: btnOnClick,
              buttonColor: Colors.white,
              textColor: Colors.black,
            ),
            CalculatorButton(
              buttonText: '+',
              buttonOnPressed: btnOnClick,
              buttonColor: Colors.purpleAccent,
              textColor: Colors.black,
            )
          ]),
          Row(children: [
            CalculatorButton(
              buttonText: '.',
              buttonOnPressed: btnOnClick,
              buttonColor: Colors.white,
              textColor: Colors.black,
            ),
            CalculatorButton(
              buttonText: '0',
              buttonOnPressed: btnOnClick,
              buttonColor: Colors.white,
              textColor: Colors.black,
            ),
            CalculatorButton(
              buttonText: '<',
              buttonOnPressed: btnOnClick,
              buttonColor: Colors.white,
              textColor: Colors.black,
            ),
            CalculatorButton(
              buttonText: '=',
              buttonOnPressed: btnOnClick,
              buttonColor: Colors.deepPurple,
              textColor: Colors.black,
            )
          ]),
        ],
      ),
    );
  }
}

class CalculatorButton extends StatelessWidget {
  final String buttonText;
  final Color buttonColor;
  final Color textColor;
  final Function buttonOnPressed;

  const CalculatorButton(
      {required this.buttonText,
      required this.buttonColor,
      required this.textColor,
      required this.buttonOnPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: 70,
      width: 70,
      decoration: BoxDecoration(
          color: buttonColor, borderRadius: BorderRadius.circular(85)),
      child: TextButton(
        onPressed: () => buttonOnPressed(buttonText),
        child:
            Text(buttonText, style: TextStyle(color: textColor, fontSize: 15)),
      ),
    );
  }
}
