import 'package:projeto_movies_clean_arciteture/src/core/error/failures.dart';

import 'package:dartz/dartz.dart';

import '../../../../core/usecases/usecase.dart';
import '../entities/movies_details_entity.dart';
import '../repositories/movies_repository.dart';

class GetRatingUsecase implements Usecase<MoviesDetailsEntity, NoParams> {
  final IMoviesRepository moviesRepository;

  const GetRatingUsecase({required this.moviesRepository});

  @override
  Future<Either<Failure, MoviesDetailsEntity>> call() async {
    return await moviesRepository.getRating();
  }
}
