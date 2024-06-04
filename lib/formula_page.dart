import 'package:flutter/material.dart';

class FormulaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulas'),
      ),
      body: Center(
        child: Text('List of saved formulas will be displayed here.'),
      ),
    );
  }
}
