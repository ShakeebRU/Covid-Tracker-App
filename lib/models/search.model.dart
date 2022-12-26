class SearchModel {
  SearchModel({
    required this.name,
    required this.flag,
    required this.cases,
  });
  late final String name;
  late final String flag;
  late final int cases;

  SearchModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    flag = json['flag'];
    cases = json['cases'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['flag'] = flag;
    _data['cases'] = cases;
    return _data;
  }
}
