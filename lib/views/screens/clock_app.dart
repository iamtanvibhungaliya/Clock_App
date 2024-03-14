import 'dart:math';

import 'package:flutter/material.dart';

class ClockApp extends StatefulWidget {
  const ClockApp({super.key});

  @override
  State<ClockApp> createState() => _ClockAppState();
}

class _ClockAppState extends State<ClockApp> {
  DateTime d = DateTime.now();

  void startclock() {
    Future.delayed(const Duration(seconds: 1), () {
      d = DateTime.now();
      setState(() {});
      startclock();
    });
  }

  @override
  void initState() {
    super.initState();
    startclock();
  }

  bool _isAnalog = true;
  bool _isStrap = false;
  bool _isDigital = false;
  bool _image = false;

  List images = [
    'https://www.hdwallpapers.in/download/wall_board_lights_black_background_4k_hd_black_background-720x1280.jpg',
    'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.pexels.com%2Fsearch%2Fblack%2520wallpaper%2F&psig=AOvVaw0W6f5gnXjGxz5sdxDa6ZUX&ust=1709307544975000&source=images&cd=vfe&opi=89978449&ved=0CBMQjRxqFwoTCNCL0frw0IQDFQAAAAAdAAAAABAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR04mS815aOdaEgiimFc9qrpDAg8xb2qeb2IQ&usqp=CAU',
    'https://images.unsplash.com/photo-1601379329542-31c59347e2b8?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8MTh8fHxlbnwwfHx8fHw%3D',
    'https://images.rawpixel.com/image_800/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIyLTA1L3Y4MjItYWV3LTI1LWpvYjU5N18xLmpwZw.jpg',
  ];
  String backgroundimg = "";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text(
          "Clock App",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          Text(
            "${d.hour} : ${d.minute} : ${d.second}_Date: ${d.day}_WeekDay: ${d.weekday}",
            style: const TextStyle(
              overflow: TextOverflow.ellipsis,
              color: Colors.white,
              fontSize: 12,
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text("Tanvi Bhungaliya"),
              accountEmail: Text("tanvibhungaliya@gmail.com"),
            ),
            Container(
              margin: const EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Strap clock"),
                  Switch(
                    value: _isStrap,
                    onChanged: (val) => _isStrap = !_isStrap,
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Analog clock"),
                  Switch(
                    value: _isAnalog,
                    onChanged: (val) => _isAnalog = !_isAnalog,
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Images"),
                  Switch(
                    value: _image,
                    onChanged: (val) => _image = !_image,
                  ),
                ],
              ),
            ),
            Visibility(
              visible: _image,
              child: Expanded(
                child: SingleChildScrollView(
                  // scrollDirection: Axis.horizontal,
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: images
                        .map(
                          (e) => GestureDetector(
                            onTap: () {
                              backgroundimg = e;
                              setState(() {});
                            },
                            child: SingleChildScrollView(
                              child: Container(
                                margin: const EdgeInsets.all(16),
                                height: size.height * 0.2,
                                width: size.width * 0.3,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.grey,
                                      offset: Offset(5, 5),
                                      blurRadius: 10,
                                    ),
                                  ],
                                  color: Colors.amberAccent,
                                  image: DecorationImage(
                                    image: NetworkImage(e),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // AnalogWatch
            Visibility(
              visible: _isAnalog,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  //allPoint
                  ...List.generate(
                    60,
                    (index) => Transform.rotate(
                      angle: index * (pi * 2) / 60,
                      child: Divider(
                        endIndent: index % 5 == 0
                            ? size.width * 0.88
                            : size.width * 0.9,
                        thickness: 2,
                        color:
                            index % 5 == 0 ? Colors.amberAccent : Colors.grey,
                      ),
                    ),
                  ),
                  //hourHand
                  Transform.rotate(
                    angle: pi / 2,
                    child: Transform.rotate(
                      angle: d.hour * (pi * 2) / 12,
                      child: Divider(
                        indent: 50,
                        endIndent: size.width * 0.5 - 16,
                        color: Colors.black,
                        thickness: 4,
                      ),
                    ),
                  ),
                  //minuteHand
                  Transform.rotate(
                    angle: pi / 2,
                    child: Transform.rotate(
                      angle: d.minute * (pi * 2) / 60,
                      child: Divider(
                        indent: 30,
                        endIndent: size.width * 0.5 - 16,
                        color: Colors.black,
                        thickness: 2,
                      ),
                    ),
                  ),
                  //secondHand
                  Transform.rotate(
                    angle: pi / 2,
                    child: Transform.rotate(
                      angle: d.second * (pi * 2) / 60,
                      child: Divider(
                        indent: 20,
                        endIndent: size.width * 0.5 - 16,
                        color: Colors.amberAccent,
                        thickness: 2,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // StrapWatch
            Visibility(
              visible: _isStrap,
              child: Stack(
                children: [
                  // Hour
                  Transform.scale(
                    scale: 8,
                    child: CircularProgressIndicator(
                      value: d.hour / 12.toDouble(),
                      strokeWidth: 1.7,
                    ),
                  ),
                  // Minutes
                  Transform.scale(
                    scale: 5,
                    child: CircularProgressIndicator(
                      value: d.minute / 60.toDouble(),
                      strokeWidth: 1.3,
                    ),
                  ),
                  // Second
                  Transform.scale(
                    scale: 3,
                    child: CircularProgressIndicator(
                      value: d.second / 60.toDouble(),
                      strokeWidth: 1.5,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
