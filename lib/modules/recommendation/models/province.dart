class Province {
  int id;
  String model;
  String title;
  String header;
  String summary;
  String image;

  Province(
      {required this.id,
      required this.model,
      required this.title,
      required this.header,
      required this.summary,
      required this.image});

  factory Province.fromJson(Map<String, dynamic> data) => Province(
        id: data["pk"],
        model: data["model"],
        title: data["fields"]["title"],
        header: data["fields"]["header"],
        summary: data["fields"]["summary"],
        image: data["fields"]["image"],
      );

  Map<String, dynamic> toJson() => {"title": title};
}
