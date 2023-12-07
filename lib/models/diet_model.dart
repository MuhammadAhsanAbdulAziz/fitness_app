class DietModel {
  String name;
  String iconPath;
  String level;
  String duration;
  String calories;
  bool isSelected;

  DietModel({
    required this.name,
    required this.iconPath,
    required this.level,
    required this.duration,
    required this.calories,
    required this.isSelected,
  });

  static List<DietModel> getDiets() {
    List<DietModel> dietList = [];

    dietList.add(DietModel(
    name: 'Honey Pancake', 
    iconPath: 'assets/icons/honey-pancakes.svg', 
    level: 'Easy', 
    duration: '30mins', 
    calories: '130kCal', 
    isSelected: true));

    dietList.add(DietModel(
    name: 'Canai Bread', 
    iconPath: 'assets/icons/canai-bread.svg', 
    level: 'Easy', 
    duration: '20mins', 
    calories: '230kCal', 
    isSelected: false));

    return dietList;
  }
}
