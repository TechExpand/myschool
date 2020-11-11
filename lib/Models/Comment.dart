class GroupComment {
  int id;
  String poster_name;
  String content;
  int message;
  String created_on;

  GroupComment({
    this.id,
    this.poster_name,
    this.content,
    this.message,
    this.created_on,
  });

  GroupComment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    poster_name = json['poster_name'];
    content = json['content'];
    created_on = json['created_on'];
    message = json['message'];
  }
}
