// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class ReviewEntity extends Equatable {
  final String? reviewId;
  final String? review;
  final Timestamp? createAt;
  final String? uid;

  const ReviewEntity({
    this.review,
    this.createAt,
    this.reviewId,
    this.uid,
  });

  @override
  List<Object?> get props => [
        review,
        createAt,
        reviewId,
        uid,
      ];
}
