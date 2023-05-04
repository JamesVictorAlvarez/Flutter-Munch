import 'package:flutter/material.dart';
// import 'app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'widget_tree.dart';

// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(
//         primaryColor: Color(0xFFE85852),
//       ),
//       home: App(),
//     );
//   }
// }

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        theme: ThemeData(
        primaryColor: Color(0xFFE85852),
      ),
      home: WidgetTree(),
    );
  }
}
