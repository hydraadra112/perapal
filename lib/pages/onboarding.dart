import 'package:flutter/material.dart';
import 'package:perapal/contents/contents.dart';
import 'package:perapal/pages/login.dart';
import 'package:perapal/utils/style.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

@override
Widget build(BuildContext context) {
  return Scaffold(
    body: Column(
      children: [
        Expanded(
          child: PageView.builder(
            itemCount: contents.length,
            itemBuilder: (_, i) {
              return Padding(
                padding: const EdgeInsets.all(50),
                child: Column(
                  children: [
                    Image(image: AssetImage(contents[i].image), 
                    height: 600,),
                    Text(contents[i].title)
                  ],
                ),
              );
            },
          ),
        ),
        Container(
          height: large,
          margin: EdgeInsets.all(large),
          width: double.infinity,
          child: FloatingActionButton(
            backgroundColor: blue,
            onPressed: (){
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => const LoginPage())
                );
            },
            child: Text("Get Started",
            style: heading2L,)),
            
        )
      ],
    ),
  );
}
}