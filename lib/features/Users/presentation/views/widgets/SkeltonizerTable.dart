import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../data/models/user_model/clients.dart';
import '../../../data/models/user_model/user_model.dart';
import 'CustomRowTaple.dart';
import 'TitlesRowTable.dart';

class SkeltonizerTable extends StatelessWidget {
  const SkeltonizerTable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
        enabled: true,
        child: Container(
          margin: const EdgeInsets.only(right: 16, left: 16, bottom: 64),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            children: [
              const TitlesRowTable(),
              ...List.generate(
                5,
                (index) => CustomRowTaple(
                    userModel: UserModel(
                  balance: 50000,
                  lastTransactionDate: "2024-20-02",
                  clients: Clients(
                      firstname: "Molham",
                      lastname: "Sheikh",
                      email: "molhamsae49@gmail.com",
                      phone: "0988159532"),
                )),
              )
            ],
          ),
        ));
  }
}
