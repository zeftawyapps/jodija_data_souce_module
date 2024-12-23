import 'package:cloud_firestore/cloud_firestore.dart';

import '../../interface/user/base/actions.dart';
import '../../model/user/base_model/base_user_module.dart';
import '../../utilis/firebase/fireBase_exception_consts.dart';
import '../../utilis/models/remote_base_model.dart';
import '../../utilis/models/staus_model.dart';
import '../../utilis/result/result.dart';


class BaseProfilRebo{

  late IBaseAccountActions _accountActions;
  BaseProfilRebo(IBaseAccountActions accountActions){

     _accountActions = accountActions;
  }
   Future<Result<RemoteBaseModel, UsersBaseModel >> getProfile( String  uid   ) async {
    try {


      var profileMapData =    await _accountActions!.getDataByDoc(uid );
      UsersBaseModel  usersModel = UsersBaseModel . formJson(profileMapData);
      return  Result.data(usersModel);
    } on FirebaseException catch (e) {
      return  Result.error(
           RemoteBaseModel(message: handilExcepstons(e.code), status: StatusModel.error));
    }
  }
  Future< Result< RemoteBaseModel, UsersBaseModel >> editProfile(
      {UsersBaseModel? data  , String? id , Object? file  }) async {
    try {
       var result  =   await _accountActions.updateProfileData(id: id  !, mapData: data! .map
           , file:file   );
      UsersBaseModel  usersModel = UsersBaseModel . formJson(result);
      return  Result.data(usersModel);
    } on FirebaseException catch (e) {
      return  Result.error(
           RemoteBaseModel(message: handilExcepstons(e.code), status: StatusModel.error));
    }
  }
}