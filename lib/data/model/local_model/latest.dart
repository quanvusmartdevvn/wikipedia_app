
class Latest {
  int id;
  String timestamp;

  Latest({this.id, this.timestamp});

  Latest.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['timestamp'] = this.timestamp;
    return data;
  }
}
