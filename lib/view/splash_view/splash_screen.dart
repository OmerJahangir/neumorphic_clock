import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:neumorphic_clock/res/constants.dart';
import 'package:neumorphic_clock/view/common_widget/soft_button.dart';
import 'package:neumorphic_clock/view/home_view/home_view.dart';
import 'package:neumorphic_clock/view_model/bloc/home%20bloc/home%20bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 1000), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BlocProvider(
          create: (context) => HomeBloc(),
      child: const HomeScreen(),
      ),));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: CircularSoftButton(
          radius: 60,
          icon: Center(child: SvgPicture.asset('assets/icons/clock.svg',height: 35,width: 35,color: Colors.pinkAccent,))
        ),
      ),
    );
  }
}
