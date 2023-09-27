import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/auth/sign_in/sign_in_page.dart';
import 'package:flutter_firebase_auth/auth/sign_up/sign_up_function.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formkey = GlobalKey<FormState>();
  String userName = '';
  String email = "";
  String password = "";

  printValut() {
    print(userName);
    print(email);
    print(password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SignUp Form"),
      ),
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Stack(children: [
              Positioned(
                  child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    // Where the linear gradient begins and ends
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    // Add one stop for each color. Stops should increase from 0 to 1
                    stops: [0.1, 0.5, 0.7, 0.9],
                    colors: [
                      // Colors are easy thanks to Flutter's Colors class.
                      Colors.deepPurpleAccent,
                      Colors.deepOrange,
                      Colors.white,
                      Colors.blueAccent,
                    ],
                  ),
                ),
              )),
              Positioned(
                  child: Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [])),
              )),
              Positioned(
                  left: 45,
                  top: 120,
                  width: 300,
                  height: 400,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Container(
                      margin: const EdgeInsets.all(20),
                      child: Form(
                          key: _formkey,
                          child: Column(
                            children: [
                              TextFormField(
                                key: const ValueKey("User Name"),
                                decoration: const InputDecoration(
                                    hintText: "User Name"),
                                validator: (value) {
                                  if (value.toString().isEmpty) {
                                    return "User Name should not be empty";
                                  } else if (value.toString().length < 3) {
                                    return "User Name should Not be Less them 3";
                                  }
                                  return null;
                                },
                                onSaved: (newValue) {
                                  setState(() {
                                    userName = newValue.toString();
                                  });
                                },
                              ),
                              TextFormField(
                                key: const ValueKey("email"),
                                decoration: const InputDecoration(
                                    hintText: "Enter your Email"),
                                validator: (value) {
                                  if (value.toString().isEmpty) {
                                    return "email should not be empty";
                                  } else if (!(value
                                      .toString()
                                      .contains("@"))) {
                                    return "invalid email address";
                                  }
                                  return null;
                                },
                                onSaved: (newValue) {
                                  setState(() {
                                    email = newValue.toString();
                                  });
                                },
                              ),
                              TextFormField(
                                obscureText: true,
                                key: const ValueKey("password"),
                                decoration: const InputDecoration(
                                    hintText: "Enter your password"),
                                validator: (value) {
                                  if (value.toString().isEmpty) {
                                    return "password should not be empty";
                                  } else if (value.toString().length < 7) {
                                    return "password should not be less then 7";
                                  }
                                  return null;
                                },
                                onSaved: (newValue) {
                                  setState(() {
                                    password = newValue.toString();
                                  });
                                },
                              ),
                              ElevatedButton(
                                  onPressed: () async {
                                    if (_formkey.currentState!.validate()) {
                                      _formkey.currentState!.save();
                                      await createUserWithEmailAndPassword(
                                          email, password);
                                      printValut();
                                    }
                                  },
                                  child: const Text("SignUp")),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text("Allready SignIn Account?"),
                                  InkWell(
                                    onTap: () {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const SignInPage(),
                                          ));
                                    },
                                    child: const Text(
                                      "SignIn",
                                      style:
                                          TextStyle(color: Colors.blueAccent),
                                    ),
                                  )
                                ],
                              )
                            ],
                          )),
                    ),
                  ))
            ]),
          ),
        ],
      ),
    );
  }
}
