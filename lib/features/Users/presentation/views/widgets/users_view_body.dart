import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism_app/core/widgets/CustomSearchBar.dart';
import 'package:tourism_app/features/Users/presentation/viewModel/cubit/users_cubit.dart';
import '../../../../../core/widgets/SliverImageError.dart';
import '../../../../../core/widgets/SliverNotFoundImage.dart';
import 'CustomUsersTable.dart';
import 'SkeltonizerTable.dart';

class UsersViewBody extends StatefulWidget {
  const UsersViewBody({super.key});

  @override
  State<UsersViewBody> createState() => _UsersViewBodyState();
}

class _UsersViewBodyState extends State<UsersViewBody> {
  @override
  void initState() {
    BlocProvider.of<UsersCubit>(context).getUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsersCubit, UsersState>(
      builder: (context, state) {
        return CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Visibility(
                visible:
                    !(state is UsersFailure && state.errMessage != "Not Found"),
                child: Image.asset(
                  "images/undraw_People_re_8spw.png",
                  height: MediaQuery.of(context).size.height / 3,
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 8)),
            SliverToBoxAdapter(
                child: Visibility(
                    visible: !(state is UsersFailure &&
                        state.errMessage != "Not Found"),
                    child: CustomSearchBar(onChanged: (value) {
                      if (value.isEmpty) {
                        BlocProvider.of<UsersCubit>(context).getUsers();
                      } else {
                        BlocProvider.of<UsersCubit>(context)
                            .searchUserByEmail(quary: value);
                      }
                    }))),
            state is UsersSuccess
                ? SliverToBoxAdapter(
                    child: CustomUsersTable(
                      users: state.users,
                    ),
                  )
                : state is UsersLoading
                    ? const SliverToBoxAdapter(
                        child: SkeltonizerTable(),
                      )
                    : state is UsersFailure
                        ? state.errMessage == "Not Found"
                            ? const SliverNotFoundImage()
                            : SliverImageError(
                                errMessage: state.errMessage,
                              )
                        : const SliverToBoxAdapter(
                            child: SizedBox(),
                          ),
          ],
        );
      },
    );
  }
}
