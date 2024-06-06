import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tourism_app/core/functions/backGroundImage.dart';
import 'package:tourism_app/core/functions/customSnackBar.dart';
import 'package:tourism_app/core/shared/shared.dart';
import 'package:tourism_app/core/utils/go_route.dart';
import 'package:tourism_app/features/Auth/presentation/view_models/login/login_cubit.dart';
import 'package:tourism_app/features/Auth/presentation/views/widgets/CheckBoxAndForgotPasswordSection.dart';
import 'package:tourism_app/features/Auth/presentation/views/widgets/CustomCheckBox.dart';
import 'package:tourism_app/features/Auth/presentation/views/widgets/EmailTextField.dart';
import 'package:tourism_app/features/Auth/presentation/views/widgets/PasswordTextField.dart';
import 'package:tourism_app/features/Auth/presentation/views/widgets/customButton.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Container(
      decoration: backgroundimage(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              CacheNetwork.insertToCache(key: 'token', value: state.token);
              GoRouter.of(context).pushReplacement(Routes.khomeView);
            } else if (state is LoginFailure) {
              customshowSnackBar(context,
                  massege: state.errMessage, color: Colors.red);
            }
          },
          builder: (context, state) {
            return AbsorbPointer(
              absorbing: state is LoginLoading,
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    EmailTextField(controller: emailController),
                    PasswordTextField(controller: passwordController),
                    CustomButton(
                      text: "SIGN IN",
                      onTap: () => formKey.currentState!.validate()
                          ? BlocProvider.of<LoginCubit>(context).fetchLogin(
                              email: emailController.text,
                              password: passwordController.text)
                          : null,
                      isLoading: state is LoginLoading,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
