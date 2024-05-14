import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';
import 'package:preconditions/preconditions.dart';

var _log = Logger("Preconditions");

final PreconditionsRepository preconditionsRepository = PreconditionsRepository();
final _repo = preconditionsRepository;

var preconditionIdHasInternet = PreconditionId("hasInternet");
var _preconditionIdIsConnected = PreconditionId("_connected");

bool get preconditionIsConnected => _repo.getPrecondition(preconditionIdHasInternet)!.status.isSatisfied;

void registerAndVerifyAllPreconditions() {
  _registerConnectedPrecondition();
  preconditionsRepository.evaluatePreconditions();
}

void _registerConnectedPrecondition() {
  FutureOr<PreconditionStatus> _isConnectedImpl() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi) {
      return PreconditionStatus.satisfied();
    }
    return PreconditionStatus.failed();
  }

  FutureOr<PreconditionStatus> _hasInternetAccess() async {
    // Should be run only when "is connected"
    var hasAccess = (await http.get(Uri.parse("https://www.gstatic.com/generate_204"))).statusCode == 204;
    return PreconditionStatus.fromBoolean(hasAccess);
  }

  _repo.registerPrecondition(_preconditionIdIsConnected, _isConnectedImpl);

  _repo.registerPrecondition(
    preconditionIdHasInternet,
    _hasInternetAccess,
    dependsOn: [
      tight(_preconditionIdIsConnected),
    ],
    staySatisfiedCacheDuration: Duration(minutes: 5),
  );

  Connectivity().onConnectivityChanged.listen((_) {
    _repo.evaluatePreconditionById(preconditionIdHasInternet);
  });
}
