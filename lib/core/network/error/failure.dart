import 'package:equatable/equatable.dart';

abstract class NetworkFailure extends Equatable {
  final String message;
  const NetworkFailure({required this.message});
  @override
  List<Object> get props => [];
}

// General failures
class ServerFailure extends NetworkFailure {
  final dynamic code;
  const ServerFailure({required super.message, this.code});
}

class CacheFailure extends NetworkFailure {
  const CacheFailure({required super.message});
}

class ValidationFailure extends NetworkFailure {
  const ValidationFailure({required super.message});
}
