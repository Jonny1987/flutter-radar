import 'dart:async';
import 'package:flutter/services.dart';

class Radar {
  static const MethodChannel _channel = const MethodChannel('flutter_radar');

  static Function(Map result) _clientLocationHandler;
  static Function(Map result) _eventHandler;
  static Function(Map result) _locationHandler;
  static Function(Map result) _errorHandler;
  static Function(Map result) _logHandler;

  static Future initialize(String publishableKey) async {
    try {
      await _channel.invokeMethod('initialize', {
        'publishableKey': publishableKey,
      });
    } on PlatformException catch (e) {
      print(e);
    }
  }

  static Future setLogLevel(String logLevel) async {
    try {
      await _channel.invokeMethod('setLogLevel', {'logLevel': logLevel});
    } on PlatformException catch (e) {
      print(e);
    }
  }

  static Future<String> getPermissionsStatus() async {
    final String permissionsStatus =
        await _channel.invokeMethod('getPermissionsStatus');
    return permissionsStatus;
  }

  static Future requestPermissions(bool background) async {
    try {
      await _channel
          .invokeMethod('requestPermissions', {'background': background});
    } on PlatformException catch (e) {
      print(e);
    }
  }

  static Future setUserId(String userId) async {
    try {
      await _channel.invokeMethod('setUserId', {'userId': userId});
    } on PlatformException catch (e) {
      print(e);
    }
  }

  static Future<String> getUserId() async {
    final String userId = await _channel.invokeMethod('getUserId');
    return userId;
  }

  static Future setDescription(String description) async {
    try {
      await _channel
          .invokeMethod('setDescription', {'description': description});
    } on PlatformException catch (e) {
      print(e);
    }
  }

  static Future<String> getDescription() async {
    final String description = await _channel.invokeMethod('getDescription');
    return description;
  }

  static Future setMetadata(Map<String, dynamic> metadata) async {
    try {
      await _channel.invokeMethod('setMetadata', metadata);
    } on PlatformException catch (e) {
      print(e);
    }
  }

  static Future<Map> getMetadata() async {
    final Map metadata = await _channel.invokeMethod('getMetadata');
    return metadata;
  }

  static Future setAdIdEnabled(bool enabled) async {
    try {
      await _channel.invokeMethod('setAdIdEnabled', {'enabled': enabled});
    } on PlatformException catch (e) {
      print(e);
    }
  }

  static Future<Map> getLocation([String accuracy]) async {
    try {
      final Map res =
          await _channel.invokeMethod('getLocation', {'accuracy': accuracy});
      return res;
    } on PlatformException catch (e) {
      print(e);
      Map<String, String> err = {'error': e.code};
      return err;
    }
  }

  static Future<Map> trackOnce([Map<String, dynamic> location]) async {
    try {
      if (location == null) {
        final Map trackOnceResult = await _channel.invokeMethod('trackOnce');
        return trackOnceResult;
      } else {
        final Map trackOnceResult =
            await _channel.invokeMethod('trackOnce', {'location': location});
        return trackOnceResult;
      }
    } on PlatformException catch (e) {
      print(e);
      Map<String, String> trackError = {'error': e.code};
      return trackError;
    }
  }

  static Future startTracking(String preset) async {
    try {
      await _channel.invokeMethod('startTracking', {
        'preset': preset,
      });
    } on PlatformException catch (e) {
      print(e);
    }
  }

  static Future startTrackingCustom(Map<String, dynamic> options) async {
    try {
      await _channel.invokeMethod('startTrackingCustom', options);
    } on PlatformException catch (e) {
      print(e);
    }
  }

  static Future stopTracking() async {
    try {
      await _channel.invokeMethod('stopTracking');
    } on PlatformException catch (e) {
      print(e);
    }
  }

  static Future<bool> isTracking() async {
    final bool isTracking = await _channel.invokeMethod('isTracking');
    return isTracking;
  }

  static Future startTrip(Map<String, dynamic> tripOptions) async {
    try {
      await _channel.invokeMethod('startTrip', tripOptions);
    } on PlatformException catch (e) {
      print(e);
    }
  }

  static Future<Map> getTripOptions() async {
    final Map res = await _channel.invokeMethod('getTripOptions');
    return res;
  }

  static Future completeTrip() async {
    try {
      await _channel.invokeMethod('completeTrip');
    } on PlatformException catch (e) {
      print(e);
    }
  }

  static Future cancelTrip() async {
    try {
      await _channel.invokeMethod('cancelTrip');
    } on PlatformException catch (e) {
      print(e);
    }
  }

  static Future<Map> getContext(Map<String, dynamic> location) async {
    try {
      final Map res =
          await _channel.invokeMethod('getContext', {'location': location});
      return res;
    } on PlatformException catch (e) {
      print(e);
      Map<String, String> err = {'error': e.code};
      return err;
    }
  }

  static Future<Map> searchGeofences(Map<String, dynamic> near, int radius,
      List tags, Map<String, dynamic> metadata, int limit) async {
    try {
      final Map res =
          await _channel.invokeMethod('searchGeofences', <String, dynamic>{
        'near': near,
        'radius': radius,
        'limit': limit,
        'tags': tags,
        'metadata': metadata
      });
      return res;
    } on PlatformException catch (e) {
      print(e);
      Map<String, String> err = {'error': e.code};
      return err;
    }
  }

  static Future<Map> searchPlaces(Map<String, dynamic> near, int radius,
      int limit, List chains, List categories, List groups) async {
    try {
      final Map res = await _channel.invokeMethod('searchPlaces', {
        'near': near,
        'radius': radius,
        'limit': limit,
        'chains': chains,
        'catgories': categories,
        'groups': groups
      });
      return res;
    } on PlatformException catch (e) {
      print(e);
      Map<String, String> err = {'error': e.code};
      return err;
    }
  }

  static Future<Map> autocomplete(
      String query, Map<String, dynamic> near, int limit) async {
    try {
      final Map res = await _channel.invokeMethod(
          'autocomplete', {'query': query, 'near': near, 'limit': limit});
      return res;
    } on PlatformException catch (e) {
      print(e);
      Map<String, String> err = {'error': e.code};
      return err;
    }
  }

  static Future<Map> geocode(String query) async {
    try {
      final Map geocodeResult =
          await _channel.invokeMethod('forwardGeocode', {'query': query});
      return geocodeResult;
    } on PlatformException catch (e) {
      print(e);
      Map<String, String> geocodeError = {'error': e.code};
      return geocodeError;
    }
  }

  static Future<Map> reverseGeocode(Map<String, dynamic> location) async {
    try {
      final Map res =
          await _channel.invokeMethod('reverseGeocode', {'location': location});
      return res;
    } on PlatformException catch (e) {
      print(e);
      Map<String, String> err = {'error': e.code};
      return err;
    }
  }

  static Future<Map> ipGeocode() async {
    try {
      final Map res = await _channel.invokeMethod('ipGeocode');
      return res;
    } on PlatformException catch (e) {
      print(e);
      Map<String, String> err = {'error': e.code};
      return err;
    }
  }

  static Future<Map> getDistance(Map<String, double> origin,
      Map<String, double> destination, List modes, String units) async {
    try {
      final Map res = await _channel.invokeMethod('getDistance', {
        'origin': origin,
        'destination': destination,
        'modes': modes,
        'units': units
      });
      return res;
    } on PlatformException catch (e) {
      print(e);
      Map<String, String> err = {'error': e.code};
      return err;
    }
  }

  static Future startForegroundService(
      Map<String, String> foregroundServiceOptions) async {
    try {
      await _channel.invokeMethod(
          'startForegroundService', foregroundServiceOptions);
    } on PlatformException catch (e) {
      print(e);
    }
  }

  static Future stopForegroundService() async {
    try {
      await _channel.invokeMethod('stopForegroundService');
    } on PlatformException catch (e) {
      print(e);
    }
  }

  static startListeners() {
    _channel.setMethodCallHandler((MethodCall methodCall) async {
      if (methodCall.method == 'onEvents' && _eventHandler != null) {
        Map res = Map.from(methodCall.arguments);
        _eventHandler(res);
      } else if (methodCall.method == 'onLocation' &&
          _locationHandler != null) {
        Map res = Map.from(methodCall.arguments);
        _locationHandler(res);
      } else if (methodCall.method == 'onClientLocation' &&
          _clientLocationHandler != null) {
        Map res = Map.from(methodCall.arguments);
        _clientLocationHandler(res);
      } else if (methodCall.method == 'onError' && _errorHandler != null) {
        Map res = Map.from(methodCall.arguments);
        _errorHandler(res);
      } else if (methodCall.method == 'onLog' && _logHandler != null) {
        Map res = Map.from(methodCall.arguments);
        _logHandler(res);
      }
      return null;
    });
  }

  static onEvents(Function(Map<dynamic, dynamic> result) resultProcess) {
    _eventHandler = resultProcess;
  }

  static offEvents() {
    _eventHandler = null;
  }

  static onLocation(Function(Map<dynamic, dynamic> result) resultProcess) {
    _locationHandler = resultProcess;
  }

  static offLocation() {
    _locationHandler = null;
  }

  static onClientLocation(
      Function(Map<dynamic, dynamic> result) resultProcess) {
    _clientLocationHandler = resultProcess;
  }

  static offClientLocation() {
    _clientLocationHandler = null;
  }

  static onError(Function(Map<dynamic, dynamic> result) resultProcess) {
    _errorHandler = resultProcess;
  }

  static offError() {
    _errorHandler = null;
  }

  static onLog(Function(Map<dynamic, dynamic> result) resultProcess) {
    _logHandler = resultProcess;
  }

  static offLog() {
    _logHandler = null;
  }
}