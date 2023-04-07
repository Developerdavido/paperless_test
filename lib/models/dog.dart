class DogModel {
  String? id;
  String? url;
  int? width;
  int? height;

  DogModel({this.id, this.url, this.width, this.height});

  DogModel.fromJson(Map<String, dynamic> json) {
    id = json["id"] ?? "";
    url = json["url"] ?? "";
    width = json["width"] ?? 0;
    height = json["height"] ?? 0 ;
  }


}