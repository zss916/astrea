import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:astrea/page/home/chatroom/chat/index.dart';
import 'package:astrea/page/home/chatroom/chat/widget/chat_msg_item.dart';
import 'package:astrea/page/home/chatroom/chat/widget/chat_send_input.dart';
import 'package:astrea/page/home/chatroom/chat/widget/chat_time_item.dart';

class Chat extends StatefulWidget {
  final List<dynamic> historyMsg;
  final List<dynamic> currentMsg;
  final ChatLogic logic;
  final bool isUser;
  const Chat({
    super.key,
    required this.historyMsg,
    required this.currentMsg,
    required this.logic,
    required this.isUser,
  });

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final centerKey = GlobalKey();

  /// 它等于0说明列表在底部
  double extentAfter = 0;

  /// 它等于0说明列表在顶部
  double extentBefore = 0;

  ScrollController scrollCtrl = ScrollController();

  @override
  void initState() {
    super.initState();
    //loadHistoryMsg();
    loadCurrentMsg();
  }

  @override
  void dispose() {
    super.dispose();
    scrollCtrl.dispose();
  }

  ///获取当前数据
  loadCurrentMsg() {
    if (widget.currentMsg.isEmpty) return;
    Future.delayed(const Duration(milliseconds: 200), () {
      scrollCtrl.jumpTo(scrollCtrl.position.maxScrollExtent);
    });
  }

  ///获取历史数据
  loadHistoryMsg() {
    if (widget.historyMsg.isEmpty) return;
    if (extentBefore == 0) {
      Future.delayed(const Duration(milliseconds: 400), () {
        scrollCtrl.animateTo(
          scrollCtrl.offset - 60,
          duration: const Duration(milliseconds: 500),
          curve: Curves.linearToEaseOut,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () {
        widget.historyMsg.add("dsfdsafdsahflsdhaljfljdsalkjfs");
        widget.historyMsg.add(
          "dsfdsafdsahflsdhaljfljdsaldsfajdsjafdskfjkldsjklfjklsadjflkjsdklkjfs",
        );
        widget.logic.update();
        loadHistoryMsg();
        return Future.delayed(Duration(milliseconds: 1000));
      },
      child: Column(
        children: [
          Expanded(child: buildContent(isUser: widget.isUser)),
          ChatSendInput(
            onSend: (value) {
              setState(() {
                widget.currentMsg.add(value);
                loadCurrentMsg();
              });
            },
          ),
        ],
      ),
    );
  }

  Widget buildContent({required bool isUser}) {
    return Listener(
      onPointerDown: (event) {
        SystemChannels.textInput.invokeMethod('TextInput.hide'); //todo
      },
      child: NotificationListener(
        onNotification: (notification) {
          if (notification is ScrollNotification) {
            if (notification.metrics is PageMetrics) {
              return false;
            }
            if (notification.metrics is FixedScrollMetrics) {
              if (notification.metrics.axisDirection == AxisDirection.left ||
                  notification.metrics.axisDirection == AxisDirection.right) {
                return false;
              }
            }
            extentAfter = notification.metrics.extentAfter;
            extentBefore = notification.metrics.extentBefore;
          }
          return false;
        },
        child: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          controller: scrollCtrl,
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          center: centerKey,
          slivers: [
            if (widget.historyMsg.isNotEmpty)
              SliverToBoxAdapter(
                child: Container(
                  width: double.maxFinite,
                  margin: EdgeInsetsDirectional.only(
                    start: 16,
                    end: 16,
                    top: 14,
                  ),
                  child: ChatTimeItem(isUser: isUser),
                ),
              ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: widget.historyMsg.length,
                (_, i) => ChatMsgItem(msg: widget.historyMsg[i], isMe: false),
              ),
            ),
            SliverPadding(padding: EdgeInsets.zero, key: centerKey),
            if (widget.historyMsg.isEmpty)
              SliverToBoxAdapter(
                child: Container(
                  width: double.maxFinite,
                  margin: EdgeInsetsDirectional.only(
                    start: 16,
                    end: 16,
                    top: 14,
                  ),
                  child: ChatTimeItem(isUser: isUser),
                ),
              ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (_, i) => ChatMsgItem(msg: widget.currentMsg[i], isMe: true),
                childCount: widget.currentMsg.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
