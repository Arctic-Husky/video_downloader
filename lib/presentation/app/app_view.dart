import 'package:flutter/material.dart';
import 'package:video_downloader/application/application_controller.dart';
import 'package:video_downloader/main.dart';
import 'package:video_downloader/presentation/view/home/home_view.dart';

class AppView extends StatelessWidget {
  AppView({super.key});

  final ApplicationController applicationController =
      getIt.get<ApplicationController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        title: "Video Downloader",
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: HomeView(),
      ),
    );
  }
}
