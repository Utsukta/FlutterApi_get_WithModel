class ApiData {
  int page;
  int per_page;
  int total;
  int total_pages;
  List<Datanum> data; // list of type datanum
  var support;

  ApiData({
    required this.page,
    required this.per_page,
    required this.total,
    required this.total_pages,
    required this.data,
    required this.support,
  });

  factory ApiData.fromJson(Map<String, dynamic> json) {
    return ApiData(
      page: json['page'],
      per_page: json['per_page'],
      total: json['total'],
      total_pages: json['total_pages'],
      data: List<Datanum>.from(json["data"].map((x) => Datanum.fromJson(x))),
      support: Support.fromJson(json["support"]),
    );
  }
}

class Datanum {
  int id;
  String email;
  String firstname;
  String lastname;
  String avatar;

  Datanum({
    required this.id,
    required this.email,
    required this.firstname,
    required this.lastname,
    required this.avatar,
  });
  factory Datanum.fromJson(Map<String, dynamic> json) {
    return Datanum(
      id: json["id"],
      email: json["email"],
      firstname: json["first_name"],
      lastname: json["last_name"],
      avatar: json["avatar"],
    );
  }
}

class Support {
  String url;
  String text;

  Support({
    required this.url,
    required this.text,
  });

  factory Support.fromJson(Map<String, dynamic> json) => Support(
        url: json["url"],
        text: json["text"],
      );
}
