import 'package:flutter/material.dart';
import 'package:perapal/contents/contents.dart';
import 'package:perapal/pages/login.dart';
import 'package:perapal/utils/style.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
int currentIndex = 0;

  @override
Widget build(BuildContext context) {
  return Scaffold(
    body: Column(
      children: [
        Padding(
          padding:  EdgeInsets.all(large),
          child: Text("PeraPal", style: heading1D.copyWith(fontSize: 50),),
        ),
        Expanded(
          child: PageView.builder(
            itemCount: contents.length,
            onPageChanged: (int index){
              setState(() {
                currentIndex = index;
              });
            },
            itemBuilder: (_, i) {
              return Padding(
                padding: EdgeInsets.all(large),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Image(image: AssetImage(contents[i].image), 
                    height: 200,
                    ),             
                    Text(contents[i].title, style: heading3,),
                    SizedBox(height: small,),
                    
                    Text(contents[i].text, style: p1,)
                  ],
                ),
              );
            },
          ),
        ),
        SizedBox(
          height: small,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: 
                List.generate(
                  contents.length, 
                  (index) => buildDot(index, context)
                  ) 
          )
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

Container buildDot(int index, BuildContext context) {
  return Container(
                  height: 5,
                  width: currentIndex == index ? 15:5,
                  margin: const EdgeInsets.only(right: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(small),
                    color: blue
                  ),
                );
}
}