import 'package:flutter/material.dart';

final Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: darkBlue),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: MyWidget(),
        ),
      ),
    );
  }
}

class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  
  //İlk olarak şuanki saati ve tarihi alalım
  DateTime secilenTarih = DateTime.now();
  TimeOfDay secilenSaat = TimeOfDay.fromDateTime(DateTime.now());


  @override
  Widget build(BuildContext context) {
    return Center(
      
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center
        ,children: [
        //Butona basılınca tarih ve zaman seçilecek
        FlatButton(child: Text("Tarihi ve saati seç"),onPressed: () async{
       secilenTarih =  await tarihSec(context);
       
       
        if(secilenTarih != null){
          secilenSaat = await saatSec(context);
        }
        
        if(secilenTarih != null && secilenSaat != null){
                setState(() {
//Durumu güncelleyelim ki seçilen tarihler gözüksün
        });
        }
      } ,),
        Text("Saat : ${secilenSaat.hour.toString()} : ${secilenSaat.minute.toString()}   Tarih : $secilenTarih"),
      ],),
    );
    
  }

   Future<TimeOfDay> saatSec(BuildContext context) {
    return showTimePicker(
            context: context, initialTime: TimeOfDay.now());
  }

  Future<DateTime> tarihSec(BuildContext context) {
    return showDatePicker(
        context: context,
        firstDate: DateTime.now(),
        initialDate: DateTime.now(),
        lastDate: DateTime(2023),
        builder: (BuildContext context, Widget child) {
          return Theme(
            data: ThemeData.dark(),
            child: child,
          );
        },
      );
  }
}
