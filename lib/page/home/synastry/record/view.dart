part of 'index.dart';

class FileManagementPage extends StatelessWidget {
  const FileManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ComAppBar(
        leading: Container(
          margin: EdgeInsetsDirectional.only(start: 16),
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              InkWell(
                borderRadius: BorderRadius.circular(50),
                onTap: () => Get.back(),
                child: Image.asset(
                  Assets.imageBackIcon,
                  matchTextDirection: true,
                  width: 40,
                  height: 40,
                ),
              ),
            ],
          ),
        ),
        title: LanKey.record.tr,
      ),
      backgroundColor: AppColor.pageBackground,
      body: GetBuilder<FileManagementLogic>(
        init: FileManagementLogic(),
        builder: (logic) {
          return Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              Column(
                children: [
                  /*if (logic.list.length < 11)*/ AddFriends(logic: logic),
                  Expanded(child: buildBody(logic.viewState, logic)),
                ],
              ),
              PositionedDirectional(
                bottom: 0,
                start: 0,
                end: 0,
                child: BottomStackBtn(
                  title: LanKey.confirm.tr,
                  isClickable: logic.isClick,
                  margin: EdgeInsetsDirectional.only(bottom: 0.h),
                  padding: EdgeInsetsDirectional.only(bottom: 24.h, top: 0.h),
                  onTap: () => logic.toDetermine(),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget buildBody(int viewState, FileManagementLogic logic) {
    return switch (viewState) {
      _ when viewState == Status.data.index => buildList(logic),
      _ => LoadingWidget(),
    };
  }

  Widget buildList(FileManagementLogic logic) => ListView.separated(
    itemCount: logic.list.length,
    padding: EdgeInsetsDirectional.only(
      top: 16.h,
      bottom: 160.h,
      start: 16.w,
      end: 16.w,
    ),
    itemBuilder: (_, i) => RecordItem(
      index: i,
      item: logic.list[i],
      onDelete: () {
        logic.showDeleteDialog(i);
      },
      onTap: () {
        logic.tapItem(i);
      },
    ),
    separatorBuilder: (_, i) =>
        Divider(color: Colors.transparent, height: 16.h),
  );
}
