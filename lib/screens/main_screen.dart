import 'package:draggable_shoes_selector_app/components/appbar.dart';
import 'package:draggable_shoes_selector_app/components/card.dart';
import 'package:draggable_shoes_selector_app/components/main_card.dart';
import 'package:draggable_shoes_selector_app/functions/toolbar_system.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String draggValue = '';
  @override
  Widget build(BuildContext context) {
    SystemBarUtils.setDarkTheme();
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(color: Colors.white),
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              const MyAppBar(),
              MainCard(
                onAccept: (value) {
                  draggValue = value;
                },
              ),
              CardSaya(
                onDrag: (value) {
                  draggValue = value;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
