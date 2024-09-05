import '../../dependency_injection.dart' as di;
import 'shared_preference.dart';

class AppInitializers {
  static Future init() async {
    print('App Initializer ');

    di.init();
    await ShardPrefHelper.init();
  }
}
