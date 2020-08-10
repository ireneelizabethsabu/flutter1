import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(Calculator());
}

class Calculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CALCULATOR',
      home: SimpleCalculator(),
    );
  }
}

class SimpleCalculator extends StatefulWidget {
  @override
  _SimpleCalculatorState createState() => _SimpleCalculatorState();
}

class _SimpleCalculatorState extends State<SimpleCalculator> {

  String equation="0";
  String result="0";
  String expression="";

  buttonPressed(String buttonText){
    setState(() {
        if(buttonText == "C"){
          equation = "0";
          result = "0";
        }
        else if(buttonText == "⌫"){
          if(equation.length > 1)
          equation = equation.substring(0,equation.length-1);
          else
            equation ="0";
        }
        else if(buttonText == "="){
            expression = equation;
            expression = expression.replaceAll('×', '*');
            expression = expression.replaceAll('÷', '/');
            try {
              Parser p = new Parser();
              Expression exp = p.parse(expression);
              ContextModel cm=ContextModel();
              result = '${exp.evaluate(EvaluationType.REAL, cm)}';
      }catch(e){
              result = "Error";
            }
        }
        else {
          if(equation == "0")
            equation = buttonText;
          else
          equation =equation + buttonText;
        }
    });
  }

  Widget buildButton(String buttonText, double buttonHeight, Color buttonColor) {
    return Container(
      height: MediaQuery.of(context).size.height * buttonHeight,
      color: buttonColor,
      child: FlatButton(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Colors.white60,
            width: 1.0,
          ),
        ),
        padding: EdgeInsets.all(16.0),
        onPressed: () => buttonPressed(buttonText),
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: 30.0,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[900],
        title: Text(
          'CALCULATOR',
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            alignment: Alignment.centerRight,
            color: Colors.white70,
            padding: EdgeInsets.fromLTRB(10, 20, 20, 0),
            child: Text(
              equation,
              style: TextStyle(fontSize: 38.0),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            color: Colors.white70,
            padding: EdgeInsets.fromLTRB(10, 20, 20, 0),
            child: Text(
              result,
              style: TextStyle(fontSize: 48.0),
            ),
          ),
          Expanded(
            child: Divider(),
          ),
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 1.0,
                child: Table(
                  children: [
                    TableRow(
                      children: [
                        buildButton('C', 0.1, Colors.green[400]),
                        buildButton('⌫', 0.1, Colors.green[400]),
                        buildButton('%', 0.1, Colors.green[400]),
                        buildButton('÷', 0.1, Colors.green[400]),
                      ],
                    ),
                    TableRow(
                      children: [
                        buildButton('7', 0.1, Colors.green[200]),
                        buildButton('8', 0.1, Colors.green[200]),
                        buildButton('9', 0.1, Colors.green[200]),
                        buildButton('×', 0.1, Colors.green[400]),
                      ],
                    ),
                    TableRow(
                      children: [
                        buildButton('4', 0.1, Colors.green[200]),
                        buildButton('5', 0.1, Colors.green[200]),
                        buildButton('6', 0.1, Colors.green[200]),
                        buildButton('-', 0.1, Colors.green[400]),
                      ],
                    ),
                    TableRow(
                      children: [
                        buildButton('1', 0.1, Colors.green[200]),
                        buildButton('2', 0.1, Colors.green[200]),
                        buildButton('3', 0.1, Colors.green[200]),
                        buildButton('+', 0.1, Colors.green[400]),
                      ],
                    ),
                    TableRow(
                      children: [
                        buildButton('', 0.1, Colors.green[400]),
                        buildButton('0', 0.1, Colors.green[200]),
                        buildButton('.', 0.1, Colors.green[400]),
                        buildButton('=', 0.1, Colors.green[400]),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
