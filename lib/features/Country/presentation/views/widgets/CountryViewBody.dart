import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism_app/core/utils/constants,.dart';
import 'package:tourism_app/core/widgets/CustomSearchBar.dart';
import 'package:tourism_app/core/widgets/SliverImageError.dart';
import 'package:tourism_app/features/Country/presentation/viewModels/CountryCubit/country_cubit.dart';
import 'package:tourism_app/core/widgets/AdditionContainer.dart';
import 'package:tourism_app/features/Country/presentation/views/widgets/CountryItem.dart';
import 'package:tourism_app/features/Country/presentation/views/widgets/CustomAddCountryDailog.dart';
import 'package:tourism_app/features/Country/presentation/views/widgets/SkeletonizerGrid.dart';

import '../../../../../core/widgets/SliverNotFoundImage.dart';

class CountryViewBody extends StatefulWidget {
  const CountryViewBody({super.key});

  @override
  State<CountryViewBody> createState() => _CountryViewBodyState();
}

class _CountryViewBodyState extends State<CountryViewBody> {
  @override
  void initState() {
    BlocProvider.of<CountryCubit>(context).getCountries();
    super.initState();
  }

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: kColor,
      onRefresh: () => BlocProvider.of<CountryCubit>(context).getCountries(),
      child: BlocBuilder<CountryCubit, CountryState>(
        builder: (context, state) {
          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Visibility(
                  visible: !(state is CountryFailure &&
                      state.errMessage != "Not Found"),
                  child: Image.asset("images/earth.png",
                      height: MediaQuery.of(context).size.height / 3,
                      fit: BoxFit.scaleDown),
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 8)),
              SliverToBoxAdapter(
                  child: Visibility(
                visible: !(state is CountryFailure &&
                    state.errMessage != "Not Found"),
                child: CustomSearchBar(
                  onChanged: (value) {
                    if (value.isEmpty) {
                      BlocProvider.of<CountryCubit>(context).getCountries();
                    } else {
                      BlocProvider.of<CountryCubit>(context)
                          .searchCountry(quary: value);
                    }
                  },
                ),
              )),
              state is CountrySuccess
                  ? SliverGrid.builder(
                      itemCount: state.countries.length + 1,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount:
                              MediaQuery.of(context).size.width < 900 ? 2 : 6,
                          mainAxisSpacing: 24),
                      itemBuilder: (context, index) =>
                          index == state.countries.length
                              ? AdditionContainer(
                                  ontap: () => showDialog(
                                    context: context,
                                    builder: (_) => CustomAddCountryDailog(
                                      viewContext: context,
                                    ),
                                  ),
                                )
                              : GestureDetector(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (_) => CustomAddCountryDailog(
                                        countryModel: state.countries[index],
                                        viewContext: context,
                                      ),
                                    );
                                  },
                                  child: CountryItem(
                                      countryModel: state.countries[index]),
                                ),
                    )
                  : state is CountryLoading
                      ? const SkeletonizerGrid(
                          desktop: 6,
                        )
                      : state is CountryFailure
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
      ),
    );
  }
}
