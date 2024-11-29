class GroupModel {
  int? id;
  int? hotel;
  List<Countries>? countries;
  String? currency;
  String? name;

  GroupModel({this.id, this.hotel, this.countries, this.currency, this.name});

  GroupModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    hotel = json['hotel'];
    if (json['countries'] != null) {
      countries = <Countries>[];
      json['countries'].forEach((v) {
        countries!.add(new Countries.fromJson(v));
      });
    }
    currency = json['currency'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['hotel'] = this.hotel;
    if (this.countries != null) {
      data['countries'] = this.countries!.map((v) => v.toJson()).toList();
    }
    data['currency'] = this.currency;
    data['name'] = this.name;
    return data;
  }
}

class Countries {
  int? id;
  String? name;
  String? group;

  Countries({this.id, this.name, this.group});

  Countries.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    group = json['group'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['group'] = this.group;
    return data;
  }
}