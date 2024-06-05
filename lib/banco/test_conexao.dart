import 'dart:developer';

import 'package:flutter_application_1/banco/test_mongo_service.dart';
import 'package:mongo_dart/mongo_dart.dart';

class MongoDatabase {
  static Db? db;
  static DbCollection? userCollection;

  static Future<void> connect() async {
    db = await Db.create(MONGO_CONN_URL);
    await db!.open();
    userCollection = db!.collection(USER_COLLECTION);
    print('Conectado ao MongoDB');
  }

  static Future<Map<String, dynamic>?> authenticateProfessor(
      String login, String password) async {
    try {
      print('Tentando autenticar: login=$login, password=$password');
      final professor = await userCollection!
          .findOne(where.eq('Login', login).eq('Senha', password));
      print('Resultado da consulta: $professor');
      return professor;
    } catch (e) {
      print('Erro ao autenticar: $e');
      return null;
    }
  }
}
