import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:patinha_perdida/pages/encontrados.dart';
import 'package:patinha_perdida/pages/home.dart';
import 'package:patinha_perdida/widgets/header.dart';
import 'package:patinha_perdida/widgets/progress.dart';

class EncontradosTela extends StatelessWidget {
  final postId;
  final userId;

  const EncontradosTela({Key? key, this.userId, this.postId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: encontradosRef
          .doc(userId)
          .collection("userEncontrados")
          .doc(postId)
          .get(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return circularProgress();
        }
        Encontrados encontrados = Encontrados.fromDocument(snapshot.data!);
        return Center(
          child: Scaffold(
            appBar: header(context, titleText: "Encontrado"),
            body: ListView(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 1,
                  child: encontrados,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
