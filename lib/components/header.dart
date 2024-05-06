import 'package:flutter/material.dart';
import 'package:perapal/utils/style.dart';


class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
          centerTitle: true,
          title: Text("PeraPal", 
          style: heading1D, 
          selectionColor: textDark,
          ),
          backgroundColor: white,
          elevation: 200,
          actions: [IconButton(onPressed: () {},
          icon: const Icon(Icons.help)
          )
          ],
          automaticallyImplyLeading: false
        );
  }
}