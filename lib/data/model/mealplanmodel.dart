class MealplanModel {
  int? id;
  String? nameen;
  String? namear;
  String? descar;
  String? descen;
  int? hotel;

  MealplanModel(
      {this.id,
      this.nameen,
      this.namear,
      this.descar,
      this.descen,
      this.hotel});

  MealplanModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameen = json['nameen'];
    namear = json['namear'];
    descar = json['descar'];
    descen = json['descen'];
    hotel = json['hotel'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nameen'] = this.nameen;
    data['namear'] = this.namear;
    data['descar'] = this.descar;
    data['descen'] = this.descen;
    data['hotel'] = this.hotel;
    return data;
  }
}
