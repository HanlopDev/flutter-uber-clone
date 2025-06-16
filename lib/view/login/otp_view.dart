import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:otp_timer_button/otp_timer_button.dart';
import 'package:uber_clone_app/common/color_extension.dart';
import 'package:uber_clone_app/common_widget/round_button.dart';

class OTPView extends StatefulWidget {
  final String number;
  final String code;
  const OTPView({super.key, required this.number, required this.code});

  @override
  State<OTPView> createState() => _OTPView();
}

class _OTPView extends State<OTPView> {
  TextEditingController txtMobile = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Image.asset("assets/img/back.png", width: 20, height: 20),
          color: const Color.fromARGB(255, 163, 163, 163),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "OTP Verification",
              style: TextStyle(
                  color: TColor.primaryText,
                  fontSize: 25,
                  fontWeight: FontWeight.w800),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Enter  0-digits code sent to you  at",
              style: TextStyle(
                color: TColor.primaryText,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "${widget.code} ${widget.number}",
                  style: TextStyle(
                    color: TColor.primaryText,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(width: 8),
                TextButton(
                  onPressed: () {
                    context.pop();
                  },
                  child: Text(
                    "Edit",
                    style: TextStyle(
                      color: TColor.secondary,
                      fontSize: 16,
                    ),
                  ),
                )
              ],
            ),
            OtpTextField(
              numberOfFields: 6,
              borderColor: TColor.placeHolder,
              focusedBorderColor: TColor.lightGray,
              textStyle: TextStyle(
                color: TColor.primaryText,
                fontSize: 16,
              ),
              showFieldAsBox: false,
              borderWidth: 1.0,
              //runs when a code is typed in
              onCodeChanged: (String code) {
                //handle validation or checks here if necessary
              },
              //runs when every textfield is filled
              onSubmit: (String verificationCode) {},
            ),
            const SizedBox(
              height: 20,
            ),
            RoundButton(
              title: "SUBMIT",
              onPress: () {},
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OtpTimerButton(
                  height: 60,
                  onPressed: () {},
                  text: const Text(
                    'Resend OTP',
                    style: TextStyle(fontSize: 16),
                  ),
                  buttonType: ButtonType.text_button,
                  backgroundColor: TColor.primaryText,
                  duration: 60,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
