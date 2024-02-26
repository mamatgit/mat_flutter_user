import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';
import 'package:latihan_tugas/kembali.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TamuFormPage(),
    );
  }
}

class TamuFormPage extends StatelessWidget {
  TamuFormPage({Key? key}) : super(key: key);
  

  final TextEditingController nama = TextEditingController();
  final DateTime tanggal = new DateTime.now();
  final TextEditingController email = TextEditingController();
  final TextEditingController gender = TextEditingController();
  final TextEditingController lembaga = TextEditingController();
  final TextEditingController keperluan = TextEditingController();

  

  Future kirimData() async {
    var url = Uri.http("localhost","flutter_koneksi/simpan.php");
    var response = await http.post(url, body: {
      "nama": nama.text,
      "tanggal": tanggal.toString(),
      "email": email.text,
      "gender": gender.text,
      "lembaga": lembaga.text,
      "keperluan": keperluan.text,
    });

    var data = json.decode(response.body);
    print(data);
    // if (data.toString() == 'berhasil') {
    //   print("berhasil");
    // } else {
    //   print("error");
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Buku Tamu",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
          
          ),
          backgroundColor: Colors.teal,
        leading: Icon(Icons.account_circle_outlined),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(20),
              child: TextField(
                controller: nama,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Nama',
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: TextField(
                controller: email,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email / No Tlp',
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: TextField(
                controller: gender,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Jenis Kelamin',
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: TextField(
                controller: lembaga,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Lembaga',
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: TextField(
                controller: keperluan,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Keperluan',
                ),
              ),
            ),
           Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => KembaliPage()),
                  );
                },
                child: Text(
                  "Selesai",
                  style: GoogleFonts.roboto(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
