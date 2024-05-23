class Material {
  final String name;
  final String category;
  final String tenacity;
  final String noteType;
  final String scentType;

  Material({
    required this.name,
    required this.category,
    required this.tenacity,
    required this.noteType,
    required this.scentType,
  });
}

List<Material> sampleMaterials = [
  Material(
    name: '2,6-Nonadien-1-Al',
    category: 'Synthetic',
    tenacity: 'Medium',
    noteType: 'Heart/Base',
    scentType: 'Greasy green, cucumber, violet',
  ),
  Material(
    name: '2-Ethylhexyl Acetate',
    category: 'Synthetic',
    tenacity: 'Medium',
    noteType: 'Heart',
    scentType: 'Mild ester, floral',
  ),
  Material(
    name: '6-Methyl Quinoline',
    category: 'Synthetic',
    tenacity: 'Very Long',
    noteType: 'Base',
    scentType: 'Animalic, leathery, tobacco',
  ),
  Material(
    name: 'Alpha Damascone',
    category: 'Synthetic',
    tenacity: 'Long',
    noteType: 'Heart',
    scentType: 'Fruity, rose',
  ),
  Material(
    name: 'Alfa Isomethyl Ionone',
    category: 'Synthetic',
    tenacity: 'Long',
    noteType: 'Heart',
    scentType: 'Woody, floral, orris',
  ),
  Material(
    name: 'Allyl Amyl Glycolate',
    category: 'Synthetic',
    tenacity: 'Medium',
    noteType: 'Top',
    scentType: 'Fruity, pineapple',
  ),
  Material(
    name: 'Allyl Heptoate',
    category: 'Synthetic',
    tenacity: 'Short',
    noteType: 'Top',
    scentType: 'Fruity, pear',
  ),
  Material(
    name: 'Ambercore',
    category: 'Synthetic',
    tenacity: 'Very Long',
    noteType: 'Base',
    scentType: 'Amber, woody',
  ),
  Material(
    name: 'Ambrettolide',
    category: 'Synthetic',
    tenacity: 'Very Long',
    noteType: 'Base',
    scentType: 'Musky, floral, fruity',
  ),
  Material(
    name: 'Ambrette Seeds Absolute',
    category: 'Absolute',
    tenacity: 'Very Long',
    noteType: 'Base',
    scentType: 'Musky, sweet, powdery, floral',
  ),
  Material(
    name: 'Ambrocenide',
    category: 'Synthetic',
    tenacity: 'Very Long',
    noteType: 'Base',
    scentType: 'Amber, woody, powerful',
  ),
  Material(
    name: 'Ambrofix',
    category: 'Synthetic',
    tenacity: 'Very Long',
    noteType: 'Base',
    scentType: 'Amber, woody, dry',
  ),
  Material(
    name: 'Ambrox Super',
    category: 'Synthetic',
    tenacity: 'Very Long',
    noteType: 'Base',
    scentType: 'Ambergris, woody, musky',
  ),
  Material(
    name: 'Ambrinol',
    category: 'Synthetic',
    tenacity: 'Very Long',
    noteType: 'Base',
    scentType: 'Musky, animalic, earthy',
  ),
  Material(
    name: 'Amyris EO',
    category: 'Essential Oil',
    tenacity: 'Long',
    noteType: 'Base',
    scentType: 'Woody, sweet, balsamic',
  ),
  Material(
    name: 'Anethole Natural',
    category: 'Synthetic',
    tenacity: 'Medium',
    noteType: 'Heart',
    scentType: 'Sweet, anise, licorice',
  ),
  Material(
    name: 'Anisyl Acetate',
    category: 'Synthetic',
    tenacity: 'Medium',
    noteType: 'Heart',
    scentType: 'Sweet, fruity, floral',
  ),
  Material(
    name: 'Appelide',
    category: 'Synthetic',
    tenacity: 'Medium',
    noteType: 'Top',
    scentType: 'Fruity, apple',
  ),
  Material(
    name: 'Armoise EO',
    category: 'Essential Oil',
    tenacity: 'Long',
    noteType: 'Heart',
    scentType: 'Herbal, green, camphoraceous',
  ),
  // Add more materials here as we gather information
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

  MaterialEntry({
    required this.material,
    required this.grams,
  });
}
