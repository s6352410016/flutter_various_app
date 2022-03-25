import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TemperatureUI extends StatefulWidget {
  const TemperatureUI({Key? key}) : super(key: key);

  @override
  State<TemperatureUI> createState() => _TemperatureUIState();
}

class _TemperatureUIState extends State<TemperatureUI> {
  int tmpGroup = 1;

  String result = '0.00';

  TextEditingController tmpCrtl = TextEditingController(text: ''); //ใช้ควบคุม TextField

  showWarningDialog(context, msg) {
  //เรียกใช้งานฟังก์ชัน showDialog
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Container(
            color: Colors.deepPurple,
            padding: EdgeInsets.only(
              top: 10.0,
              bottom: 10.0,
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'คำเตือน',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          content: Text(
            msg,
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'ตกลง',
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.deepPurple,
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Temperature'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 70.0,
                ),
                Icon(
                  FontAwesomeIcons.temperatureHigh,
                  size: 100,
                  color: Colors.red,
                ),
                SizedBox(
                  height: 50.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 50.0,
                    right: 50.0,
                  ),
                  child: TextField(
                    controller: tmpCrtl,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'อุณภูมิ',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: 'ป้อนอุณภูมิ (Cel หรือ Fah)',
                      labelStyle: TextStyle(
                        color: Colors.red,
                      ),
                      hintStyle: TextStyle(
                        color: Colors.grey[400],
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.deepOrange,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.deepOrange,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Radio(
                      activeColor: Colors.red,
                      onChanged: (value) {
                        setState(() {
                          tmpGroup = int.parse(value.toString());
                        });
                      },
                      value: 1,
                      groupValue: tmpGroup,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          tmpGroup = 1;
                        });
                      },
                      child: Text(
                        'แปลง Celcius เป็น Fahrenhite',
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Radio(
                      activeColor: Colors.red,
                      onChanged: (value) {
                        setState(() {
                          tmpGroup = int.parse(value.toString());
                        });
                      },
                      value: 2,
                      groupValue: tmpGroup,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          tmpGroup = 2;
                        });
                      },
                      child: Text(
                        'แปลง Fahrenhite เป็น Celcius',
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.0,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (tmpCrtl.text.isEmpty) {
                      showWarningDialog(context, 'ป้อนอุณภูมิด้วย!!!');
                    } else {
                      if(tmpGroup == 1){
                        double c = double.parse(tmpCrtl.text);
                        double f = (9 / 5 * c) + 32;
                        setState(() {
                          result = f.toStringAsFixed(2);
                        });
                      }else{
                        double f = double.parse(tmpCrtl.text);
                        double c = (f - 32) * 5 / 9;
                        setState(() {
                          result = c.toStringAsFixed(2);
                        });
                      }
                    }
                  },
                  child: Text(
                    'คำนวณ',
                  ),
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(
                      MediaQuery.of(context).size.width - 100.0,
                      50.0,
                    ),
                    primary: Colors.deepOrange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        50.0,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Text(
                  result,
                  style: TextStyle(
                    fontSize: 50.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrange,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
