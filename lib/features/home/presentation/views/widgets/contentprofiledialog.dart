import 'package:flutter/material.dart';
import 'package:tourism_app/core/utils/constants,.dart';
import 'package:tourism_app/core/widgets/CustomTextField.dart';
import 'package:tourism_app/core/widgets/SelectImage.dart';
import 'package:tourism_app/features/home/presentation/views/widgets/selectProfileImage.dart';
import 'package:tourism_app/features/home/data/models/data_user_model.dart';

class ContentProfileDialog extends StatelessWidget {
  ContentProfileDialog({
    super.key,
    this.dataUserModel,
    required this.firstNameController,
    required this.lastNameController,
    required this.formkey,
    this.isFailure = false,
    required this.phoneNumberController,
    required this.passwordController,
    required this.emailController,
  });
  final DataUserModel? dataUserModel;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController phoneNumberController;
  final TextEditingController passwordController;
  final TextEditingController emailController;
  final GlobalKey<FormState> formkey;
  bool isFailure;

  bool showPassowrd = false;

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) => Form(
        key: formkey,
        child: SizedBox(
          width: 400,
          height: 700,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
            child: ListView(
              children: [
                Center(
                  child: SizedBox(
                    height: 200,
                    child: SelectProfileImage(
                      photo: dataUserModel?.photo,
                      type: "profile",
                    ),
                  ),
                ),
                Visibility(
                    visible: isFailure,
                    child: const Text(
                      "Photo is required",
                      style: TextStyle(color: Colors.red),
                    )),
                CustomTextField(
                  controller: firstNameController,
                  labelText: "First Name",
                ),
                CustomTextField(
                  controller: lastNameController,
                  labelText: "Last Name",
                ),
                CustomTextField(
                  controller: phoneNumberController,
                  labelText: "Phone Number",
                ),
                CustomTextField(
                  controller: emailController,
                  labelText: "Email",
                ),
                GestureDetector(
                    onTap: () => setState(
                        () => !showPassowrd ? showPassowrd = true : null),
                    child: Visibility(
                      visible: !showPassowrd,
                      child: const Text(
                        "Reset Password",
                        style: TextStyle(color: kColor),
                      ),
                    )),
                Visibility(
                  visible: showPassowrd,
                  child: CustomTextField(
                    controller: passwordController,
                    labelText: "Password",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
