import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism_app/core/utils/constants,.dart';
import 'package:tourism_app/core/widgets/custom_circle_loading.dart';
import 'package:tourism_app/features/Users/presentation/viewModel/cubit/edit_user_cubit.dart';
import 'package:tourism_app/features/home/data/models/data_user_model.dart';

import '../../../../../core/functions/build_container_decoratin.dart';
import '../../../../../core/widgets/CustomTextField.dart';
import '../../../../Auth/presentation/views/widgets/customButton.dart';
import 'PaymentWaySwitcher.dart';
import 'UsersList.dart';

class QuickTranscation extends StatefulWidget {
  const QuickTranscation({super.key});

  @override
  State<QuickTranscation> createState() => _QuickTranscationState();
}

class _QuickTranscationState extends State<QuickTranscation> {
  TextEditingController emailController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController operationController = TextEditingController();
  @override
  void initState() {
    operationController.text = "Fill";
    super.initState();
  }

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
            "Quick Charge",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 24),
          const Text("Latest Charging"),
          const SizedBox(
            height: 16,
          ),
          const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: UsersList(
                dataUserModel: [
                  DataUserModel(
                      email: "molhamsa49@gmail.com",
                      firstName: "Molham",
                      lastName: "Al-Sheikh",
                      photo: "/storage/66c00112d9e12.jpg"),
                  DataUserModel(
                      email: "molhamsa49@gmail.com",
                      firstName: "Molham",
                      lastName: "Al-Sheikh",
                      photo: "/storage/66c00112d9e12.jpg"),
                  DataUserModel(
                      email: "molhamsa49@gmail.com",
                      firstName: "Molham",
                      lastName: "Al-Sheikh",
                      photo: "/storage/66c00112d9e12.jpg"),
                  DataUserModel(
                      email: "molhamsa49@gmail.com",
                      firstName: "Molham",
                      lastName: "Al-Sheikh",
                      photo: "/storage/66c00112d9e12.jpg"),
                  DataUserModel(
                      email: "molhamsa49@gmail.com",
                      firstName: "Molham",
                      lastName: "Al-Sheikh",
                      photo: "/storage/66c00112d9e12.jpg"),
                ],
              )),
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  labelText: "Customer Email",
                  controller: emailController,
                  icon: Icons.email,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: CustomTextField(
                  labelText: "Amount",
                  controller: amountController,
                  icon: Icons.attach_money_outlined,
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                  child: PaymentWaySwitcher(
                operationController: operationController,
              )),
              const SizedBox(width: 16),
              Expanded(
                  child: BlocConsumer<EditUserCubit, EditUserState>(
                listener: (context, state) {
                  state is EditUserFailure ? print(state.errMessage) : null;
                },
                builder: (context, state) {
                  return state is EditUserLoading
                      ? const CustomCircleLoading(color: kColor)
                      : CustomButton(
                          text: "Send",
                          onTap: () {
                            BlocProvider.of<EditUserCubit>(context).chargeMoney(
                                money: double.parse(amountController.text),
                                email: emailController.text,
                                operationType: operationController.text);
                          },
                          circular: 16,
                        );
                },
              )),
            ],
          )
        ],
      ),
    );
  }
}
