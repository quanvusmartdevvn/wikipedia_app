
import 'package:wikipedia_app/data/sources/repositories/home/home_repository.dart';
import 'package:wikipedia_app/data/sources/repositories/home/home_repository_impl.dart';
import 'package:wikipedia_app/data/sources/repositories/wikipedia_detail/wiki_repository.dart';
import 'package:wikipedia_app/data/sources/repositories/wikipedia_detail/wiki_repository_impl.dart';

class Injector {
  static final Injector _singleton = Injector._internal();

  factory Injector() {
    return _singleton;
  }

  Injector._internal();

  HomeRepository get onSearch => HomeRepositoryImpl();
  WikiRepository get onGetDetail => WikiRepositoryImpl();
}
