import 'package:flutter/material.dart';
import 'package:turismo_flutter/views/user/login.dart';
import 'package:turismo_flutter/views/user/profile.dart';
import 'package:turismo_flutter/views/product/service_list.dart';
import 'package:turismo_flutter/views/chat/conversations.dart';
import 'package:turismo_flutter/views/main/home_page.dart';
import 'package:turismo_flutter/views/reservation/reservation_page.dart';

class Screens {
  final List<Widget> _mainViews = [
    const HomePage(), //0
    const Descovery(), //1
    const Reservation(), //2
    const Conversations(), //3
    const Profile(), //4
    const Login(), //5
  ];

  final List<Widget> settingView = [];

  final List<Widget> userView = [];

  final List<Widget> reservationView = [];

  final List<Widget> favoriteView = [];

  getMainViews() {
    return _mainViews;
  }
}
