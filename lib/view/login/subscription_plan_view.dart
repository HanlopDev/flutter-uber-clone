import 'package:flutter/material.dart';
import 'package:uber_clone_app/common/color_extension.dart';
import 'package:uber_clone_app/common_widget/plan_row.dart';

class SubscriptionPlanView extends StatefulWidget {
  const SubscriptionPlanView({super.key});

  @override
  State<SubscriptionPlanView> createState() => _SubscriptionPlanView();
}

class _SubscriptionPlanView extends State<SubscriptionPlanView> {
  List planArr = [
    {
      "name": "Basic Plan",
      "time": "10 Month",
      "ride": "10 rides every month",
      "cash_ride": "2 cash rides",
      "km": "50 km travel ride",
      "price": "Try 1 month free",
    },
    {
      "name": "Clasical Plan",
      "time": "3 Month",
      "ride": "10 rides every month",
      "cash_ride": "2 cash rides",
      "km": "50 km travel ride",
      "price": "Buy At \$20.50",
    }
  ];

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
          "Subscription Plan",
          style: TextStyle(
              color: TColor.primaryText,
              fontSize: 25,
              letterSpacing: 4.0,
              fontWeight: FontWeight.w800),
        ),
      ),
      backgroundColor: TColor.bg,
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        itemCount: planArr.length,
        itemBuilder: (context, index) {
          var pObj = planArr[index] as Map? ?? {};
          return PLanRow(pObj: pObj, onPressed: () {});
        },
      ),
    );
  }
}
