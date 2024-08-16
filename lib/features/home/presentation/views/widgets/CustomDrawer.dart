import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tourism_app/core/models/draweritemmodel.dart';
import 'package:tourism_app/core/utils/api_service.dart';
import 'package:tourism_app/core/utils/constants,.dart';
import 'package:tourism_app/features/home/presentation/viewmodels/profilecubit/profile_cubit.dart';
import 'package:tourism_app/features/home/presentation/views/widgets/CustomDrawerItem.dart';
import 'package:tourism_app/features/home/presentation/views/widgets/CustomDrawerList.dart';
import 'package:tourism_app/features/Auth/presentation/views/widgets/CustomLogOutDialog.dart';
import 'package:tourism_app/features/home/presentation/views/widgets/custom_show_profile_dialog.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
    @required this.onDestinationSelected,
    @required this.selectedIndex,
    required this.destenations,
  });
  final ValueChanged<int>? onDestinationSelected;
  final int? selectedIndex;
  final List<DrawerItemModel> destenations;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 224, 224, 224),
      elevation: 0,
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: BlocBuilder<ProfileCubit, ProfileState>(
              builder: (context, state) {
                return DrawerHeader(
                    child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Spacer(flex: 3),
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: kColor,
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(99),
                              child: state is ProfileSuccess
                                  ? CachedNetworkImage(
                                      imageUrl:
                                          "${ApiService.baseURL}${state.dataUserModel.photo}",
                                      errorWidget: (context, url, error) =>
                                          const Icon(Icons.error),
                                      fit: BoxFit.cover,
                                    )
                                  : const SizedBox(),
                            ),
                          ),
                        ),
                        const Spacer(flex: 2),
                        state is ProfileSuccess
                            ? IconButton(
                                onPressed: () => showDialog(
                                      context: context,
                                      builder: (_) => CustomShowProfileDailog(
                                        dataUserModel: state.dataUserModel,
                                        viewContext: context,
                                      ),
                                    ),
                                icon: const Icon(Icons.edit))
                            : state is ProfileLoading
                                ? const Skeletonizer(child: Icon(Icons.edit))
                                : const SizedBox(),
                      ],
                    ),
                    const Spacer(),
                    state is ProfileLoading
                        ? const Skeletonizer(child: Text("molham sheikh"))
                        : state is ProfileSuccess
                            ? Text(
                                "${state.dataUserModel.firstName} ${state.dataUserModel.lastName}")
                            : const Text("")
                  ],
                ));
              },
            ),
          ),
          CustomDrawerList(
            destenations: destenations,
            selectedIndex: selectedIndex,
            onDestinationSelected: onDestinationSelected,
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
                const Expanded(
                    child: SizedBox(
                  height: 20,
                )),
                GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) => const CustomLogOutDialog());
                  },
                  child: CustomDrawerItem(
                    drawerItemModel: DrawerItemModel(
                        text: "L O G O U T", icon: Icons.logout),
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
