import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tourism_app/core/widgets/CustomExpantionListTile.dart';
import '../../../../../core/utils/constants,.dart';
import '../../../../../core/utils/service_locator.dart';
import '../../../../../core/widgets/CustomTextField.dart';
import '../../../data/models/user_model/user_model.dart';
import '../../../data/repos/payment_repo.dart';
import '../../viewModel/cubit/edit_user_cubit.dart';
import '../../viewModel/cubit/users_cubit.dart';
import 'CustomTextPaymentDialog.dart';

class CustomChargeDialog extends StatefulWidget {
  const CustomChargeDialog({
    super.key,
    required this.userModel,
    required this.viewcontext,
  });
  final UserModel userModel;
  final BuildContext viewcontext;

  @override
  State<CustomChargeDialog> createState() => _CustomChargeDialogState();
}

class _CustomChargeDialogState extends State<CustomChargeDialog> {
  final TextEditingController controller = TextEditingController();
  final TextEditingController opertionController = TextEditingController();

  String? errMessage;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: const Text("Payment", style: TextStyle(fontSize: 24)),
      content: SizedBox(
          height: 300,
          width: 300,
          child: ListView(
            children: [
              CustomTextPaymentDialog(
                title: "Name",
                content:
                    "${widget.userModel.clients?.firstname} ${widget.userModel.clients?.lastname}",
              ),
              const SizedBox(height: 8),
              CustomTextPaymentDialog(
                title: "Email",
                content: "${widget.userModel.clients?.email}",
              ),
              const SizedBox(height: 8),
              CustomTextPaymentDialog(
                title: "Current Balance",
                content: "${widget.userModel.balance} " r"$",
              ),
              const SizedBox(height: 8),
              CustomTextField(
                labelText: "Balance",
                controller: controller,
                keyboardType: TextInputType.number,
                icon: Icons.attach_money,
              ),
              CustomExpantionListTile(
                  controller: opertionController,
                  list: const ["Fill", "Draw"],
                  label: "Opertion"),
            ],
          )),
      actions: [
        BlocProvider(
          create: (context) => EditUserCubit(getIt.get<PaymentRepo>()),
          child: BlocConsumer<EditUserCubit, EditUserState>(
            listener: (context, state) {
              state is EditUserSuccess
                  ? {
                      GoRouter.of(context).pop(),
                      BlocProvider.of<UsersCubit>(widget.viewcontext)
                          .getUsers(),
                    }
                  : state is EditUserFailure
                      ? errMessage = state.errMessage
                      : null;
            },
            builder: (context, state) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: Text(
                      errMessage ?? "",
                      style: const TextStyle(color: Colors.red),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  //  const Spacer(),
                  TextButton(
                      onPressed: () => GoRouter.of(context).pop(),
                      child: const Text(
                        "Cancle",
                        style: TextStyle(color: Colors.black),
                      )),
                  const SizedBox(width: 16),
                  state is EditUserLoading
                      ? const Padding(
                          padding: EdgeInsets.all(4.0),
                          child: CircularProgressIndicator(color: kColor),
                        )
                      : ElevatedButton(
                          onPressed: () =>
                              BlocProvider.of<EditUserCubit>(context)
                                  .chargeMoney(
                                      operationType: opertionController.text ==
                                              "Fill"
                                          ? "Fill"
                                          : opertionController.text == "Draw"
                                              ? "WithDraw"
                                              : "",
                                      id: widget.userModel.id!,
                                      money: double.parse(controller.text)),
                          style: const ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(kColor)),
                          child: const Text(
                            "Charge",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                ],
              );
            },
          ),
        )
      ],
    );
  }
}
