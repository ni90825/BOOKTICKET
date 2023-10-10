import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../controllers/location_controller.dart';
import '../utils/dummy_data.dart';
import '../utils/mytheme.dart';

class FacilitesBottomSheet extends StatelessWidget {
  final dynamic model;
  const FacilitesBottomSheet({Key? key, required this.model}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 58),
          height: double.maxFinite,
          width: double.maxFinite,
          color: Colors.white,
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Text(
                model.name,
                style: const TextStyle(fontSize: 18),
              ),
              RichText(
                text: TextSpan(
                  children: [
                    const WidgetSpan(
                      child: Icon(
                        Icons.location_on,
                        size: 25,
                        color: Color(0xff999999),
                      ),
                    ),
                    TextSpan(
                      text: "chembur",
                      style: const TextStyle(color: Color(0xff999999), fontSize: 14),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                model.fullAddress,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 14, color: Color(0xff999999)),
              ),
              const SizedBox(
                height: 20,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Available Facilites",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: model.facilites.length,
                  itemBuilder: (_, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: MyTheme.redGiftGradientColors[0],
                            ),
                            height: 60,
                            width: 60,
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: SvgPicture.asset(
                                facilityAsset[index],
                                height: 15,
                                width: 15,
                              ),
                            ),
                          ),
                          Text(
                            model.facilites[index],
                            style: const TextStyle(
                              color: Color(0xff999999),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 80,
          child: Center(
            child: CircleAvatar(
              backgroundColor: MyTheme.splash,
              radius: 40,
              child: SvgPicture.asset(
                "assets/icons/gps.svg",
                height: 40,
                width: 40,
              ),
            ),
          ),
        )
      ],
    );
  }
}
