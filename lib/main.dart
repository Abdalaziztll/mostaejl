import 'package:flutter/material.dart';
import 'package:herry_up/core/config/dependency_injection.dart';
import 'package:herry_up/trask7/view/pages/CreatOrder.dart';

void main() {
WidgetsFlutterBinding.ensureInitialized();
  init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        
        useMaterial3: true,
        colorSchemeSeed: const Color.fromARGB(255, 7, 135, 11)
        
      ),
      home:CreatOrder(),
    );
  }
}
