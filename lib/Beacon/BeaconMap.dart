// ignore: file_names
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:thuyngoc/Beacon/BeaconManager.dart';
import 'package:thuyngoc/Beacon/LocationManager.dart';
//import 'package:marker_icon/marker_icon.dart';
import 'package:flutter_svg/flutter_svg.dart';

 PolygonLayerOptions polygonOptions = PolygonLayerOptions(
  polygons: [
    Polygon(
      points: [
        LatLng(51.5, -0.1),
        LatLng(51.6, -0.2),
        LatLng(51.7, -0.1),
      ],
      color: Colors.blue.withOpacity(0.5),
      borderColor: Colors.blue,
      borderStrokeWidth: 2.0,
    ),
  ],
);
CircleLayerOptions circleOptions = CircleLayerOptions(
  circles: [
    CircleMarker(
      point: LatLng(51.5, -0.1),
      radius: 10,
      color: Colors.red.withOpacity(0.5),
      borderColor: Colors.red,
      borderStrokeWidth: 2.0,
    ),
  ],
);
class BeaconMap extends StatefulWidget {
  @override
  _BeaconMapState createState() => _BeaconMapState();
}

class _BeaconMapState extends State<BeaconMap> {
  final MapController _mapController = MapController();
  final List<Marker> _markers = [];
  final BeaconManager _beaconManager = new BeaconManager();
  // ignore: unnecessary_new
  final LocationManager _locationManager = new LocationManager();
  late LatLng _currentPositionLatLng = LatLng(0, 0);

  @override
  void initState() {
    super.initState();
    _setupLocationServices();
  }

  void _addMarker(Beacon beacon, LatLng latLng) {
    setState(() {
      _markers.clear();
      _markers.add(
        Marker(
          width: 80.0,
          height: 80.0,
          point: latLng,
          builder: (ctx) => Container(
            child: IconButton(
              icon: CircleAvatar(
        backgroundImage: AssetImage('assets/Logo.png'),
        radius: 30,
        backgroundColor: Colors.white,
      ),
              color: Colors.white,
              iconSize: 80.0,
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Nết Na', textAlign: TextAlign.center,),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
        backgroundImage: AssetImage('assets/dog_1.png'),
        radius: 30,
        backgroundColor: Colors.white,
        
      ),
                          Text('Tên: ${beacon.name}'),
                          Text('Khoảng cách: ${beacon.distance}m'),
                          
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
        
      );
    });
  }
//late Location location = new Location();
  Future<void> _checkPermissions() async {
    
    var status = await Permission.location.status;
   
    if (status.isDenied) {
      await Permission.location.request();
    //  location.serviceEnabled();
    }
  }

  void _moveCameraToCurrentPosition() {
    if (_currentPositionLatLng != null) {
      _mapController.move(_currentPositionLatLng, 18.0);
    }
  }

  void _setupLocationServices() async {
    // await _checkPermissions();
    
    // Position currentPosition = await _locationManager.getCurrentLocation();
    // setState(() {
    //   _currentPositionLatLng = LatLng(currentPosition.latitude, currentPosition.longitude);
    // });
    // _moveCameraToCurrentPosition();
     try {
    await _checkPermissions();
    Position currentPosition = await _locationManager.getCurrentLocation();
    setState(() {
      //_currentPositionLatLng =LatLng(10.8556298, 106.7852747);
      _currentPositionLatLng =   LatLng(currentPosition.latitude, currentPosition.longitude);
    });
    _moveCameraToCurrentPosition();
  } catch (e) {
    print("Error getting location: $e");
  }
  }


 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Vị trí thú cưng',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 136, 202, 191),
      ),
      body: Stack(
        children: [
          FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              center: LatLng(0, 0),
              // center: LatLng(51.5, -0.1),
              zoom: 19.0,
              maxZoom: 19.0,
              minZoom: 19.0,
            ),
            layers: [
              TileLayerOptions(
                urlTemplate:
                    'https://mt1.google.com/vt/lyrs=m&x={x}&y={y}&z={z}',
                subdomains: ['mt0', 'mt1', 'mt2', 'mt3'],
                maxZoom: 22.0,
              ),
              if (_currentPositionLatLng != null)
                CircleLayerOptions(
                  circles: [
                    CircleMarker(
                      point: _currentPositionLatLng,
                      radius: 150,
                      color:
                          Color.fromARGB(255, 223, 232, 230).withOpacity(0.5),
                      borderColor: Color.fromARGB(255, 136, 202, 191),
                      borderStrokeWidth: 2.0,
                    ),
                  ],
                ),
              MarkerLayerOptions(markers: _markers),
              MarkerLayerOptions(
                markers: [
                  Marker(
                    width: 200.0,
                    height: 400.0,
                    point: _currentPositionLatLng,
                    builder: (ctx) => Container(
                      child: Icon(
                        Icons.catching_pokemon_outlined,
                        color: Color.fromARGB(255, 78, 79, 78),
                        size: 50.0,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white30,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: TextField(
                      onChanged: (value) {
                        // Xử lý sự kiện thay đổi giá trị trong ô tìm kiếm
                      },
                      decoration: InputDecoration(
                        hintText: 'Tìm kiếm',
                        hintStyle: TextStyle(color: Colors.black87),
                        prefixIcon: Icon(Icons.search),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 163, 212, 183),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.wifi,
                              color: Colors.black,
                            ),
                            Text(
                              "Thiết bị",
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 163, 212, 183),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.grid_view,
                              color: Colors.black,
                            ),
                            Text(
                              "An toàn",
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 163, 212, 183),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.shopping_cart,
                              color: Colors.black,
                            ),
                            Text(
                              "Dịch vụ",
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // 2. Quét các thiết bị beacon gần đó
          List<Beacon> nearbyBeacons = await _beaconManager.scanNearbyBeacons(
              timeout: const Duration(seconds: 4));
          // 3. Thêm đánh dấu trên bản đồ cho mỗi beacon
          for (Beacon beacon in nearbyBeacons) {
            // Randomize the location around the user's current position
            LatLng beaconLocation =
                generateRandomLatLng(_currentPositionLatLng, beacon.distance);
            LatLng beaconLatLng =
                LatLng(beaconLocation.latitude, beaconLocation.longitude);
            // Tạo một đánh dấu mới trên bản đồ với thông tin vị trí và khoảng cách của beacon
            _addMarker(beacon, beaconLatLng);
          }

          // 4. Di chuyển camera của bản đồ để hiển thị tất cả các đánh dấu
          _moveCameraToShowAllMarkers();
        },
        child: Icon(Icons.refresh,
        color: Colors.black,),
        backgroundColor: Color.fromARGB(255,136 ,202, 191),
      ),
    );
  }

  // Di chuyển camera của bản đồ để hiển thị tất cả các đánh dấu
  void _moveCameraToShowAllMarkers() {
    // Đảm bảo rằng bạn đã thêm ít nhất một đánh dấu vào bản đồ trước khi thử di chuyển camera
    if (_markers.isNotEmpty) {
      double north = _markers.first.point.latitude;
      double south = _markers.first.point.latitude;
      double east = _markers.first.point.longitude;
      double west = _markers.first.point.longitude;

      for (Marker marker in _markers) {
        if (marker.point.latitude > north) north = marker.point.latitude;
        if (marker.point.latitude < south) south = marker.point.latitude;
        if (marker.point.longitude > east) east = marker.point.longitude;
        if (marker.point.longitude < west) west = marker.point.longitude;
      }

      // Thiết lập các giới hạn của bản đồ để hiển thị tất cả các đánh dấu
      LatLngBounds bounds =
          LatLngBounds(LatLng(south, west), LatLng(north, east));

      // Di chuyển camera để hiển thị tất cả các đánh dấu trong vùng giới hạn
_mapController.fitBounds(
        bounds,
        options: FitBoundsOptions(
          padding: EdgeInsets.all(
              50), // Đặt đệm cho các đánh dấu ở các cạnh của bản đồ
        ),
      );
    }
  }

// This function generates a random LatLng within the given distance from the given center
  LatLng generateRandomLatLng(LatLng center, num distance) {
    Random random = Random();

    // Convert distance to radians
    double distanceInRadians = distance / 6371000;

    // Generate random bearing (direction) and random distance within the given distance
    double randomBearing = random.nextDouble() * 2 * pi;
    double randomDistance = sqrt(random.nextDouble()) * distanceInRadians;

    // Convert the center LatLng to radians
    double centerLatInRadians = degreesToRadians(center.latitude);
    double centerLngInRadians = degreesToRadians(center.longitude);

    // Calculate the random LatLng
    double randomLatInRadians = asin(
        sin(centerLatInRadians) * cos(randomDistance) +
            cos(centerLatInRadians) * sin(randomDistance) * cos(randomBearing));
    double randomLngInRadians = centerLngInRadians +
        atan2(
            sin(randomBearing) * sin(randomDistance) * cos(centerLatInRadians),
            cos(randomDistance) -
                sin(centerLatInRadians) * sin(randomLatInRadians));

    // Convert the random LatLng back to degrees
    double randomLat = radiansToDegrees(randomLatInRadians);
    double randomLng = radiansToDegrees(randomLngInRadians);

    return LatLng(randomLat - 0.0001000, randomLng - 0.0001000);
    //return LatLng(randomLat, randomLng);

  }
}

// class UserAvatar extends StatefulWidget {
//   @override
//   _UserAvatarState createState() => _UserAvatarState();
// }

// class _UserAvatarState extends State<UserAvatar>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _animationController;
//   late Animation<double> _rotationAnimation;

//   @override
//   void initState() {
//     super.initState();
//     _animationController = AnimationController(
//       duration: Duration(seconds: 2),
//       vsync: this,
//     );
//     _rotationAnimation = Tween<double>(begin: 0, end: 0).animate(
//       CurvedAnimation(
//         parent: _animationController,
//         curve: Curves.linear,
//       ),
//     )..addStatusListener((status) {
//         if (status == AnimationStatus.completed) {
//           _animationController.reset();
//           _animationController.forward();
//         }
//       });

//     _animationController.forward();
//   }

//   @override
//   void dispose() {
//     _animationController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return RotationTransition(
//       turns: _rotationAnimation,
//       child: GestureDetector(
//         onTap: () {
//           if (_animationController.isAnimating) {
//             _animationController.stop();
//           } else {
//             _animationController.forward();
//           }
//         },
//         child: CircleAvatar(
//           backgroundImage: AssetImage('assets/Logo.png'),
//           radius: 30,
//         ),
//       ),
//     );
//   }
// }
// class BouncingUserAvatar extends StatefulWidget {
//   @override
//   _BouncingUserAvatarState createState() => _BouncingUserAvatarState();
// }

// class _BouncingUserAvatarState extends State<BouncingUserAvatar>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _animationController;
//   late Animation<double> _animation;

//   @override
//   void initState() {
//     super.initState();

//     _animationController = AnimationController(
//       duration: Duration(milliseconds: 500),
//       vsync: this,
//     );

//     _animation = Tween<double>(begin: 1.0, end: 0.9).animate(
//       CurvedAnimation(
//         parent: _animationController,
//         curve: Curves.easeOut,
//       ),
//     );

//     _animationController.addStatusListener((status) {
//       if (status == AnimationStatus.completed) {
//         _animationController.reverse();
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _animationController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTapDown: (TapDownDetails details) {
//         _animationController.forward();
//       },
//       onTapUp: (TapUpDetails details) {
//         _animationController.reverse();
//       },
//       child: AnimatedBuilder(
//   animation: _animationController,
//   builder: (BuildContext context, Widget? child) {
//     return Transform.scale(
//       scale: _animation.value,
//       child: CircleAvatar(
//         backgroundImage: AssetImage('assets/Logo.png'),
//         radius: 30,
//       ),
//     );
//   },
// ),
//     );
//   }
// }