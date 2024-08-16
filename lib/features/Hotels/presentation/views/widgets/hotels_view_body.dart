import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism_app/features/Hotels/presentation/viewModel/HotelsCubit/hotels_cubit.dart';
import 'package:tourism_app/features/Hotels/presentation/views/widgets/custom_ad_hotel_dialog.dart';
import 'package:tourism_app/features/Hotels/presentation/views/widgets/hotelItem.dart';
import '../../../../../core/widgets/AdditionContainer.dart';
import '../../../../../core/widgets/CustomSearchBar.dart';
import '../../../../../core/widgets/SliverImageError.dart';
import '../../../../../core/widgets/SliverNotFoundImage.dart';
import '../../../../../core/widgets/googleMapContainer.dart';
import '../../../../../core/widgets/rippled_animation.dart';
import '../../../../Country/presentation/viewModels/CountryCubit/country_cubit.dart';
import '../../../../Country/presentation/views/widgets/SkeletonizerGrid.dart';

class HotelsViewBody extends StatefulWidget {
  const HotelsViewBody({super.key});

  @override
  State<HotelsViewBody> createState() => _HotelsViewBodyState();
}

class _HotelsViewBodyState extends State<HotelsViewBody> {
  @override
  void initState() {
    BlocProvider.of<CountryCubit>(context).getCountries();
    BlocProvider.of<HotelsCubit>(context).getHotels();

    super.initState();
  }

  int choosedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HotelsCubit, HotelsState>(
      builder: (context, state) {
        return CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: GoogleMapContainer(
                x: state is HotelsSuccess
                    ? state.hotels.isEmpty
                        ? 2
                        : state.hotels[choosedIndex].id!.toDouble()
                    : 2,
                y: state is HotelsSuccess
                    ? state.hotels.isEmpty
                        ? 2
                        : state.hotels[choosedIndex].id!.toDouble()
                    : 2,
              ),
            ),
            SliverToBoxAdapter(child: CustomSearchBar(
              onChanged: (value) {
                if (value.isEmpty) {
                  BlocProvider.of<HotelsCubit>(context).getHotels();
                } else {
                  BlocProvider.of<HotelsCubit>(context)
                      .searchHotel(quary: value);
                }
              },
            )),
            state is HotelsSuccess
                ? SliverGrid.builder(
                    itemCount: state.hotels.length + 1,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount:
                            MediaQuery.of(context).size.width < 900 ? 2 : 4,
                        mainAxisSpacing: 16),
                    itemBuilder: (context, index) =>
                        index == state.hotels.length
                            ? AdditionContainer(
                                ontap: () => showDialog(
                                  context: context,
                                  builder: (_) => CustomAddHotelDialog(
                                    viewContext: context,
                                  ),
                                ),
                              )
                            : GestureDetector(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (_) => CustomAddHotelDialog(
                                      viewContext: context,
                                      hotelModel: state.hotels[index],
                                    ),
                                  );
                                },
                                child: Stack(children: [
                                  HotelItem(hotelModel: state.hotels[index]),
                                  Positioned(
                                      top: 8,
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
                                ]),
                              ),
                  )
                : state is HotelsLoading
                    ? const SkeletonizerGrid(
                        desktop: 4,
                        mobile: 2,
                      )
                    : state is HotelsFailure
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
