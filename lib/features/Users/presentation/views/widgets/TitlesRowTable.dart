import 'package:flutter/material.dart';

import 'custom_text_table.dart';

class TitlesRowTable extends StatelessWidget {
  const TitlesRowTable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          const CustomTextTaple(text: "Name"),
          const CustomTextTaple(text: "Mail"),
          const CustomTextTaple(text: "Phone"),
          const CustomTextTaple(text: "Balance"),
          const CustomTextTaple(text: "Last Transcation"),
          width > 1300 ? const Spacer(flex: 2) : const SizedBox()
        ],
      ),
    );
  }
}
