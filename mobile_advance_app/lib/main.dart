import 'package:flutter/material.dart'; 
void main() => runApp(MyApp()); 
class MyApp extends StatelessWidget { 
@override 
Widget build(BuildContext context) { 
return MaterialApp( 
home: Scaffold( 
appBar: AppBar( 
leading: Icon(Icons.dashboard), 
title: Text("Belajar MaterialApp Scaffold"),  
actions: <Widget>[ 
Icon(Icons.search), 
// Icon(Icons.find_in_page) 
], 
actionsIconTheme: IconThemeData(color: Colors.yellow),
backgroundColor: Colors.pinkAccent, 
bottom: PreferredSize( 
child: Container( 
color: Colors.orange,  
height: 4.0, 
),  
preferredSize: Size.fromHeight(4.0) 
), 
centerTitle: true, 
), 
floatingActionButton: FloatingActionButton( 
backgroundColor: Colors.pinkAccent, 
child: Text('+'), 
onPressed: () {}, 
), 
body: Column( 
crossAxisAlignment: CrossAxisAlignment.start, 
children: <Widget>[ 
Container(width: 50, height: 50, decoration: BoxDecoration(color: 
Colors.redAccent, shape: BoxShape.circle),), 
Container(width: 50, height: 50, decoration: BoxDecoration(color: 
Colors.pinkAccent, shape: BoxShape.circle),), 
Row( 
mainAxisAlignment: MainAxisAlignment.end, 
children: <Widget>[ 
Container(width: 50, height: 50, decoration: BoxDecoration(color: 
Colors.blueAccent, shape: BoxShape.circle),), 
Container(width: 50, height: 50, decoration: BoxDecoration(color: 
Colors.redAccent, shape: BoxShape.circle),), 
Container(width: 50, height: 50, decoration: BoxDecoration(color: 
Colors.pinkAccent, shape: BoxShape.circle),), 
], 
) 
], 
), 
), 
debugShowCheckedModeBanner: false, 
); 
} 
} 