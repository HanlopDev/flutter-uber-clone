import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:uber_clone_app/common/color_extension.dart';
import 'package:uber_clone_app/common_widget/round_button.dart';
import 'package:uber_clone_app/view/login/otp_view.dart';

class MobileNumberView extends StatefulWidget {
  const MobileNumberView({super.key});

  @override
  State<MobileNumberView> createState() => _MobileNumberView();
}

class _MobileNumberView extends State<MobileNumberView> {
  FlCountryCodePicker countryCodePicker = const FlCountryCodePicker();
  TextEditingController txtMobile = TextEditingController();
  late CountryCode countryCode;

  @override
  void initState() {
    super.initState();
    countryCode = countryCodePicker.countryCodes
        .firstWhere((element) => element.name == "Tanzania");
  }

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
              "Enter mobile  number",
              style: TextStyle(
                  color: TColor.primaryText,
                  fontSize: 25,
                  fontWeight: FontWeight.w800),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () async {
                    final code =
                        await countryCodePicker.showPicker(context: context);
                    if (code != null) {
                      countryCode = code;
                      setState(() {});
                    }
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 20,
                        width: 30,
                        child: countryCode.flagImage(),
                      ),
                      Text(
                        " ${countryCode.dialCode}",
                        style: TextStyle(
                          color: TColor.primaryText,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: TextField(
                    controller: txtMobile,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      hintText: "767 878 987",
                      hintStyle: TextStyle(
                        color: TColor.placeHolder,
                      ),
                    ),
                  ),
                )
              ],
            ),
            const Divider(),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "By countinuing, I confirm i  have read and agree withh the",
                  style: TextStyle(
                    color: TColor.primaryText,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Terms and conditions",
                  style: TextStyle(
                    color: TColor.primaryText,
                    fontSize: 11,
                  ),
                ),
                Text(
                  " and ",
                  style: TextStyle(
                    color: TColor.primaryText,
                    fontSize: 11,
                  ),
                ),
                Text(
                  "Privacy policy",
                  style: TextStyle(
                    color: TColor.primaryText,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            RoundButton(
              title: "CONTINUE",
              onPress: () {
                context
                    .push(const OTPView(number: "897 765   876", code: "+255"));
              },
            ),
          ],
        ),
      ),
    );
  }
}
