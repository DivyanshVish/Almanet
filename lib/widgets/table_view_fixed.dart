import 'dart:convert';
import 'dart:async';
// import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:stomp_dart_client/stomp_dart_client.dart';
import 'package:univest_flutter/utils/common_methods.dart';
import 'package:univest_flutter/config/web_socket.dart';
import 'package:univest_flutter/constants/app_color.dart';
import 'package:univest_flutter/constants/app_text_style.dart';
import 'package:univest_flutter/constants/string_constants.dart';
import 'package:univest_flutter/cubit/bottom_nav_cubit.dart';
import 'package:univest_flutter/cubit/explore_components/top_banner/top_banner_cubit.dart';
import 'package:univest_flutter/cubit/screeners_home/screeners_home_cubit.dart';
import 'package:univest_flutter/data/models/movers.dart';
import 'package:univest_flutter/routes/app_routes.dart';
import 'package:univest_flutter/utils/get_it.dart';
import 'package:univest_flutter/ui/responsive/SizeConfig.dart';

class TableView extends StatefulWidget {
  Market? data;
  final VoidCallback? onRefreshData; // Callback to refresh data from parent
  
  TableView({super.key, required this.data, this.onRefreshData});

  @override
  State<TableView> createState() => _TableViewState();
}

class _TableViewState extends State<TableView> with WidgetsBindingObserver {
  Timer? _marketSessionTimer;
  DateTime? _lastDataRefresh;
  bool _isMarketOpen = false;
  
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _initializeMarketSessionMonitoring();
    _lastDataRefresh = DateTime.now();
  }

  @override
  void dispose() {
    _marketSessionTimer?.cancel();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    
    if (state == AppLifecycleState.resumed) {
      // Check if we need to refresh data when app comes to foreground
      _checkAndRefreshIfNeeded();
    }
  }

  void _initializeMarketSessionMonitoring() {
    // Check market status every minute
    _marketSessionTimer = Timer.periodic(const Duration(minutes: 1), (timer) {
      _checkMarketSession();
    });
    
    // Initial check
    _checkMarketSession();
  }

  void _checkMarketSession() {
    final now = DateTime.now();
    final currentTime = TimeOfDay.fromDateTime(now);
    
    // Market opens at 9:15 AM and closes at 3:30 PM (Indian market hours)
    final marketOpenTime = const TimeOfDay(hour: 9, minute: 15);
    final marketCloseTime = const TimeOfDay(hour: 15, minute: 30);
    
    final isCurrentlyMarketOpen = _isTimeInRange(currentTime, marketOpenTime, marketCloseTime) && 
                                  _isWeekday(now);
    
    // If market just opened and we haven't refreshed data recently, refresh it
    if (isCurrentlyMarketOpen && !_isMarketOpen) {
      _isMarketOpen = true;
      _refreshDataIfNeeded();
    } else if (!isCurrentlyMarketOpen && _isMarketOpen) {
      _isMarketOpen = false;
    }
  }

  bool _isTimeInRange(TimeOfDay current, TimeOfDay start, TimeOfDay end) {
    final currentMinutes = current.hour * 60 + current.minute;
    final startMinutes = start.hour * 60 + start.minute;
    final endMinutes = end.hour * 60 + end.minute;
    
    return currentMinutes >= startMinutes && currentMinutes <= endMinutes;
  }

  bool _isWeekday(DateTime date) {
    return date.weekday >= 1 && date.weekday <= 5; // Monday to Friday
  }

  void _checkAndRefreshIfNeeded() {
    final now = DateTime.now();
    
    // If it's been more than 30 minutes since last refresh and market is open, refresh
    if (_lastDataRefresh != null && 
        now.difference(_lastDataRefresh!).inMinutes > 30 && 
        _isMarketOpen) {
      _refreshDataIfNeeded();
    }
    
    // If app was opened before market hours and now market is open, refresh
    if (_lastDataRefresh != null && 
        _lastDataRefresh!.hour < 9 && 
        now.hour >= 9 && 
        _isMarketOpen) {
      _refreshDataIfNeeded();
    }
  }

  void _refreshDataIfNeeded() {
    if (widget.onRefreshData != null) {
      widget.onRefreshData!();
      _lastDataRefresh = DateTime.now();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ((widget.data?.list ?? []).isEmpty)
        ? Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 0, 8),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12), color: Colors.white),
              child: Column(
                children: [
                  const Spacer(),
                  const Text("No stocks currently"),
                  const Spacer(),
                  GestureDetector(
                    onTap: (){
                      if((context.read<TopBannerCubit>().data.openNativeScreener ?? false)){
                        getIt<ScreenersHomeCubit>().updateIndex(widget.data!.screenerDetail!.code!, context);
                      } else {
                        Navigator.of(context)
                            .pushNamed(RouteName.webViewScreen, arguments: {
                          "code": '',
                          "isStockDetails": false,
                          "url": '${StringConstants.webBaseUrl}new-screen/${widget.data!.screenerDetail!.code}'
                        }).then((value) {
                          if (value == "search") {
                            Navigator.of(context)
                                .pushNamed(RouteName.searchScreen);
                          }
                          if (value == "faircent") {
                            (StringConstants.showEliteTab) ?
                            context.read<BottomNavCubit>().updateIndex(4):
                            Navigator.of(navigatorKey
                                .currentContext!)
                                .pushNamed(
                                RouteName
                                    .webViewScreen,
                                arguments: {
                                  "code": '',
                                  "isStockDetails": false,
                                  "url": '${StringConstants.webBaseUrl}uni-wis'
                                });
                          }
                        });
                      }
                    },
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: AppColors.cupertinoBlue)),
                      margin: EdgeInsets.symmetric(
                          horizontal: 12 * SizeConfig.widthMultiplier!),
                      padding: EdgeInsets.symmetric(
                          vertical: 8 * SizeConfig.heightMultiplier!),
                      child: Center(
                          child: Text(
                            'View all',
                            style: AppTextStyle.blueMedium12Weight500.copyWith(color: AppColors.cupertinoBlue,fontWeight: FontWeight.w700),
                          )),
                    ),
                  ),
                  SizedBox(height: 12 * SizeConfig.heightMultiplier!),
                ],
              ),
            ),
          )
        : Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 0, 8),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12), color: Colors.white),
              child: Column(
                children: [
                  // Add refresh indicator for market status
                  if (_isMarketOpen && _lastDataRefresh != null)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      child: Row(
                        children: [
                          Container(
                            width: 8,
                            height: 8,
                            decoration: const BoxDecoration(
                              color: Colors.green,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Live • Updated ${_getLastUpdateTime()}',
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                  Expanded(
                    child: ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: (widget.data!.list!.length >= 4)
                            ? 4
                            : widget.data!.list!.length,
                        padding: EdgeInsets.zero,
                        separatorBuilder: (ctx, index)=> Padding(
                          padding: EdgeInsets.only(left: 12 * SizeConfig.widthMultiplier!, right: 12 * SizeConfig.widthMultiplier!),
                          child: Container(
                            height: 1,
                            width: double.infinity,
                            color: AppColors.greyNeutral,
                          ),
                        ),
                        itemBuilder: (BuildContext context, index1) {
                          return ListOfData(
                            data: widget.data!.list![index1],
                            index1: index1,
                            isLast: (widget.data!.list!.length >= 4) ? index1 == 3 :(widget.data!.list!.length - 1 == index1),
                          );
                        }),
                  ),
                  GestureDetector(
                    onTap: () {
                      sendAnalyticsEvents("cta_clicked", {
                        'page': "market_home",
                        "cta_text": "view_all",
                        "widget": "market_movers",
                      });
                      if((context.read<TopBannerCubit>().data.openNativeScreener ?? false)){
                        getIt<ScreenersHomeCubit>().updateIndex(widget.data!.screenerDetail!.code!, context);
                      } else {
                        Navigator.of(context)
                            .pushNamed(RouteName.webViewScreen, arguments: {
                          "code": '',
                          "isStockDetails": false,
                          "url": '${StringConstants.webBaseUrl}new-screen/${widget.data!.screenerDetail!.code}'
                        }).then((value) {
                          if (value == "search") {
                            Navigator.of(context)
                                .pushNamed(RouteName.searchScreen);
                          }
                          if (value == "faircent") {
                            (StringConstants.showEliteTab) ?
                            context.read<BottomNavCubit>().updateIndex(4):
                            Navigator.of(navigatorKey
                                .currentContext!)
                                .pushNamed(
                                RouteName
                                    .webViewScreen,
                                arguments: {
                                  "code": '',
                                  "isStockDetails": false,
                                  "url": '${StringConstants.webBaseUrl}uni-wis'
                                });
                          }
                        });
                      }
                    },
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: AppColors.cupertinoBlue)),
                      margin: EdgeInsets.symmetric(
                          horizontal: 12 * SizeConfig.widthMultiplier!),
                      padding: EdgeInsets.symmetric(
                          vertical: 8 * SizeConfig.heightMultiplier!),
                      child: Center(
                          child: Text(
                        'View all',
                        style: AppTextStyle.blueMedium12Weight500.copyWith(color: AppColors.cupertinoBlue,fontWeight: FontWeight.w700),
                      )),
                    ),
                  ),
                  SizedBox(height: 12 * SizeConfig.heightMultiplier!),
                ],
              ),
            ),
          );
  }

  String _getLastUpdateTime() {
    if (_lastDataRefresh == null) return '';
    
    final now = DateTime.now();
    final difference = now.difference(_lastDataRefresh!);
    
    if (difference.inMinutes < 1) {
      return 'now';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes}m ago';
    } else {
      return '${difference.inHours}h ago';
    }
  }
}

class ListOfData extends StatefulWidget {
  MoversModel data;
  int index1;
  bool isLast;
  ListOfData({super.key, required this.data, required this.index1,this.isLast = false});

  @override
  State<ListOfData> createState() => _ListOfDataState();
}

class _ListOfDataState extends State<ListOfData> with WidgetsBindingObserver {
  String value = '';
  String difference = '';
  String perc = '';
  bool? backgroundColor;
  double check = 0;
  List<String> unsubscribeFn = [];
  Timer? _reconnectTimer;

  connectSocket(){
    try {
      StompService().subscribe(
          destination: '/stock/live-price/${widget.data.finCode}',
          callback: (frame) {
            if (jsonDecode(frame.body!)['ltpPrice'] != check) {
              if (jsonDecode(frame.body!)['ltpPrice'] > check) {
                backgroundColor = true;
              } else {
                backgroundColor = false;
              }
            } else {
              backgroundColor = null;
            }
            (mounted)
                ? setState(() {
              value = NumberFormat('#,##,#00.00')
                  .format(jsonDecode(frame.body!)['ltpPrice']);
              check = jsonDecode(frame.body!)['ltpPrice'];
              perc = (((jsonDecode(frame.body!)['ltpPrice'] -
                  jsonDecode(frame.body!)['c']) *
                  100) /
                  jsonDecode(frame.body!)['c'])
                  .toStringAsFixed(2);
              difference = (jsonDecode(frame.body!)['ltpPrice'] -
                  jsonDecode(frame.body!)['c'])
                  .toStringAsFixed(2);
            })
                : null;
            Future.delayed(const Duration(milliseconds: 500), () {
              (mounted)
                  ? setState(() {
                widget.data.lastUpdatedAt = 0;
                backgroundColor = null;
              })
                  : null;
            });
          });
      unsubscribeFn.add('/stock/live-price/${widget.data.finCode}');
    } catch (e) {
      // Retry connection after a delay if it fails
      _reconnectTimer = Timer(const Duration(seconds: 5), () {
        if (mounted) {
          connectSocket();
        }
      });
    }
  }

  @override
  void initState() {
    if (widget.data.nseLtpPrice! == 0) {
      value = NumberFormat('#,##,#00.00').format(widget.data.bseLtpPrice!);
      difference = (widget.data.bseLtpPrice! - widget.data.bseClosePrice!)
          .toStringAsFixed(2);
      perc = ((widget.data.bseLtpPrice! - widget.data.bseClosePrice!) *
              100 /
              widget.data.bseClosePrice!)
          .toStringAsFixed(2);
    } else {
      value = NumberFormat('#,##,#00.00').format(widget.data.nseLtpPrice!);
      difference = (widget.data.nseLtpPrice! - widget.data.nseClosePrice!)
          .toStringAsFixed(2);
      perc = ((widget.data.nseLtpPrice! - widget.data.nseClosePrice!) *
              100 /
              widget.data.nseClosePrice!)
          .toStringAsFixed(2);
    }
    check = double.parse((widget.data.nseLtpPrice ?? (widget.data.bseLtpPrice ??0)).toString());
    WidgetsBinding.instance.addPostFrameCallback((_) {
      connectSocket();
    });
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed ||
        state == AppLifecycleState.inactive ||
        state == AppLifecycleState.hidden) {
      try {
        for (var element in unsubscribeFn) {
          StompService().unsubscribe(destination: element);
        }
      } catch (e) {}
      // Add a small delay before reconnecting to ensure app is fully resumed
      Future.delayed(const Duration(milliseconds: 500), () {
        if (mounted) {
          connectSocket();
        }
      });
    }
  }

  @override
  void dispose() {
    _reconnectTimer?.cancel();
    try {
      for (var element in unsubscribeFn) {
        StompService().unsubscribe(destination: element);
      }
    } catch (e) {}
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (perc.contains('-')) {
      perc = perc.substring(1, perc.length);
    }
    return Padding(
      padding: EdgeInsets.fromLTRB(12 * SizeConfig.widthMultiplier!, 10, 12 * SizeConfig.widthMultiplier!, widget.isLast ? 0 :10),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          sendAnalyticsEvents("stock_clicked", {
            'page': "market_home",
            "fincode": widget.data.finCode,
            "symbol": widget.data.nseSymbol ?? widget.data.bseSymbol,
            "gain": !(difference.contains('-'))?"green":"red",
          });
          Navigator.of(context)
              .pushNamed(RouteName.webViewScreen, arguments: {
            "code": widget.data.finCode.toString(),
            "isStockDetails": true,
            "url": '${StringConstants.webBaseUrl}stocks/'
          }).then((value) {
            if (value == "search") {
              Navigator.of(context).pushNamed(RouteName.searchScreen);
            }
            if (value == "faircent") {
              (StringConstants.showEliteTab) ?
              context.read<BottomNavCubit>().updateIndex(4):
              Navigator.of(navigatorKey
                  .currentContext!)
                  .pushNamed(
                  RouteName
                      .webViewScreen,
                  arguments: {
                    "code": '',
                    "isStockDetails": false,
                    "url": '${StringConstants.webBaseUrl}uni-wis'
                  });
            }
          });
        },
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 2 * SizeConfig.heightMultiplier!,
                ),
                Text(widget.data.nseSymbol ?? widget.data.bseSymbol ?? "",
                    style: AppTextStyle.blackMedium12Weight500.copyWith(fontWeight: FontWeight.bold,height: 1.25)),
                SizedBox(height: 6 * SizeConfig.heightMultiplier!,),
                Text(
                    (widget.data.compName!.length >= 25)
                        ? '${widget.data.compName!.substring(0, 24)}...'
                        : widget.data.compName!,
                    style: AppTextStyle.blackRegular8Weight400.copyWith(fontWeight: FontWeight.w500, fontSize: 10 * SizeConfig.textMultiplier!,color: AppColors.neutral700,height: 1))
              ],
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(value,
                    style: AppTextStyle.blackMedium12Weight500.copyWith(
                      height: 1.25,
                        fontWeight: FontWeight.w700,
                        backgroundColor: (backgroundColor == true)
                            ? AppColors.textGreen.withOpacity(0.2)
                            : (backgroundColor == false)
                                ? AppColors.errorRed.withOpacity(0.1)
                                : AppColors.kPureWhite)),
                SizedBox(height: 6 * SizeConfig.heightMultiplier!,),
                LayoutBuilder(builder: (context, constraints) {
                  if (difference.contains('-')) {
                    return Row(
                      children: [
                        Text(
                          difference,
                          style: AppTextStyle.redMedium10Weight500,
                        ),
                        Text(' ($perc%)',
                            style: AppTextStyle.redMedium10Weight500)
                      ],
                    );
                  } else {
                    return Row(
                      children: [
                        Text(difference,
                            style: AppTextStyle.greenMedium10Weight500),
                        Text(' ($perc%)',
                            style: AppTextStyle.greenMedium10Weight500)
                      ],
                    );
                  }
                })
              ],
            ),
          ],
        ),
      ),
    );
  }
}