import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:uber_clone_app/common/color_extension.dart';
import 'package:uber_clone_app/common_widget/line_text_field.dart';
import 'package:uber_clone_app/common_widget/round_button.dart';
import 'package:uber_clone_app/view/login/bank_detail_view.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpView();
}

class _SignUpView extends State<SignUpView> {
  FlCountryCodePicker countryCodePicker = const FlCountryCodePicker();
  TextEditingController txtMobile = TextEditingController();
  TextEditingController txtFirstName = TextEditingController();
  TextEditingController txtLastName = TextEditingController();
  TextEditingController txtHomeAddress = TextEditingController();
  late CountryCode countryCode;
  TextEditingController txtPassword = TextEditingController();

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Create Profile",
                style: TextStyle(
                    color: TColor.primaryText,
                    fontSize: 25,
                    letterSpacing: 4.0,
                    fontWeight: FontWeight.w800),
              ),
              const SizedBox(
                height: 30,
              ),
              LineTextField(
                title: "First Name",
                hintText: "Ex: Hanaf",
                controller: txtFirstName,
                right: null,
                obscureText: null,
              ),
              const SizedBox(
                height: 8,
              ),
              LineTextField(
                title: "Last Name",
                hintText: "Ex: Mpore",
                controller: txtLastName,
                right: null,
                obscureText: null,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "Mobile Number",
                style: TextStyle(color: TColor.primaryText, fontSize: 14),
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
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        hintText: "767 878 987",
                      ),
                    ),
                  )
                ],
              ),
              const Divider(),
              const SizedBox(
                height: 8,
              ),
              LineTextField(
                title: "Home address",
                hintText: "Ex: home no, name, street, city, state",
                controller: txtHomeAddress,
                right: null,
                obscureText: null,
              ),
              const SizedBox(
                height: 8,
              ),
              LineTextField(
                title: "Password",
                hintText: "******",
                controller: txtPassword,
                right: IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    "assets/img/hide_password.png",
                    width: 25,
                    height: 25,
                  ),
                ),
                obscureText: true,
              ),
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
                title: "REGISTER",
                onPress: () {
                  context.push(const BankDetailView());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
