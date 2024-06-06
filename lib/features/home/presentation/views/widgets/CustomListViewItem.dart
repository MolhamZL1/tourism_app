import 'package:flutter/material.dart';
import 'package:tourism_app/features/home/presentation/views/widgets/ArrowAndPercantage.dart';

class CustomListViewItem extends StatelessWidget {
  const CustomListViewItem({super.key, required this.tourCost});
  final String tourCost;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 12;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: builddecoration(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  "images/mountain.jpg",
                  height: 75,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 20),
              const Column(
                children: [Text("thailand"), Text("thailand")],
              ),
            ],
          ),
          SizedBox(
              width: width,
              child: const Text(
                "thailand",
                textAlign: TextAlign.center,
              )),
          SizedBox(
              width: width, child: Text(tourCost, textAlign: TextAlign.center)),
          SizedBox(width: width, child: const ArrowAndPercantage())
        ],
      ),
    );
  }

  BoxDecoration builddecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.3),
          spreadRadius: 3,
          blurRadius: 7,
          offset: const Offset(0, 3),
        ),
      ],
    );
  }
}
