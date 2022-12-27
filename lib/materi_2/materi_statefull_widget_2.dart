import 'package:flutter/material.dart';

class MateriStatefullWidget2 extends StatelessWidget {
  const MateriStatefullWidget2({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyWidget(),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  final namaTextController = TextEditingController();
  final hargaTextController = TextEditingController();
  final deskripsiTextController = TextEditingController();

  List<Barang> barang = [
    Barang(
      nama: "Topi",
      harga: 20000,
      deskripsi: "Topi murah meriah untuk melindungi dari panas",
    ),
    Barang(
      nama: "Tas",
      harga: 300000,
      deskripsi: "Tas bisa muat banyak. tas level 3",
    ),
  ];

  void tambahBarang(String nama, double harga, String deskripsi) {
    setState(() {
      final barangBaru = Barang(nama: nama, harga: harga, deskripsi: deskripsi);
      barang.add(barangBaru);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              visualDensity: VisualDensity.comfortable,
              title: Text(barang[index].nama),
              subtitle: Text(barang[index].deskripsi),
              trailing: Text(
                barang[index].harga.toString(),
              ),
            ),
          );
        },
        itemCount: barang.length,
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            showDialog(
              context: context,
              builder: ((context) {
                return dialogForm();
              }),
            );
          }),
    );
  }

  Dialog dialogForm() {
    return Dialog(
      child: SizedBox(
        height: 200,
        width: 300,
        child: Column(
          children: [
            TextField(
              controller: namaTextController,
            ),
            TextField(
              controller: hargaTextController,
            ),
            TextField(
              controller: deskripsiTextController,
            ),
            MaterialButton(
              onPressed: () {
                tambahBarang(
                  namaTextController.text,
                  double.parse(hargaTextController.text),
                  deskripsiTextController.text,
                );
                Navigator.pop(context);
              },
              color: Colors.red,
            )
          ],
        ),
      ),
    );
  }
}

class Barang {
  final String nama;
  final double harga;
  final String deskripsi;

  Barang({
    required this.nama,
    required this.harga,
    required this.deskripsi,
  });
}
