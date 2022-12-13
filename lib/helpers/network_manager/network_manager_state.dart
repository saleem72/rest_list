// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'network_manager_cubit.dart';

enum ConnectionType { wifi, mobile, offline }

class NetworkManagerState extends Equatable {
  final bool isConnected;
  final ConnectionType type;

  const NetworkManagerState({
    required this.isConnected,
    required this.type,
  });

  @override
  List<Object?> get props => [isConnected, type];

  @override
  bool get stringify => true;

  @override
  String toString() =>
      'NetworkManagerState(isConnected: $isConnected, ConnectionType: ${type.toString()})';
}
