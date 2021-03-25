import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kalkulator/angka_akhir.dart';
import 'package:kalkulator/angka_awal.dart';
import 'package:provider/provider.dart';

class HomeKalkulator extends StatefulWidget {
  @override
  _HomeKalkulatorState createState() => _HomeKalkulatorState();
}

class _HomeKalkulatorState extends State<HomeKalkulator> {

  TextEditingController angkaPertama = new TextEditingController();
  TextEditingController angkaTerakhir= new TextEditingController();

  List primaList = [];
  String msg = "";
  
  Future<List> cariPrima(String awal, String akhir) async {
    final int angkaAwal = int.parse(awal);
    final int angkaAkhir = int.parse(akhir);
    int i;
    setState(() {
      for(i=angkaAwal; i<=angkaAkhir; i++){
        if(i>1 && i == 2){
          primaList.add('${i}');
        }else if(i>2 && i == 3){
          primaList.add('${i}');
        }else if(i>3 && i%2 != 0 && i%3 != 0){
          primaList.add('${i}');
        }
      }
      json.encode(primaList);
    });

    angkaPertama.clear();
    angkaTerakhir.clear();

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    primaList = [];
    print("AWAL ${primaList.length}");
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kalkulator Prima"),
        leading: FlatButton(
          child: Icon(Icons.account_circle),
          onPressed: (){
            Navigator.pushNamed(context, 'screens/profile');
          },
        ),
      ),
      body: SingleChildScrollView(
        // PENGGHUNAAN STATE MANAGEMENT PROVIDER
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider<AngkaAwal>(builder: (context) => AngkaAwal(),),
            ChangeNotifierProvider<AngkaAkhir>(builder: (context) => AngkaAkhir(),)
          ],
          child: Container(
            padding: EdgeInsets.only(left: 40, right: 40, top: 100),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: angkaPertama,
                  inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: 'Masukan Angka Pertama',
                      border: OutlineInputBorder()
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 10)),
                TextFormField(
                  controller: angkaTerakhir,
                  inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: 'Masukan Angka Terakhir',
                      border: OutlineInputBorder()
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 20)),
                SizedBox(
                  width: double.infinity,
                  height: 50.0,
                  child: Consumer<AngkaAwal>(
                    builder: (context, angkaAwal, _) => Consumer<AngkaAkhir>(
                      builder: (context, angkaAkhir, _) => RaisedButton(
                        child: Text("Submit", style: TextStyle(color: Colors.white),),
                        color: Colors.blue,
                        onPressed: (){
                          if(int.parse(angkaPertama.text) > int.parse(angkaTerakhir.text)){
                            setState(() {
                              msg = "Angka pertama harus lebih besar daripada angka terakhir";
                            });
                          }else{
                            angkaAwal.angkaAwal = int.parse(angkaPertama.text);
                            angkaAkhir.angkaAkhir = int.parse(angkaTerakhir.text);
                            cariPrima(angkaPertama.text, angkaTerakhir.text);
                          }

                        },
                      ),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 10)),
                Text(msg, style: TextStyle(color: Colors.red),),
                Padding(padding: EdgeInsets.only(top: 50)),
                //PENGGUNAAN STATE MANAGEMENT PROVIDER
                Text("Yang termasuk bilangan prima dari "),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Angka Pertama"),
                    Container(
                      padding: EdgeInsets.all(20),
                      child: Consumer<AngkaAwal>(
                        builder: (context, angkaAwal, _) =>
                            Center(
                              child: Text("${angkaAwal.angkaAwal.toString()}", style: TextStyle(fontSize: 20, color: Colors.green),),
                            ),
                      ),
                    ),
                    Text("Angka Terakhir"),
                    Container(
                      padding: EdgeInsets.all(20),
                      child: Consumer<AngkaAkhir>(
                        builder: (context, angkaAkhir, _) =>
                            Center(
                              child: Text("${angkaAkhir.angkaAkhir.toString()}", style: TextStyle(fontSize: 20, color: Colors.red),),
                            ),
                      ),
                    )
                  ],
                ),
                Text("adalah : "),
                //END OF PENGGUNAAN STATE MANAGEMENT PROVIDER
                Container(
                  height: 300,
                  child: primaList.length != 0 ?
                  ListView.builder(
                    itemCount: primaList.length,
                    itemBuilder: (BuildContext context, int index){
                      return Container(
                        padding: EdgeInsets.only(top: 10),
                        child: Row(
                          children: [
                            Padding(padding: EdgeInsets.only(left: 30)),
                            Text(primaList[index], style: TextStyle(color: Colors.black54, fontSize: 20),),
                            Padding(padding: EdgeInsets.only(left: 30)),
                            Text("Merupakan bil. prima.")
                          ],
                        ),
                      );
                    },
                  ) :
                  Container(
                    child: Center(
                      child: Text("Masukan Angka Terlebih dahulu."),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}