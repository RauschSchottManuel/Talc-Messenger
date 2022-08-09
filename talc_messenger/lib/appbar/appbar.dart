import 'package:flutter/material.dart';

import 'appbar_clipper.dart';

class TalcAppBar extends StatefulWidget with PreferredSizeWidget {
  const TalcAppBar({
    Key? key,
    required this.height,
    this.homePage = true,
    this.text = const Text(''),
  }) : super(key: key);

  final double height;
  final bool homePage;
  final Widget text;

  @override
  State<TalcAppBar> createState() => _TalcAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(height);
}

class _TalcAppBarState extends State<TalcAppBar> {
  var searchOpen = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          ClipPath(
            clipper: AppBarShapeClipper(),
            child: Container(
              height: widget.height,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [
                    Colors.blue,
                    Colors.lime,
                  ],
                ),
              ),
              child: Stack(
                children: layoutElements(),
              ),
            ),
          ),

          /// Search Button
          if (widget.homePage) //NOTE: when needed on non-homepage remove this
            configureSearchButton(),
        ],
      ),
    );
  }

  List<Widget> layoutElements() {
    List<Widget> elements = [];

    if (!widget.homePage) {
      elements.add(Positioned(
        top: 2.0,
        child: IconButton(
          color: Colors.white,
          iconSize: 32.0,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ));
    }

    elements.add(Positioned(
      top: 55.0,
      left: 15.0,
      child: widget.text,
    ));

    return elements;
  }

  Widget configureSearchButton() {
    return AnimatedPositioned(
      top: searchOpen ? 95.0 : 45.0,
      left: searchOpen ? 7.0 : MediaQuery.of(context).size.width - 80.0,
      right: searchOpen ? 7.0 : 25.0,
      height: 55.0,
      duration: const Duration(milliseconds: 200),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(50.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment:
              searchOpen ? MainAxisAlignment.end : MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedContainer(
              width: searchOpen ? MediaQuery.of(context).size.width - 86.0 : 0,
              duration: const Duration(milliseconds: 200),
              child: const TextField(),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  searchOpen = !searchOpen;
                });
              },
              icon: searchOpen
                  ? const Icon(Icons.close)
                  : const Icon(Icons.search),
            ),
          ],
        ),
      ),
    );
  }
}
