import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tourism_app/core/functions/customSnackBar.dart';
import 'package:tourism_app/core/utils/constants,.dart';
import 'package:tourism_app/core/utils/go_route.dart';
import 'package:tourism_app/core/utils/service_locator.dart';
import 'package:tourism_app/features/Auth/data/repos/auth_repo.dart';
import 'package:tourism_app/features/Auth/presentation/view_models/logout/logout_cubit.dart';

class CustomLogOutDialog extends StatelessWidget {
  const CustomLogOutDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: const Text("Are you sure?", style: TextStyle(fontSize: 24)),
      content: Image.asset("images/logout.jpg"),
      actions: [
        TextButton(
            onPressed: () => GoRouter.of(context).pop(),
            child: const Text(
              "Cancle",
              style: TextStyle(color: Colors.black),
            )),
        BlocProvider(
          create: (context) => LogoutCubit(getIt.get<AuthRepo>()),
          child: BlocConsumer<LogoutCubit, LogoutState>(
            listener: (context, state) {
              state is LogoutSuccess
                  ? GoRouter.of(context).pushReplacement(Routes.kloginView)
                  : state is LogoutFailure
                      ? customshowSnackBar(context,
                          color: Colors.red, massege: state.errMessage)
                      : null;
            },
            builder: (context, state) {
              return state is LogoutLoading
                  ? const Padding(
                      padding: EdgeInsets.all(4.0),
                      child: CircularProgressIndicator(color: kColor),
                    )
                  : ElevatedButton(
                      onPressed: () =>
                          BlocProvider.of<LogoutCubit>(context).fetchLogout(),
                      style: const ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(kColor)),
                      child: const Text(
                        "Logout",
                        style: TextStyle(color: Colors.white),
                      ),
                    );
            },
          ),
        )
      ],
    );
  }
}
