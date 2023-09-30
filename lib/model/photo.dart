import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'photo.g.dart';

@JsonSerializable()
class Photo extends Equatable {
  final int id;
  final String tags;

  @JsonKey(name: 'perviewURL')
  final String previewUrl;

  Photo({
    required this.id,
    required this.tags,
    required this.previewUrl,
  });

  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);
  Map<String, dynamic> toJson() => _$PhotoToJson(this);

  @override
  List<Object?> get props => [id];
}
