class Evolution {
  Evolution({
    this.num,
    this.name,
  });

  String num;
  String name;

  factory Evolution.fromJson(Map<String, dynamic> json) => Evolution(
        num: json["num"] == null ? null : json["num"],
        name: json["name"] == null ? null : json["name"],
      );

  Map<String, dynamic> toJson() => {
        "num": num == null ? null : num,
        "name": name == null ? null : name,
      };
}
