import 'dart:ui';

import '../utils/path_provider.dart';

Widget dashboardImageWidget() {
  return Stack(
    children: [
      ConstrainedBox(
        constraints: BoxConstraints.expand(width: Get.width, height: 300.0),
        child: Image.asset(AppAssets.dashboardImage, fit: BoxFit.cover),
      ),

      Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: white, width: 1.5),
            ),
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
                child: Container(
                  height: 260.0,
                  child: Center(
                    child: Text(
                      'TENNIS COACHING \n    PROGRAMMES',
                      style: titleStyle(28.0, TextDecoration.none, white),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    ],
  );
}

Widget totalStudentsWidget(String totalCount) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        "Total Students ",
        style: titleStyle(15.0, TextDecoration.none, black),
      ),
      SizedBox(width: 10.0),
      Container(
        height: 30.0,
        width: 60.0,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Center(
          child: Text(
            totalCount,
            style: titleStyle(15.0, TextDecoration.none, white),
          ),
        ),
      ),
    ],
  );
}

Widget eventWidget(DashboardController controller) {
  return SizedBox(
    height: 180,
    child: ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: controller.coachUpcomingEventList.data.length,
      itemBuilder: (context, index) {
        final item = controller.coachUpcomingEventList.data[index];
        return Container(
          decoration: BoxDecoration(
            border: Border.all(color: grey),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              width: 150,
              decoration: BoxDecoration(
                color: grey,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Image.asset(
                        item.image != null
                            ? item.image
                            : AppAssets.defaultEvent,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      formatDate(dateMonth, item.date),
                      style: titleStyle(15.0, TextDecoration.none, blue),
                    ),
                    Text(
                      "${item.age} ${item.eventName}",
                      style: titleStyle(20.0, TextDecoration.none, blue),
                    ),
                    Text(
                      "5:00 PM",
                      style: titleStyle(15.0, TextDecoration.none, blue),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    ),
  );
}

Widget tabBarWidget(DashboardController controller) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20.0),
    child: Container(
      height: 40.0,
      width: Get.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: blue.withValues(alpha: 0.3),
      ),

      child: TabBar(
        controller: controller.tabController,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(10), // Creates border
          color: blue,
        ),
        indicatorColor: blue,
        padding: EdgeInsets.zero,
        indicatorPadding: EdgeInsets.zero,
        labelPadding: EdgeInsets.zero,
        labelColor: white,
        unselectedLabelColor: white,
        dividerColor: Colors.transparent,
        tabs: [
          Tab(
            child: SizedBox(
              width: Get.width,
              child: Center(
                child: Text(
                  "DEVELOPMENT",
                  style: titleStyle(18.0, TextDecoration.none, white),
                ),
              ),
            ),
          ),
          Tab(
            child: SizedBox(
              width: Get.width,
              child: Center(
                child: Text(
                  "COMPETITION",
                  style: titleStyle(18.0, TextDecoration.none, white),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget leaderBoardMenisListWidget(DashboardController controller) {
  return ListView.builder(
    shrinkWrap: true,
    scrollDirection: Axis.vertical,
    physics: NeverScrollableScrollPhysics(),
    itemCount: controller.leaderBoardMenisList.data.length,
    itemBuilder: (context, index) {
      final item = controller.leaderBoardMenisList.data[index];

      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Container(
          height: 100,
          width: Get.width,
          decoration: BoxDecoration(
            border: Border.all(color: grey),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              bottomLeft: Radius.circular(10.0),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      bottomLeft: Radius.circular(10.0),
                    ),
                    color: blue,
                  ),

                  width: 30.0,
                  child: Center(child: Text("${index + 1}")),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  width: 100.0,
                  child: ClipPath(
                    clipper: ImageDiagonalClipper(),
                    child: Image.network(item.profile, fit: BoxFit.cover),
                  ),
                ),
              ),
              Expanded(
                flex: 9,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            item.studentName,
                            style: titleStyle(15.0, TextDecoration.none, black),
                          ),
                          Text(
                            item.match.toString(),
                            style: titleStyle(15.0, TextDecoration.none, black),
                          ),
                        ],
                      ),
                      SizedBox(height: 35.0),
                      Transform.translate(
                        offset: Offset(-10, 0),
                        child: ClipPath(
                          clipper: ProgressIndicatorDiagonalClipper(),
                          child: LinearProgressIndicator(
                            minHeight: 10.0,
                            value: item.percentage.toDouble() / 100,
                            color: Colors.green,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10.0),
                              bottomRight: Radius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

Widget leaderBoardJuniorsListWidget(DashboardController controller) {
  return ListView.builder(
    shrinkWrap: true,
    scrollDirection: Axis.vertical,
    physics: NeverScrollableScrollPhysics(),
    itemCount: controller.leaderBoardJuniorsList.data.length,
    itemBuilder: (context, index) {
      final item = controller.leaderBoardJuniorsList.data[index];

      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Container(
          height: 100,
          width: Get.width,
          decoration: BoxDecoration(
            border: Border.all(color: grey),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              bottomLeft: Radius.circular(10.0),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      bottomLeft: Radius.circular(10.0),
                    ),
                    color: blue,
                  ),

                  width: 30.0,
                  child: Center(child: Text("${index + 1}")),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  width: 100.0,
                  child: ClipPath(
                    clipper: ImageDiagonalClipper(),
                    child: Image.network(item.profile, fit: BoxFit.cover),
                  ),
                ),
              ),
              Expanded(
                flex: 9,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            item.studentName,
                            style: titleStyle(15.0, TextDecoration.none, black),
                          ),
                          Text(
                            item.match.toString(),
                            style: titleStyle(15.0, TextDecoration.none, black),
                          ),
                        ],
                      ),
                      SizedBox(height: 35.0),
                      Transform.translate(
                        offset: Offset(-10, 0),
                        child: ClipPath(
                          clipper: ProgressIndicatorDiagonalClipper(),
                          child: LinearProgressIndicator(
                            minHeight: 10.0,
                            value: item.percentage.toDouble() / 100,
                            color: Colors.green,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10.0),
                              bottomRight: Radius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

Widget dashboardGridMenuWidget() {
  return SizedBox(
    height: 240,
    child: GridView.count(
      childAspectRatio: 3.0,
      crossAxisCount: 2,
      children: List.generate(6, (index) {
        return Container(
          decoration: BoxDecoration(
            color: blue,
            borderRadius: BorderRadius.circular(30.0),
          ),
          margin: const EdgeInsets.all(10),
          child: Center(
            child: Text(
              sampleData[index],
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        );
      }),
    ),
  );
}
