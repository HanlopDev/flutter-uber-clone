import 'package:flutter/material.dart';
import 'package:uber_clone_app/common/color_extension.dart';
import 'package:uber_clone_app/common_widget/line_text_field.dart';
import 'package:uber_clone_app/common_widget/round_button.dart';
import 'package:uber_clone_app/view/login/document_upload_details.dart';

class BankDetailView extends StatefulWidget {
  const BankDetailView({super.key});

  @override
  State<BankDetailView> createState() => _BankDetailView();
}

class _BankDetailView extends State<BankDetailView> {
  TextEditingController txtBankName = TextEditingController();
  TextEditingController txtAccountHolderName = TextEditingController();
  TextEditingController txtAccountNumber = TextEditingController();
  TextEditingController txtSwiftCode = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Image.asset("assets/img/back.png", width: 20, height: 20),
          color: const Color.fromARGB(255, 163, 163, 163),
        ),
        centerTitle: true,
        title: Text(
          "Bank Details",
          style: TextStyle(
              color: TColor.primaryText,
              fontSize: 25,
              letterSpacing: 4.0,
              fontWeight: FontWeight.w800),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              LineTextField(
                title: "Bank Name",
                hintText: "Ex: CRDB",
                controller: txtBankName,
                right: null,
                obscureText: null,
              ),
              const SizedBox(
                height: 8,
              ),
              LineTextField(
                title: "Account Holder Name",
                hintText: "Ex: Hanaf Mpore",
                controller: txtAccountHolderName,
                right: null,
                obscureText: null,
              ),
              const SizedBox(
                height: 8,
              ),
              const SizedBox(
                height: 8,
              ),
              LineTextField(
                title: "Account Number",
                hintText: "Ex: 122 876 978 098",
                controller: txtAccountNumber,
                right: null,
                obscureText: null,
              ),
              const SizedBox(
                height: 8,
              ),
              LineTextField(
                title: "Swift/IFSC Code",
                hintText: "YT675C",
                controller: txtSwiftCode,
                right: null,
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
                title: "NEXT",
                onPress: () {
                  context.push(
                      const DocumentUploadView(title: "Upload Documents"));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
