import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  Failure([List properties = const []]);
}

class ServerFailure extends Failure {
  @override
  List<Object> get props => throw UnimplementedError();
}
