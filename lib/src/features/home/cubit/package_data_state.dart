
part of 'package_data_cubit.dart';

abstract class PackageDataState extends Equatable {
  const PackageDataState();

  @override
  List<Object?> get props => [];
}

class PackageInitial extends PackageDataState {
  const PackageInitial();
}

class PackageLoading extends PackageDataState {
  const PackageLoading();
}

class TopPackageLoaded extends PackageDataState {
  final PackagesDataModel? packagesDataModel;

  const TopPackageLoaded(this.packagesDataModel);

  @override
  List<Object?> get props => [packagesDataModel];
}
class PackageDataLoadingError extends PackageDataState {
  final String? error;

  const PackageDataLoadingError(this.error);

  @override
  List<Object?> get props => [error];
}