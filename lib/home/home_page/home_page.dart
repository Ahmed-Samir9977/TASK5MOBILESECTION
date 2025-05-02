import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // 👈 Needed for Provider
import 'package:task/models/user_model.dart';
   // 👈 Your UserModel
import 'package:task/profile/profile_page/profile_page.dart';
import '../../first_screen.dart';
import '../home_widget/home_widget.dart';

class MyHomePage extends StatelessWidget {
  final String? title;
  final String? body;
  final List<File>? image;

  const MyHomePage({this.image, this.title, this.body, super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text("The ${title ?? "Tree"}"),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProfilePage()));
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: CircleAvatar(
                radius: 18,
                backgroundImage: user.imagePath.startsWith("assets")
                    ? AssetImage(user.imagePath)
                    : FileImage(File(user.imagePath)) as ImageProvider,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            image == null || image!.isEmpty
                ? Image.asset("assets/R.png", height: 300, width: 300)
                : Image.file(image![0],
                height: 300, width: 300, fit: BoxFit.cover),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(onPressed: () {}, icon: Icon(Icons.share)),
                favouriteWidget(),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                body ?? " hello",
                textAlign: TextAlign.justify,
              ),
            ),
            image == null || image!.isEmpty
                ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                MySeason(url: "assets/tree1.jpg"),
                MySeason(url: "assets/springTree.jpg"),
              ],
            )
                : SizedBox(
              height: 500,
              child: GridView.builder(
                itemBuilder: (context, index) => Image.file(
                  image![index],
                  height: 200,
                  width: 200,
                  fit: BoxFit.cover,
                ),
                itemCount: image!.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const firstScreen()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
