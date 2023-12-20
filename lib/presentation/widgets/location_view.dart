import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../core/fonts.dart';

class LocationView extends StatelessWidget {
  final String name, address;
  final String? lat, lng;
  const LocationView(
      {super.key,
      required this.name,
      required this.address,
      required this.lat,
      required this.lng});

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    late CameraPosition initialCameraPosition;
    List<Marker> markers = [];
    if (lat != null && lng != null) {
      LatLng location = LatLng(double.parse(lat!), double.parse(lng!));
      initialCameraPosition = CameraPosition(
        target: location,
        zoom: 10,
      );

      markers.add(Marker(markerId: MarkerId(name), position: location));
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Location:',
          style:
              Fonts.sFProDisplay(18.sp, colorScheme.primary, FontWeight.w700),
          textScaleFactor: 1,
        ),
        SizedBox(
          height: 10.h,
        ),
        Container(
          width: double.infinity,
          //    height: 110.h,
          color: colorScheme.surface,
          child: IntrinsicHeight(
            child: Row(
              children: [
                Flexible(
                    flex: 3,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 15.h, horizontal: 14.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: Fonts.sFProDisplay(
                                14.sp, colorScheme.primary, FontWeight.w700),
                            textScaleFactor: 1,
                          ),
                          SizedBox(
                            height: 12.h,
                          ),
                          Text(
                            'Address: $address',
                            style: Fonts.sFProDisplay(
                                14.sp, colorScheme.primary, FontWeight.w400),
                            textScaleFactor: 1,
                          ),
                        ],
                      ),
                    )),
                if (lat != null && lng != null)
                  Flexible(
                    flex: 1,
                    child: GoogleMap(
                      mapType: MapType.normal,
                      myLocationButtonEnabled: false,
                      zoomControlsEnabled: false,
                      initialCameraPosition: initialCameraPosition,
                      markers: markers.toSet(),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
