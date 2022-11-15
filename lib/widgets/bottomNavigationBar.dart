
import 'package:flutter/material.dart';


class BottomNavigationWidget extends StatelessWidget {
  final IconData icon;
  final String name;
  final Function() onTap;

  const BottomNavigationWidget({super.key, required this.icon, required this.name, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: <Widget>[
            Icon(icon, size: 30,),
            const SizedBox(height: 2.0,),
            Text(name),
          ],
        ),
      ),
      //child: Image.asset("images/momo.png", width: 26, height: 26,),
    );
  }
}