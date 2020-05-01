import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animated Fab',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AnimatedFab(),
    );
  }
}

class AnimatedFab extends StatefulWidget {
 
  @override
  AnimatedFabState createState() => AnimatedFabState();
}

class AnimatedFabState extends State<AnimatedFab> {

  bool isFabTapped=false;
  List iconList=
  [
    Icons.camera,
    Icons.add_a_photo,
    Icons.videocam,
    Icons.local_movies,
    Icons.image,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: AnimatedContainer(
        
        width:!isFabTapped ?50: 50*iconList.length.ceilToDouble(),
        height: 50,

        duration: Duration(milliseconds: 250),
        
        child: FloatingActionButton(
          
          isExtended: true,

          child:!isFabTapped ? Icon(Icons.add)
          :ListView(
            scrollDirection: Axis.horizontal,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children:List.generate(iconList.length, (index)
            {
               return IconButton(
                 icon: Icon(iconList[index]),
                 onPressed: ()
                 {
                   setState(() {
                     isFabTapped=false;
                   });
                 });
            }),
            
          ),

          onPressed:!isFabTapped ?()
          {
            setState(() {
               isFabTapped=true;
            });
          }: null
          ),

        ),
    );
  }
}
