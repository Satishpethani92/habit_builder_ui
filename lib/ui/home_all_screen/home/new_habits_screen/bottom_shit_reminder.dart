import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewHabitBottomShit extends StatelessWidget {
  const NewHabitBottomShit({Key? key}) : super(key: key);
  void _show(BuildContext ctx) {
    showModalBottomSheet(
        elevation: 10,
        backgroundColor: Colors.amber,
        context: ctx,
        builder: (ctx) => Container(
              width: 300,
              height: 250,
              color: Colors.white54,
              alignment: Alignment.center,
              child: const Text('Breathe in... Breathe out...'),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
