class Area {
  String title;
  int provinceId;
  String summary;
  String description;
  String image;

  Area(
      {required this.title,
      required this.provinceId,
      required this.summary,
      required this.description,
      required this.image});

  factory Area.fromJson(Map<String, dynamic> data) => Area(
        title: data["fields"]["title"],
        provinceId: data["fields"]["province"],
        summary: data["fields"]["summary"],
        description: data["fields"]["description"],
        image: data["fields"]["image"],
      );

  Map<String, dynamic> toJson() => {"title": title};
}