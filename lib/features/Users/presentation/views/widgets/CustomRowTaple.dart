import 'package:date_formatter/date_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism_app/features/Users/presentation/viewModel/cubit/edit_user_cubit.dart';
import 'package:tourism_app/features/Users/presentation/viewModel/cubit/users_cubit.dart';
import 'package:tourism_app/features/Users/presentation/views/widgets/CustomChargeDialog.dart';
import '../../../../../core/functions/custom_loading_circle.dart';
import '../../../../../core/utils/constants,.dart';
import '../../../../../core/widgets/CustomErrorDialog.dart';
import '../../../data/models/user_model/user_model.dart';
import 'CustomTableButton.dart';
import 'custom_text_table.dart';

class CustomRowTaple extends StatelessWidget {
  const CustomRowTaple({super.key, required this.userModel});
  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      decoration: const BoxDecoration(
          border: Border(
        top: BorderSide(color: Colors.grey),
      )),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            CustomTextTaple(
                text:
                    "${userModel.clients?.firstname ?? ""} ${userModel.clients?.lastname ?? ""}"),
            CustomTextTaple(text: userModel.clients?.email ?? ""),
            CustomTextTaple(text: userModel.clients?.phone ?? ""),
            CustomTextTaple(text: "${userModel.balance.toString()} USD"),
            CustomTextTaple(
                text: DateFormatter.formatDateTime(
                    dateTime:
                        DateTime.parse(userModel.lastTransactionDate ?? ""),
                    outputFormat: 'yyyy/MM/dd')),
            width > 1300
                ? Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        children: [
                          BlocConsumer<EditUserCubit, EditUserState>(
                            listener: (context, state) {
                              state is EditUserSuccess
                                  ? {
                                      Navigator.pop(context),
                                      BlocProvider.of<UsersCubit>(context)
                                          .getUsers()
                                    }
                                  : state is EditUserLoading
                                      ? customshowLoadingCircle(context, kColor)
                                      : state is EditUserFailure
                                          ? showDialog(
                                              context: context,
                                              builder: (context) {
                                                return CustomErrorDialog(
                                                  errMessage: state.errMessage,
                                                );
                                              })
                                          : null;
                            },
                            builder: (context, state) {
                              return IconButton(
                                  onPressed: () =>
                                      BlocProvider.of<EditUserCubit>(context)
                                          .deleteUser(id: userModel.id!),
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ));
                            },
                          ),
                          const Spacer(),
                          CustomTableButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => CustomChargeDialog(
                                        userModel: userModel,
                                        viewcontext: context,
                                      ));
                            },
                          )
                        ],
                      ),
                    ))
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
