import '../utils/path_provider.dart';

PreferredSizeWidget commonAppbar(int counter) {
  return AppBar(
    leading: InkWell(child: Icon(Icons.menu)),
    backgroundColor: white,
    elevation: 0.0,
    centerTitle: true,
    title: SizedBox(
      height: 50.0,
      width: Get.width,
      child: Image.asset(AppAssets.logo),
    ),
    actions: <Widget>[
      // Using Stack to show Notification Badge
      Stack(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // setState(() {
              //   counter = 0;
              // });
            },
          ),
          counter != 0
              ? Positioned(
                right: 11,
                top: 11,
                child: Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  constraints: BoxConstraints(minWidth: 14, minHeight: 14),
                  child: Text(
                    '$counter',
                    style: TextStyle(color: Colors.white, fontSize: 8),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
              : Container(),
        ],
      ),
    ],
  );
}
