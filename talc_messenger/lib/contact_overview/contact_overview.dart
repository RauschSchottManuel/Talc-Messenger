import 'package:flutter/material.dart';
import 'package:talc_messenger/pages/chat_page/chat_page.dart';

class TalcContactOverview extends StatefulWidget {
  const TalcContactOverview({Key? key, required this.contacts})
      : super(key: key);

  final List<String> contacts;

  @override
  State<TalcContactOverview> createState() => _TalcContactOverviewState();
}

class _TalcContactOverviewState extends State<TalcContactOverview> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.contacts.length,
      itemBuilder: (context, idx) {
        return InkWell(
          onTap: () {
            Navigator.push(
                context, _createChatScreenRoute(widget.contacts[idx]));
          },
          child: SizedBox(
            height: 75.0,
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: idx == 0
                      ? const Icon(
                          Icons.groups,
                          size: 45.0,
                        )
                      : const Icon(
                          Icons.person,
                          size: 45.0,
                        ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.contacts[idx],
                      style: const TextStyle(
                        fontSize: 19.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      'status? last message? ...?',
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Route _createChatScreenRoute(String contact) {
    var transitionDuration = const Duration(milliseconds: 90);

    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => TalcChatScreen(
        contact: contact,
      ),
      transitionDuration: transitionDuration,
      reverseTransitionDuration: transitionDuration,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.easeInOut;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
