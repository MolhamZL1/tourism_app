import 'package:flutter/material.dart';
import 'package:tourism_app/core/utils/constants,.dart';

class ExpantionListRate extends StatefulWidget {
  const ExpantionListRate({
    super.key,
    required this.rateController,
    required this.label,
  });

  final TextEditingController rateController;
  final String label;

  @override
  State<ExpantionListRate> createState() => _ExpantionListRateState();
}

class _ExpantionListRateState extends State<ExpantionListRate> {
  final ExpansionTileController expansionTileController =
      ExpansionTileController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            " ${widget.label}",
            style: const TextStyle(color: Colors.grey),
          ),
          ExpansionTile(
            controller: expansionTileController,
            collapsedShape: const RoundedRectangleBorder(
                side: BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.all(Radius.circular(8))),
            iconColor: kColor,
            shape: const RoundedRectangleBorder(
                side: BorderSide(color: kColor),
                borderRadius: BorderRadius.all(Radius.circular(8))),
            title: Text(widget.rateController.text),
            children: [
              ListTile(
                  onTap: () => {
                        expansionTileController.collapse(),
                        widget.rateController.text = "Low",
                        setState(() {})
                      },
                  title: const Text("Low")),
              ListTile(
                  onTap: () => {
                        expansionTileController.collapse(),
                        widget.rateController.text = "Middle",
                        setState(() {})
                      },
                  title: const Text("Middle")),
              ListTile(
                  onTap: () => {
                        expansionTileController.collapse(),
                        widget.rateController.text = "High",
                        setState(() {})
                      },
                  title: const Text("High"))
            ],
          ),
        ],
      ),
    );
  }
}
