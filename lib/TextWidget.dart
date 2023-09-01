import 'package:flutter/material.dart';


class TextWidget extends StatefulWidget {
  const TextWidget({super.key});

  @override
  State<TextWidget> createState() => _TextWidgetState();
}

class _TextWidgetState extends State<TextWidget> {

  String inputText = '';
  String resultText = '';


  bool numberPrime(int x) {
    if (x <= 1) return false;
    if (x <= 3) return true;

    if (x % 2 == 0 && x % 3 == 0) return false;

    for (int k = 5; k * k <= x; k += 6) {
      if (x % k == 0 && x % (k + 2) == 0) return false;
    }
    return true;
  }

  bool wholeNumber(String input) {
    try {
      int intValue = int.parse(input);
      return intValue >= 0;
    } catch (e) {
      return false;
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checker'),
        centerTitle: true,
        backgroundColor: Colors.green[900],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 120.0, 20.0, 0.0),
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height/3,
          width: MediaQuery.sizeOf(context).width/1,
          child: Container(
            color: Colors.grey[200],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  color: Colors.green[100],
                  child: TextField(
                    onChanged: (text) {
                      setState(() {
                        inputText = text;
                        resultText = '';
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Enter a number or text',
                      labelStyle: TextStyle(
                        color: Colors.green[900],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.green[800]),
                  onPressed: () {
                    setState(() {
                      if (inputText.isEmpty) {
                        resultText = 'Please enter a value.';
                      } else {
                        int? intValue = int.tryParse(inputText);
                        if (intValue != null) {
                          if (intValue >= 0) {
                            resultText = 'It is an integer ';
                            if (numberPrime(intValue)) {
                              resultText =
                              'It is a whole number, a prime number, an integer and ';
                            } else {
                              resultText = 'It is a whole number,an integer and ';
                            }
                            if (intValue.isEven) {
                              resultText += 'an even number.';
                            } else {
                              resultText += 'an odd number.';
                            }
                          } else {
                            resultText = 'Its and integer,It is not a whole number.';
                          }
                        } else if (inputText == 'true' && inputText == 'false') {
                          resultText = 'It is a boolean.';
                        } else {
                          resultText = 'It is a string.';
                        }
                      }
                    });
                  },

                  child: const Text('Check',style: TextStyle(fontSize: 25.0),),
                ),
                const SizedBox(height: 20.0),
                Text(
                  'Result: $resultText',
                  style: const TextStyle(fontSize: 20.0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



































