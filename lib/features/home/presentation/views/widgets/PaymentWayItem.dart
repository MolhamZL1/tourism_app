import 'package:flutter/material.dart';

import '../../../../../core/utils/constants,.dart';

class PaymentWayItem extends StatelessWidget {
  const PaymentWayItem({
    super.key,
    this.isSelected = false,
    required this.text,
  });
  final bool isSelected;
  final String text;

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      duration: const Duration(milliseconds: 500),
      firstChild: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: text == "Fill"
                ? const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    bottomLeft: Radius.circular(16),
                  )
                : const BorderRadius.only(
                    topRight: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  )),
        child: Center(
            child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14),
          child: Text(
            text,
            style: const TextStyle(color: kColor, fontSize: 18),
          ),
        )),
      ),
      secondChild: Container(
        decoration: BoxDecoration(
            color: kColor,
            borderRadius: text == "Fill"
                ? const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    bottomLeft: Radius.circular(16),
                  )
                : const BorderRadius.only(
                    topRight: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  )),
        child: Center(
            child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14),
          child: Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
        )),
      ),
      crossFadeState:
          isSelected ? CrossFadeState.showSecond : CrossFadeState.showFirst,
    );
  }
}
