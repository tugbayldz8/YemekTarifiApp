import 'package:bugun_ne_yesem/draww.dart';
import 'package:bugun_ne_yesem/services/status_service.dart';
import 'package:bugun_ne_yesem/video.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Tariflerim extends StatefulWidget {
  const Tariflerim({Key? key}) : super(key: key);

  @override
  State<Tariflerim> createState() => _TariflerimState();
}

class _TariflerimState extends State<Tariflerim> {
  StatusService _statusService = StatusService();
  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return StreamBuilder<QuerySnapshot>(
      stream: _statusService.getStatus(),
      builder: (context, snaphot) {
        return !snaphot.hasData
            ? CircularProgressIndicator()
            : Scaffold(
                drawer: Draww(),
                appBar: AppBar(
                  centerTitle: true,
                  title: Text('Projeler'),
                ),
                body: Scrollbar(
                  thickness: 10,
                  controller: _scrollController,
                  child: ListView.builder(
                      itemCount: snaphot.data!.docs.length,
                      itemBuilder: (context, index) {
                        DocumentSnapshot mypost = snaphot.data!.docs[index];

                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 300,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.red, width: 2),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: SingleChildScrollView(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Yemek Adı:\t',
                                            style: TextStyle(
                                                color: Colors.red.shade900,
                                                fontSize: 22,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            "${mypost['name']}",
                                            style: TextStyle(
                                              fontSize: 22,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ]),
                                    SizedBox(height: 5),
                                    Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Yemek Tarifi:\t',
                                            style: TextStyle(
                                                color: Colors.red.shade900,
                                                fontSize: 22,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            "${mypost['tarif']}",
                                            style: TextStyle(
                                              fontSize: 15,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ]),
                                    SizedBox(height: 5),
                                    Center(
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      VideoPage()));
                                        },
                                        child: Text("Tarif Videosu"),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              );
      },
    );
  }
}
