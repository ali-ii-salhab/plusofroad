class GroupModel {
  bool? status;
  int? id;
  int? hotel;
  List<CountriesGroupModels>? countries;
  String? currency;
  String? name;

  GroupModel(
      {this.status,
      this.id,
      this.hotel,
      this.countries,
      this.currency,
      this.name});

  GroupModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    id = json['id'];
    hotel = json['hotel'];
    if (json['countries'] != null) {
      countries = <CountriesGroupModels>[];
      json['countries'].forEach((v) {
        countries!.add(new CountriesGroupModels.fromJson(v));
      });
    }
    currency = json['currency'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
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

class CountriesGroupModels {
  int? id;
  String? name;
  String? group;

  CountriesGroupModels({this.id, this.name, this.group});

  CountriesGroupModels.fromJson(Map<String, dynamic> json) {
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
