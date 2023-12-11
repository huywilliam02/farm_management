import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:itfsd/presentation/page/login/login.dart';

class PlanttrackingView extends StatefulWidget {
  const PlanttrackingView({Key? key}) : super(key: key);

  @override
  _PlanttrackingViewState createState() => _PlanttrackingViewState();
}

class _PlanttrackingViewState extends State<PlanttrackingView> {
  late List<Map<String, dynamic>> plantData;

  @override
  void initState() {
    super.initState();
    plantData = generatePlantData();
    startDataSimulation();
  }

  List<Map<String, dynamic>> generatePlantData() {
    final Random random = Random();
    final List<Map<String, dynamic>> data = [];

    for (int i = 0; i < 10; i++) {
      data.add({
        'temperature': random.nextInt(21) + 10,
        'humidity': (random.nextDouble() * 100).toStringAsFixed(2),
        'brightness': random.nextInt(101),
        'co2': random.nextInt(1001),
        'nh3': random.nextInt(101),
        'soil_moisture': (random.nextDouble() * 100).toStringAsFixed(2),
        'ec': random.nextInt(2001),
        'soil_temperature': random.nextInt(31) + 10,
        'conductivity': (random.nextDouble() * 10).toStringAsFixed(2),
        'ph': (random.nextDouble() * 14).toStringAsFixed(1),
        'water_ec': random.nextInt(2001),
        'water_ph': (random.nextDouble() * 14).toStringAsFixed(1),
        'water_temperature': random.nextInt(31) + 10,
        'salinity': (random.nextDouble() * 10).toStringAsFixed(1),
        'timestamp': DateTime.now().subtract(Duration(minutes: i * 5)),
      });
    }

    return data;
  }

  void startDataSimulation() {
    const Duration interval = Duration(minutes: 5);
    Timer.periodic(interval, (timer) {
      setState(() {
        plantData = updatePlantData();
      });
    });
  }

  List<Map<String, dynamic>> updatePlantData() {
    final Random random = Random();
    final List<Map<String, dynamic>> updatedData = [];

    for (int i = 0; i < plantData.length; i++) {
      updatedData.add({
        'temperature': random.nextInt(21) + 10,
        'humidity': (random.nextDouble() * 100).toStringAsFixed(2),
        'brightness': random.nextInt(101),
        'co2': random.nextInt(1001),
        'nh3': random.nextInt(101),
        'soil_moisture': (random.nextDouble() * 100).toStringAsFixed(2),
        'ec': random.nextInt(2001),
        'soil_temperature': random.nextInt(31) + 10,
        'conductivity': (random.nextDouble() * 10).toStringAsFixed(2),
        'ph': (random.nextDouble() * 14).toStringAsFixed(1),
        'water_ec': random.nextInt(2001),
        'water_ph': (random.nextDouble() * 14).toStringAsFixed(1),
        'water_temperature': random.nextInt(31) + 10,
        'salinity': (random.nextDouble() * 10).toStringAsFixed(1),
        'timestamp': DateTime.now(),
      });
    }

    return updatedData;
  }

  String formatTimestamp(DateTime timestamp) {
    return DateFormat('yyyy-MM-dd HH:mm:ss').format(timestamp);
  }

  Widget buildMetricCard(String title, String value) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Text(
          title,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          value,
          style: TextStyle(
              color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w700),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.background_color,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back_ios_new),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Expanded(
                  flex: 18,
                  child: Center(
                    child: Text(
                      'Theo dõi cây trồng',
                      style:
                          TextStyle(fontWeight: FontWeight.w800, fontSize: 18),
                    ),
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Expanded(child: SizedBox())
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Image.network(
                        "https://baotayninh.vn/image/fckeditor/upload/2019/20191027/images/v2.jpg"),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          formatTimestamp(plantData[0]['timestamp']),
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Không khí",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 90,
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          buildMetricCard(
                              "Nhiệt độ", "${plantData[0]['temperature']} °C"),
                          buildMetricCard(
                              "Độ ẩm", "${plantData[0]['humidity']} %"),
                          buildMetricCard(
                              "Độ sáng", "${plantData[0]['brightness']} lux"),
                          buildMetricCard("CO2", "${plantData[0]['co2']} ppm"),
                          buildMetricCard("NH3", "${plantData[0]['nh3']} ppm"),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Đất",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 90,
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          buildMetricCard("Độ ẩm đất",
                              "${plantData[0]['soil_moisture']} %"),
                          buildMetricCard("EC (ppm)", "${plantData[0]['ec']}"),
                          buildMetricCard("Nhiệt độ đất",
                              "${plantData[0]['soil_temperature']} °C"),
                          buildMetricCard("Dẫn điện",
                              "${plantData[0]['conductivity']} dS/m"),
                          buildMetricCard("pH", "${plantData[0]['ph']}"),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Nước",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 90,
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          buildMetricCard(
                              "Dẫn điện", "${plantData[0]['water_ec']} dS/m"),
                          buildMetricCard("pH", "${plantData[0]['water_ph']}"),
                          buildMetricCard("Nhiệt độ nước",
                              "${plantData[0]['water_temperature']} °C"),
                          buildMetricCard(
                              "Độ mặn", "${plantData[0]['salinity']} ppt"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
