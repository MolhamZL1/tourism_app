import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism_app/features/Resturants/presentation/viewModel/ResturantsCubit/resturants_cubit.dart';
import 'package:tourism_app/features/Resturants/presentation/views/widgets/resturants_item.dart';
import '../../../../../core/widgets/AdditionContainer.dart';
import '../../../../../core/widgets/CustomSearchBar.dart';
import '../../../../../core/widgets/SliverImageError.dart';
import '../../../../../core/widgets/SliverNotFoundImage.dart';
import '../../../../../core/widgets/googleMapContainer.dart';
import '../../../../../core/widgets/rippled_animation.dart';
import '../../../../Country/presentation/viewModels/CountryCubit/country_cubit.dart';
import '../../../../Country/presentation/views/widgets/SkeletonizerGrid.dart';
import 'custom_add_resturant_dialog.dart';

class ResturantsViewBody extends StatefulWidget {
  const ResturantsViewBody({super.key});

  @override
  State<ResturantsViewBody> createState() => _ResturantsViewBodyState();
}

class _ResturantsViewBodyState extends State<ResturantsViewBody> {
  @override
  void initState() {
    BlocProvider.of<CountryCubit>(context).getCountries();
    BlocProvider.of<ResturantsCubit>(context).getResturants();

    super.initState();
  }

  int choosedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResturantsCubit, ResturantsState>(
      builder: (context, state) {
        return CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: GoogleMapContainer(
                x: 2,
                y: 2,
              ),
            ),
            SliverToBoxAdapter(child: CustomSearchBar(
              onChanged: (value) {
                if (value.isEmpty) {
                  BlocProvider.of<ResturantsCubit>(context).getResturants();
                } else {
                  BlocProvider.of<ResturantsCubit>(context)
                      .searchResturant(quary: value);
                }
              },
            )),
            state is ResturantsSuccess
                ? SliverGrid.builder(
                    itemCount: state.restaurants.length + 1,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount:
                            MediaQuery.of(context).size.width < 900 ? 2 : 4,
                        mainAxisSpacing: 16),
                    itemBuilder: (context, index) => index ==
                            state.restaurants.length
                        ? AdditionContainer(
                            ontap: () => showDialog(
                              context: context,
                              builder: (_) => CustomAddResturantDialog(
                                viewContext: context,
                              ),
                            ),
                          )
                        : GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (_) => CustomAddResturantDialog(
                                  viewContext: context,
                                  resturantModel: state.restaurants[index],
                                ),
                              );
                            },
                            child: Stack(
                              children: [
                                ResturantItem(
                                    resturantModel: state.restaurants[index]),
                                Positioned(
                                    bottom: 8,
                                    right: 25,
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          choosedIndex = index;
                                        });
                                      },
                                      child: Container(
                                        child: index == choosedIndex
                                            ? const CustomRippledAnimation(
                                                icon: Icons.gps_fixed,
                                              )
                                            : const CircleAvatar(
                                                backgroundColor: Colors.white,
                                                child: Icon(
                                                  Icons.gps_fixed,
                                                  color: Colors.black,
                                                ),
                                              ),
                                      ),
                                    ))
                              ],
                            ),
                          ),
                  )
                : state is ResturantsLoading
                    ? const SkeletonizerGrid(
                        desktop: 4,
                        mobile: 2,
                      )
                    : state is ResturantsFailure
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
