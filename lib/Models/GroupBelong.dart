class GroupBelong {
  int id;
  String name;
  int group;
  int user;
  String created_on;

  GroupBelong({
    this.id,
    this.name,
    this.group,
    this.user,
    this.created_on,
  });

  GroupBelong.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    group = json['group'];
    user = json['user'];
    created_on = json['created_on'];
  }
}
