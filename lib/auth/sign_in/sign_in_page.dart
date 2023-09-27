import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/auth/sign_in/sign_in_function.dart';
import 'package:flutter_firebase_auth/auth/sign_up/sign_up_page.dart';
import 'package:flutter_firebase_auth/home_page/home_pages.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();

  String email = "";
  String password = "";

  printValue() {
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
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      key: const ValueKey("email"),
                      decoration:
                          const InputDecoration(hintText: "Enter your Email"),
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
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            await signInWithEmailAndPassword(email, password);
                          }
                          printValue();
                          goToNextPage();
                        },
                        child: const Text("SignIn")),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account?"),
                        InkWell(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignUpPage(),
                                ));
                          },
                          child: const Text(
                            "SignUp",
                            style: TextStyle(color: Colors.blueAccent),
                          ),
                        )
                      ],
                    )
                  ],
                )),
          )
        ],
      ),
    );
  }
}
