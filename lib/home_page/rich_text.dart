import 'package:flutter/material.dart';

class RichFont extends StatelessWidget {
  const RichFont({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RichText(
          text: TextSpan(
        text: 'hi ',
        style: DefaultTextStyle.of(context).style,
        children: const <TextSpan>[
          TextSpan(
              text: 'this',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.pink)),
          TextSpan(text: ' is!'),
          TextSpan(
            text: ' Rich',
            style: TextStyle(fontSize: 40, color: Colors.indigo),
          ),
          TextSpan(text: ' Text'),
          TextSpan(
              text: ' Example',
              style:
                  TextStyle(fontSize: 25, color: Colors.deepPurpleAccent)),
        ],
          ),
        ),
      ),
    );
  }
}
