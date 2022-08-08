import 'package:flutter/material.dart';

class TalcFloatingActionButtonSection extends StatefulWidget {
  const TalcFloatingActionButtonSection({Key? key}) : super(key: key);

  @override
  State<TalcFloatingActionButtonSection> createState() =>
      _TalcFloatingActionButtonSectionState();
}

class _TalcFloatingActionButtonSectionState
    extends State<TalcFloatingActionButtonSection> {
  var listMoreOptions = false;
  var animationDurationMilliseconds = 200;
  var animationCurve = Curves.bounceInOut;

  final double buttonSize = 60.0;
  final double buttonSpacing = 10;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: listMoreOptions
          ? (buttonSize * 3) + (buttonSpacing * 3)
          : (buttonSize * 2) + buttonSpacing,
      height: buttonSize,
      duration: Duration(milliseconds: animationDurationMilliseconds + 50),
      curve: Curves.decelerate,
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          AnimatedPositioned(
            right: listMoreOptions
                ? (buttonSize * 3) + (buttonSpacing * 3)
                : buttonSize + buttonSpacing,
            duration: Duration(milliseconds: animationDurationMilliseconds),
            curve: animationCurve,
            child: AnimatedOpacity(
              opacity: listMoreOptions ? 0 : 1,
              duration: Duration(milliseconds: animationDurationMilliseconds),
              child: iconButtonContainer(
                size: buttonSize,
                child: IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return const SizedBox(
                            height: 150,
                            child: Text('Cool Bottom Sheet'),
                          );
                        });
                  },
                  tooltip: 'Add contact/group',
                  color: Colors.white,
                  icon: const Icon(Icons.add),
                ),
              ),
            ),
          ),
          AnimatedPositioned(
            right: listMoreOptions ? (buttonSize * 2) + (buttonSpacing * 2) : 0,
            duration:
                Duration(milliseconds: animationDurationMilliseconds + 80),
            curve: animationCurve,
            child: iconButtonContainer(
              size: buttonSize,
              child: IconButton(
                onPressed: () {},
                tooltip: 'Something else',
                color: Colors.white,
                icon: const Icon(Icons.logo_dev),
              ),
            ),
          ),
          AnimatedPositioned(
            right: listMoreOptions ? buttonSize + buttonSpacing : 0,
            duration: Duration(milliseconds: animationDurationMilliseconds),
            curve: animationCurve,
            child: iconButtonContainer(
              size: buttonSize,
              child: IconButton(
                onPressed: () {},
                tooltip: 'Settings',
                color: Colors.white,
                icon: const Icon(Icons.settings),
              ),
            ),
          ),
          Positioned(
            child: iconButtonContainer(
              size: buttonSize,
              child: IconButton(
                tooltip: 'More options',
                color: Colors.white,
                onPressed: () {
                  setState(() {
                    listMoreOptions = !listMoreOptions;
                  });
                },
                icon: listMoreOptions
                    ? const Icon(Icons.close)
                    : const Icon(Icons.more_vert),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget iconButtonContainer({required Widget child, required double size}) {
    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(50.0)),
        color: Colors.blue,
      ),
      child: child,
    );
  }
}
