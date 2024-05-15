import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'models.dart' as custom;

class CreateFormulaPage extends StatefulWidget {
  @override
  _CreateFormulaPageState createState() => _CreateFormulaPageState();
}

class _CreateFormulaPageState extends State<CreateFormulaPage> {
  final TextEditingController _nameController = TextEditingController();
  final List<custom.MaterialEntry> _materialEntries = [];
  double totalGrams = 0.0;

  void _addMaterial(custom.Material material, double grams) {
    setState(() {
      _materialEntries.add(custom.MaterialEntry(material: material, grams: grams));
      totalGrams += grams;
    });
  }

  void _saveFormula() {
    if (_nameController.text.isEmpty || _materialEntries.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter a name and add at least one material.')),
      );
      return;
    }

    // Save the formula (this is just a placeholder for actual saving logic)
    custom.Formula newFormula = custom.Formula(name: _nameController.text, materials: _materialEntries);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Formula saved!')),
    );

    // Clear the inputs
    setState(() {
      _nameController.clear();
      _materialEntries.clear();
      totalGrams = 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Formula'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Formula Name'),
            ),
            TypeAheadField<custom.Material>(
              suggestionsCallback: (pattern) async {
                return custom.sampleMaterials.where((material) => material.name.toLowerCase().contains(pattern.toLowerCase())).toList();
              },
              itemBuilder: (context, custom.Material material) {
                return ListTile(
                  title: Text(material.name),
                );
              },
              onSelected: (custom.Material material) {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    final TextEditingController _gramsController = TextEditingController();
                    return AlertDialog(
                      title: Text('Enter Grams'),
                      content: TextField(
                        controller: _gramsController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(hintText: 'Grams'),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            final double grams = double.tryParse(_gramsController.text) ?? 0.0;
                            _addMaterial(material, grams);
                            Navigator.of(context).pop();
                          },
                          child: Text('Add'),
                        ),
                      ],
                    );
                  },
                );
              },
              builder: (context, controller, focusNode) {
                return TextField(
                  controller: controller,
                  focusNode: focusNode,
                  decoration: InputDecoration(
                    labelText: 'Material',
                    border: OutlineInputBorder(),
                  ),
                );
              },
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _materialEntries.length,
                itemBuilder: (context, index) {
                  final entry = _materialEntries[index];
                  return ListTile(
                    title: Text(entry.material.name),
                    subtitle: Text('${entry.grams} grams (${(entry.grams / totalGrams * 100).toStringAsFixed(2)}%)'),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: _saveFormula,
              child: Text('Save Formula'),
            ),
          ],
        ),
      ),
    );
  }
}
