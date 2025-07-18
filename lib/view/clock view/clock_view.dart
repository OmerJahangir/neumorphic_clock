import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neumorphic_clock/view/clock%20view/components/clock_body.dart';
import 'package:neumorphic_clock/view_model/bloc/time_bloc/time_bloc.dart';
import '../../res/constants.dart';

class ClockScreen extends StatefulWidget {
  const ClockScreen({super.key});
  @override
  State<ClockScreen> createState() => _ClockScreenState();
}

class _ClockScreenState extends State<ClockScreen> {
  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(milliseconds: 1000), (timer) {
      BlocProvider.of<TimeCubit>(context).updateTime();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: const SafeArea(child: ClockBody()),
    );
  }
}
