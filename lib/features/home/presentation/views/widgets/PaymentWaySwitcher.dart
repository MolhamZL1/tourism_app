import 'package:flutter/material.dart';

import '../../../../../core/utils/constants,.dart';
import 'PaymentWayItem.dart';

class PaymentWaySwitcher extends StatefulWidget {
  const PaymentWaySwitcher({super.key});

  @override
  State<PaymentWaySwitcher> createState() => _PaymentWaySwitcherState();
}

bool isFillSelected = true;
bool ismSelected = false;

class _PaymentWaySwitcherState extends State<PaymentWaySwitcher> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: kColor),
          borderRadius: BorderRadius.circular(16)),
      child: Row(
        children: [
          Expanded(
              child: GestureDetector(
                  onTap: () => !isFillSelected
                      ? setState(() {
                          isFillSelected = !isFillSelected;
                          ismSelected = !ismSelected;
                        })
                      : null,
                  child: PaymentWayItem(
                    text: "Fill",
                    isSelected: isFillSelected,
                  ))),
          Expanded(
              child: GestureDetector(
                  onTap: () => !ismSelected
                      ? setState(() {
                          ismSelected = !ismSelected;
                          isFillSelected = !isFillSelected;
                        })
                      : null,
                  child: PaymentWayItem(
                    text: "Draw",
                    isSelected: ismSelected,
                  ))),
        ],
      ),
    );
  }
}
