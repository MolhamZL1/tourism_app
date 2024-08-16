import 'package:flutter/material.dart';
import 'package:tourism_app/core/widgets/CustomTextField.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
    required this.onChanged,
  });
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Flexible(
            flex: 2,
            child: CustomTextField(
                icon: Icons.search, onChanged: onChanged, labelText: "Search"),
          ),
          width > 900
              ? const Flexible(
                  flex: 1,
                  child: SizedBox(),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
