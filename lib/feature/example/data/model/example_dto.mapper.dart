// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'example_dto.dart';

class ExampleDtoMapper extends ClassMapperBase<ExampleDto> {
  ExampleDtoMapper._();

  static ExampleDtoMapper? _instance;
  static ExampleDtoMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ExampleDtoMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ExampleDto';

  static String _$name(ExampleDto v) => v.name;
  static const Field<ExampleDto, String> _f$name = Field('name', _$name);
  static String _$subscriptionPlan(ExampleDto v) => v.subscriptionPlan;
  static const Field<ExampleDto, String> _f$subscriptionPlan =
      Field('subscriptionPlan', _$subscriptionPlan);
  static int _$age(ExampleDto v) => v.age;
  static const Field<ExampleDto, int> _f$age = Field('age', _$age);
  static bool _$isExample(ExampleDto v) => v.isExample;
  static const Field<ExampleDto, bool> _f$isExample =
      Field('isExample', _$isExample);
  static int? _$numberOfOrders(ExampleDto v) => v.numberOfOrders;
  static const Field<ExampleDto, int> _f$numberOfOrders =
      Field('numberOfOrders', _$numberOfOrders);

  @override
  final Map<Symbol, Field<ExampleDto, dynamic>> fields = const {
    #name: _f$name,
    #subscriptionPlan: _f$subscriptionPlan,
    #age: _f$age,
    #isExample: _f$isExample,
    #numberOfOrders: _f$numberOfOrders,
  };

  static ExampleDto _instantiate(DecodingData data) {
    return ExampleDto(data.dec(_f$name), data.dec(_f$subscriptionPlan),
        data.dec(_f$age), data.dec(_f$isExample), data.dec(_f$numberOfOrders));
  }

  @override
  final Function instantiate = _instantiate;

  static ExampleDto fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ExampleDto>(map);
  }

  static ExampleDto fromJson(String json) {
    return ensureInitialized().decodeJson<ExampleDto>(json);
  }
}

mixin ExampleDtoMappable {
  String toJson() {
    return ExampleDtoMapper.ensureInitialized()
        .encodeJson<ExampleDto>(this as ExampleDto);
  }

  Map<String, dynamic> toMap() {
    return ExampleDtoMapper.ensureInitialized()
        .encodeMap<ExampleDto>(this as ExampleDto);
  }

  ExampleDtoCopyWith<ExampleDto, ExampleDto, ExampleDto> get copyWith =>
      _ExampleDtoCopyWithImpl(this as ExampleDto, $identity, $identity);
  @override
  String toString() {
    return ExampleDtoMapper.ensureInitialized()
        .stringifyValue(this as ExampleDto);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            ExampleDtoMapper.ensureInitialized()
                .isValueEqual(this as ExampleDto, other));
  }

  @override
  int get hashCode {
    return ExampleDtoMapper.ensureInitialized().hashValue(this as ExampleDto);
  }
}

extension ExampleDtoValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ExampleDto, $Out> {
  ExampleDtoCopyWith<$R, ExampleDto, $Out> get $asExampleDto =>
      $base.as((v, t, t2) => _ExampleDtoCopyWithImpl(v, t, t2));
}

abstract class ExampleDtoCopyWith<$R, $In extends ExampleDto, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? name,
      String? subscriptionPlan,
      int? age,
      bool? isExample,
      int? numberOfOrders});
  ExampleDtoCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ExampleDtoCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ExampleDto, $Out>
    implements ExampleDtoCopyWith<$R, ExampleDto, $Out> {
  _ExampleDtoCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ExampleDto> $mapper =
      ExampleDtoMapper.ensureInitialized();
  @override
  $R call(
          {String? name,
          String? subscriptionPlan,
          int? age,
          bool? isExample,
          Object? numberOfOrders = $none}) =>
      $apply(FieldCopyWithData({
        if (name != null) #name: name,
        if (subscriptionPlan != null) #subscriptionPlan: subscriptionPlan,
        if (age != null) #age: age,
        if (isExample != null) #isExample: isExample,
        if (numberOfOrders != $none) #numberOfOrders: numberOfOrders
      }));
  @override
  ExampleDto $make(CopyWithData data) => ExampleDto(
      data.get(#name, or: $value.name),
      data.get(#subscriptionPlan, or: $value.subscriptionPlan),
      data.get(#age, or: $value.age),
      data.get(#isExample, or: $value.isExample),
      data.get(#numberOfOrders, or: $value.numberOfOrders));

  @override
  ExampleDtoCopyWith<$R2, ExampleDto, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ExampleDtoCopyWithImpl($value, $cast, t);
}
