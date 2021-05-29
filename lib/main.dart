import 'package:device_preview/device_preview.dart';
import 'package:device_preview/plugins.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/bmi_cubit.dart';
import 'ui/home/home_screen.dart';

void main() {
  runApp(
    DevicePreview(
      // enabled: false,
      enabled: !kReleaseMode,
      builder: (context) => MyApp(),
      plugins: const [
        ScreenshotPlugin(),
      ],
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BmiCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        home: HomeScreen(),
      ),
    );
  }
}
