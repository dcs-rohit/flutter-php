import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_php/utills/styles.dart';
import 'package:flutter_php/widgets/textWidget.dart';
import 'package:http/http.dart' as http;
import 'package:modal_progress_hud/modal_progress_hud.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: TextTheme(headline1: TextStyle(fontSize: 16)),
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var regKey = GlobalKey<FormState>();
  bool inAsyncCall = false, buttonPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: ModalProgressHUD(
          inAsyncCall: inAsyncCall,
          progressIndicator: (Platform.isIOS)
              ? CupertinoActivityIndicator()
              : CircularProgressIndicator(),
          child: Form(
            autovalidate: true,
            key: regKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //Full Name TextForm
                MyTextFormField(
                  controller: nameController,
                  validator: (value) =>
                      value.isEmpty ? "Required Field*" : null,
                  hintText: "Enter Full Name",
                ),

                //Email TextForm Field
                MyTextFormField(
                  controller: emailController,
                  validator: (value) =>
                      value.isEmpty ? "Required Field*" : null,
                  hintText: "Enter Full Name",
                ),

                // Password TextForm Field
                MyTextFormField(
                  controller: passwordController,
                  validator: (value) =>
                      value.isEmpty ? "Required Field*" : null,
                  hintText: "Enter Full Name",
                ),

                RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    "SignUp",
                    style: myTextStyle(color: Colors.white),
                  ),
                  color: Colors.blueAccent,
                  onPressed: () {
                    if (regKey.currentState.validate()) {
                      if (buttonPressed == false) {
                        buttonPressed = true;
                        print("buttonPressed");
//                        _saveData();
                      }
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _saveData() async {
    var url = "http://192.168.42.3/phpLearning/createReg.php";
    var data = {
      "name": nameController.text,
      "email": emailController.text,
      "password": passwordController.text
    };
    setState(() {
      inAsyncCall = true;
      buttonPressed = false;
    });
    var res = await http.post(url, body: data);
    if (res.statusCode == 200) {
      print(res.body);
    } else {
      print("error");
    }
    inAsyncCall = false;
  }
/* var client = new http.Client();
    try {
      await client.get('https://flutter.dev/');

    }
    finally {
      client.close();
    }*/

}
