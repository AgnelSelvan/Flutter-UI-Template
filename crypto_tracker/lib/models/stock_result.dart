import 'dart:convert';

class StockResult {
  bool isUp;
  double percentage;
  StockResult({
    required this.isUp,
    required this.percentage,
  });

  StockResult copyWith({
    bool? isUp,
    double? percentage,
  }) {
    return StockResult(
      isUp: isUp ?? this.isUp,
      percentage: percentage ?? this.percentage,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'isUp': isUp,
      'percentage': percentage,
    };
  }

  factory StockResult.fromMap(Map<String, dynamic> map) {
    return StockResult(
      isUp: map['isUp'] ?? false,
      percentage: map['percentage']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory StockResult.fromJson(String source) =>
      StockResult.fromMap(json.decode(source));

  @override
  String toString() => 'StockResult(isUp: $isUp, percentage: $percentage)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is StockResult &&
        other.isUp == isUp &&
        other.percentage == percentage;
  }

  @override
  int get hashCode => isUp.hashCode ^ percentage.hashCode;
}
