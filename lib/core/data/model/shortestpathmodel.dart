class ShortestPathModel {
  String? sourceName;
  String? targetName;

  ShortestPathModel({this.sourceName, this.targetName});

  ShortestPathModel.fromJson(Map<String, dynamic> json) {
    sourceName = json['source_name'];
    targetName = json['target_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['source_name'] = this.sourceName;
    data['target_name'] = this.targetName;
    return data;
  }
}
