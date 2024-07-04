import 'package:flutter/material.dart';
import 'package:tourism_app/core/utils/constants,.dart';

class CustomExpantionListTile extends StatefulWidget {
  const CustomExpantionListTile(
      {super.key,
      required this.controller,
      required this.list,
      required this.label});
  final TextEditingController controller;
  final List<String> list;
  final String label;
  @override
  State<CustomExpantionListTile> createState() =>
      _CustomExpantionListTileState();
}

class _CustomExpantionListTileState extends State<CustomExpantionListTile> {
  final ExpansionTileController expansionTileController =
      ExpansionTileController();
  @override
  void initState() {
    widget.controller.text == ""
        ? widget.controller.text = widget.list[0]
        : null;
    super.initState();
  }

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
            title: Text(widget.controller.text),
            children: List.generate(
              widget.list.length,
              (index) => ListTile(
                  onTap: () => {
                        expansionTileController.collapse(),
                        widget.controller.text = widget.list[index],
                        setState(() {})
                      },
                  title: Text(widget.list[index])),
            ),
          ),
        ],
      ),
    );
  }
}
