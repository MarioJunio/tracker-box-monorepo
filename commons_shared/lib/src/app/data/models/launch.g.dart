// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'launch.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Launch on _LaunchBase, Store {
  Computed<bool>? _$hasValueComputed;

  @override
  bool get hasValue => (_$hasValueComputed ??=
          Computed<bool>(() => super.hasValue, name: '_LaunchBase.hasValue'))
      .value;
  Computed<String>? _$launchTypeDescriptionComputed;

  @override
  String get launchTypeDescription => (_$launchTypeDescriptionComputed ??=
          Computed<String>(() => super.launchTypeDescription,
              name: '_LaunchBase.launchTypeDescription'))
      .value;
  Computed<String>? _$valueFormattedComputed;

  @override
  String get valueFormatted =>
      (_$valueFormattedComputed ??= Computed<String>(() => super.valueFormatted,
              name: '_LaunchBase.valueFormatted'))
          .value;
  Computed<int>? _$valueInMetersComputed;

  @override
  int get valueInMeters =>
      (_$valueInMetersComputed ??= Computed<int>(() => super.valueInMeters,
              name: '_LaunchBase.valueInMeters'))
          .value;
  Computed<int>? _$valueInMillisecondsComputed;

  @override
  int get valueInMilliseconds => (_$valueInMillisecondsComputed ??=
          Computed<int>(() => super.valueInMilliseconds,
              name: '_LaunchBase.valueInMilliseconds'))
      .value;

  late final _$typeAtom = Atom(name: '_LaunchBase.type', context: context);

  @override
  LaunchType get type {
    _$typeAtom.reportRead();
    return super.type;
  }

  @override
  set type(LaunchType value) {
    _$typeAtom.reportWrite(value, super.type, () {
      super.type = value;
    });
  }

  late final _$unitTypeAtom =
      Atom(name: '_LaunchBase.unitType', context: context);

  @override
  LaunchUnitType get unitType {
    _$unitTypeAtom.reportRead();
    return super.unitType;
  }

  @override
  set unitType(LaunchUnitType value) {
    _$unitTypeAtom.reportWrite(value, super.unitType, () {
      super.unitType = value;
    });
  }

  late final _$valueAtom = Atom(name: '_LaunchBase.value', context: context);

  @override
  int get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(int value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  late final _$_LaunchBaseActionController =
      ActionController(name: '_LaunchBase', context: context);

  @override
  dynamic selectLaunchType(LaunchType type) {
    final _$actionInfo = _$_LaunchBaseActionController.startAction(
        name: '_LaunchBase.selectLaunchType');
    try {
      return super.selectLaunchType(type);
    } finally {
      _$_LaunchBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setLaunchUnitType(LaunchUnitType unitType) {
    final _$actionInfo = _$_LaunchBaseActionController.startAction(
        name: '_LaunchBase.setLaunchUnitType');
    try {
      return super.setLaunchUnitType(unitType);
    } finally {
      _$_LaunchBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setValue(int value) {
    final _$actionInfo =
        _$_LaunchBaseActionController.startAction(name: '_LaunchBase.setValue');
    try {
      return super.setValue(value);
    } finally {
      _$_LaunchBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
type: ${type},
unitType: ${unitType},
value: ${value},
hasValue: ${hasValue},
launchTypeDescription: ${launchTypeDescription},
valueFormatted: ${valueFormatted},
valueInMeters: ${valueInMeters},
valueInMilliseconds: ${valueInMilliseconds}
    ''';
  }
}
