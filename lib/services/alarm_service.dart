// ignore_for_file: use_build_context_synchronously

import 'dart:math';
import 'package:alarm/alarm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neumorphic_clock/view_model/bloc/alarm_bloc/alarm_cubit.dart';
import '../model/alarm_model.dart';

class MyAlarm {
  static void setAlarm(TimeOfDay time, BuildContext context) {
    final timeOfDay = time;
    final nextDay = DateTime.now().add(const Duration(days: 1));
    var dateTime = DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
      timeOfDay.hour,
      timeOfDay.minute,
    );
    if (dateTime.isBefore(DateTime.now())) {
      dateTime = nextDay;
    }
    final alarmSettings = AlarmSettings(
      id: Random().nextInt(100),
      dateTime: dateTime,
      assetAudioPath: 'assets/audio/tune.mp3',
      loopAudio: true,
      vibrate: true,
      notificationSettings: const NotificationSettings(
        title: 'This is the title',
        body: 'This is the body',
        stopButton: 'Stop the alarm',
        icon: 'notification_icon',
        iconColor: Color(0xff862778),
      ),
      volumeSettings: VolumeSettings.fade(
        volume: 0.8,
        fadeDuration: Duration(seconds: 5),
        volumeEnforced: true,
      ),
      //  volumeMax: true,
      //  fadeDuration: 3.0,
      //  notificationTitle: 'Alarm is Playing',
      //  notificationBody: 'Tap to stop',
      //  enableNotificationOnKill: true,
      //  stopOnNotificationOpen: true,
    );
    Alarm.set(alarmSettings: alarmSettings)
        .then((value) {
          BlocProvider.of<AlarmCubit>(context).helper.insert(
            AlarmModel(
              key: DateTime.now().microsecondsSinceEpoch.toString(),
              hour: time.hourOfPeriod.toString(),
              period: time.period.name,
              min: time.minute.toString(),
              day: 'Today',
              isEnabled: 'true',
              alarmId: alarmSettings.id.toString(),
              title: 'Alarm N',
            ),
          );
        })
        .then((value) {
          BlocProvider.of<AlarmCubit>(context).getData();
        });
  }
}
