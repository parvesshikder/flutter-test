

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_app/features/domain/entities/weather_entities.dart';
import 'package:weather_app/features/domain/usecases/get_weather_data_usecases.dart';

import '../../../helper/test_helper.mocks.dart';


void main() {
  
  late GetWeatherDataUseCase getCurrentWeatherUseCase;
  late MockWeatherRepository mockWeatherRepository;

  setUp((){
    mockWeatherRepository = MockWeatherRepository();
    getCurrentWeatherUseCase = GetWeatherDataUseCase(weatherRepository: mockWeatherRepository);
  });

  const testWeatherDetail = WeatherEntity(
    cityName: 'New York',
    main: 'Clouds',
    description: 'few clouds',
    iconCode: '02d',
    temperature: 302.28,
    pressure: 1009,
    humidity: 70,
  );
  
  const testCityName = 'New York';

  test(
    'should get current weather detail from the repository',
    () async {
      // arrange
       when(
        mockWeatherRepository.getWeatherData(cityName: testCityName)
       ).thenAnswer((_) async => const Right(testWeatherDetail) );
       
      // act
      final result = await getCurrentWeatherUseCase.execute(testCityName);

      // assert
      expect(result, const Right(testWeatherDetail));

    }
  );
}