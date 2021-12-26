import 'package:flutter/material.dart';
import 'package:smart_carboy/core/constants/icon/app_icons.dart';
import 'package:smart_carboy/core/extensions/context_extension.dart';
import 'package:smart_carboy/view/home/home_view.dart';
import 'package:smart_carboy/view/main/main_view_model.dart';
import 'package:smart_carboy/widgets/custom_text.dart';
import 'package:stacked/stacked.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
        viewModelBuilder: () => MainViewModel(),
        onModelReady: (viewModel) => viewModel.initialize(context),
        builder: (context, viewModel, child) {
          return Scaffold(
            key: _scaffoldKey,
            appBar: buildAppBar(context),
            body: body(viewModel.bottomBarIndex),
            bottomNavigationBar: buildBottomNavigationBar(viewModel),
            endDrawer: Drawer(
              elevation: 16.0,
              child: Container(
                child: Center(
                  child: Text('A'),
                ),
              ),
            ),
          );
        });
  }

  Widget body(int index) {
    switch (index) {
      case 0:
        return Center(child: CustomText('Sepet'));
      case 1:
        return HomeView();
      case 2:
        return Center(child: CustomText('Sepet'));
      default:
        return Center(child: CustomText('Sepet'));
    }
  }

  BottomNavigationBar buildBottomNavigationBar(MainViewModel viewModel) {
    return BottomNavigationBar(
      currentIndex: viewModel.bottomBarIndex,
      showUnselectedLabels: false,
      showSelectedLabels: false,
      iconSize: 28,
      backgroundColor: Color(0xff0F608E),
      unselectedItemColor: Color(0xff1D91D2),
      onTap: (value) {
        viewModel.bottomBarIndex = value;
      },
      items: [
        BottomNavigationBarItem(icon: Icon(AppIcons.basket), label: 'Basket'),
        BottomNavigationBarItem(icon: Icon(AppIcons.home), label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(AppIcons.settings), label: 'Setting'),
      ],
    );
  }

  AppBar buildAppBar(BuildContext context) => AppBar(
        title: Container(
          // width: context.dynamicWidth(1),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset('assets/logo_yatay.png'),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: IconButton(
                onPressed: () => _scaffoldKey.currentState!.openEndDrawer(),
                icon: Icon(AppIcons.menu, color: Color(0xff1D91D2))),
          )
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      );
}
