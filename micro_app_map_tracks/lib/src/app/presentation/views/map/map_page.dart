import 'package:commons_dependencies/main.dart' hide Color;
import 'package:commons_design_system/main.dart';
import 'package:commons_shared/main.dart';
import 'package:flutter/material.dart';

import 'map_controller.dart';

class MapPage extends StatefulWidget {
  final String? title;

  const MapPage({
    Key? key,
    this.title = 'Tracks',
  }) : super(key: key);
  @override
  MapPageState createState() => MapPageState();
}

class MapPageState extends ModularState<MapPage, MapController> {
  // PolylinePoints polylinePoints = PolylinePoints();

  late ReactionDisposer loadTracks;

  @override
  void initState() {
    super.initState();

    MapUtils.drawUserMarkerDot(60, 60, const Color(0xff64b5f6)).then(
      (value) => controller.setCustomUserMarker(
        BitmapDescriptor.fromBytes(value),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title ?? ""),
          actions: [
            _getCentralizeButton,
            _getTrackButtons,
            _getDiscardTrackButton,
            _getPublishTrackButton,
          ],
        ),
        body: Observer(builder: (_) {
          return Stack(
            children: [
              _mapView(),
              _trackIndicators(),
              _trackPillInfo(),
            ],
          );
        }));
  }

  Widget _mapView() {
    return GoogleMap(
      onMapCreated: _onMapCreated,
      myLocationButtonEnabled: false,
      initialCameraPosition: CameraPosition(
        target: const LatLng(-23.714468, -46.9162349),
        zoom: 6,
        bearing: controller.currentPosition?.heading ?? 0.0,
      ),
      zoomControlsEnabled: false,
      markers: Set<Marker>.of(controller.markers.values),
      polylines: Set<Polyline>.of(controller.polylines.values),
      onTap: (LatLng position) {
        controller.setPinPillPosition(-100);
      },
    );
  }

  Widget get _getCentralizeButton => Observer(builder: (_) {
        return IconButton(
          onPressed: () => controller.setCentralize(!controller.centralize),
          icon: FaIcon(
            FontAwesomeIcons.mapMarkerAlt,
            color: controller.centralize
                ? Colors.white
                : Colors.white.withOpacity(0.4),
          ),
        );
      });

  Widget get _getTrackButtons => Observer(
        builder: (_) {
          IconButton button = IconButton(
            onPressed: controller.track.calibrated ? _confirmStartTrack : null,
            icon: const FaIcon(FontAwesomeIcons.play),
          );

          if (controller.track.isActive) {
            button = IconButton(
              onPressed: () {
                controller.stopTracking();
              },
              icon: const FaIcon(FontAwesomeIcons.stop),
            );
          }

          return controller.track.isComplete ? Container() : button;
        },
      );

  Widget get _getPublishTrackButton => Observer(
        builder: (_) => controller.track.isComplete
            ? IconButton(
                onPressed: () {
                  controller.publishTrack();
                },
                icon: const FaIcon(FontAwesomeIcons.check),
              )
            : Container(),
      );

  Widget get _getDiscardTrackButton => Observer(
        builder: (_) => controller.track.isComplete
            ? IconButton(
                onPressed: () {
                  controller.discardTrack();
                },
                icon: const FaIcon(FontAwesomeIcons.times),
              )
            : Container(),
      );

  void _confirmStartTrack() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomDialogBox(
          type: DialogType.CONFIRMATION,
          title: "Iniciar um novo track?",
          textPositiveButton: "Sim",
          onPressPositiveButton: () {
            controller.startTracking();
            Navigator.pop(context);
          },
          textNegativeButton: "Cancelar",
          onPressNegativeButton: () {
            Navigator.pop(context);
          },
        );
      },
    );
  }

  Widget _buildIndicator(String value, String label, {bool bigFont = false}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(150),
        border: Border.all(
          width: 4,
          color: Theme.of(context).primaryColor.withOpacity(0.6),
        ),
        shape: BoxShape.circle,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            value,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: bigFont ? 28 : 22,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            label,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller.stopCapturePositions();
    super.dispose();
  }

  void _onMapCreated(GoogleMapController mapController) {
    controller.setGoogleMapController(mapController);

    controller.startCapturePositions();
  }

  Widget _trackIndicators() => Container(
        margin: const EdgeInsets.only(top: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 8),
              child: _buildIndicator(controller.track.speed.toString(), "km/h",
                  bigFont: true),
            ),
            controller.showIndicators
                ? Container(
                    margin: const EdgeInsets.only(left: 8, top: 8),
                    child: _buildIndicator(
                      controller.track.timerFormattedWithoutUnit,
                      controller.track.timerUnit,
                    ),
                  )
                : Container(),
            controller.showIndicators
                ? Container(
                    margin: const EdgeInsets.only(left: 8, top: 16),
                    child: _buildIndicator(
                      controller.track.distanceFormattedWithoutUnit,
                      controller.track.distanceUnit,
                    ),
                  )
                : Container(),
          ],
        ),
      );

  Widget _trackPillInfo() => TrackPillInfo(
        pinPillPosition: controller.pinPillPosition!,
        track: controller.selectedTrack,
      );

  /*_getPolyline() async {
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        Constants.GOOGLE_API_KEY,
        PointLatLng(_originLatitude, _originLongitude),
        PointLatLng(_destLatitude, _destLongitude),
        travelMode: TravelMode.driving,
        wayPoints: [PolylineWayPoint(location: "Sabo, Yaba Lagos Nigeria")]);
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }
    _addPolyLine();
  }*/
}
