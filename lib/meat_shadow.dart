import 'package:flutter/material.dart';

class MeatShadow extends StatefulWidget {
  final double growthFactor;
  const MeatShadow({Key? key, required this.growthFactor}) : super(key: key);

  @override
  State<MeatShadow> createState() => _MeatShadowState();
}

class _MeatShadowState extends State<MeatShadow> {
//write code that changes the darkness of the shadow as
//the width of the shadow reduces.

//create box color using Colors.rgb
  Color darkenColor(double darkenFactor) {
    int value = (100 * darkenFactor).toInt();

    return Color.fromARGB(255, value, value, value);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.0 * widget.growthFactor < 15 ? 15 : 30.0 * widget.growthFactor,
      width: 90.0 * widget.growthFactor < 30 ? 30 : 90.0 * widget.growthFactor,
      decoration: BoxDecoration(
        color: darkenColor(widget.growthFactor),
        borderRadius: BorderRadius.all(Radius.elliptical(120,
            70 * widget.growthFactor < 50 ? 50 : 70 * widget.growthFactor)),
      ),
    );
  }
}
