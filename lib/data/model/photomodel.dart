class PhotoModel {
  int? id;
  String? phototype;
  String? photo;
  int? hotel;

  PhotoModel({this.id, this.phototype, this.photo, this.hotel});

  PhotoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    phototype = json['phototype'];
    photo = json['photo'];
    hotel = json['hotel'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['phototype'] = this.phototype;
    data['photo'] = this.photo;
    data['hotel'] = this.hotel;
    return data;
  }
}
