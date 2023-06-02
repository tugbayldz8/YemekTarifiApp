import 'package:bugun_ne_yesem/profilim.dart';
import 'package:bugun_ne_yesem/services/status_service.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class TarifEkle extends StatefulWidget {
  @override
  _TarifEkleState createState() => _TarifEkleState();
}

class _TarifEkleState extends State<TarifEkle> {
  TextEditingController nameController = TextEditingController();
  TextEditingController tarifController = TextEditingController();

  StatusService _statusService = StatusService();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.orangeAccent,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("Tarif Ekle"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 350,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Yemek Adı:  '),
                    Expanded(
                        child: TextField(
                      controller: nameController,
                    )),
                  ],
                ),
              ),
              Container(
                width: 350,
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Yemek Tarifi:  '),
                    Expanded(
                      child: Container(
                        height: 300,
                        child: SingleChildScrollView(
                          child: TextField(
                            controller: tarifController,
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8, bottom: 25),
                child: InkWell(
                  onTap: () {
                    _statusService
                        .addStatus(
                            tarifController.text, nameController.text ?? '')
                        .then((value) {
                      Fluttertoast.showToast(
                          msg: "Yeni Tarif eklendi!",
                          timeInSecForIosWeb: 2,
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          backgroundColor: Colors.grey[600],
                          textColor: Colors.white,
                          fontSize: 14);
                    });

                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Profilim()));
                  },
                  child: Container(
                    width: 200,
                    padding: EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 2),
                        //color: colorPrimaryShade,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Center(
                          child: Text(
                        "Ekle",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      )),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
