import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: GoogleFonts.latoTextTheme(Theme.of(context).textTheme),
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var currency = ['USD', 'MMK', 'THB', 'EUR'];
  var valOne = 'USD';
  var valTwo = 'THB';
  final textOne = TextEditingController();
  final textTwo = TextEditingController();
  dynamic calOne;
  dynamic calTwo;

  calculate() {
    if (valOne == 'USD' && valTwo == 'MMK') {
      calTwo = int.parse(textOne.text) * 3000;

      textTwo.text = calTwo.toString();
    } else if (valOne == 'USD' && valTwo == 'THB') {
      calTwo = int.parse(textOne.text) * 35.68;

      textTwo.text = calTwo.toString();
    } else if (valOne == 'USD' && valTwo == 'EUR') {
      calTwo = int.parse(textOne.text) * 0.99;

      textTwo.text = calTwo.toString();
    }
    // USD
    else if (valOne == 'EUR' && valTwo == 'USD') {
      calTwo = int.parse(textOne.text) / 0.99;

      textTwo.text = calTwo.toString();
    } else if (valOne == 'EUR' && valTwo == 'THB') {
      calTwo = int.parse(textOne.text) * 36.1;

      textTwo.text = calTwo.toString();
    } else if (valOne == 'EUR' && valTwo == 'MMK') {
      calTwo = int.parse(textOne.text) * 3001;

      textTwo.text = calTwo.toString();
    }
    // EUR
    else if (valOne == 'THB' && valTwo == 'USD') {
      calTwo = int.parse(textOne.text) / 35.68;

      textTwo.text = calTwo.toString();
    } else if (valOne == 'THB' && valTwo == 'EUR') {
      calTwo = int.parse(textOne.text) / 36.1;

      textTwo.text = calTwo.toString();
    } else if (valOne == 'THB' && valTwo == 'MMK') {
      calTwo = int.parse(textOne.text) * 60;

      textTwo.text = calTwo.toString();
    }
    // THB
    else if (valOne == 'MMK' && valTwo == 'USD') {
      calTwo = int.parse(textOne.text) / 3000;

      textTwo.text = calTwo.toString();
    } else if (valOne == 'MMK' && valTwo == 'THB') {
      calTwo = int.parse(textOne.text) / 60;

      textTwo.text = calTwo.toString();
    } else if (valOne == 'MMK' && valTwo == 'EUR') {
      calTwo = int.parse(textOne.text) / 3001;

      textTwo.text = calTwo.toString();
    }
    // MMK
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.grey,
              ),
              child: const Center(
                child: Text(
                  'Currency Converter',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 30,
                    color: Color(0xFFFFDB58),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white10,
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SizedBox(
                            height: 50,
                            width: 250,
                            child: TextFormField(
                              controller: textOne,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Enter Amount',
                              ),
                              keyboardType: TextInputType.number,
                              onFieldSubmitted: (value) {
                                calculate();
                              },
                            ),
                          ),
                        ),
                        Container(
                          height: 50,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black38),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              alignment: AlignmentDirectional.center,
                              borderRadius: BorderRadius.circular(5),
                              dropdownColor: Colors.grey,
                              iconSize: 30,
                              value: valOne,
                              items: currency.map((item) {
                                return DropdownMenuItem(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                );
                              }).toList(),
                              onChanged: (value) {
                                valTwo != value
                                    ? setState(() {
                                        valOne = value.toString();
                                      })
                                    : null;
                                calculate();
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SizedBox(
                            height: 50,
                            width: 250,
                            child: TextFormField(
                              controller: textTwo,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Enter Amount',
                              ),
                              keyboardType: TextInputType.number,
                              onFieldSubmitted: (value) {
                                calculate();
                              },
                            ),
                          ),
                        ),
                        Container(
                          height: 50,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black38),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                                alignment: AlignmentDirectional.center,
                                borderRadius: BorderRadius.circular(5),
                                dropdownColor: Colors.grey,
                                iconSize: 30,
                                value: valTwo,
                                items: currency.map((item) {
                                  return DropdownMenuItem(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: const TextStyle(fontSize: 18),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  valOne != value
                                      ? setState(() {
                                          valTwo = value.toString();
                                        })
                                      : null;
                                  calculate();
                                }),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
