class Model {
  late int _id;
  late String _name;
  late List<String> _tags;

  int get id => _id;

  set id(int value) => _id = value;

  String get name => _name;

  set name(String value) => _name = value;

  List<String> get tags => _tags;

  set tags(List<String> value) => _tags = value;
}
