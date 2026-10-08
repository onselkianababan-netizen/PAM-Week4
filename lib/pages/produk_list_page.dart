import 'package:flutter/material.dart';

import '../models/produk.dart';

/// [TUGAS 1 - HALAMAN DAFTAR PRODUK]
/// Menampilkan produk dalam ListView (satu baris per produk).
/// Halaman ini hanya menampilkan data; state-nya dipegang oleh MainPage.
class ProdukListPage extends StatelessWidget {
  final List<Produk> produk;
  final void Function(Produk) onTapProduk;
  final void Function(Produk) onHapusProduk;

  const ProdukListPage({
    super.key,
    required this.produk,
    required this.onTapProduk,
    required this.onHapusProduk,
  });

  @override
  Widget build(BuildContext context) {
    if (produk.isEmpty) {
      return const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.inventory_2_outlined, size: 64, color: Colors.grey),
            SizedBox(height: 12),
            Text('Belum ada produk. Tekan "Tambah Produk".'),
          ],
        ), // Column
      ); // Center
    }

    return ListView.separated(
      // padding bawah besar supaya item terakhir tidak tertutup tombol (FAB)
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 88),
      itemCount: produk.length,
      separatorBuilder: (_, __) => const SizedBox(height: 8),
      itemBuilder: (context, index) {
        final item = produk[index];
        return Card(
          margin: EdgeInsets.zero,
          child: ListTile(
            leading: CircleAvatar(child: Icon(item.ikon)),
            title: Text(item.nama),
            subtitle: Text(formatRupiah(item.harga)),
            trailing: IconButton(
              icon: const Icon(Icons.delete_outline, color: Colors.red),
              onPressed: () => onHapusProduk(item),
            ),
            onTap: () => onTapProduk(item),
          ), // ListTile
        ); // Card
      },
    ); // ListView.separated
  }
}