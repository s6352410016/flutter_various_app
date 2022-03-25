import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class CarBuyUI extends StatefulWidget {
  const CarBuyUI({Key? key}) : super(key: key);

  @override
  State<CarBuyUI> createState() => _CarBuyUIState();
}

class _CarBuyUIState extends State<CarBuyUI> {

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

  int downValue = 1;

  List<DropdownMenuItem<String>> items = [
    '1 ปี (12 งวด)',
    '2 ปี (24 งวด)',
    '3 ปี (36 งวด)',
    '4 ปี (48 งวด)',
    '5 ปี (60 งวด)',
    '6 ปี (72 งวด)',
  ]
      .map((e) => DropdownMenuItem<String>(
            value: e,
            child: Text(e),
          ))
      .toList();

  String yearSep = '1 ปี (12 งวด)';

  String moneyDown = '0.00';
  String moneyJud = '0.00';
  String payPerMonth = '0.00';

  TextEditingController carPriceCtrl = TextEditingController(text: '');
  TextEditingController interestPerYearCtrl = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('Car Buy'),
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
                  height: 40.0,
                ),
                Text(
                  'คำนวณค่างวดรถ',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Icon(
                  FontAwesomeIcons.car,
                  color: Colors.purple,
                  size: 100.0,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  height: 5.0,
                  width: MediaQuery.of(context).size.width - 80.0,
                  color: Colors.purple,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'ข้อมูลรถ',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 40.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'ราคารถ (บาท)',
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 40.0,
                    right: 40.0,
                  ),
                  child: TextField(
                    controller: carPriceCtrl,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.purple,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.purple,
                        ),
                      ),
                      hintText: '0.00',
                      hintStyle: TextStyle(
                        color: Colors.grey[400],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 40.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'เงินดาวน์ (%)',
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 30.0,
                  ),
                  child: Row(
                    children: [
                      Radio(
                        onChanged: (value) {
                          setState(() {
                            downValue = int.parse(value.toString());
                          });
                        },
                        value: 1,
                        groupValue: downValue,
                        activeColor: Colors.purple,
                      ),
                      Text(
                        '10%',
                      ),
                      Radio(
                        onChanged: (value) {
                          setState(() {
                            downValue = int.parse(value.toString());
                          });
                        },
                        value: 2,
                        groupValue: downValue,
                        activeColor: Colors.purple,
                      ),
                      Text(
                        '20%',
                      ),
                      Radio(
                        onChanged: (value) {
                          setState(() {
                            downValue = int.parse(value.toString());
                          });
                        },
                        value: 3,
                        groupValue: downValue,
                        activeColor: Colors.purple,
                      ),
                      Text(
                        '30%',
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 40.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'จำนวนปีที่ผ่อน (ปี)',
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 40.0,
                    right: 40.0,
                  ),
                  child: DropdownButton(
                    isExpanded: true,
                    items: items,
                    onChanged: (value) {
                      setState(() {
                        yearSep = value.toString();
                      });
                    },
                    value: yearSep,
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 40.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'ดอกเบี้ย (%ปี)',
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 40.0,
                    right: 40.0,
                  ),
                  child: TextField(
                    controller: interestPerYearCtrl,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.purple,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.purple,
                        ),
                      ),
                      hintText: '0.00',
                      hintStyle: TextStyle(
                        color: Colors.grey[400],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  height: 5.0,
                  width: MediaQuery.of(context).size.width - 80,
                  color: Colors.purple,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'ผลลัพธ์',
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 40.0,
                    right: 40.0,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            if(carPriceCtrl.text.isEmpty){
                              showWarningDialog(context, 'ป้อนราคารถด้วย');
                            }else if(interestPerYearCtrl.text.isEmpty){
                              showWarningDialog(context, 'ป้อนดอกเบี้ยด้วย');
                            }else{

                              double downMoneyPay = 0;

                              if(downValue == 1){
                                downMoneyPay = double.parse(carPriceCtrl.text) * 10 / 100;       
                              }else if(downValue == 2){
                                downMoneyPay = double.parse(carPriceCtrl.text) * 20 / 100;
                              }else{
                                downMoneyPay = double.parse(carPriceCtrl.text) * 30 / 100;
                              }

                              setState(() {
                                var fm = NumberFormat('#,###,##0.00');
                                moneyDown = fm.format(downMoneyPay);
                              });

                              double judMoneyPay = double.parse(carPriceCtrl.text) - downMoneyPay;
                              setState(() {
                                var fm = NumberFormat('#,###,##0.00');
                                moneyJud = fm.format(judMoneyPay);
                              });

                              double calPayMoneyPerMonth = 0;
                              if(yearSep == '1 ปี (12 งวด)'){

                                double cp = double.parse(carPriceCtrl.text);
                                double inpy = double.parse(interestPerYearCtrl.text);
                                calPayMoneyPerMonth = (cp + (judMoneyPay * inpy / 100 * 1)) / 12;

                              }else if(yearSep == '2 ปี (24 งวด)'){

                                double cp = double.parse(carPriceCtrl.text);
                                double inpy = double.parse(interestPerYearCtrl.text);
                                calPayMoneyPerMonth = (cp + (judMoneyPay * inpy / 100 * 2)) / 24;

                              }else if(yearSep == '3 ปี (36 งวด)'){

                                double cp = double.parse(carPriceCtrl.text);
                                double inpy = double.parse(interestPerYearCtrl.text);
                                calPayMoneyPerMonth = (cp + (judMoneyPay * inpy / 100 * 3)) / 36;

                              }else if(yearSep == '4 ปี (48 งวด)'){

                                double cp = double.parse(carPriceCtrl.text);
                                double inpy = double.parse(interestPerYearCtrl.text);
                                calPayMoneyPerMonth = (cp + (judMoneyPay * inpy / 100 * 4)) / 48;

                              }else if(yearSep == '5 ปี (60 งวด)'){

                                double cp = double.parse(carPriceCtrl.text);
                                double inpy = double.parse(interestPerYearCtrl.text);
                                calPayMoneyPerMonth = (cp + (judMoneyPay * inpy / 100 * 5)) / 60;
                                
                              }else{
                                
                                double cp = double.parse(carPriceCtrl.text);
                                double inpy = double.parse(interestPerYearCtrl.text);
                                calPayMoneyPerMonth = (cp + (judMoneyPay * inpy / 100 * 6)) / 72;
                                
                              }

                              setState(() {
                                var fm = NumberFormat('#,###,##0.00');
                                payPerMonth = fm.format(calPayMoneyPerMonth);
                              });

                            }
                          },
                          child: Text('คำนวณ'),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.green,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15.0,
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              carPriceCtrl.text = '';
                              interestPerYearCtrl.text = '';
                              downValue = 1;
                              yearSep = '1 ปี (12 งวด)';
                              moneyDown = '0.00';
                              moneyJud = '0.00';
                              payPerMonth = '0.00';
                            });
                          },
                          child: Text('รีเซ็ท'),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 40.0,
                    right: 40.0,
                  ),
                  child: Row(
                    children: [
                      Text(
                        'เงินดาวน์ (บาท)',
                        style: TextStyle(
                          color: Colors.purple,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 40.0,
                    right: 40.0,
                  ),
                  child: Row(
                    children: [
                      Text(
                        moneyDown,
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 30.0,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 40.0,
                    right: 40.0,
                  ),
                  child: Row(
                    children: [
                      Text(
                        'ยอดจัดไฟแนนท์ (บาท)',
                        style: TextStyle(
                          color: Colors.purple,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 40.0,
                    right: 40.0,
                  ),
                  child: Row(
                    children: [
                      Text(
                        moneyJud,
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 30.0,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 40.0,
                    right: 40.0,
                  ),
                  child: Row(
                    children: [
                      Text(
                        'ค่างวดต่อเดือน (บาท)',
                        style: TextStyle(
                          color: Colors.purple,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 40.0,
                    right: 40.0,
                  ),
                  child: Row(
                    children: [
                      Text(
                        payPerMonth,
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 30.0,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 70.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
