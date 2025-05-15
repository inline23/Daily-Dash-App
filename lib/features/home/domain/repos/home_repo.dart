import 'package:daily_dash_app/core/errors/failure.dart';
import 'package:daily_dash_app/features/home/domain/entities/project_entity.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<ProjectEntity>>> fetchCompletedProjects();
  Future<Either<Failure, List<ProjectEntity>>> fetchOngoingProjects();
}
