import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';
import 'package:preconditions/preconditions.dart';

var _log = Logger("Preconditions");

final PreconditionsRepository preconditionsRepository =
    PreconditionsRepository();
final _repo = preconditionsRepository;

var preconditionIdConnected = PreconditionId("connected");

bool get preconditionIsOnline =>
    _repo.getPrecondition(preconditionIdConnected)!.status.isSatisfied;

void registerAndVerifyAllPreconditions() {
  _registerOnlinePrecondition();
  preconditionsRepository.evaluatePreconditions();
}

void _registerOnlinePrecondition() {
  FutureOr<PreconditionStatus> _isOnlineImpl() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      return PreconditionStatus.satisfied();
    }
    return PreconditionStatus.unsatisfied();
  }

  FutureOr<PreconditionStatus> _isConnectedImpl() async {
    // Should be run only when "is online"
    var connected =
        (await http.get(Uri.parse("https://www.gstatic.com/generate_204")))
                .statusCode ==
            204;
    return PreconditionStatus.fromBoolean(connected);
  }

  _repo.registerPrecondition(PreconditionId("_online"), _isOnlineImpl);

  _repo.registerPrecondition(
    preconditionIdConnected,
    _isConnectedImpl,
    dependsOn: [PreconditionId("__online")],
    satisfiedCache: Duration(minutes: 5),
    dependenciesStrategy: DependenciesStrategy.unsatisfiedOnUnsatisfied,
  );

  Connectivity().onConnectivityChanged.listen((_) {
    _repo.evaluatePreconditionById(preconditionIdConnected);
  });
}
