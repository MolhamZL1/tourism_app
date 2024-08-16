import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism_app/core/utils/constants,.dart';
import 'package:tourism_app/core/widgets/Rating.dart';
import 'package:tourism_app/features/AirPlaneCompany/data/models/airPlaneCompanyModel.dart';
import 'package:tourism_app/features/AirPlaneCompany/presentation/viewmodel/companies_cubit/companies_cubit.dart';
import 'package:tourism_app/features/AirPlaneCompany/presentation/viewmodel/edit_company_cubit/edit_company_cubit.dart';
import 'package:tourism_app/features/AirPlaneCompany/presentation/views/widget/CustomAddCompanyDialog.dart';

import '../../../../../core/utils/api_service.dart';

class AirPlaneItem extends StatefulWidget {
  const AirPlaneItem(
      {super.key, required this.airPlaneCompanyModel, this.loading = false});
  final AirPlaneCompanyModel airPlaneCompanyModel;
  final bool loading;

  @override
  State<AirPlaneItem> createState() => _AirPlaneItemState();
}

class _AirPlaneItemState extends State<AirPlaneItem> {
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ExpansionTile(
        leading: // const Icon(Icons.airplanemode_active),
            Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(99),
              image: DecorationImage(
                image: widget.loading
                    ? AssetImage(widget.airPlaneCompanyModel.photo)
                    : CachedNetworkImageProvider(
                            "${ApiService.baseURL}${widget.airPlaneCompanyModel.photo}")
                        as ImageProvider,
              )),
          width: 50,
        ),
        collapsedShape: const RoundedRectangleBorder(
            side: BorderSide(color: kColor),
            borderRadius: BorderRadius.all(Radius.circular(8))),
        iconColor: kColor,
        shape: const RoundedRectangleBorder(
            side: BorderSide(color: kColor),
            borderRadius: BorderRadius.all(Radius.circular(8))),
        title: Row(
          children: [
            Text(widget.airPlaneCompanyModel.name),
            const Spacer(),
            IconButton(
              onPressed: () => {
                BlocProvider.of<EditCompanyCubit>(context)
                    .deleteCompany(id: widget.airPlaneCompanyModel.id),
                BlocProvider.of<CompaniesCubit>(context).getAirPlaneCompanies(),
              },
              icon: const Icon(Icons.delete),
              color: Colors.red,
            ),
            IconButton(
              onPressed: () => showDialog(
                  context: context,
                  builder: (_) => CustomAddCompanyDialog(
                        companyModel: widget.airPlaneCompanyModel,
                        viewContext: context,
                      )),
              icon: const Icon(Icons.edit),
              color: Colors.greenAccent,
            )
          ],
        ),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.location_on, color: Colors.green),
                    const SizedBox(width: 4),
                    Text(
                        "${widget.airPlaneCompanyModel.location}(${widget.airPlaneCompanyModel.country.name})"),
                    const SizedBox(width: 24),
                    ShowRating(avarage: widget.airPlaneCompanyModel.rate),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.food_bank_outlined, color: Colors.grey),
                    const SizedBox(width: 4),
                    ShowRating(avarage: widget.airPlaneCompanyModel.food),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.safety_check, color: Colors.red),
                    const SizedBox(width: 4),
                    ShowRating(avarage: widget.airPlaneCompanyModel.safe),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.chair, color: Colors.black),
                    const SizedBox(width: 4),
                    ShowRating(avarage: widget.airPlaneCompanyModel.comforts),
                  ],
                ),
                const SizedBox(height: 8),
                const Text("description :",
                    style: TextStyle(color: Colors.grey)),
                Padding(
                  padding: const EdgeInsets.only(left: 24),
                  child: Text(widget.airPlaneCompanyModel.description),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
