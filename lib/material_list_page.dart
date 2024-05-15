import 'package:flutter/material.dart';

class MaterialListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Materials'),
      ),
      body: Center(
        child: Text('Material List and CRUD operations go here'),
      ),
    );
  }
}
