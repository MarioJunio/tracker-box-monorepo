// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MapController on _MapStoreBase, Store {
  late final _$currentPositionAtom =
      Atom(name: '_MapStoreBase.currentPosition', context: context);

  @override
  Position? get currentPosition {
    _$currentPositionAtom.reportRead();
    return super.currentPosition;
  }

  @override
  set currentPosition(Position? value) {
    _$currentPositionAtom.reportWrite(value, super.currentPosition, () {
      super.currentPosition = value;
    });
  }

  late final _$trackAtom = Atom(name: '_MapStoreBase.track', context: context);

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

  late final _$centralizeAtom =
      Atom(name: '_MapStoreBase.centralize', context: context);

  @override
  bool get centralize {
    _$centralizeAtom.reportRead();
    return super.centralize;
  }

  @override
  set centralize(bool value) {
    _$centralizeAtom.reportWrite(value, super.centralize, () {
      super.centralize = value;
    });
  }

  late final _$pinPillPositionAtom =
      Atom(name: '_MapStoreBase.pinPillPosition', context: context);

  @override
  double? get pinPillPosition {
    _$pinPillPositionAtom.reportRead();
    return super.pinPillPosition;
  }

  @override
  set pinPillPosition(double? value) {
    _$pinPillPositionAtom.reportWrite(value, super.pinPillPosition, () {
      super.pinPillPosition = value;
    });
  }

  late final _$selectedTrackAtom =
      Atom(name: '_MapStoreBase.selectedTrack', context: context);

  @override
  TrackEntity? get selectedTrack {
    _$selectedTrackAtom.reportRead();
    return super.selectedTrack;
  }

  @override
  set selectedTrack(TrackEntity? value) {
    _$selectedTrackAtom.reportWrite(value, super.selectedTrack, () {
      super.selectedTrack = value;
    });
  }

  late final _$selectedIconAtom =
      Atom(name: '_MapStoreBase.selectedIcon', context: context);

  @override
  Uint8List? get selectedIcon {
    _$selectedIconAtom.reportRead();
    return super.selectedIcon;
  }

  @override
  set selectedIcon(Uint8List? value) {
    _$selectedIconAtom.reportWrite(value, super.selectedIcon, () {
      super.selectedIcon = value;
    });
  }

  late final _$trackEntitiesAtom =
      Atom(name: '_MapStoreBase.trackEntities', context: context);

  @override
  List<TrackEntity> get trackEntities {
    _$trackEntitiesAtom.reportRead();
    return super.trackEntities;
  }

  @override
  set trackEntities(List<TrackEntity> value) {
    _$trackEntitiesAtom.reportWrite(value, super.trackEntities, () {
      super.trackEntities = value;
    });
  }

  late final _$loadNearTracksAsyncAction =
      AsyncAction('_MapStoreBase.loadNearTracks', context: context);

  @override
  Future loadNearTracks(CoordinateEntity coordinate) {
    return _$loadNearTracksAsyncAction
        .run(() => super.loadNearTracks(coordinate));
  }

  late final _$setSelectedTrackAsyncAction =
      AsyncAction('_MapStoreBase.setSelectedTrack', context: context);

  @override
  Future setSelectedTrack(TrackEntity track) {
    return _$setSelectedTrackAsyncAction
        .run(() => super.setSelectedTrack(track));
  }

  late final _$_MapStoreBaseActionController =
      ActionController(name: '_MapStoreBase', context: context);

  @override
  void clearTracks() {
    final _$actionInfo = _$_MapStoreBaseActionController.startAction(
        name: '_MapStoreBase.clearTracks');
    try {
      return super.clearTracks();
    } finally {
      _$_MapStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPinPillPosition(double pinPillPosition) {
    final _$actionInfo = _$_MapStoreBaseActionController.startAction(
        name: '_MapStoreBase.setPinPillPosition');
    try {
      return super.setPinPillPosition(pinPillPosition);
    } finally {
      _$_MapStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCentralize(bool centralize) {
    final _$actionInfo = _$_MapStoreBaseActionController.startAction(
        name: '_MapStoreBase.setCentralize');
    try {
      return super.setCentralize(centralize);
    } finally {
      _$_MapStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void startCapturePositions() {
    final _$actionInfo = _$_MapStoreBaseActionController.startAction(
        name: '_MapStoreBase.startCapturePositions');
    try {
      return super.startCapturePositions();
    } finally {
      _$_MapStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addMarker(
      String id, LatLng position, BitmapDescriptor descriptor, Function onTap) {
    final _$actionInfo = _$_MapStoreBaseActionController.startAction(
        name: '_MapStoreBase.addMarker');
    try {
      return super.addMarker(id, position, descriptor, onTap);
    } finally {
      _$_MapStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addPolyline(String id, Color color, List<CoordinateEntity> coordinates) {
    final _$actionInfo = _$_MapStoreBaseActionController.startAction(
        name: '_MapStoreBase.addPolyline');
    try {
      return super.addPolyline(id, color, coordinates);
    } finally {
      _$_MapStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCurrentMarker(Position position) {
    final _$actionInfo = _$_MapStoreBaseActionController.startAction(
        name: '_MapStoreBase.setCurrentMarker');
    try {
      return super.setCurrentMarker(position);
    } finally {
      _$_MapStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void startTracking() {
    final _$actionInfo = _$_MapStoreBaseActionController.startAction(
        name: '_MapStoreBase.startTracking');
    try {
      return super.startTracking();
    } finally {
      _$_MapStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void stopTracking() {
    final _$actionInfo = _$_MapStoreBaseActionController.startAction(
        name: '_MapStoreBase.stopTracking');
    try {
      return super.stopTracking();
    } finally {
      _$_MapStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void publishTrack() {
    final _$actionInfo = _$_MapStoreBaseActionController.startAction(
        name: '_MapStoreBase.publishTrack');
    try {
      return super.publishTrack();
    } finally {
      _$_MapStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void discardTrack() {
    final _$actionInfo = _$_MapStoreBaseActionController.startAction(
        name: '_MapStoreBase.discardTrack');
    try {
      return super.discardTrack();
    } finally {
      _$_MapStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic _listenPositions(Position position) {
    final _$actionInfo = _$_MapStoreBaseActionController.startAction(
        name: '_MapStoreBase._listenPositions');
    try {
      return super._listenPositions(position);
    } finally {
      _$_MapStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentPosition: ${currentPosition},
track: ${track},
centralize: ${centralize},
pinPillPosition: ${pinPillPosition},
selectedTrack: ${selectedTrack},
selectedIcon: ${selectedIcon},
trackEntities: ${trackEntities}
    ''';
  }
}
