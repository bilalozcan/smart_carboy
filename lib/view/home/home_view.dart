import 'package:flutter/material.dart';
import 'package:smart_carboy/widgets/base_container.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BaseContainer(image: 'assets/background.png',child: Column()),
    );
  }
}
