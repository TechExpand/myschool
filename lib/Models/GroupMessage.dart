class GroupMessage {
  int id;
  String poster_name;
  String content;
  String file;
  String link;
  int group;
  String created_on;

  GroupMessage({
    this.id,
    this.poster_name,
    this.content,
    this.file,
    this.link,
    this.group,
    this.created_on,
  });

  GroupMessage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    poster_name = json['poster_name'];
    content = json['content'];
    file = json['file'];
    link = json['link'];
    created_on = json['created_on'];
    group = json['group'];
  }
}
