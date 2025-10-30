import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tourism_app/core/models/draweritemmodel.dart';
import 'package:tourism_app/features/AirPlaneCompany/presentation/views/widget/AirPlaneCompanyViewBody.dart';
import 'package:tourism_app/features/Country/presentation/views/widgets/CountryViewBody.dart';
import 'package:tourism_app/features/Hotels/presentation/views/widgets/hotels_view_body.dart';
import 'package:tourism_app/features/Users/presentation/views/widgets/users_view_body.dart';
import 'package:tourism_app/features/Resturants/presentation/views/widgets/resturants_view_body.dart';
import 'package:tourism_app/features/Trips/presentation/views/widgets/tripsviewbody.dart';
import 'package:tourism_app/features/home/presentation/views/widgets/DashBoardBody.dart';

const kColor = Color(0xFF67E7EA);

final List<DrawerItemModel> destenations = [
  DrawerItemModel(text: "D A S H B O A R D", icon: FontAwesomeIcons.house),
  DrawerItemModel(text: "C O U N T R Y", icon: FontAwesomeIcons.earthAsia),
  DrawerItemModel(text: "A I R L I N E", icon: Icons.airplanemode_active),
  DrawerItemModel(text: "H O T E L", icon: FontAwesomeIcons.hotel),
  DrawerItemModel(text: "R E S T U R A N T", icon: Icons.restaurant),
  DrawerItemModel(text: "T R I P", icon: Icons.flight_takeoff),
  DrawerItemModel(text: "U S E R S", icon: Icons.people),
];

const List views = [
  DashBoardBody(),
  CountryViewBody(),
  AirPlaneCompanyViewBody(),
  HotelsViewBody(),
  ResturantsViewBody(),
  TripsViewBody(),
  UsersViewBody()
];
