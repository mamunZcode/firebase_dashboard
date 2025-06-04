import 'package:flutter/material.dart';

import 'service/firestore_service.dart';
class firestore_docs extends ChangeNotifier{

  List<MyDocument> _documents = [];

  List<MyDocument> get documents => _documents;

  FireStoreService firestoreService = FireStoreService();

  void listenToDocuments(String userId) {
    firestoreService.listenToDocuments(userId, (documents) {
      _documents = documents;
      notifyListeners();
    });
  }

  void updateDocuments(List<MyDocument> newDocuments) {
    _documents = newDocuments;
    notifyListeners(); // Notify listeners about the change
  }

  void deleteDocument(MyDocument document, String uid) async {
    var firestoreService = FireStoreService();
    await firestoreService.deleteDocument(uid, document.doc_id);
  }

  void removeAllData() {
    _documents.clear();
    notifyListeners();
  }

}
class MyDocument{
  late final String id;
  late final String doc_id;
  late final String name;
  late final String? role;

  MyDocument({required this.doc_id,required this.name,required this.id,required this.role});

  factory MyDocument.fromFirestore(Map<String, dynamic> data){
    return MyDocument(
      id: data['id'] as String,
      doc_id: data['doc_id'] as String,
      name: data['name'] as String,
      role: data['role'] as String?,
    );
  }
}