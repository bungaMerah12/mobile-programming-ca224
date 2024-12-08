import 'package:flutter/material.dart';
import 'create_comment.dart'; // Pastikan path sesuai dengan file CreateCommentPage

class ListCommentsPage extends StatefulWidget {
  const ListCommentsPage({super.key});

  @override
  State<ListCommentsPage> createState() => _ListCommentsPageState();
}

class _ListCommentsPageState extends State<ListCommentsPage> {
  // Daftar komentar awal
  final List<Map<String, String>> _comments = [
    {"name": "Andi", "comment": "Mantap!"},
    {"name": "Budi", "comment": "Keren banget."},
    {"name": "Citra", "comment": "Inspiratif sekali."},
    {"name": "Dewi", "comment": "Suka banget kontennya!"},
  ];

  // Fungsi untuk menambahkan komentar baru
  void _addComment(String name, String comment) {
    setState(() {
      _comments.add({"name": name, "comment": comment});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Komentar"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: _comments.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.primaries[index % Colors.primaries.length],
              child: Text(
                _comments[index]["name"]![0].toUpperCase(), // Inisial nama
                style: const TextStyle(color: Colors.white),
              ),
            ),
            title: Text(_comments[index]["name"]!),
            subtitle: Text(_comments[index]["comment"]!),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Navigasi ke halaman Create Comment
          final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CreateCommentPage(),
            ),
          );

          // Periksa apakah data valid dan tambahkan komentar baru
          if (result != null && result is Map<String, String>) {
            _addComment(result["name"]!, result["comment"]!);
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}