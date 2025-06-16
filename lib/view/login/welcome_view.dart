import 'package:flutter/material.dart';
import 'package:uber_clone_app/common/color_extension.dart';
import 'package:uber_clone_app/common_widget/round_button.dart';
import 'package:uber_clone_app/view/login/sign_in_view.dart';
import 'package:uber_clone_app/view/login/sign_up_view.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColor.bg,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            "assets/img/welcome.jpg",
            width: context.width,
            height: context.height,
            fit: BoxFit.cover,
          ),
          Container(
            width: context.width,
            height: context.height,
            color: Colors.black54.withOpacity(0.8),
          ),
          SafeArea(
            child: Column(
              children: [
                Image.asset(
                  "assets/img/uber-logo.png",
                  width: context.width * 0.30,
                  color: Colors.white,
                ),
                const Spacer(),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: RoundButton(
                      title: "SIGN IN",
                      onPress: () {
                        context.push(const SignInView());
                      }),
                ),
                TextButton(
                  onPressed: () {
                    context.push(const SignUpView());
                  },
                  child: Text(
                    "SIGN UP",
                    style: TextStyle(
                      color: TColor.primaryTextW,
                      fontSize: 16,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
