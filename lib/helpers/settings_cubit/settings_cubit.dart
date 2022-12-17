import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rest_list/models/settings_item.dart';

// part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsItem> {
  SettingsCubit() : super(SettingsItem.values.first);

  setActiveItem(SettingsItem item) {
    emit(item);
  }
}
