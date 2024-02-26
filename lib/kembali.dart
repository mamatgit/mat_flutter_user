import 'package:flutter/material.dart';
import 'package:latihan_tugas/main.dart';

class KembaliPage extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         backgroundColor: Colors.teal,
        leading: Icon(Icons.book),
        title: Text("Data Selesai"),
      ),
      body: Center(
        child: Column(
          children: [
            Text("DATA ANDA TELAH DI SIMPAN ",
            style: TextStyle(
          fontWeight: FontWeight.bold, 
          fontStyle: FontStyle.italic, 
        ),
        
      ),
            
            ElevatedButton(
                onPressed: () {
                 Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
                },
                child: Text("OK"))
          ],
        ),
      ),
    );
  }
}
