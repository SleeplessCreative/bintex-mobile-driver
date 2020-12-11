import 'dart:async';
import 'dart:math' as math;
import 'dart:ui';

import 'package:bintex_mobile_driver/app/locator.dart';
import 'package:bintex_mobile_driver/app/router.gr.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../datamodels/trip.dart';

class TripViewModel extends BaseViewModel {
  NavigationService _navigationService = locator<NavigationService>();

  void init(Trip data) async {
    setTripData = data;
    runBusyFuture(await setPolylines());
  }

  Future navigateToHome() async {
    return await _navigationService.clearStackAndShow(Routes.homeView);
  }

  PanelController _panelController = new PanelController();
  PanelController get panelController => _panelController;

  String _originLabel = 'Origin';
  String get originLabel => _originLabel;

  String _destinationLabel = 'Destination';
  String get destinationLabel => _destinationLabel;

  Trip _tripData;
  Trip get tripData => _tripData;
  set setTripData(Trip tripData) => this._tripData = tripData;

  // MAAAP
  Future setPolylines() async {
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult polylineResult =
        await polylinePoints.getRouteBetweenCoordinates(
      _googleAPIKey,
      PointLatLng(_tripData.agentOriginLatLng.latitude,
          _tripData.agentOriginLatLng.longitude),
      PointLatLng(_tripData.agentDestinationLatLng.latitude,
          _tripData.agentDestinationLatLng.longitude),
    );
    List<PointLatLng> result = polylineResult.points;
    if (result.isNotEmpty) {
      result.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
      _polylines.add(
        Polyline(
            width: 5,
            polylineId: PolylineId('poly'),
            color: Color.fromARGB(255, 40, 122, 198),
            points: polylineCoordinates),
      );
      await _centerCamera();
      notifyListeners();
    }
  }

  Future<void> _centerCamera() async {
    final GoogleMapController controller = await _controller.future;

    double latMin = math.min(_tripData.agentOriginLatLng.latitude,
        _tripData.agentDestinationLatLng.latitude);
    double latMax = math.max(_tripData.agentOriginLatLng.latitude,
        _tripData.agentDestinationLatLng.latitude);

    double longMin = math.min(_tripData.agentOriginLatLng.longitude,
        _tripData.agentDestinationLatLng.longitude);
    double longMax = math.max(_tripData.agentOriginLatLng.longitude,
        _tripData.agentDestinationLatLng.longitude);

    controller.animateCamera(
      CameraUpdate.newLatLngBounds(
        LatLngBounds(
          southwest: LatLng(latMin, longMin),
          northeast: LatLng(latMax, longMax),
        ),
        50,
      ),
    );
  }

  Completer<GoogleMapController> _controller = Completer();
  Completer<GoogleMapController> get controller => _controller;

  String _googleAPIKey = 'AIzaSyAkE28LLnDGr0G5PLdvOgnMZyOHs8ijbcQ';

  Set<Polyline> _polylines = Set<Polyline>();
  Set<Polyline> get polylines => _polylines;

  List<LatLng> _polylineCoordinates = [];
  List<LatLng> get polylineCoordinates => _polylineCoordinates;

  CameraPosition _initialCameraPosition = CameraPosition(
    target: LatLng(3.6422756, 98.5294066),
    zoom: 16,
  );
  CameraPosition get initialCameraPosition => _initialCameraPosition;
}
