import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rent_project/feature/screen/Tenants/model/add_new_tenant_model.dart';

class TenantServices {

  static Future createTenant({
    required NewTenantModel newTenantModel,
  }) async {
    final docsUser = FirebaseFirestore.instance.collection("newTenant").doc();
    newTenantModel.id = docsUser.id;
    final json = newTenantModel.toJson();

    var data = await docsUser
        .set(json)
        .then((value) => print("User Added"))
        .catchError(
          (error) => print("Failed to add User"),
    );
    return data;
  }


  static Stream<List<NewTenantModel>> readNewTenant() =>
      FirebaseFirestore.instance.collection("newTenant").snapshots().map((
          snapshot) =>
          snapshot.docs.map((doc) => NewTenantModel.fromJson(doc.data()))
              .toList());
}
