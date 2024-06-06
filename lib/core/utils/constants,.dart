import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tourism_app/core/models/draweritemmodel.dart';
import 'package:tourism_app/features/AirPlaneCompany/presentation/views/widget/AirPlaneCompanyViewBody.dart';
import 'package:tourism_app/features/Country/presentation/views/widgets/CountryViewBody.dart';
import 'package:tourism_app/features/Trips/presentation/views/widgets/tripsviewbody.dart';
import 'package:tourism_app/features/home/presentation/views/widgets/DashBoardBody.dart';

const kColor = Color(0xFF67E7EA);
final List<DrawerItemModel> destenations = [
  DrawerItemModel(text: "D A S H B O A R D", icon: FontAwesomeIcons.house),
  DrawerItemModel(text: "C O U N T R Y", icon: FontAwesomeIcons.earthAsia),
  DrawerItemModel(text: "A I R P L A N E", icon: Icons.airplanemode_active),
  DrawerItemModel(text: "T R I P S", icon: Icons.holiday_village),
];
const List views = [
  DashBoardBody(),
  CountryViewBody(),
  AirPlaneCompanyViewBody(),
  TripsViewBody()
];
