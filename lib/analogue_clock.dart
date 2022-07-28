/* Developed by Eng Mouaz M. Al-Shahmeh */
import 'dart:async';
import 'package:clock_flutter_app/utility/widgetHelper.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' show radians;
import 'container_hand.dart';

final radiansPerTick = radians(360 / 60);
final radiansPerHour = radians(360 / 12);
double _clockSizeFActor = 4 / 5;

class AnalogueClock extends StatefulWidget {
  const AnalogueClock({Key? key}) : super(key: key);

  @override
  AnalogueClockState createState() => AnalogueClockState();
}

class AnalogueClockState extends State<AnalogueClock> {
  bool isStartTime = false, isEndTime = false;
  var _now = DateTime.now();
  Timer? _timer;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _updateTime();
  }

  void _updateTime() {
    setState(() {
      _now = DateTime.now();
      _timer = Timer(
        const Duration(seconds: 1) - Duration(milliseconds: _now.millisecond),
        _updateTime,
      );
    });
  }

  Widget _horizontalSmallLine(bool isReverse) {
    return Container(
      width: 25,
      height: 5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight:
              isReverse ? const Radius.circular(0) : const Radius.circular(5),
          bottomRight:
              isReverse ? const Radius.circular(0) : const Radius.circular(5),
          topLeft:
              !isReverse ? const Radius.circular(0) : const Radius.circular(5),
          bottomLeft:
              !isReverse ? const Radius.circular(0) : const Radius.circular(5),
        ),
        color: const Color(0xffb9c6d5),
      ),
    );
  }

  Widget _horizontalSmallLine2(bool isReverse) {
    return Container(
      width: 15,
      height: 3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight:
              isReverse ? const Radius.circular(0) : const Radius.circular(5),
          bottomRight:
              isReverse ? const Radius.circular(0) : const Radius.circular(5),
          topLeft:
              !isReverse ? const Radius.circular(0) : const Radius.circular(5),
          bottomLeft:
              !isReverse ? const Radius.circular(0) : const Radius.circular(5),
        ),
        color: const Color(0xffb9c6d5),
      ),
    );
  }

  Widget _verticalSmallLine(bool isReverse) {
    return Container(
      width: 5,
      height: 25,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight:
              isReverse ? const Radius.circular(5) : const Radius.circular(0),
          bottomLeft:
              !isReverse ? const Radius.circular(5) : const Radius.circular(0),
          bottomRight:
              isReverse ? const Radius.circular(0) : const Radius.circular(5),
          topLeft:
              !isReverse ? const Radius.circular(0) : const Radius.circular(5),
        ),
        color: const Color(0xffb9c6d5),
      ),
    );
  }

  Widget _clock() {
    var size = fullWidth(context);
    var clockWidth = size * _clockSizeFActor;
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: AspectRatio(
        aspectRatio: 5 / 3,
        child: Container(
          margin: const EdgeInsets.only(top: 10, bottom: 10),
          height: clockWidth,
          width: clockWidth,
          decoration: decoration(context),
          child: _innerClockBody(),
        ),
      ),
    );
  }

  Widget _clockDigits() {
    var size = fullWidth(context);
    var clockWidth = size * _clockSizeFActor;
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: AspectRatio(
        aspectRatio: 5 / 3,
        child: Container(
          margin: const EdgeInsets.only(top: 10, bottom: 10),
          height: clockWidth,
          width: clockWidth,
          // decoration: decorationDigits(context),
          child: _innerClockBodyDigits(),
        ),
      ),
    );
  }

  Widget _innerClockBodyDigits() {
    return LayoutBuilder(
      builder: (context, constraints) {
        var innerClockWidth = constraints.maxHeight;
        return SizedBox(
          width: innerClockWidth,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${_now.hour} : ',
                style: const TextStyle(fontSize: 60, color: Color(0xff234f22)),
              ),
              Text(
                '${_now.minute} : ',
                style: const TextStyle(fontSize: 60, color: Color(0xff234f22)),
              ),
              Text(
                '${_now.second}',
                style: const TextStyle(fontSize: 50, color: Color(0xff234f22)),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _innerClockBody() {
    var size = fullWidth(context);
    return LayoutBuilder(
      builder: (context, constraints) {
        var innerClockWidth = constraints.maxHeight;
        var clockWidth = size * _clockSizeFActor;
        return SizedBox(
          width: innerClockWidth,
          child: Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: innerClockWidth,
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        _horizontalSmallLine(false),
                        _horizontalSmallLine(true),
                      ],
                    ),
                    RotationTransition(
                      turns: AlwaysStoppedAnimation(-15.0 * radiansPerTick),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          _horizontalSmallLine2(false),
                          _horizontalSmallLine2(true),
                        ],
                      ),
                    ),
                    RotationTransition(
                      turns: AlwaysStoppedAnimation(-30.0 * radiansPerTick),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          _horizontalSmallLine2(false),
                          _horizontalSmallLine2(true),
                        ],
                      ),
                    ),
                    RotationTransition(
                      turns: AlwaysStoppedAnimation(15.0 * radiansPerTick),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          _horizontalSmallLine2(false),
                          _horizontalSmallLine2(true),
                        ],
                      ),
                    ),
                    RotationTransition(
                      turns: AlwaysStoppedAnimation(30.0 * radiansPerTick),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          _horizontalSmallLine2(false),
                          _horizontalSmallLine2(true),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        _verticalSmallLine(false),
                        _verticalSmallLine(true),
                      ],
                    ),
                  ],
                ),
              ),
              ContainerHand(
                color: Colors.transparent,
                size: .6,
                angleRadians: _now.minute * radiansPerTick,
                child: Transform.translate(
                  offset: Offset(0.0, -clockWidth * .2),
                  child: Container(
                    width: 4,
                    height: clockWidth * .58,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: customTheme(context).highlightColor,
                    ),
                  ),
                ),
              ),
              ContainerHand(
                color: Colors.transparent,
                size: 0.6,
                angleRadians: _now.hour * radiansPerHour +
                    (_now.minute / 60) * radiansPerHour,
                child: Transform.translate(
                  offset: Offset(0.0, -clockWidth * .2),
                  child: Container(
                    width: 8,
                    height: clockWidth * .58,
                    decoration: BoxDecoration(
                        color: const Color(0xff68865e),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
              ContainerHand(
                color: Colors.transparent,
                size: 0.65,
                angleRadians: _now.second * radiansPerTick,
                child: Transform.translate(
                  offset: Offset(0.0, clockWidth * .2),
                  child: Container(
                    width: 2,
                    height: clockWidth * .6,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
              Container(
                constraints: const BoxConstraints(
                    minHeight: 5, minWidth: 5, maxHeight: 10, maxWidth: 10),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    _clockSizeFActor = 3 / 5;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: const Color(0xffaecbb2),
          body: SafeArea(
              child: MediaQuery.of(context).orientation == Orientation.landscape
                  ? _clock()
                  : Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 20),
                          child: Text(
                            'Flutter Clock App',
                            style: TextStyle(
                                color: customTheme(context).primaryColor,
                                fontSize: 30,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        const SizedBox(height: 20),
                        _clock(),
                        const SizedBox(height: 10),
                        _clockDigits(),
                      ],
                    ))),
    );
  }
}
