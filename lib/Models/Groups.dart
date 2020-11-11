class Group {
  int id;
  String name;
  String description;
  String pro_pic;
  bool admin;

  Group({
    this.id,
    this.name,
    this.description,
    this.pro_pic,
    this.admin,
  });

  Group.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    pro_pic = json['pro_pic'];
    admin = json['admin'];
  }
}
