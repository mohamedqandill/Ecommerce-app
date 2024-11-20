abstract class RouteExceptions{

  String message;
  RouteExceptions(this.message);
  @override
  String toString() {
    // TODO: implement toString
    return message;
  }

}

class RouteRemoteExceptions extends RouteExceptions{
  RouteRemoteExceptions(super.message);

  @override
  String toString() {
    // TODO: implement toString
    return super.message;
  }
}
class RouteInvalidCredintailExceptions extends RouteExceptions{
  RouteInvalidCredintailExceptions(super.message);

  @override
  String toString() {
    // TODO: implement toString
    return super.message;
  }
}
class RouteLocalExceptions extends RouteExceptions{
  RouteLocalExceptions(super.message);

  @override
  String toString() {
    // TODO: implement toString
    return super.message;
  }
}

