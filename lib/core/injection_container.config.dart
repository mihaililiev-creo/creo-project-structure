// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../feature/example/data/example_repository_impl.dart' as _i6;
import '../feature/example/domain/repository/example_repository.dart' as _i5;
import '../feature/example/presentation/cubit/example_cubit.dart' as _i7;
import 'network/dio_module.dart' as _i8;
import 'network/rest_client.dart' as _i4;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final dioModule = _$DioModule();
    final restModule = _$RestModule();
    gh.lazySingleton<_i3.Dio>(() => dioModule.dio);
    gh.lazySingleton<_i4.RestClient>(() => restModule.client(gh<_i3.Dio>()));
    gh.factory<String>(() => dioModule.apiUrl);
    gh.lazySingleton<_i5.ExampleRepository>(
        () => _i6.ExampleRepositoryImpl(gh<_i4.RestClient>()));
    gh.factory<_i7.ExampleCubit>(
        () => _i7.ExampleCubit(gh<_i5.ExampleRepository>()));
    return this;
  }
}

class _$DioModule extends _i8.DioModule {}

class _$RestModule extends _i4.RestModule {}
