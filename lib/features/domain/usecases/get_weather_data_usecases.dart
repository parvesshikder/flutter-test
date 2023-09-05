import 'package:dartz/dartz.dart';
import 'package:weather_app/core/error/failute.dart';
import 'package:weather_app/features/domain/entities/weather_entities.dart';
import 'package:weather_app/features/domain/repository/weather_repository.dart';

class GetWeatherDataUseCase {
  final WeatherRepository weatherRepository;

  GetWeatherDataUseCase({required this.weatherRepository});

  Future<Either<Failure, WeatherEntity>> execute(String cityName) {
    return weatherRepository.getWeatherData(cityName: cityName);
  }
}
