import 'package:animated_screen/meat_shadow.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);

    animation = Tween<double>(begin: 0.5, end: 1.0).animate(controller)
      ..addListener(() {
        setState(() {});
      });

    controller.forward();
    controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: const Text('Loading')),
      body: Center(
        child: SizedBox(
            width: size.width,
            height: 300.0,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/meat.png'),
                    SizedBox(
                      height: 30 * animation.value,
                    ),
                    MeatShadow(
                      growthFactor: animation.value,
                    ),
                  ],
                ),
                const Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      'Loading....',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    )),
              ],
            )),
      ),
    );
  }
}
