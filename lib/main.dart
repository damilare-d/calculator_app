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
  String? history;
  String? textToDisplay;
  String? res;
  String? operation;

  void btnOnClick(String btnVal) {
    print(btnVal);
    if (btnVal == 'C') {
      textToDisplay = '';
      firstNum = 0;
      secondNum = 0;
      res = '';
    } else if (btnVal == 'AC') {
      textToDisplay = '';
      firstNum = 0;
      secondNum = 0;
      res = '';
      history = '';
    } else if (btnVal == '<') {
      res = textToDisplay?.substring(0, textToDisplay!.length - 1);
    } else if (btnVal == '+' ||
        btnVal == '-' ||
        btnVal == '*' ||
        btnVal == '/') {
      firstNum = int.parse(textToDisplay!);
      res = '';
      operation = btnVal;
    } else if (btnVal == '*') {
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            alignment: const Alignment(1.0, 1.0),
            child: Text(history!,
                style: GoogleFonts.rubik(
                    textStyle:
                        const TextStyle(fontSize: 24, color: Colors.blueGrey))),
          ),
          Container(
            padding: const EdgeInsets.all(12),
            alignment: const Alignment(1.0, 1.0),
            child: Text(textToDisplay!,
                style: GoogleFonts.rubik(
                    textStyle:
                        const TextStyle(fontSize: 48, color: Colors.blueGrey))),
          ),
          Row(children: [
            CalculatorButton(
              buttonText: '.',
              buttonOnPressed: btnOnClick,
              buttonColor: Colors.white,
              textColor: Colors.black,
            ),
            CalculatorButton(
              buttonText: '0',
              buttonOnPressed: () {},
              buttonColor: Colors.white,
              textColor: Colors.black,
            ),
            CalculatorButton(
              buttonText: '<',
              buttonOnPressed: () {},
              buttonColor: Colors.white,
              textColor: Colors.black,
            ),
            CalculatorButton(
              buttonText: '=',
              buttonOnPressed: () {},
              buttonColor: Colors.white,
              textColor: Colors.black,
            )
          ]),
          Row(children: [
            CalculatorButton(
              buttonText: '1',
              buttonOnPressed: () {},
              buttonColor: Colors.white,
              textColor: Colors.black,
            ),
            CalculatorButton(
              buttonText: '2',
              buttonOnPressed: () {},
              buttonColor: Colors.white,
              textColor: Colors.black,
            ),
            CalculatorButton(
              buttonText: '3',
              buttonOnPressed: () {},
              buttonColor: Colors.white,
              textColor: Colors.black,
            ),
            CalculatorButton(
              buttonText: '+',
              buttonOnPressed: () {},
              buttonColor: Colors.white,
              textColor: Colors.black,
            )
          ]),
          Row(children: [
            CalculatorButton(
              buttonText: '4',
              buttonOnPressed: () {},
              buttonColor: Colors.white,
              textColor: Colors.black,
            ),
            CalculatorButton(
              buttonText: '5',
              buttonOnPressed: () {},
              buttonColor: Colors.white,
              textColor: Colors.black,
            ),
            CalculatorButton(
              buttonText: '6',
              buttonOnPressed: () {},
              buttonColor: Colors.white,
              textColor: Colors.black,
            ),
            CalculatorButton(
              buttonText: '-',
              buttonOnPressed: () {},
              buttonColor: Colors.white,
              textColor: Colors.black,
            )
          ]),
          Row(children: [
            CalculatorButton(
              buttonText: '7',
              buttonOnPressed: () {},
              buttonColor: Colors.white,
              textColor: Colors.black,
            ),
            CalculatorButton(
              buttonText: '8',
              buttonOnPressed: () {},
              buttonColor: Colors.white,
              textColor: Colors.black,
            ),
            CalculatorButton(
              buttonText: '9',
              buttonOnPressed: () {},
              buttonColor: Colors.white,
              textColor: Colors.black,
            ),
            CalculatorButton(
              buttonText: '/',
              buttonOnPressed: () {},
              buttonColor: Colors.white,
              textColor: Colors.black,
            )
          ]),
          Row(children: [
            CalculatorButton(
              buttonText: 'C',
              buttonOnPressed: () {},
              buttonColor: Colors.white,
              textColor: Colors.black,
            ),
            CalculatorButton(
              buttonText: '(',
              buttonOnPressed: () {},
              buttonColor: Colors.white,
              textColor: Colors.black,
            ),
            CalculatorButton(
              buttonText: ')',
              buttonOnPressed: () {},
              buttonColor: Colors.white,
              textColor: Colors.black,
            ),
            CalculatorButton(
              buttonText: '*',
              buttonOnPressed: () {},
              buttonColor: Colors.white,
              textColor: Colors.black,
            )
          ])
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
      height: 10,
      width: 10,
      decoration: BoxDecoration(
          color: buttonColor, borderRadius: BorderRadius.circular(15)),
      child: TextButton(
        onPressed: () => buttonOnPressed(buttonText),
        child: Text(buttonText, style: TextStyle(color: textColor)),
      ),
    );
  }
}
