import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neumorphic_clock/view_model/bloc/time_bloc/time_states.dart';

class TimeCubit extends Cubit<TimeStates>{
  TimeCubit() : super(UpdateTime(TimeOfDay.now().hourOfPeriod.toString(),
      TimeOfDay.now().minute.toString(),
      TimeOfDay.now().period.name.toUpperCase()));


  void updateTime(){
    emit(UpdateTime(TimeOfDay.now().hourOfPeriod.toString(),
        TimeOfDay.now().minute.toString(),
        TimeOfDay.now().period.name.toUpperCase()));
  }


}



