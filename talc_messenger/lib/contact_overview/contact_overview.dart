import 'package:flutter/material.dart';

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
        return GestureDetector(
          onTap: () {
            print('Contact tapped: ${widget.contacts[idx]}');
          },
          child: SizedBox(
            height: 75.0,
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
}
