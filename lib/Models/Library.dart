class Library {
  int id;
  String category;
  String file_name;
  String files;
  String created_on;

  Library({
    this.id,
    this.category,
    this.file_name,
    this.files,
    this.created_on,
  });

  Library.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    category = json['category'];
    file_name = json['file_name'];
    files = json['files'];
    created_on = json['created_on'];
  }
}
