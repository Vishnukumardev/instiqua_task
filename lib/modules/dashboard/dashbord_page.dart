import '../../utils/path_provider.dart';

class DashbordPage extends StatelessWidget {
  const DashbordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      builder:
          (controller) =>
              controller.isLoading
                  ? Material(
                    color: white,
                    child: Center(child: CircularProgressIndicator()),
                  )
                  : Scaffold(
                    backgroundColor: white,
                    appBar: commonAppbar(controller.counter),
                    body: SingleChildScrollView(
                      child: Column(
                        children: [
                          dashboardImageWidget(),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10.0,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 20.0),
                                totalStudentsWidget(
                                  controller.studentCount.data.totalStudents
                                      .toString(),
                                ),
                                SizedBox(height: 10.0),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "EVENTS",
                                      style: titleStyle(
                                        16.0,
                                        TextDecoration.none,
                                        Colors.black,
                                      ),
                                    ),
                                    Text(
                                      "VIEW ALL",
                                      style: titleStyle(
                                        16.0,
                                        TextDecoration.underline,
                                        blue,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10.0),
                                eventWidget(controller),
                                SizedBox(height: 10.0),
                                Text(
                                  "LEADERBOARD",
                                  style: titleStyle(
                                    16.0,
                                    TextDecoration.none,
                                    Colors.black,
                                  ),
                                ),
                                SizedBox(height: 10.0),
                                tabBarWidget(controller),
                                SizedBox(height: 10.0),
                                SizedBox(
                                  height: 340,
                                  child: TabBarView(
                                    controller: controller.tabController,
                                    children: [
                                      leaderBoardMenisListWidget(controller),
                                      leaderBoardJuniorsListWidget(controller),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 10.0),

                                dashboardGridMenuWidget(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    bottomNavigationBar: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                        child: BottomNavigationBar(
                          currentIndex: controller.navIndex,
                          backgroundColor: Colors.transparent,
                          type: BottomNavigationBarType.shifting,
                          selectedItemColor: blue,
                          showSelectedLabels: false,
                          items: [
                            BottomNavigationBarItem(
                              backgroundColor: white,
                              icon: Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  Icon(Icons.home, color: blue),
                                  Text(
                                    controller.navIndex == 0 ? "Home" : "",
                                    style: titleStyle(
                                      15.0,
                                      TextDecoration.none,
                                      blue,
                                    ),
                                  ),
                                ],
                              ),
                              label: "",
                            ),
                            BottomNavigationBarItem(
                              icon: Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  Icon(Icons.menu_book_rounded, color: blue),
                                  Text(
                                    controller.navIndex == 1 ? "Book" : "",
                                    style: titleStyle(
                                      15.0,
                                      TextDecoration.none,
                                      blue,
                                    ),
                                  ),
                                ],
                              ),
                              label: '',
                            ),
                            BottomNavigationBarItem(
                              icon: Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  Icon(
                                    Icons.calendar_today_outlined,
                                    color: blue,
                                  ),
                                  Text(
                                    controller.navIndex == 2 ? "Calendar" : "",
                                    style: titleStyle(
                                      15.0,
                                      TextDecoration.none,
                                      blue,
                                    ),
                                  ),
                                ],
                              ),
                              label: '',
                            ),
                            BottomNavigationBarItem(
                              icon: Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  Icon(Icons.person, color: blue),
                                  Text(
                                    controller.navIndex == 3 ? "Profile" : "",
                                    style: titleStyle(
                                      15.0,
                                      TextDecoration.none,
                                      blue,
                                    ),
                                  ),
                                ],
                              ),
                              label: '',
                            ),
                          ],
                          onTap: (index) {
                            controller.switchIndex(index);
                          },
                        ),
                      ),
                    ),
                  ),
    );
  }
}
