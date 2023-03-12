// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'track.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Track on _TrackBase, Store {
  Computed<String>? _$speedFormattedComputed;

  @override
  String get speedFormatted =>
      (_$speedFormattedComputed ??= Computed<String>(() => super.speedFormatted,
              name: '_TrackBase.speedFormatted'))
          .value;
  Computed<String>? _$timerFormattedComputed;

  @override
  String get timerFormatted =>
      (_$timerFormattedComputed ??= Computed<String>(() => super.timerFormatted,
              name: '_TrackBase.timerFormatted'))
          .value;
  Computed<String>? _$timerFormattedWithoutUnitComputed;

  @override
  String get timerFormattedWithoutUnit =>
      (_$timerFormattedWithoutUnitComputed ??= Computed<String>(
              () => super.timerFormattedWithoutUnit,
              name: '_TrackBase.timerFormattedWithoutUnit'))
          .value;
  Computed<String>? _$timerUnitComputed;

  @override
  String get timerUnit => (_$timerUnitComputed ??=
          Computed<String>(() => super.timerUnit, name: '_TrackBase.timerUnit'))
      .value;
  Computed<String>? _$distanceFormattedComputed;

  @override
  String get distanceFormatted => (_$distanceFormattedComputed ??=
          Computed<String>(() => super.distanceFormatted,
              name: '_TrackBase.distanceFormatted'))
      .value;
  Computed<String>? _$distanceFormattedWithoutUnitComputed;

  @override
  String get distanceFormattedWithoutUnit =>
      (_$distanceFormattedWithoutUnitComputed ??= Computed<String>(
              () => super.distanceFormattedWithoutUnit,
              name: '_TrackBase.distanceFormattedWithoutUnit'))
          .value;
  Computed<String>? _$distanceUnitComputed;

  @override
  String get distanceUnit =>
      (_$distanceUnitComputed ??= Computed<String>(() => super.distanceUnit,
              name: '_TrackBase.distanceUnit'))
          .value;
  Computed<bool>? _$calibratedComputed;

  @override
  bool get calibrated => (_$calibratedComputed ??=
          Computed<bool>(() => super.calibrated, name: '_TrackBase.calibrated'))
      .value;
  Computed<bool>? _$isStandbyComputed;

  @override
  bool get isStandby => (_$isStandbyComputed ??=
          Computed<bool>(() => super.isStandby, name: '_TrackBase.isStandby'))
      .value;
  Computed<bool>? _$isPrepareComputed;

  @override
  bool get isPrepare => (_$isPrepareComputed ??=
          Computed<bool>(() => super.isPrepare, name: '_TrackBase.isPrepare'))
      .value;
  Computed<bool>? _$isActiveComputed;

  @override
  bool get isActive => (_$isActiveComputed ??=
          Computed<bool>(() => super.isActive, name: '_TrackBase.isActive'))
      .value;
  Computed<bool>? _$isCompleteComputed;

  @override
  bool get isComplete => (_$isCompleteComputed ??=
          Computed<bool>(() => super.isComplete, name: '_TrackBase.isComplete'))
      .value;

  late final _$startSpeedAtom =
      Atom(name: '_TrackBase.startSpeed', context: context);

  @override
  int get startSpeed {
    _$startSpeedAtom.reportRead();
    return super.startSpeed;
  }

  @override
  set startSpeed(int value) {
    _$startSpeedAtom.reportWrite(value, super.startSpeed, () {
      super.startSpeed = value;
    });
  }

  late final _$distanceAtom =
      Atom(name: '_TrackBase.distance', context: context);

  @override
  double get distance {
    _$distanceAtom.reportRead();
    return super.distance;
  }

  @override
  set distance(double value) {
    _$distanceAtom.reportWrite(value, super.distance, () {
      super.distance = value;
    });
  }

  late final _$accuracyAtom =
      Atom(name: '_TrackBase.accuracy', context: context);

  @override
  double get accuracy {
    _$accuracyAtom.reportRead();
    return super.accuracy;
  }

  @override
  set accuracy(double value) {
    _$accuracyAtom.reportWrite(value, super.accuracy, () {
      super.accuracy = value;
    });
  }

  late final _$timerAtom = Atom(name: '_TrackBase.timer', context: context);

  @override
  int get timer {
    _$timerAtom.reportRead();
    return super.timer;
  }

  @override
  set timer(int value) {
    _$timerAtom.reportWrite(value, super.timer, () {
      super.timer = value;
    });
  }

  late final _$speedAtom = Atom(name: '_TrackBase.speed', context: context);

  @override
  int get speed {
    _$speedAtom.reportRead();
    return super.speed;
  }

  @override
  set speed(int value) {
    _$speedAtom.reportWrite(value, super.speed, () {
      super.speed = value;
    });
  }

  late final _$distanceIntegralAtom =
      Atom(name: '_TrackBase.distanceIntegral', context: context);

  @override
  double get distanceIntegral {
    _$distanceIntegralAtom.reportRead();
    return super.distanceIntegral;
  }

  @override
  set distanceIntegral(double value) {
    _$distanceIntegralAtom.reportWrite(value, super.distanceIntegral, () {
      super.distanceIntegral = value;
    });
  }

  late final _$statusAtom = Atom(name: '_TrackBase.status', context: context);

  @override
  TrackStatus get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(TrackStatus value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  late final _$calculateDistanceAsyncAction =
      AsyncAction('_TrackBase.calculateDistance', context: context);

  @override
  Future calculateDistance() {
    return _$calculateDistanceAsyncAction.run(() => super.calculateDistance());
  }

  late final _$_TrackBaseActionController =
      ActionController(name: '_TrackBase', context: context);

  @override
  dynamic reset() {
    final _$actionInfo =
        _$_TrackBaseActionController.startAction(name: '_TrackBase.reset');
    try {
      return super.reset();
    } finally {
      _$_TrackBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setSpeed(int speed) {
    final _$actionInfo =
        _$_TrackBaseActionController.startAction(name: '_TrackBase.setSpeed');
    try {
      return super.setSpeed(speed);
    } finally {
      _$_TrackBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setDistance(double distance) {
    final _$actionInfo = _$_TrackBaseActionController.startAction(
        name: '_TrackBase.setDistance');
    try {
      return super.setDistance(distance);
    } finally {
      _$_TrackBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setTimer(int timer) {
    final _$actionInfo =
        _$_TrackBaseActionController.startAction(name: '_TrackBase.setTimer');
    try {
      return super.setTimer(timer);
    } finally {
      _$_TrackBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setTrackStatus(TrackStatus status) {
    final _$actionInfo = _$_TrackBaseActionController.startAction(
        name: '_TrackBase.setTrackStatus');
    try {
      return super.setTrackStatus(status);
    } finally {
      _$_TrackBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic refreshSpeedDefinitions() {
    final _$actionInfo = _$_TrackBaseActionController.startAction(
        name: '_TrackBase.refreshSpeedDefinitions');
    try {
      return super.refreshSpeedDefinitions();
    } finally {
      _$_TrackBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic incrementTimer(int value) {
    final _$actionInfo = _$_TrackBaseActionController.startAction(
        name: '_TrackBase.incrementTimer');
    try {
      return super.incrementTimer(value);
    } finally {
      _$_TrackBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
startSpeed: ${startSpeed},
distance: ${distance},
accuracy: ${accuracy},
timer: ${timer},
speed: ${speed},
distanceIntegral: ${distanceIntegral},
status: ${status},
speedFormatted: ${speedFormatted},
timerFormatted: ${timerFormatted},
timerFormattedWithoutUnit: ${timerFormattedWithoutUnit},
timerUnit: ${timerUnit},
distanceFormatted: ${distanceFormatted},
distanceFormattedWithoutUnit: ${distanceFormattedWithoutUnit},
distanceUnit: ${distanceUnit},
calibrated: ${calibrated},
isStandby: ${isStandby},
isPrepare: ${isPrepare},
isActive: ${isActive},
isComplete: ${isComplete}
    ''';
  }
}
