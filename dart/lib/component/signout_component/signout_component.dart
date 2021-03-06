part of security_monkey;

@Component(
        selector: 'signout',
        templateUrl: 'packages/security_monkey/component/signout_component/signout_component.html',
        cssUrl: const ['css/bootstrap.min.css'],
        publishAs: 'cmp')
class SignoutComponent {
    final Http _http;
    Scope scope;
    bool complete = false;
    bool error = false;
    bool loading = true;

    SignoutComponent(this._http, this.scope) {
        String url = '$API_HOST/logout';
        print("Signing Out...");
        _http.get(url, withCredentials: true).then((HttpResponse response) {
            print("Sign Out Complete");
            complete = true;
            loading = false;
            scope.rootScope.broadcast("username-change", "");
        }).catchError((error) {
            print("Error Signing Out $error");
            error = true;
            loading = false;
        });
    }
}
