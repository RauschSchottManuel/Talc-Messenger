import 'package:flutter/material.dart';
import 'package:talc_messenger/floating_action_button_section/floating_action_button_section.dart';

import 'appbar/appbar.dart';

void main() {
  runApp(const TalcApp());
}

class TalcApp extends StatelessWidget {
  const TalcApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TalcStructure();
  }
}

class TalcStructure extends StatefulWidget {
  const TalcStructure({Key? key}) : super(key: key);

  @override
  State<TalcStructure> createState() => _TalcStructureState();
}

class _TalcStructureState extends State<TalcStructure> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: TalcAppBar(
          height: 150.0,
          homePage: true,
          text: Text(
            'Chats',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        floatingActionButton: TalcFloatingActionButtonSection(),
      ),
    );
  }
}
