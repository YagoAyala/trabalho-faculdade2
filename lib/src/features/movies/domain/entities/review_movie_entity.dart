// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class ReviewMovieEntity extends Equatable {
  final int id;
  final int rate;

  const ReviewMovieEntity({
    required this.id,
    required this.rate
  });

  @override
  List<Object?> get props => [
        id,
        rate,
      ];
}
