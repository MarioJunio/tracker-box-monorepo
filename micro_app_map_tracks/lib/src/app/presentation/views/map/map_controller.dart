import 'dart:async';
import 'dart:typed_data';

import 'package:commons_dependencies/main.dart' hide Color;
import 'package:commons_shared/main.dart';
import 'package:flutter/material.dart';

part 'map_controller.g.dart';

final $MapController = Bind.lazySingleton(
  (i) => MapController(i()),
  export: true,
);
class MapController = _MapStoreBase with _$MapController;

abstract class _MapStoreBase with Store {
  final GetTracksByCurrentPositionAndDistanceUsecase
      _getTracksByCurrentPositionAndDistanceUsecase;

  final PolylineId currentPolylineId = const PolylineId("P0");
  final TrackerLocator trackerLocator = TrackerLocator();
  GoogleMapController? mapController;

  ObservableMap<MarkerId, Marker> markers = ObservableMap();
  ObservableMap<PolylineId, Polyline> polylines = ObservableMap();

  BitmapDescriptor? customUserMarker;

  Timer? _countTimer;

  @observable
  Position? currentPosition;

  @observable
  Track track = Track();

  @observable
  bool centralize = true;

  @observable
  double? pinPillPosition = -Constants.pillHeight;

  @observable
  TrackEntity? selectedTrack;

  @observable
  Uint8List? selectedIcon;

  @observable
  List<TrackEntity> trackEntities = [];

  _MapStoreBase(this._getTracksByCurrentPositionAndDistanceUsecase);

  @action
  void clearTracks() {
    markers = ObservableMap();
    polylines = ObservableMap();
  }

  @action
  loadNearTracks(CoordinateEntity coordinate) async {
    trackEntities = await _getTracksByCurrentPositionAndDistanceUsecase(
      coordinate,
      AppPreferences.RADIUS_DISTANCE_KM,
    );

    for (var trackEntity in trackEntities) {
      final CoordinateEntity startCoordinate = trackEntity.startCoordinate!;
      final CoordinateEntity endCoordinate = trackEntity.endCoordinate!;

      // add start marker in map
      addMarker(
        Constants.startMarkerSymbol + trackEntity.id!,
        LatLng(startCoordinate.latitude!, startCoordinate.longitude!),
        BitmapDescriptor.fromBytes(
          await MapUtils.drawTrackMarkerDot(60, 60, trackEntity.user!.color!),
        ),
        _onTapMarker,
      );

      // add track route
      addPolyline(
        trackEntity.id!,
        trackEntity.user!.color!,
        trackEntity.coordinates!,
      );

      // add end marker in map
      addMarker(
        Constants.endMarkerSymbol + trackEntity.id!,
        LatLng(endCoordinate.latitude!, endCoordinate.longitude!),
        BitmapDescriptor.fromBytes(
          await MapUtils.drawTrackMarkerDot(
              60, 60, trackEntity.user!.color!.withOpacity(0.5)),
        ),
        _onTapMarker,
      );
    }
  }

  @action
  void setPinPillPosition(double pinPillPosition) {
    this.pinPillPosition = pinPillPosition;
  }

  @action
  setSelectedTrack(TrackEntity track) async {
    selectedTrack = track;
    selectedTrack?.icon = (await MapUtils.drawTrackMarkerDot(
      60,
      60,
      selectedTrack!.user!.color!,
    ));
  }

  @action
  void setCentralize(bool centralize) {
    this.centralize = centralize;
  }

  @action
  void startCapturePositions() {
    trackerLocator.listenForPosition(_listenPositions).then((value) {
      print("M=listenForPosition, value=$value");
    });
  }

  void stopCapturePositions() {
    trackerLocator.cancelListener();
  }

  @action
  void addMarker(
      String id, LatLng position, BitmapDescriptor descriptor, Function onTap) {
    Marker marker = Marker(
      markerId: MarkerId(id),
      icon: descriptor,
      position: position,
      onTap: () => onTap(id),
    );

    markers[marker.markerId] = marker;
  }

  @action
  void addPolyline(String id, Color color, List<CoordinateEntity> coordinates) {
    Polyline polyline = Polyline(
      polylineId: PolylineId(id),
      color: color,
      points: MapUtils.toPolylineCoordinates(coordinates),
    );

    polylines[polyline.polylineId] = polyline;
  }

  @action
  void setCurrentMarker(Position position) {
    currentPosition = position;

    Marker marker = Marker(
      markerId: const MarkerId("ME"),
      icon: customUserMarker!,
      position: LatLng(position.latitude, position.longitude),
      rotation: position.heading,
    );

    markers[marker.markerId] = marker;
  }

  @action
  void startTracking() {
    polylines[currentPolylineId] = Polyline(
      polylineId: currentPolylineId,
      color: Colors.blue.shade400,
      points: const [],
    );

    track = Track();
    track.setTrackStatus(TrackStatus.active);
  }

  @action
  void stopTracking() {
    track.setTrackStatus(TrackStatus.complete);

    // para o temporizador
    _stopTimer();

    if (track.coordinates.isNotEmpty) {
      final lastCoordinate = track.coordinates.last;

      // change route color
      /*final points = polylines[currentPolylineId]!.points;

      polylines[currentPolylineId] = Polyline(
        polylineId: currentPolylineId,
        color: Colors.blue.shade700,
        points: points,
      );*/

      MapUtils.drawTrackMarkerDot(60, 60, Colors.blueAccent.shade200)
          .then((value) {
        addMarker(
          "M1",
          LatLng(lastCoordinate.latitude!, lastCoordinate.longitude!),
          BitmapDescriptor.fromBytes(value),
          _onTapMarker,
        );
      });
    }
  }

  @action
  void publishTrack() {
    //TODO: chamar serviço para publicar track ou armazenar localmente caso a internet esteja OFF
    track.setTrackStatus(TrackStatus.standby);
  }

  @action
  void discardTrack() {
    track.setTrackStatus(TrackStatus.standby);
  }

  @action
  _listenPositions(Position position) {
    track.accuracy = position.accuracy;

    if (currentPosition == null) {
      loadNearTracks(CoordinateEntity(
        latitude: position.latitude,
        longitude: position.longitude,
      ));
    }

    setCurrentMarker(position);

    if (track.status != TrackStatus.complete && centralize) {
      mapController?.animateCamera(CameraUpdate.newLatLngZoom(
          LatLng(position.latitude, position.longitude), 18.5));
    } else if (track.status == TrackStatus.complete) {
      MapUtils.fitMapOnTrack(track.coordinates, mapController!);
    }

    _updateTrackActive(position);
  }

  void _updateTrackActive(Position position) async {
    // converte velocidade de m/s -> km/h
    final int tmpSpeed = (position.speed * 3.6).truncate();

    // não aceita velocidade negativa, acontece se inicia o GPS
    track.setSpeed(tmpSpeed < 0 ? 0 : tmpSpeed);

    if (track.isActive) {
      // inicia temporizador da track
      if (track.canStartTimer && tmpSpeed > 0) _startTimer();

      // define velocidade inicial e máxima
      track.refreshSpeedDefinitions();

      final LatLng latLng = LatLng(position.latitude, position.longitude);

      // adiciona polyline para criar a rota
      polylines[currentPolylineId]!.points.add(latLng);

      // adiciona bandeira de inicio do track
      if (track.coordinates.isEmpty) {
        addMarker(
          "M0",
          latLng,
          BitmapDescriptor.fromBytes(
              await MapUtils.drawTrackMarkerDot(60, 60, Colors.blueAccent)),
          _onTapMarker,
        );
      }

      // add coordenada a lista
      track.coordinates.add(
        CoordinateEntity(
          latitude: position.latitude,
          longitude: position.longitude,
        ),
      );

      // calcula distancia
      track.calculateDistance();
    }
  }

  void _onTapMarker(String id) {
    final trackId = id.substring(1);

    final TrackEntity track = trackEntities.firstWhere(
      (track) => track.id == trackId,
    );

    setPinPillPosition(0);
    setSelectedTrack(track);
  }

  void _startTimer() {
    track.canStartTimer = false;

    if (!(_countTimer?.isActive ?? false)) {
      _countTimer = Timer.periodic(
        const Duration(milliseconds: AppPreferences.TRACK_TIMER_DELAY_MILLI),
        (timer) {
          track.incrementTimer(AppPreferences.TRACK_TIMER_DELAY_MILLI);
        },
      );
    }
  }

  _stopTimer() {
    _countTimer?.cancel();
  }

  void setGoogleMapController(GoogleMapController googleMapController) =>
      mapController = googleMapController;

  void setCustomUserMarker(BitmapDescriptor marker) =>
      customUserMarker = marker;

  bool get showIndicators => track.isActive || track.isComplete;
}
