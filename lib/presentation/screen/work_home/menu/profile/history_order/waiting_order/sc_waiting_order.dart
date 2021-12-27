import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:ybc/app/constants/style/style.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/history_order/bloc/bloc.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/history_order/order_item.dart';

class WaitingOrderScreen extends StatefulWidget {
  @override
  _WaitingOrderScreenState createState() => _WaitingOrderScreenState();
}

class _WaitingOrderScreenState extends State<WaitingOrderScreen> {

  @override
  void initState() {
    super.initState();
    BlocProvider.of<HistoryOrderBloc>(context).add(RefreshHistoryOrder(status: 1, type: 0));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<HistoryOrderBloc, HistoryOrderState>(builder: (context, state) {
          if (state is HistoryOrderLoaded) {
            return RefreshIndicator(
                onRefresh: () async {
                  BlocProvider.of<HistoryOrderBloc>(context).add(RefreshHistoryOrder(status: 1, type: 0));
                  await Future.delayed(Duration(seconds: 3));
                  return true;
                },
                color: Colors.blue,
                backgroundColor: Colors.white,
                child: Container(
                  color: Colors.grey[100],
                  child: _buildContent(state),
                )
            );
          } else if (state is HistoryOrderLoading) {
            return Center(
              child: Container(
                height: 100,
                width: 100,
                child: Lottie.asset(
                  'assets/lottie/trail_loading.json',
                ),
              ),
            );
          } else if (state is HistoryOrderNotLoaded) {
            return Center(
              child: Text('${state.error}'),
            );
          } else {
            return Center(
              child: Text('Unknown state'),
            );
          }
        })
    );
  }

  _buildContent(HistoryOrderLoaded state){
    return state.orderData.rows.length != 0 ?
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text('Số lượng: ${state.orderData.rows.length}', style: AppStyle.DEFAULT_MEDIUM_BOLD,),
        ),
        SizedBox(
          height: 10,
        ),
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: state.orderData.rows.length,
            itemBuilder: (context, index) {
              return Container(
                child: WidgetOrderItem(
                    orderItem: state.orderData.rows[index]
                ),
              );
            },
          ),
        )
      ],
    )
        : Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              height: 120,
              width: 120,
              child: Image.asset('assets/images/box.png')
          ),
          SizedBox(height: 20,),
          Text('Bạn chưa có đơn hàng đợi duyệt!'),
        ],
      ),
    );
  }
}
