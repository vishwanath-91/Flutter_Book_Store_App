import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class AnimatedWidgetText extends StatefulWidget {
  const AnimatedWidgetText({super.key});

  @override
  State<AnimatedWidgetText> createState() => _AnimatedWidgetTextState();
}

class _AnimatedWidgetTextState extends State<AnimatedWidgetText> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      SizedBox(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Be',
              style: TextStyle(fontSize: 43.0),
            ),
            const SizedBox(width: 10.0, height: 100.0),
            DefaultTextStyle(
              style: const TextStyle(
                  fontSize: 40.0,
                  fontFamily: 'Horizon',
                  color: Colors.orangeAccent),
              child: AnimatedTextKit(
                animatedTexts: [
                  RotateAnimatedText('AWESOME'),
                  RotateAnimatedText('OPTIMISTIC'),
                  RotateAnimatedText('DIFFERENT'),
                ],
                onTap: () {
                  print("Tap Event");
                },
              ),
            ),
          ],
        ),
      ),
      const Divider(
        height: 5,
        color: Colors.white,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 250.0,
            child: DefaultTextStyle(
              style: const TextStyle(
                  fontSize: 30.0, fontFamily: 'Agne', color: Colors.redAccent),
              child: AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText('Discipline is the best tool'),
                  TypewriterAnimatedText('Design first, then code'),
                  TypewriterAnimatedText('Do not patch bugs out, rewrite them'),
                  TypewriterAnimatedText(
                      'Do not test bugs out, design them out'),
                ],
                onTap: () {
                  print("Tap Event");
                },
              ),
            ),
          )
        ],
      )
    ]));
  }
}
