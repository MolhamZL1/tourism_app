import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism_app/features/Hotels/presentation/viewModel/HotelsCubit/hotels_cubit.dart';
import 'package:tourism_app/features/Hotels/presentation/views/widgets/custom_ad_hotel_dialog.dart';
import 'package:tourism_app/features/Hotels/presentation/views/widgets/hotelItem.dart';
import '../../../../../core/widgets/AdditionContainer.dart';
import '../../../../../core/widgets/SliverImageError.dart';
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

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HotelsCubit, HotelsState>(
      builder: (context, state) {
        return CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Visibility(
                visible: state is! HotelsFailure,
                child: Image.asset("images/undraw_Best_place_re_lne9.png",
                    height: MediaQuery.of(context).size.height / 3,
                    fit: BoxFit.scaleDown),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 8)),
            state is HotelsSuccess
                ? SliverGrid.builder(
                    itemCount: state.hotels.length + 1,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount:
                            MediaQuery.of(context).size.width < 900 ? 2 : 4,
                        mainAxisSpacing: 16),
                    itemBuilder: (context, index) => index ==
                            state.hotels.length
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
                            child: HotelItem(hotelModel: state.hotels[index]),
                          ),
                  )
                : state is HotelsLoading
                    ? const SkeletonizerGrid(
                        desktop: 4,
                        mobile: 2,
                      )
                    : state is HotelsFailure
                        ? SliverImageError(
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
