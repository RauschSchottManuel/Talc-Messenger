import 'package:flutter/material.dart';
import 'package:talc_messenger/appbar/appbar.dart';

class TalcChatScreen extends StatefulWidget {
  const TalcChatScreen({
    Key? key,
    required this.contact,
  }) : super(key: key);

  final String contact;

  @override
  State<TalcChatScreen> createState() => _TalcChatScreenState();
}

class _TalcChatScreenState extends State<TalcChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TalcAppBar(
        height: 150.0,
        homePage: false,
        showProgressIndicator: true,
        text: Text(
          widget.contact,
          style: const TextStyle(
            decoration: TextDecoration.none,
            color: Colors.white,
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: const Text('Loading Data ...'),
    );
  }
}
