
import '../../../constants/firabase_intences.dart';

class ScveUserDataSorece {
 static void saveUser(
      {required String name,
      required String email,
      required String phone,
      required String uid}) {
    try {
      FireSetup.users
          .doc(uid)
          .set({"email": email, "name": name, "phoneNuber": phone});
    } catch (e) {
      throw e;
    }
  }
}
