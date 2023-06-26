class EnterpriseItem {
  String? photo;
  String? name;
  String? city;

  EnterpriseItem({this.photo, this.name, this.city});

  EnterpriseItem.fromJson(Map<String, dynamic> json) {
    photo = json['foto'];
    name = json['nome'];
    city = json['cidade'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['foto'] = photo;
    data['nome'] = name;
    data['cidade'] = city;
    return data;
  }
}