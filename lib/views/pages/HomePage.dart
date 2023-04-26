import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'dart:math' as maths;

import 'package:ic_coding_challange/views/widgets/CustomButton.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //fake data to simulate travel data
  List<Map<String, dynamic>> travelData = [
    {
      "lbl": "From",
      "CountryCode": "ADD",
      "CountryName": "Addis Ababa",
      "ServiceProvider": "Bole International Airport"
    },
    {
      "lbl": "To",
      "CountryCode": "DBX",
      "CountryName": "Dubai",
      "ServiceProvider": "Dubai International Airport"
    }
  ];
  //#131C66
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Stack(
                children: [
                  Positioned(
                    child: Image.asset(
                      "assets/images/bg.jpg",
                      fit: BoxFit.fill,
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    color: const Color(0xFF131C66).withOpacity(0.96),
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                      top: 10,
                      bottom: 30,
                    ),
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/images/guzogo.png",
                          width: 100,
                          height: 60,
                          fit: BoxFit.fill,
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Container(
                          width: double.infinity,
                          height: 45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(
                              color: Colors.grey.withOpacity(0.5),
                            ),
                          ),
                          padding: const EdgeInsets.all(5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .scaffoldBackgroundColor,
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  padding:
                                      const EdgeInsets.only(top: 8, bottom: 8),
                                  child: Text(
                                    "Return",
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(
                                          color: const Color(0xFF131C66),
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  "One-Way",
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _destinationWidget(0),
                            Container(
                              margin: const EdgeInsets.only(top: 20),
                              child: CircleAvatar(
                                radius: 18,
                                backgroundColor:
                                    Theme.of(context).scaffoldBackgroundColor,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Transform.rotate(
                                      angle: 90 * maths.pi / 180,
                                      child: const Icon(
                                        Icons.flight,
                                        size: 14,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Transform.rotate(
                                      angle: -90 * maths.pi / 180,
                                      child: const Icon(
                                        Icons.flight,
                                        size: 14,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            _destinationWidget(1),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              // const SizedBox(
              //   height: 5,
              // ),
              Row(
                children: [
                  Expanded(
                    child: _departureWidget(),
                  ),
                  Expanded(
                    child: _returnWidget(),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: _seatWidget(),
                  ),
                  Expanded(
                    child: _passangerWidget(),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: CustomButon(
                  bgColor: const Color(0xFFE6C12A),
                  txt: "Search",
                  onPressed: () {},
                  textStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedLabelStyle: const TextStyle(
          fontSize: 14,
        ),
        selectedLabelStyle: const TextStyle(
          fontSize: 14,
          color: Color(0xFF131C66),
        ),
        items: const [
          BottomNavigationBarItem(
            label: "Search",
            icon: Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            label: "My Bookings",
            icon: Icon(Icons.badge),
          ),
          BottomNavigationBarItem(
            label: "Profile",
            icon: Icon(Icons.person),
          )
        ],
      ),
    );
  }

  Widget _destinationWidget(int dIndex) {
    return SizedBox(
      width: 130,
      child: Column(
        children: [
          Text(
            travelData[dIndex]["lbl"],
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.white.withOpacity(0.9),
                  fontSize: 15,
                ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            travelData[dIndex]["CountryCode"],
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Colors.white.withOpacity(0.9),
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            travelData[dIndex]["CountryName"],
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            travelData[dIndex]["ServiceProvider"],
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Colors.white.withOpacity(0.8),
                  //fontSize: 14,
                ),
          ),
        ],
      ),
    );
  }

  _departureWidget() {
    return Container(
      padding: const EdgeInsets.only(
        top: 8.0,
        left: 15,
        bottom: 8.0,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: Colors.grey.withOpacity(0.2),
          ),
        ),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Departure Date",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    "1",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontSize: 38,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Jan",
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Monday",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              fontSize: 14,
                            ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
          Column(
            children: [],
          )
        ],
      ),
    );
  }

  _returnWidget() {
    return Container(
      padding: const EdgeInsets.only(
        top: 8.0,
        left: 15,
        bottom: 8.0,
      ),
      decoration: BoxDecoration(
          border: Border.all(
        color: Colors.grey.withOpacity(0.2),
      )),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Return Date",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    "14",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontSize: 38,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Jan",
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Friday",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              fontSize: 14,
                            ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
          Column(
            children: [],
          )
        ],
      ),
    );
  }

  _seatWidget() {
    return Container(
      padding: const EdgeInsets.only(
        top: 8.0,
        left: 15,
        bottom: 8.0,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: Colors.grey.withOpacity(0.2),
          ),
          right: BorderSide(
            width: 1,
            color: Colors.grey.withOpacity(0.2),
          ),
        ),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.chair,
                    size: 16,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Cabin Class",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(),
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                "Economy",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _passangerWidget() {
    return Container(
      padding: const EdgeInsets.only(
        top: 8.0,
        left: 15,
        bottom: 8.0,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: Colors.grey.withOpacity(0.2),
          ),
        ),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Passengers",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.man,
                    size: 18,
                  ),
                  Text(
                    "1",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Icon(
                    Icons.man,
                    size: 17,
                  ),
                  Text(
                    "0",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Icon(
                    Icons.man,
                    size: 16,
                  ),
                  Text(
                    "0",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
