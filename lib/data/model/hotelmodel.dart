class HotelModel {
  int? id;
  String? namear;
  String? nameen;
  String? category;
  int? hoteStars;
  String? country;
  String? city;
  String? location;
  String? postcode;
  double? lat;
  String? logo;

  double? long;
  String? descar;
  String? descen;
  String? policyen;
  String? policyar;
  String? icons;
  int? user;

  HotelModel(
      {this.id,
      this.namear,
      this.nameen,
      this.category,
      this.hoteStars,
      this.country,
      this.city,
      this.location,
      this.postcode,
      this.lat,
      this.logo,
      this.long,
      this.descar,
      this.descen,
      this.policyen,
      this.policyar,
      this.icons,
      this.user});

  HotelModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    namear = json['namear'];
    logo = json['logo'];
    nameen = json['nameen'];
    category = json['Category'];
    hoteStars = json['HoteStars'];
    country = json['country'];
    city = json['city'];
    location = json['location'];
    postcode = json['postcode'];
    lat = json['lat'];
    long = json['long'];
    descar = json['descar'];
    descen = json['descen'];
    policyen = json['policyen'];
    policyar = json['policyar'];
    icons = json['icons'];
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['namear'] = this.namear;
    data['nameen'] = this.nameen;
    data['Category'] = this.category;
    data['HoteStars'] = this.hoteStars;
    data['country'] = this.country;
    data['city'] = this.city;
    data['logo'] = this.logo;

    data['location'] = this.location;
    data['postcode'] = this.postcode;
    data['lat'] = this.lat;
    data['long'] = this.long;
    data['descar'] = this.descar;
    data['descen'] = this.descen;
    data['policyen'] = this.policyen;
    data['policyar'] = this.policyar;
    data['icons'] = this.icons;
    data['user'] = this.user;
    return data;
  }
}
