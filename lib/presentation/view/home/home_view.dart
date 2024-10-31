import 'package:flutter/material.dart';
import 'package:video_downloader/main.dart';
import 'package:video_downloader/presentation/view/home/home_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<StatefulWidget> createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  late HomeController homeController;

  @override
  void initState() {
    super.initState();

    homeController = getIt.registerSingleton(HomeController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      //   title: const Text("Teste App"), //const Text("Video Downloader"),
      // ),
      body: Container(
        child: CustomScrollView(
          physics: const RangeMaintainingScrollPhysics(),
          slivers: [
            SliverAppBar(
              title: Text("Teste App"),
            )
          ],
        ),
      ),
    );
  }
}
