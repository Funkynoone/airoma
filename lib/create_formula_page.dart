import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'models.dart' as custom;

class CreateFormulaPage extends StatefulWidget {
  @override
  _CreateFormulaPageState createState() => _CreateFormulaPageState();
}

class _CreateFormulaPageState extends State<CreateFormulaPage> {
  final TextEditingController _nameController = TextEditingController();
  final List<MaterialSlot> _materialSlots = List.generate(10, (_) => MaterialSlot());

  void _addMaterialSlot() {
    setState(() {
      _materialSlots.add(MaterialSlot());
    });
  }

  void _saveFormula() {
    if (_nameController.text.isEmpty || _materialSlots.every((slot) => slot.material == null)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter a name and add at least one material.')),
      );
      return;
    }

    final materialEntries = _materialSlots
        .where((slot) => slot.material != null)
        .map((slot) => custom.MaterialEntry(
        material: slot.material!,
        grams: slot.gramsController.text.isEmpty ? 0 : double.parse(slot.gramsController.text)
    ))
        .toList();

    // Save the formula (this is just a placeholder for actual saving logic)
    custom.Formula newFormula = custom.Formula(name: _nameController.text, materials: materialEntries);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Formula saved!')),
    );

    // Clear the inputs
    setState(() {
      _nameController.clear();
      _materialSlots.clear();
      _materialSlots.addAll(List.generate(10, (_) => MaterialSlot()));
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
            Expanded(
              child: ListView.builder(
                itemCount: _materialSlots.length,
                itemBuilder: (context, index) {
                  final slot = _materialSlots[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TypeAheadField<custom.Material>(
                            suggestionsCallback: (pattern) async {
                              return custom.sampleMaterials.where((material) => material.name.toLowerCase().contains(pattern.toLowerCase())).toList();
                            },
                            itemBuilder: (context, custom.Material material) {
                              return ListTile(
                                title: Text(material.name),
                              );
                            },
                            onSelected: (custom.Material material) {
                              setState(() {
                                slot.material = material;
                                slot.materialController.text = material.name;
                              });
                            },
                            // Directly using builder without any deprecated fields
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
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: TextField(
                            controller: slot.gramsController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(labelText: 'Grams'),
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                setState(() {
                                  double grams = double.parse(value);
                                  slot.percentController.text = (grams / _totalGrams() * 100).toStringAsFixed(2);
                                });
                              }
                            },
                          ),
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: TextField(
                            controller: slot.percentController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(labelText: '%'),
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                setState(() {
                                  double percent = double.parse(value);
                                  slot.gramsController.text = (_totalGrams() * percent / 100).toStringAsFixed(2);
                                });
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: _addMaterialSlot,
              child: Icon(Icons.add),
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

  double _totalGrams() {
    return _materialSlots.fold(0, (sum, slot) {
      if (slot.gramsController.text.isNotEmpty) {
        return sum + double.parse(slot.gramsController.text);
      }
      return sum;
    });
  }
}

class MaterialSlot {
  custom.Material? material;
  final TextEditingController materialController = TextEditingController();
  final TextEditingController gramsController = TextEditingController();
  final TextEditingController percentController = TextEditingController();
}
