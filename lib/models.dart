class Material {
  final String name;
  final String category;
  final String tenacity;
  final String noteType; // base, middle, top
  final String scentType; // floral, green, etc.
  final double dilution;

  Material({
    required this.name,
    required this.category,
    required this.tenacity,
    required this.noteType,
    required this.scentType,
    required this.dilution,
  });
}

// Sample materials
List<Material> sampleMaterials = [
  Material(name: 'Lavender', category: 'Essential Oil', tenacity: 'Medium', noteType: 'Top', scentType: 'Floral', dilution: 1.0),
  Material(name: 'Rose', category: 'Essential Oil', tenacity: 'Long', noteType: 'Middle', scentType: 'Floral', dilution: 0.5),
  Material(name: 'Sandalwood', category: 'Essential Oil', tenacity: 'Very Long', noteType: 'Base', scentType: 'Woody', dilution: 0.2),
];

class Formula {
  final String name;
  final List<MaterialEntry> materials;

  Formula({
    required this.name,
    required this.materials,
  });
}

class MaterialEntry {
  final Material material;
  final double grams;
  final double dilutionGrams;

  MaterialEntry({
    required this.material,
    required this.grams,
  }) : dilutionGrams = grams * material.dilution;
}
