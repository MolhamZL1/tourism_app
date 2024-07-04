import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tourism_app/core/utils/constants,.dart';
import 'package:tourism_app/core/utils/service_locator.dart';
import 'package:tourism_app/features/Country/presentation/viewModels/EditCountryCubit/edit_country_cubit.dart';
import 'package:tourism_app/features/home/data/models/data_user_model.dart';
import 'package:tourism_app/features/home/data/repos/profile_repo.dart';
import 'package:tourism_app/features/home/presentation/viewmodels/editProfile/edit_profile_cubit.dart';
import 'package:tourism_app/features/home/presentation/viewmodels/profilecubit/profile_cubit.dart';
import 'package:tourism_app/features/home/presentation/views/widgets/contentprofiledialog.dart';

class CustomShowProfileDailog extends StatefulWidget {
  const CustomShowProfileDailog({
    super.key,
    required this.dataUserModel,
    required this.viewContext,
  });

  final DataUserModel dataUserModel;
  final BuildContext viewContext;

  @override
  State<CustomShowProfileDailog> createState() =>
      _CustomAddCountryDailogState();
}

class _CustomAddCountryDailogState extends State<CustomShowProfileDailog> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey();
  bool isFailure = false;

  @override
  void initState() {
    EditCountryCubit.photo = null;
    firstNameController.text = widget.dataUserModel.firstName == null
        ? ""
        : widget.dataUserModel.firstName!;
    lastNameController.text = widget.dataUserModel.lastName == null
        ? ""
        : widget.dataUserModel.lastName!;
    phoneNumberController.text = widget.dataUserModel.phoneNumber == null
        ? ""
        : widget.dataUserModel.phoneNumber!;
    emailController.text =
        widget.dataUserModel.email == null ? "" : widget.dataUserModel.email!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditProfileCubit(getIt.get<ProfileRepo>()),
      child: AlertDialog(
        backgroundColor: Colors.white,
        content: ContentProfileDialog(
          firstNameController: firstNameController,
          lastNameController: lastNameController,
          formkey: formKey,
          dataUserModel: widget.dataUserModel,
          emailController: emailController,
          passwordController: passwordController,
          phoneNumberController: phoneNumberController,
          isFailure: isFailure,
        ),
        actions: [
          BlocConsumer<EditProfileCubit, EditProfileState>(
            listener: (context, state) => state is EditProfileSuccess
                ? {
                    GoRouter.of(context).pop(),
                    BlocProvider.of<ProfileCubit>(widget.viewContext)
                        .getProfile(),
                  }
                : null,
            builder: (context, state) {
              return Column(
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    TextButton(
                        onPressed: () => {
                              GoRouter.of(context).pop(),
                              EditProfileCubit.photo = null
                            },
                        child: const Text(
                          "Cancle",
                          style: TextStyle(color: Colors.black),
                        )),
                    const SizedBox(width: 16),
                    state is EditProfileLoading
                        ? const Padding(
                            padding: EdgeInsets.all(4.0),
                            child: CircularProgressIndicator(color: kColor),
                          )
                        : ElevatedButton(
                            onPressed: () => formKey.currentState!.validate()
                                ? BlocProvider.of<EditProfileCubit>(context)
                                    .updateProfile(
                                        firstName: firstNameController.text,
                                        lastName: lastNameController.text,
                                        email: emailController.text,
                                        password: passwordController.text,
                                        phoneNumber: phoneNumberController.text)
                                : null,
                            style: const ButtonStyle(
                                backgroundColor:
                                    WidgetStatePropertyAll(kColor)),
                            child: const Text(
                              "Save",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                  ]),
                  state is EditProfileFailure
                      ? SizedBox(
                          child: Text(
                            state.errMessage,
                            style: const TextStyle(color: Colors.red),
                          ),
                        )
                      : const SizedBox(),
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
