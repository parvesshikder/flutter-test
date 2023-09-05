import 'package:dartz/dartz.dart';
import 'package:weather_app/core/error/failute.dart';
import 'package:weather_app/features/domain/entities/weather_entities.dart';

abstract class WeatherRepository {
  Future<Either<Failure, WeatherEntity>> getWeatherData(
      {required String cityName});
}
