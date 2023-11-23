import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class OrderShow {
    // ignore: non_constant_identifier_names
    int top_passenger_count;
  int current_passenger_count;
  int destination_vertices_id;
bool is_hurry;
String genders;
  OrderShow({
    required this.top_passenger_count,
    required this.current_passenger_count,
    required this.destination_vertices_id,
    required this.is_hurry,
    required this.genders,
  });

  OrderShow copyWith({
    int? top_passenger_count,
    int? current_passenger_count,
    int? destination_vertices_id,
    bool? is_hurry,
    String? genders,
  }) {
    return OrderShow(
      top_passenger_count: top_passenger_count ?? this.top_passenger_count,
      current_passenger_count: current_passenger_count ?? this.current_passenger_count,
      destination_vertices_id: destination_vertices_id ?? this.destination_vertices_id,
      is_hurry: is_hurry ?? this.is_hurry,
      genders: genders ?? this.genders,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'top_passenger_count': top_passenger_count,
      'current_passenger_count': current_passenger_count,
      'destination_vertices_id': destination_vertices_id,
      'is_hurry': is_hurry,
      'genders': genders,
    };
  }

  factory OrderShow.fromMap(Map<String, dynamic> map) {
    return OrderShow(
      top_passenger_count: map['top_passenger_count'] as int,
      current_passenger_count: map['current_passenger_count'] as int,
      destination_vertices_id: map['destination_vertices_id'] as int,
      is_hurry: map['is_hurry'] as bool,
      genders: map['genders'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderShow.fromJson(String source) => OrderShow.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'OrderShow(top_passenger_count: $top_passenger_count, current_passenger_count: $current_passenger_count, destination_vertices_id: $destination_vertices_id, is_hurry: $is_hurry, genders: $genders)';
  }

  @override
  bool operator ==(covariant OrderShow other) {
    if (identical(this, other)) return true;
  
    return 
      other.top_passenger_count == top_passenger_count &&
      other.current_passenger_count == current_passenger_count &&
      other.destination_vertices_id == destination_vertices_id &&
      other.is_hurry == is_hurry &&
      other.genders == genders;
  }

  @override
  int get hashCode {
    return top_passenger_count.hashCode ^
      current_passenger_count.hashCode ^
      destination_vertices_id.hashCode ^
      is_hurry.hashCode ^
      genders.hashCode;
  }
}
