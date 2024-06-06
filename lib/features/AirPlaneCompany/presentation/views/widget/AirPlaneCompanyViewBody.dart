import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism_app/core/utils/constants,.dart';
import 'package:tourism_app/core/widgets/SliverImageError.dart';
import 'package:tourism_app/features/AirPlaneCompany/presentation/viewmodel/companies_cubit/companies_cubit.dart';
import 'package:tourism_app/features/AirPlaneCompany/presentation/views/widget/AirPlaneItem.dart';
import 'package:tourism_app/features/AirPlaneCompany/presentation/views/widget/AirplaneAditionItem.dart';
import 'package:tourism_app/features/AirPlaneCompany/presentation/views/widget/SkeltonList.dart';

class AirPlaneCompanyViewBody extends StatefulWidget {
  const AirPlaneCompanyViewBody({super.key});

  @override
  State<AirPlaneCompanyViewBody> createState() =>
      _AirPlaneCompanyViewBodyState();
}

class _AirPlaneCompanyViewBodyState extends State<AirPlaneCompanyViewBody> {
  @override
  void initState() {
    BlocProvider.of<CompaniesCubit>(context).getAirPlaneCompanies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: kColor,
      onRefresh: () =>
          BlocProvider.of<CompaniesCubit>(context).getAirPlaneCompanies(),
      child: BlocBuilder<CompaniesCubit, CompaniesState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
            child: CustomScrollView(slivers: [
              SliverToBoxAdapter(
                child: Image.asset(
                  "images/airplaneundraw.png",
                  fit: BoxFit.scaleDown,
                  height: MediaQuery.of(context).size.height / 3,
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 8)),
              state is CompaniesLoading
                  ? const SkeltonList()
                  : state is CompaniesSuccess
                      ? SliverList.builder(
                          itemCount: state.companies.length + 1,
                          itemBuilder: (context, index) => index ==
                                  state.companies.length
                              ? AirplaneAditionItem(ontap: () {})
                              : AirPlaneItem(
                                  airPlaneCompanyModel: state.companies[index],
                                ),
                        )
                      : state is CompaniesFailure
                          ? SliverImageError(
                              errMessage: state.errMessage,
                            )
                          : const SliverToBoxAdapter(
                              child: SizedBox(),
                            ),
            ]),
          );
        },
      ),
    );
  }
}
