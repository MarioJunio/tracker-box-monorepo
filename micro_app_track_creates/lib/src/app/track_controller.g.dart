// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'track_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TrackController on _TrackControllerBase, Store {
  Computed<String>? _$getPageTitleComputed;

  @override
  String get getPageTitle =>
      (_$getPageTitleComputed ??= Computed<String>(() => super.getPageTitle,
              name: '_TrackControllerBase.getPageTitle'))
          .value;
  Computed<bool>? _$trackInProgressComputed;

  @override
  bool get trackInProgress =>
      (_$trackInProgressComputed ??= Computed<bool>(() => super.trackInProgress,
              name: '_TrackControllerBase.trackInProgress'))
          .value;

  late final _$launchAtom =
      Atom(name: '_TrackControllerBase.launch', context: context);

  @override
  Launch get launch {
    _$launchAtom.reportRead();
    return super.launch;
  }

  @override
  set launch(Launch value) {
    _$launchAtom.reportWrite(value, super.launch, () {
      super.launch = value;
    });
  }

  late final _$trackAtom =
      Atom(name: '_TrackControllerBase.track', context: context);

  @override
  Track get track {
    _$trackAtom.reportRead();
    return super.track;
  }

  @override
  set track(Track value) {
    _$trackAtom.reportWrite(value, super.track, () {
      super.track = value;
    });
  }

  late final _$activeAtom =
      Atom(name: '_TrackControllerBase.active', context: context);

  @override
  bool get active {
    _$activeAtom.reportRead();
    return super.active;
  }

  @override
  set active(bool value) {
    _$activeAtom.reportWrite(value, super.active, () {
      super.active = value;
    });
  }

  late final _$prepareCountDownAtom =
      Atom(name: '_TrackControllerBase.prepareCountDown', context: context);

  @override
  int get prepareCountDown {
    _$prepareCountDownAtom.reportRead();
    return super.prepareCountDown;
  }

  @override
  set prepareCountDown(int value) {
    _$prepareCountDownAtom.reportWrite(value, super.prepareCountDown, () {
      super.prepareCountDown = value;
    });
  }

  late final _$errorOnTrackingStartAtom =
      Atom(name: '_TrackControllerBase.errorOnTrackingStart', context: context);

  @override
  bool get errorOnTrackingStart {
    _$errorOnTrackingStartAtom.reportRead();
    return super.errorOnTrackingStart;
  }

  @override
  set errorOnTrackingStart(bool value) {
    _$errorOnTrackingStartAtom.reportWrite(value, super.errorOnTrackingStart,
        () {
      super.errorOnTrackingStart = value;
    });
  }

  late final _$publishTrackAsyncAction =
      AsyncAction('_TrackControllerBase.publishTrack', context: context);

  @override
  Future publishTrack() {
    return _$publishTrackAsyncAction.run(() => super.publishTrack());
  }

  late final _$_TrackControllerBaseActionController =
      ActionController(name: '_TrackControllerBase', context: context);

  @override
  dynamic setErrorOnTrackingStart(bool errorOnTrackingStart) {
    final _$actionInfo = _$_TrackControllerBaseActionController.startAction(
        name: '_TrackControllerBase.setErrorOnTrackingStart');
    try {
      return super.setErrorOnTrackingStart(errorOnTrackingStart);
    } finally {
      _$_TrackControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic discartTrack() {
    final _$actionInfo = _$_TrackControllerBaseActionController.startAction(
        name: '_TrackControllerBase.discartTrack');
    try {
      return super.discartTrack();
    } finally {
      _$_TrackControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic toggleTracker() {
    final _$actionInfo = _$_TrackControllerBaseActionController.startAction(
        name: '_TrackControllerBase.toggleTracker');
    try {
      return super.toggleTracker();
    } finally {
      _$_TrackControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setActive(bool active) {
    final _$actionInfo = _$_TrackControllerBaseActionController.startAction(
        name: '_TrackControllerBase.setActive');
    try {
      return super.setActive(active);
    } finally {
      _$_TrackControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic _prepareTracking() {
    final _$actionInfo = _$_TrackControllerBaseActionController.startAction(
        name: '_TrackControllerBase._prepareTracking');
    try {
      return super._prepareTracking();
    } finally {
      _$_TrackControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic _startTracking() {
    final _$actionInfo = _$_TrackControllerBaseActionController.startAction(
        name: '_TrackControllerBase._startTracking');
    try {
      return super._startTracking();
    } finally {
      _$_TrackControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic stopTracking() {
    final _$actionInfo = _$_TrackControllerBaseActionController.startAction(
        name: '_TrackControllerBase.stopTracking');
    try {
      return super.stopTracking();
    } finally {
      _$_TrackControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic _cancelTracking() {
    final _$actionInfo = _$_TrackControllerBaseActionController.startAction(
        name: '_TrackControllerBase._cancelTracking');
    try {
      return super._cancelTracking();
    } finally {
      _$_TrackControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic _listenForPosition(Position position) {
    final _$actionInfo = _$_TrackControllerBaseActionController.startAction(
        name: '_TrackControllerBase._listenForPosition');
    try {
      return super._listenForPosition(position);
    } finally {
      _$_TrackControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic _listenForCalibrate(Position position) {
    final _$actionInfo = _$_TrackControllerBaseActionController.startAction(
        name: '_TrackControllerBase._listenForCalibrate');
    try {
      return super._listenForCalibrate(position);
    } finally {
      _$_TrackControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
launch: ${launch},
track: ${track},
active: ${active},
prepareCountDown: ${prepareCountDown},
errorOnTrackingStart: ${errorOnTrackingStart},
getPageTitle: ${getPageTitle},
trackInProgress: ${trackInProgress}
    ''';
  }
}
