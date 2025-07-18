import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neumorphic_clock/res/constants.dart';
import 'package:neumorphic_clock/view/alarm%20view/components/body.dart';
import 'package:neumorphic_clock/view/alarm%20view/components/floating_button.dart';
import 'package:neumorphic_clock/view_model/bloc/alarm_bloc/alarm_cubit.dart';

class AlarmScreen extends StatefulWidget {
  const AlarmScreen({super.key});
  @override
  State<AlarmScreen> createState() => _AlarmScreenState();
}

class _AlarmScreenState extends State<AlarmScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<AlarmCubit>(context).getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const FloatingButton(),
      body: const SafeArea(child: Body()),
    );
  }
}
