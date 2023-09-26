import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/auth/sign_in/sign_in_function.dart';
import 'package:flutter_firebase_auth/home_page/home_pages.dart';

class SignIpPage extends StatefulWidget {
  const SignIpPage({super.key});

  @override
  State<SignIpPage> createState() => _SignIpPageState();
}

class _SignIpPageState extends State<SignIpPage> {
  final _formkey = GlobalKey<FormState>();

  String email = "";
  String password = "";

  printValut() {
    print(email);
    print(password);
  }

  goToNextPage() async {
    if (FirebaseAuth.instance.currentUser?.uid != null) {
      await Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const Home(),
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SignIn Form"),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(30),
            child: Form(
                key: _formkey,
                child: Column(
                  children: [
                    TextFormField(
                      key: const ValueKey("email"),
                      decoration: const InputDecoration(
                          hintText: "Enter your Email Here"),
                      validator: (value) {
                        if (value.toString().isEmpty) {
                          return "email should not be empty";
                        } else if (!(value.toString().contains("@"))) {
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
                          hintText: "Enter your password Here"),
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
                            await signInWithEmailAndPassword(email, password);
                          }
                          printValut();
                          goToNextPage();
                        },
                        child: const Text("SignIn"))
                  ],
                )),
          )
        ],
      ),
    );
  }
}
