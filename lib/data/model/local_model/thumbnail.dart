
class Thumbnail {
  String mimetype;
  int size;
  int width;
  int height;
  Null duration;
  String url;

  Thumbnail(
      {this.mimetype,
        this.size,
        this.width,
        this.height,
        this.duration,
        this.url});

  Thumbnail.fromJson(Map<String, dynamic> json) {
    mimetype = json['mimetype'];
    size = json['size'];
    width = json['width'];
    height = json['height'];
    duration = json['duration'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mimetype'] = this.mimetype;
    data['size'] = this.size;
    data['width'] = this.width;
    data['height'] = this.height;
    data['duration'] = this.duration;
    data['url'] = this.url;
    return data;
  }
}