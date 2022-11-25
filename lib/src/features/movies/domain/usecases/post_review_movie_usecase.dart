import 'package:projeto_movies_clean_arciteture/src/core/error/failures.dart';

import 'package:dartz/dartz.dart';

import '../../../../core/usecases/usecase.dart';
import '../entities/movies_entity.dart';
import '../repositories/movies_repository.dart';

class PostRatingMovieUseCase implements Usecase<List<ReviewMovieEntity>, int, int> {
  final IMoviesRepository moviesRepository;

  const PostRatingMovieUseCase({required this.moviesRepository}, {required this.moviesRepository});

  @override
  Future<Either<Failure, List<ReviewMovieEntity>>> call(int movieId, int rate) async {
    return await moviesRepository.postRatingMovie(movieId, rate);
  }
}