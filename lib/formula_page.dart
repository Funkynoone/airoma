import 'package:flutter/material.dart';
import 'create_formula_page.dart';

class FormulaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulas'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => CreateFormulaPage()));
              },
              child: Text('Create Formula'),
            ),
            // Other formula management widgets can go here
          ],
        ),
      ),
    );
  }
}
