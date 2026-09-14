import 'package:flutter/material.dart';
// Gunakan relatif path ke routes.dart di folder yang sama
import 'routes.dart'; 

void main() { 
  runApp(MaterialApp( 
    onGenerateRoute: RouteGenerator.generateRoute, 
  )); 
}