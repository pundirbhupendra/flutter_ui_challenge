import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_ui_challenge/src/features/home/model/package_data_model.dart';
import 'package:flutter_ui_challenge/src/repository/package_repository.dart';
part 'package_data_state.dart';

class PackageDataCubit extends Cubit<PackageDataState> {
  final PackageRepository _packageRepository;

  PackageDataCubit(this._packageRepository) : super(const PackageInitial());

  void loadPackage() async {
    try {
      emit(const PackageLoading());
      final packageData = await _packageRepository.fechPackageData();
      if (packageData == null) {
        emit(const PackageDataLoadingError("Data not found"));
      } else {
        emit(TopPackageLoaded(packageData));
      }
    } catch (e) {
      emit(PackageDataLoadingError(e.toString()));
    }
  }
}
