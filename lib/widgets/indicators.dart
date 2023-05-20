import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class Indicator extends StatefulWidget {
  const Indicator({super.key});

  @override
  State<Indicator> createState() => _IndicatorState();
}

class _IndicatorState extends State<Indicator> {
  double _musicValue = 100.0;
  double _ringValue = 85.0;
  double _alarmValue = 65.0;

  @override
  Widget build(BuildContext context) {
    return _buildVolumeControl();
  }

  Widget _buildVolumeControl() {
    final Brightness brightness = Theme.of(context).brightness;

    return Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      SizedBox(
        height: 205,
        child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(20.0)),
            child: SfLinearGauge(
              orientation: LinearGaugeOrientation.vertical,
              interval: 20.0,
              showTicks: false,
              showLabels: false,
              minorTicksPerInterval: 0,
              axisTrackStyle: LinearAxisTrackStyle(
                thickness: 40,
                edgeStyle: LinearEdgeStyle.bothCurve,
                borderWidth: 1,
                borderColor: brightness == Brightness.dark
                    ? const Color(0xff898989)
                    : Colors.grey[350],
                color: brightness == Brightness.dark
                    ? Colors.transparent
                    : Colors.grey[350],
              ),
              barPointers: <LinearBarPointer>[
                LinearBarPointer(
                  enableAnimation: false,
                  value: _musicValue,
                  thickness: 40,
                  edgeStyle: LinearEdgeStyle.bothCurve,
                  color: Color.fromARGB(255, 136, 179, 255),
                )
              ],
              markerPointers: <LinearMarkerPointer>[
                LinearWidgetPointer(
                    enableAnimation: false,
                    markerAlignment: LinearMarkerAlignment.end,
                    value: 100,
                    child: SizedBox(
                      height: 25,
                      child: Text(_musicValue.toStringAsFixed(0) + '%'),
                    )),
                LinearWidgetPointer(
                  value: 5,
                  enableAnimation: false,
                  markerAlignment: LinearMarkerAlignment.end,
                  child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _musicValue = 0;
                        });
                      },
                      child: const SizedBox(
                          height: 30,
                          width: 30,
                          child: Center(
                              child: Icon(
                            Icons.water_drop,
                            color: Color(0xffFFFFFF),
                          )))),
                ),
                LinearShapePointer(
                    enableAnimation: false,
                    value: _musicValue - 20,
                    onChanged: (dynamic value) {
                      setState(() {
                        _musicValue = value as double;
                      });
                    },
                    color: Colors.transparent,
                    width: 40,
                    markerAlignment: LinearMarkerAlignment.end,
                    position: LinearElementPosition.cross,
                    shapeType: LinearShapePointerType.circle,
                    height: 40),
              ],
            )),
      ),
      const SizedBox(
        width: 20,
      ),
      SizedBox(
          height: 205,
          child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(20.0)),
              child: SfLinearGauge(
                  orientation: LinearGaugeOrientation.vertical,
                  interval: 20.0,
                  showTicks: false,
                  showLabels: false,
                  minorTicksPerInterval: 0,
                  axisTrackStyle: LinearAxisTrackStyle(
                    thickness: 40,
                    edgeStyle: LinearEdgeStyle.bothCurve,
                    borderWidth: 1,
                    borderColor: brightness == Brightness.dark
                        ? const Color(0xff898989)
                        : Colors.grey[350],
                    color: brightness == Brightness.dark
                        ? Colors.transparent
                        : Colors.grey[350],
                  ),
                  barPointers: <LinearBarPointer>[
                    LinearBarPointer(
                      enableAnimation: false,
                      value: _ringValue,
                      thickness: 40,
                      edgeStyle: LinearEdgeStyle.bothCurve,
                      color: Color.fromARGB(255, 136, 179, 255),
                    )
                  ],
                  markerPointers: <LinearMarkerPointer>[
                    LinearWidgetPointer(
                      value: 5,
                      enableAnimation: false,
                      markerAlignment: LinearMarkerAlignment.end,
                      child: SizedBox(
                          height: 30,
                          width: 30,
                          child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _ringValue = 0;
                                });
                              },
                              child: const Center(
                                  child: Icon(
                                Icons.fastfood_sharp,
                                color: Color(0xffFFFFFF),
                              )))),
                    ),
                    LinearWidgetPointer(
                        markerAlignment: LinearMarkerAlignment.end,
                        value: 100,
                        enableAnimation: false,
                        child: SizedBox(
                          height: 25,
                          child: Text(_ringValue.toStringAsFixed(0) + '%'),
                        )),
                    LinearShapePointer(
                        value: _ringValue - 20,
                        enableAnimation: false,
                        onChanged: (dynamic value) {
                          setState(() {
                            _ringValue = value as double;
                          });
                        },
                        color: Colors.transparent,
                        width: 40,
                        position: LinearElementPosition.cross,
                        shapeType: LinearShapePointerType.circle,
                        markerAlignment: LinearMarkerAlignment.end,
                        height: 40),
                  ]))),
      const SizedBox(
        width: 20,
      ),
      SizedBox(
          height: 205,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: SfLinearGauge(
                orientation: LinearGaugeOrientation.vertical,
                interval: 20.0,
                showTicks: false,
                showLabels: false,
                minorTicksPerInterval: 0,
                axisTrackStyle: LinearAxisTrackStyle(
                  thickness: 40,
                  edgeStyle: LinearEdgeStyle.bothCurve,
                  borderWidth: 1,
                  borderColor: brightness == Brightness.dark
                      ? const Color(0xff898989)
                      : Colors.grey[350],
                  color: brightness == Brightness.dark
                      ? Colors.transparent
                      : Colors.grey[350],
                ),
                barPointers: <LinearBarPointer>[
                  LinearBarPointer(
                    enableAnimation: false,
                    value: _alarmValue,
                    thickness: 40,
                    edgeStyle: LinearEdgeStyle.bothCurve,
                    color: Color.fromARGB(255, 136, 179, 255),
                  )
                ],
                markerPointers: <LinearMarkerPointer>[
                  LinearWidgetPointer(
                      enableAnimation: false,
                      markerAlignment: LinearMarkerAlignment.end,
                      value: 100,
                      child: SizedBox(
                        height: 25,
                        child: Text(_alarmValue.toStringAsFixed(0) + '%'),
                      )),
                  LinearWidgetPointer(
                    value: 5,
                    enableAnimation: false,
                    markerAlignment: LinearMarkerAlignment.end,
                    child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _alarmValue = 0;
                          });
                        },
                        child: const SizedBox(
                            height: 30,
                            width: 30,
                            child: Center(
                                child: Icon(
                              Icons.airline_seat_individual_suite_sharp,
                              color: Color(0xffFFFFFF),
                            )))),
                  ),
                  LinearShapePointer(
                      value: _alarmValue - 20,
                      enableAnimation: false,
                      onChanged: (dynamic value) {
                        setState(() {
                          _alarmValue = value as double;
                        });
                      },
                      color: Colors.transparent,
                      width: 40,
                      position: LinearElementPosition.cross,
                      shapeType: LinearShapePointerType.circle,
                      markerAlignment: LinearMarkerAlignment.end,
                      height: 40),
                ]),
          ))
    ]);
  }
}
