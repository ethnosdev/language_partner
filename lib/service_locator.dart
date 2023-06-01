import 'package:get_it/get_it.dart';
import 'package:language_partner/chat/chat_screen_manager.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerLazySingleton<ChatScreenManager>(() => ChatScreenManager());
}
