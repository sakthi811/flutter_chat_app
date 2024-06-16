import 'package:flutter/material.dart';
import 'package:flutter_flash_chat/screens/login_screen.dart';
import 'package:flutter_flash_chat/screens/registration_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_flash_chat/widgets/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  static String id = 'welcome_screen';

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animController;
  late Animation animation;

  @override
  void initState() {
    super.initState();
    animController =
        AnimationController(duration: Duration(seconds: 5), vsync: this);
    animation =
        ColorTween(begin: Colors.red, end: Colors.blue).animate(animController);
    animController.forward();
    animController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    animController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Hero(
                      tag: 'logo',
                      child: Container(
                        child: Image.asset('images/logo.png'),
                        height: 60.0,
                      ),
                    ),
                    AnimatedTextKit(
                      animatedTexts: [
                        TypewriterAnimatedText(
                          'Flash Chat',
                          textStyle: const TextStyle(
                            fontSize: 45.0,
                            color: Colors.black,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w900,
                          ),
                          speed: const Duration(milliseconds: 200),
                        ),
                      ],
                      totalRepeatCount: 4,
                      pause: const Duration(milliseconds: 100),
                      displayFullTextOnTap: true,
                      stopPauseOnTap: true,
                    )
                  ],
                ),
                SizedBox(
                  height: 48.0,
                ),
                RoundedButton(
                    buttonColor: Colors.lightBlueAccent,
                    buttonTitle: 'Log In',
                    onPressed: () {
                      Navigator.pushNamed(context, LoginScreen.id);
                    }),
                RoundedButton(
                    buttonColor: Colors.blueAccent,
                    buttonTitle: 'Register',
                    onPressed: () {
                      Navigator.pushNamed(context, RegistrationScreen.id);
                    })
              ],
            )));
  }
}
