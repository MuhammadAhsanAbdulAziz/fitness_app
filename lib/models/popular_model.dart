class PopularModel{
  String name;
  String iconPath;
  String level;
  String duration;
  String calories;

  PopularModel({
    required this.name,
    required this.iconPath,
    required this.level,
    required this.duration,
    required this.calories

  });

  static List<PopularModel> getPopularModel(){
    List<PopularModel> popularList = [];

    popularList.add(PopularModel(
    name: 'BlueBerry Pancake', 
    iconPath: 'assets/icons/blueberry-pancake.svg', 
    level: 'Medium', 
    duration: '30mins', 
    calories: '230kCal'));

    popularList.add(PopularModel(
    name: 'Salmon Nagiri', 
    iconPath: 'assets/icons/salmon-nigiri.svg', 
    level: 'Medium', 
    duration: '20mins', 
    calories: '130kCal'));

    return popularList;
  }
}