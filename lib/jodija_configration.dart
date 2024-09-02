import 'package:JoDija_DataSource/source/http/crud_http_sources.dart';
import 'package:firebase_core/firebase_core.dart';
abstract class DataSourceConfigration {
  static AppType appType = AppType.App;
  static EnvType envType = EnvType.dev;
  static BackendState backendState = BackendState.remote;

    Future FirebaseInit() ;
  Future backenRoutsdInit() ;


}
enum AppType { DashBord, App }

enum EnvType { localDev, dev, prod }

enum BackendState { local, remote }