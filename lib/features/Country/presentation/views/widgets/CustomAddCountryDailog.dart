import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tourism_app/core/utils/constants,.dart';
import 'package:tourism_app/core/utils/service_locator.dart';
import 'package:tourism_app/features/Country/data/models/country_model.dart';
import 'package:tourism_app/features/Country/data/repos/countryRepo.dart';
import 'package:tourism_app/features/Country/presentation/viewModels/CountryCubit/country_cubit.dart';
import 'package:tourism_app/features/Country/presentation/viewModels/EditCountryCubit/edit_country_cubit.dart';
import 'package:tourism_app/features/Country/presentation/views/widgets/ContentCountryDialog.dart';

class CustomAddCountryDailog extends StatefulWidget {
  const CustomAddCountryDailog({
    super.key,
    this.countryModel,
    this.viewContext,
  });

  final ContryModel? countryModel;
  final BuildContext? viewContext;

  @override
  State<CustomAddCountryDailog> createState() => _CustomAddCountryDailogState();
}

class _CustomAddCountryDailogState extends State<CustomAddCountryDailog> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController rateController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  bool isFailure = false;

  @override
  void initState() {
    nameController.text =
        widget.countryModel?.name == null ? "" : widget.countryModel!.name!;
    rateController.text =
        widget.countryModel?.rate == null ? "1" : widget.countryModel!.rate!;
    widget.countryModel != null ? EditCountryCubit.photo = null : null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditCountryCubit(getIt.get<CountryRepo>()),
      child: AlertDialog(
        backgroundColor: Colors.white,
        title: Text(
            widget.countryModel?.name == null
                ? "Add New Country"
                : widget.countryModel!.name!,
            style: const TextStyle(fontSize: 24)),
        content: ContentAddCountryDialog(
          nameController: nameController,
          rateController: rateController,
          formkey: formKey,
          countryModel: widget.countryModel,
          isFailure: isFailure,
        ),
        actions: [
          BlocConsumer<EditCountryCubit, EditCountryState>(
            listener: (context, state) => state is EditCountrySuccess
                ? {
                    GoRouter.of(context).pop(),
                    BlocProvider.of<CountryCubit>(widget.viewContext!)
                        .getCountries(),
                  }
                : null,
            builder: (context, state) {
              return Column(
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    Visibility(
                      visible: widget.countryModel?.name != null,
                      child: TextButton(
                          onPressed: () =>
                              BlocProvider.of<EditCountryCubit>(context)
                                  .deleteCountry(id: widget.countryModel!.id!),
                          child: const Text(
                            "Delete",
                            style: TextStyle(color: Colors.red),
                          )),
                    ),
                    const Spacer(),
                    TextButton(
                        onPressed: () => {
                              GoRouter.of(context).pop(),
                              EditCountryCubit.photo = null
                            },
                        child: const Text(
                          "Cancle",
                          style: TextStyle(color: Colors.black),
                        )),
                    const SizedBox(width: 16),
                    state is EditCountryLoading
                        ? const Padding(
                            padding: EdgeInsets.all(4.0),
                            child: CircularProgressIndicator(color: kColor),
                          )
                        : ElevatedButton(
                            onPressed: () => formKey.currentState!.validate()
                                ? widget.countryModel?.name == null
                                    ? EditCountryCubit.photo != null
                                        ? BlocProvider.of<EditCountryCubit>(
                                                context)
                                            .addCountry(
                                                name: nameController.text,
                                                rate: rateController.text)
                                        : setState(() {
                                            isFailure = true;
                                          })
                                    : BlocProvider.of<EditCountryCubit>(context)
                                        .updateCountry(
                                            id: widget.countryModel!.id!,
                                            name: nameController.text,
                                            rate: rateController.text)
                                : null,
                            style: const ButtonStyle(
                                backgroundColor:
                                    WidgetStatePropertyAll(kColor)),
                            child: const Text(
                              "Save",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                  ]),
                  state is EditCountryFailure
                      ? SizedBox(
                          child: Text(
                            state.errMessage,
                            style: const TextStyle(color: Colors.red),
                          ),
                        )
                      : const SizedBox(),
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
