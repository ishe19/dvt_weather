class Rain {
  final double the3H;

  Rain({
    required this.the3H,
  });

  factory Rain.fromJson(Map<String, dynamic> json) => Rain(
    the3H: json["3h"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "3h": the3H,
  };
}