import 'package:flutter/material.dart';
import '../models/weather_model.dart';
import '../services/weather_service.dart';
import '../widgets/show_alert_dialog.dart';

TextStyle kTextFieldStyle = TextStyle(
  decorationColor: Colors.red,
  color: Colors.blueGrey,
);

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  bool isLoading;
  TextEditingController cityController;
  @override
  void initState() {
    super.initState();
    cityController = TextEditingController();
    isLoading = false;
  }

  @override
  void dispose() {
    cityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: isLoading
            ? Center(child: CircularProgressIndicator())
            : Container(
                padding: EdgeInsets.all(30),
                color: Colors.blue.shade100,
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.location_on_sharp,
                          size: 50,
                          color: Colors.blue.shade600,
                        ),
                        SizedBox(height: 30),
                        Text(
                          'เมือง / ประเทศ',
                          style: TextStyle(
                            color: Color.fromARGB(255, 54, 143, 226),
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'City / Country',
                          style: TextStyle(
                            color: Color.fromARGB(255, 43, 202, 223),
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'กรอกชื่อเมือง หรือ ชื่อประเทศ:',
                            focusColor: Colors.pink,
                            labelStyle: kTextFieldStyle,
                            prefixIcon: Icon(
                              Icons.location_city,
                              color: Colors.blueGrey,
                            ),
                            fillColor: Colors.blueGrey,
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              borderSide: BorderSide(color: Colors.blueGrey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 5, 74, 223)),
                            ),
                          ),
                          controller: cityController,
                          autofocus: true,
                          autocorrect: false,
                          style: kTextFieldStyle,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Color.fromARGB(255, 245, 116, 107),
                                    onPrimary: Colors.black),
                                child: Text('ยกเลิก'),
                                onPressed: () {
                                  Navigator.of(context).pop(null);
                                }),
                            SizedBox(
                              width: 10,
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  onPrimary: Colors.black),
                              child: Text('ตกลง'),
                              onPressed: () async {
                                setState(() {
                                  isLoading = true;
                                });
                                try {
                                  var jsonParsed =
                                      await WeatherService.getByCity(
                                          cityName: cityController.text,
                                          countryCode: '');
                                  WeatherModel weatherData =
                                      WeatherModel.fromJson(
                                          jsonParsed: jsonParsed);
                                  Navigator.of(context).pop(weatherData);
                                } catch (e) {
                                  await showAlertDialog(
                                    context,
                                    title: 'ข้อผิดพลาด',
                                    content: 'ไม่พบชื่อเมือง/ประเทศ ที่คุณกรอก',
                                    defaultActionText: 'ตกลง',
                                  );
                                  cityController.clear();
                                }
                                setState(() {
                                  isLoading = false;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
