import 'package:flutter/material.dart';

class CreateCommentPage extends StatelessWidget {
  const CreateCommentPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController commentController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Tambah Komentar"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: "Nama",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: commentController,
              decoration: const InputDecoration(
                labelText: "Komentar",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Kembalikan data ke halaman sebelumnya
                if (nameController.text.isNotEmpty &&
                    commentController.text.isNotEmpty) {
                  Navigator.pop(context, {
                    "name": nameController.text,
                    "comment": commentController.text,
                  });
                }
              },
              child: const Text("Kirim"),
            ),
          ],
        ),
      ),
    );
  }
}