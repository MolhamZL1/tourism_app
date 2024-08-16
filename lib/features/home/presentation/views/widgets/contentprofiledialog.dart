import 'package:flutter/material.dart';
import 'package:tourism_app/core/utils/constants,.dart';
import 'package:tourism_app/core/widgets/CustomTextField.dart';
import 'package:tourism_app/features/home/presentation/views/widgets/selectProfileImage.dart';
import 'package:tourism_app/features/home/data/models/data_user_model.dart';

class ContentProfileDialog extends StatefulWidget {
  const ContentProfileDialog({
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
  final bool isFailure;

  @override
  State<ContentProfileDialog> createState() => _ContentProfileDialogState();
}

class _ContentProfileDialogState extends State<ContentProfileDialog> {
  bool showPassowrd = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formkey,
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
                    photo: widget.dataUserModel?.photo,
                  ),
                ),
              ),
              Visibility(
                  visible: widget.isFailure,
                  child: const Text(
                    "Photo is required",
                    style: TextStyle(color: Colors.red),
                  )),
              CustomTextField(
                controller: widget.firstNameController,
                labelText: "First Name",
                icon: Icons.person,
              ),
              CustomTextField(
                controller: widget.lastNameController,
                labelText: "Last Name",
                icon: Icons.person,
              ),
              CustomTextField(
                controller: widget.phoneNumberController,
                labelText: "Phone Number",
                icon: Icons.phone,
              ),
              CustomTextField(
                controller: widget.emailController,
                labelText: "Email",
                icon: Icons.email,
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
                  controller: widget.passwordController,
                  labelText: "Password",
                  icon: Icons.password,
                  isPassword: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
