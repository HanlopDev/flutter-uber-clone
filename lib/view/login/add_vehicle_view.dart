import 'package:flutter/material.dart';
import 'package:uber_clone_app/common/color_extension.dart';
import 'package:uber_clone_app/common_widget/line_text_field.dart';
import 'package:uber_clone_app/common_widget/round_button.dart';
import 'package:uber_clone_app/view/login/vehicle_document_view.dart';

class AddVehicleView extends StatefulWidget {
  const AddVehicleView({super.key});

  @override
  State<AddVehicleView> createState() => _AddVehicleView();
}

class _AddVehicleView extends State<AddVehicleView> {
  TextEditingController txtServiceType = TextEditingController();
  TextEditingController txtBrandName = TextEditingController();
  TextEditingController txtModelName = TextEditingController();
  TextEditingController txtManufucturer = TextEditingController();
  TextEditingController txtNumberPlate = TextEditingController();
  TextEditingController txtColor = TextEditingController();

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
          "Add Vehicle",
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
                title: "Service Type",
                hintText: "Ex: Micro",
                controller: txtServiceType,
                right: null,
                obscureText: null,
              ),
              const SizedBox(
                height: 8,
              ),
              LineTextField(
                title: "Brand (Auto Suggestion)",
                hintText: "Ex: BMW",
                controller: txtBrandName,
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
                title: "Model (Auto Suggestion)",
                hintText: "Ex: X5",
                controller: txtModelName,
                right: null,
                obscureText: null,
              ),
              const SizedBox(
                height: 8,
              ),
              LineTextField(
                title: "Manufacturer (Auto Suggestion)",
                hintText: "BMW",
                controller: txtManufucturer,
                right: null,
                obscureText: true,
              ),
              const SizedBox(
                height: 8,
              ),
              LineTextField(
                title: "Number Plate",
                hintText: "Ex: 1234",
                controller: txtManufucturer,
                right: null,
                obscureText: true,
              ),
              const SizedBox(
                height: 8,
              ),
              LineTextField(
                title: "Color",
                hintText: "Ex: Red",
                controller: txtManufucturer,
                right: null,
                obscureText: true,
              ),
              const SizedBox(
                height: 15,
              ),
              RoundButton(
                title: "REGISTER",
                onPress: () {
                  context.push(const VehicleDocumentUploadView());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
