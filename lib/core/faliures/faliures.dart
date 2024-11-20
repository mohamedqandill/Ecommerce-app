abstract class RouteFailures{

  String message;
  RouteFailures(this.message);
  @override
  String toString() {
    // TODO: implement toString
    return message;
  }

}

class RouteRemoteFailures extends RouteFailures{
  RouteRemoteFailures(super.message);

  @override
  String toString() {
    // TODO: implement toString
    return super.message;
  }
}
class RouteInvalidCredintailFailures extends RouteFailures{
  RouteInvalidCredintailFailures(super.message);

  @override
  String toString() {
    // TODO: implement toString
    return super.message;
  }
}
class RouteLocalFailures extends RouteFailures{
  RouteLocalFailures(super.message);

  @override
  String toString() {
    // TODO: implement toString
    return super.message;
  }
}

