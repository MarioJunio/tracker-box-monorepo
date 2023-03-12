import 'package:commons_shared/src/app/data/models/track_status.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';

import '../../domain/entities/coordinate_entity.dart';
import '../../domain/entities/track_entity.dart';
import '../../domain/entities/user_entity.dart';
import '../../preferences/app_preferences.dart';
import '../../service/location.dart';
import '../../utils/crypto_utils.dart';
import '../../utils/track_formatter.dart';

part 'track.g.dart';

class Track = _TrackBase with _$Track;

abstract class _TrackBase with Store {
  late int id;

  @observable
  int startSpeed = 0;

  int maxSpeed = 0;

  @observable
  double distance = 0;

  @observable
  double accuracy = 0;

  @observable
  int timer = 0;

  List<CoordinateEntity> coordinates = [];

  // transient
  @observable
  int speed = 0;

  @observable
  double distanceIntegral = 0;

  @observable
  TrackStatus status = TrackStatus.standby;

  bool canStartTimer = true;

  _TrackBase() {
    reset();
  }

  TrackEntity toEntity(UserEntity user) => TrackEntity(
        user: user,
        startSpeed: startSpeed,
        maxSpeed: maxSpeed,
        distance: distance,
        time: timer,
        coordinates: coordinates,
        checkSum: CryptoUtils.genSha256(
            DateFormat('yyyy-MM-ddTHH:mm:ss.mmm').format(DateTime.now())),
      );

  @action
  reset() {
    startSpeed = 0;
    speed = 0;
    distance = 0;
    distanceIntegral = 0;
    timer = 0;
    canStartTimer = true;
    coordinates = [];
  }

  @action
  setSpeed(int speed) {
    this.speed = speed;
  }

  @action
  setDistance(double distance) {
    this.distance = distance;
  }

  @action
  setTimer(int timer) {
    this.timer = timer;
  }

  @action
  setTrackStatus(TrackStatus status) {
    this.status = status;
  }

  @action
  refreshSpeedDefinitions() {
    if (startSpeed == 0) {
      startSpeed = speed;
    }

    if (speed > maxSpeed) {
      maxSpeed = speed;
    }
  }

  @action
  calculateDistance() async {
    // se possuir ao menos 2 coordenadas registradas
    // a distancia poderia calculada para ser acumulada
    if (coordinates.length > 1) {
      final int length = coordinates.length;
      final double distanceBetween = ILocation.distanceBetween(
          coordinates[length - 2], coordinates[length - 1]);

      if (_canAcumulateDistance(distanceBetween)) {
        this.distance += distanceBetween;
      }
    }
  }

  /*@action
  calculateDistanceIntegral() async {
    this.distanceIntegral = 0;

    if (this.coordinates.length > 1) {
      for (int i = 1; i < this.coordinates.length; i++) {
        final distanceBetween = await TrackerLocator.distanceBetween(
            this.coordinates[i - 1], this.coordinates[i]);

        if (_canAcumulateDistance(distanceBetween))
          this.distanceIntegral += distanceBetween;
      }
    }
  }*/

  @action
  incrementTimer(int value) => timer += value;

  @computed
  String get speedFormatted => TrackFormatter.formatSpeed(speed);

  @computed
  String get timerFormatted => TrackFormatter.formatTimer(timer);

  @computed
  String get timerFormattedWithoutUnit =>
      TrackFormatter.formatTimer(timer, showLabel: false);

  @computed
  String get timerUnit => TrackFormatter.timerUnit(timer);

  @computed
  String get distanceFormatted => TrackFormatter.formatDistance(distance);

  @computed
  String get distanceFormattedWithoutUnit =>
      TrackFormatter.formatDistance(distance, showLabel: false);

  @computed
  String get distanceUnit => TrackFormatter.distanceUnit(distance);

  @computed
  bool get calibrated =>
      accuracy < AppPreferences.TRACK_CALIBRATED_ACCURACY_IN_METTERS;

  @computed
  bool get isStandby => status == TrackStatus.standby;

  @computed
  bool get isPrepare => status == TrackStatus.prepare;

  @computed
  bool get isActive => status == TrackStatus.active;

  @computed
  bool get isComplete => status == TrackStatus.complete;

  List<CoordinateEntity> get getTraceBeginAndEndCoordinates =>
      coordinates.isNotEmpty ? [coordinates.first, coordinates.last] : [];

  bool _canAcumulateDistance(double distanceBetween) =>
      speed > 1 && distanceBetween > 1;
}
