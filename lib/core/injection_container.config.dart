// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../feature/example/data/example_repository_impl.dart' as _i6;
import '../feature/example/domain/repository/example_repository.dart' as _i5;
import '../feature/example/presentation/cubit/example_cubit.dart' as _i7;
import 'network/dio_module.dart' as _i8;
import 'routes/app_router.dart' as _i3;

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
    gh.factory<_i3.AppRouter>(() => _i3.AppRouter());
    gh.lazySingleton<_i4.Dio>(() => dioModule.dio);
    gh.lazySingleton<_i5.ExampleRepository>(
        () => _i6.ExampleRepositoryImpl(gh<_i4.Dio>()));
    gh.factory<String>(() => dioModule.apiUrl);
    gh.factory<_i7.ExampleCubit>(
        () => _i7.ExampleCubit(gh<_i5.ExampleRepository>()));
    return this;
  }
}

class _$DioModule extends _i8.DioModule {}
