import 'package:flutter/material.dart';
import 'package:uber_clone_app/common/color_extension.dart';

class PLanRow extends StatelessWidget {
  final Map pObj;
  final VoidCallback onPressed;
  const PLanRow({super.key, required this.pObj, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 1,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            pObj["name"] as String? ?? "",
            style: TextStyle(
              color: TColor.primaryText,
              fontSize: 18,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            pObj["time"] as String? ?? "",
            style: TextStyle(
              color: TColor.secondaryText,
              fontSize: 15,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            pObj["rides"] as String? ?? "",
            style: TextStyle(
              color: TColor.secondaryText,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            pObj["cash_ride"] as String? ?? "",
            style: TextStyle(
              color: TColor.secondaryText,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            pObj["km"] as String? ?? "",
            style: TextStyle(
              color: TColor.secondaryText,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: onPressed,
                child: Text(
                  pObj["price"] as String? ?? "",
                  style: TextStyle(
                    color: TColor.primary,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
