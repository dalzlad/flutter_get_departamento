import 'package:flutter/material.dart';
import 'package:flutter_get_api/get_departamentos.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Material App',
      home: DepartamentoApiGet(),
      debugShowCheckedModeBanner: false,
    );
  }
}
