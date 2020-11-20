import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final inputController = TextEditingController();
  String value, oldValue = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('MyApp'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 200.0,
                child: TextField(
                  controller: inputController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1.0),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Output: $value',
                style: TextStyle(
                  fontSize: 28,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlatButton(
                    onPressed: () {
                      setState(() {
                        value = inputController.text;
                      });
                    },
                    child: Text('Reverse'),
                  ),
                  FlatButton(
                    onPressed: () {},
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          oldValue = inputController.text;
                        });
                        inputController.clear();
                      },
                      onDoubleTap: () {
                        setState(() {
                          inputController.text = oldValue;
                        });
                      },
                      child: Text('Undo/Redo'),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
