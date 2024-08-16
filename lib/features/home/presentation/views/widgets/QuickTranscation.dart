import 'package:flutter/material.dart';

import '../../../../../core/functions/build_container_decoratin.dart';
import '../../../../../core/widgets/CustomTextField.dart';
import '../../../../Auth/presentation/views/widgets/customButton.dart';
import 'PaymentWaySwitcher.dart';

class QuickTranscation extends StatelessWidget {
  const QuickTranscation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: buildContainerDecoration(),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Quick Invoice",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 24),
          const Text("Latest Transcation"),
          const SizedBox(
            height: 16,
          ),
          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  5,
                  (index) => Container(
                    margin: const EdgeInsets.only(right: 8),
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(.1),
                        borderRadius: BorderRadius.circular(16)),
                    child: IntrinsicWidth(
                      child: ListTile(
                        title: const Text("Molham alshiekh"),
                        subtitle: const Text("molhamsa49@gmail.com"),
                        leading: Container(
                          width: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(99),
                              image: const DecorationImage(
                                  image: AssetImage("images/earth.png")),
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              )),
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  labelText: "Customer Email",
                  controller: TextEditingController(),
                  icon: Icons.email,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: CustomTextField(
                  labelText: "Amount",
                  controller: TextEditingController(),
                  icon: Icons.attach_money_outlined,
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
          Row(
            children: [
              const Expanded(child: PaymentWaySwitcher()),
              const SizedBox(width: 16),
              Expanded(
                  child: CustomButton(
                text: "Send",
                onTap: () {},
                circular: 16,
              )),
            ],
          )
        ],
      ),
    );
  }
}
