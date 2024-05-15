import 'package:flutter/material.dart';
import 'material_list_page.dart';
import 'formula_page.dart';

void main() {
  runApp(AiromaApp());
}

class AiromaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Airoma',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Airoma'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => MaterialListPage()));
              },
              child: Text('Materials'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => FormulaPage()));
              },
              child: Text('Formulas'),
            ),
          ],
        ),
      ),
    );
  }
}
