import 'dart:async';
import 'dart:convert' show jsonDecode;
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:http/http.dart' as http;
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final controller = TextEditingController();
  bool loading = false;
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    controller.dispose();
    super.dispose();
  }

  void getData() async {
    // String url = "http://127.0.0.1:8000/api/";
    // if (Platform.isAndroid) {
    //   url = "http://10.0.2.2:8000/api/";
    // }
    String url = "http://codeanalyser.herokuapp.com/api/";
    http.Response response = await http.get(
      Uri.encodeFull(url + controller.text),
      headers: {"Accept": "application/json"},
    );
    // print(response.body);

    Map<String, dynamic> data = jsonDecode(response.body);
    setState(() {
      loading = false;
    });
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => resultPage(data)));
  }

  @override
  void initState() {
    super.initState();
  }

  Widget _linear() {
    return LinearProgressIndicator();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AR Analysis'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image(
                image: AssetImage('assets/GitHub-Logo.png'),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    // enabledBorder: OutlineInputBorder(
                    //   borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    //   borderSide: BorderSide(color: Colors.bl, width: 2),
                    // ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      borderSide: BorderSide(color: Colors.blue, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.green),
                    ),
                    prefixIcon: Icon(Icons.person),
                    labelText: "GitHub username",
                    suffixIcon: IconButton(
                      icon: Icon(Icons.search),
                      splashColor: Colors.blue,
                      onPressed: () => {
                        setState(() {
                          loading = !loading;
                          getData();
                        })
                      },
                    ),
                  ),
                ),
              ),
              loading ? _linear() : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
