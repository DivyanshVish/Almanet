import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:univest_flutter/constants/string_constants.dart';
import 'package:univest_flutter/constants/testing_keys.dart';
import 'package:univest_flutter/constants/univest_ad_location_constants.dart';
import 'package:univest_flutter/cubit/ads_cubit/ads_cubit.dart';
import 'package:univest_flutter/cubit/ads_cubit/ads_state.dart';
import 'package:univest_flutter/routes/app_routes.dart';
import 'package:univest_flutter/ui/responsive/SizeConfig.dart';
import 'package:univest_flutter/utils/common_methods.dart';

import 'package:univest_flutter/config/jusPay.dart';
import 'package:univest_flutter/constants/app_color.dart';
import 'package:univest_flutter/constants/app_text_style.dart';
import 'package:univest_flutter/constants/image_path.dart';
import 'package:univest_flutter/cubit/add_funds_cubit/addfunds_cubit.dart';
import 'package:univest_flutter/cubit/explore_components/top_banner/top_banner_cubit.dart';
import 'package:univest_flutter/data/models/add_fund_default_method_model.dart';
import 'package:univest_flutter/utils/get_it.dart';
import 'package:univest_flutter/ui/widgets/session_loader.dart';

class AddFundsScreen extends StatefulWidget {
  String fundAmount;
  bool isFromOrderPage;
  bool showComplienceLoader;

  AddFundsScreen(
      {super.key, required this.fundAmount, required this.isFromOrderPage, required this.showComplienceLoader});

  @override
  State<AddFundsScreen> createState() => _AddFundsScreenState();
}

class _AddFundsScreenState extends State<AddFundsScreen> {
  final FocusNode _inputNode = FocusNode();

  @override
  void initState() {
    super.initState();

    sendAnalyticsEvents(
      "page_viewed",
      {
        'page': 'add_funds',
        "amount": widget.fundAmount,
      },
    );
    getIt<AdsCubit>().getAdsSize(UnivestAdApiConstantc.addFunds);
    getIt<AddfundsCubit>().addFundController.clear();
    getIt<AddfundsCubit>().errorNoteFundWidget = '';
      if (widget.fundAmount.isNotEmpty) {
      getIt<AddfundsCubit>().addFundController.text = widget.fundAmount;
    }
    getIt<AddfundsCubit>().getDataForFunds();
    // Auto-open keypad by requesting focus after a slight delay
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _inputNode.requestFocus();
      debugPrint('Input field focus requested: ${_inputNode.hasFocus}');
    });

    if(widget.showComplienceLoader && getIt<TopBannerCubit>().data.userInfoDTO?.data!.cashTrade==true){
      Future.delayed( const Duration(milliseconds: 250),(){
        sessionLoaderBF(context:context);
      });
    }
  }

  @override
  void dispose() {
    _inputNode.dispose(); // Clean up the focus node
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AddfundsCubit>.value(value: getIt<AddfundsCubit>()),
      ],
      child: WillPopScope(
        onWillPop: () async {
          // if (Platform.isAndroid) {
          //   var backpressResult = await jusPay.onBackPress();
          //   if (backpressResult.toLowerCase() == "true") {
          //     return false;
          //   } else {
          //     return true;
          //   }
          // } else {
          return true;
          // }
        },
        child: GestureDetector(
          onTap: () {
            _inputNode.unfocus();
          },
          child: Scaffold(
            backgroundColor: AppColors.orderPageBackgroundColor,
            appBar: AppBar(
              centerTitle: true,
              elevation: 5,
              shadowColor: AppColors.appBarShadowColor,
              backgroundColor: AppColors.kPureWhite,
              title: Text(
                "Add Funds",
                style: AppTextStyle.greyMedium14Weight500.copyWith(
                    color: AppColors.kPureBlack,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              leading: GestureDetector(
                  key: addFundPageBack,
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.arrow_back,
                      color: AppColors.kPureBlack,
                    ),
                  )),
              actions: [
                InkWell(
                  onTap: (){
                    sendAnalyticsEvents(
                      "cta_clicked",
                      {
                        'page': 'funds_withdraw',
                        'cta_text': 'support',
                      },
                    );
                    Navigator.of(context).pushNamed(
                        RouteName.webViewScreen,
                        arguments: {
                          "code": null,
                          "isStockDetails": false,
                          "url":
                          '${StringConstants.webBaseUrl}help-and-support/funds-or-ledger',
                        }).then((value) {
                      if (value == "search") {
                        Navigator.of(context).pushNamed(RouteName.searchScreen);
                      }
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.headset_mic_outlined,
                      size: 24 * SizeConfig.widthMultiplier!,
                      color: AppColors.kPureBlack,
                    ),
                  ),
                )
              ],
            ),
            bottomNavigationBar: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color:
                        AppColors.shadowGrey.withOpacity(0.05),
                        blurRadius: 1,
                        offset: const Offset(0, 0),
                        // Shadow position
                        spreadRadius: 6),
                  ],
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12.0),
                    // Adjust the values as needed
                    topRight: Radius.circular(
                        12.0), // Adjust the values as needed
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 12 * SizeConfig.heightMultiplier!,
                      right: 12 * SizeConfig.heightMultiplier!,
                      bottom: 8 * SizeConfig.heightMultiplier! + MediaQuery.viewInsetsOf(context).bottom,
                      top: 8 * SizeConfig.heightMultiplier!,
                  ),
                  child: AddFundBottomBar(
                    isButtonEnabled: getIt<AddfundsCubit>()
                        .errorNoteFundWidget
                        .isEmpty,
                    addFundBottomBarCallFrom:
                    AddFundBottomBarCallFrom.addFunds,
                    isFromOrderPage: widget.isFromOrderPage,
                  ),
                ),
            ),
            body: SafeArea(
              bottom: Platform.isIOS ? true : false,
              child: BlocBuilder<AddfundsCubit, AddfundsState>(
                builder: (BuildContext context, AddfundsState state) {
                  if (state is AddfundsLoading) {
                    return Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 1.5,
                        color: AppColors.whiteTextColor,
                        backgroundColor: AppColors.primaryBlue900,
                      ),
                    );
                  } else if (state is AddfundsLoaded) {
                    return Stack(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 12 * SizeConfig.heightMultiplier!,
                              horizontal: 16 * SizeConfig.heightMultiplier!),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                if(getIt<TopBannerCubit>().data.userInfoDTO?.data?.firstTimeFundAdded == false)
                                ...[
                                  SizedBox(
                                    height: 24 * SizeConfig.heightMultiplier!,
                                  ),
                                  Image.network(ImagePath.addFundProgressImage),
                                  SizedBox(
                                    height: 32 * SizeConfig.heightMultiplier!,
                                  ),
                                ],
                                Center(
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: Colors.white),
                                    child: Padding(
                                      padding: EdgeInsets.all(
                                          12 * SizeConfig.heightMultiplier!),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(height: 4 * SizeConfig.heightMultiplier!,),
                                          RichText(
                                            key: addFundPage,
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                    text: "Balance : ",
                                                    style: TextStyle(
                                                        color: AppColors
                                                            .blackShadeColor,
                                                        fontSize: 12 *
                                                            SizeConfig
                                                                .textMultiplier!,
                                                        fontWeight:
                                                            FontWeight.w600)),
                                                TextSpan(
                                                    text:
                                                        ' ${putComma(double.parse(getIt<AddfundsCubit>().availableFund.toString()), decimalDigits: 2)}',
                                                    style: TextStyle(
                                                        color: AppColors
                                                            .blackShadeColor,
                                                        fontSize: 12 *
                                                            SizeConfig
                                                                .textMultiplier!,
                                                        fontWeight:
                                                            FontWeight.w600)),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height:
                                                12 * SizeConfig.heightMultiplier!,
                                          ),
                                          Divider(
                                            thickness: 1,
                                            color: AppColors.grey500,
                                          ),
                                          SizedBox(
                                            height:
                                                12 * SizeConfig.heightMultiplier!,
                                          ),
                                          Text(
                                            "Add Funds",
                                            style: AppTextStyle
                                                .greyMedium14Weight500
                                                .copyWith(
                                                    color: AppColors.textGreen,
                                                    fontWeight: FontWeight.w600),
                                          ),
                                          SizedBox(
                                            height:
                                                24 * SizeConfig.heightMultiplier!,
                                          ),
                                          IntrinsicWidth(
                                            child: TextFormField(
                                              focusNode: _inputNode,
                                              onChanged: (value) {
                                                setState(() {});
                                                getIt<AddfundsCubit>()
                                                    .checkforFundLimitError();
                                              },
                                              controller: getIt<AddfundsCubit>()
                                                  .addFundController,
                                              cursorColor: AppColors.greyNeutral600,
                                              textAlign: TextAlign.center,
                                              style: AppTextStyle
                                                  .greyMedium14Weight500
                                                  .copyWith(
                                                      color: AppColors.kPureBlack,
                                                      fontSize: 24 *
                                                          SizeConfig
                                                              .textMultiplier!,
                                                      fontWeight: FontWeight.w800),
                                              maxLines: 1,
                                              maxLength: 10,
                                              autofocus: autoFocusForFund,
                                              keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                              inputFormatters: [
                                                FilteringTextInputFormatter.allow(
                                                    RegExp("[0-9]")),
                                              ],
                                              textDirection: TextDirection.ltr,
                                              decoration: InputDecoration(
                                                prefixIconConstraints:
                                                    const BoxConstraints(
                                                        maxWidth: 40),
                                                prefixIcon: Text(
                                                  '₹',
                                                  style: AppTextStyle
                                                      .greyMedium14Weight500
                                                      .copyWith(
                                                          color:
                                                              AppColors.kPureBlack,
                                                          fontSize: 24 *
                                                              SizeConfig
                                                                  .textMultiplier!,
                                                          fontWeight:
                                                              FontWeight.w800),
                                                ),
                                                counter: const Offstage(),
                                                contentPadding: EdgeInsets.only(
                                                  left: 15 *
                                                      SizeConfig.widthMultiplier!,
                                                  right: 20 *
                                                      SizeConfig.widthMultiplier!,
                                                ),
                                                enabledBorder: InputBorder.none,
                                                focusedBorder: InputBorder.none,
                                                hintText: "0",
                                                hintStyle: AppTextStyle
                                                    .greyMedium14Weight500
                                                    .copyWith(
                                                        color: AppColors
                                                            .lightBlackColor
                                                            .withOpacity(0.2),
                                                        fontSize: 24 *
                                                            SizeConfig
                                                                .textMultiplier!,
                                                        fontWeight:
                                                            FontWeight.w800),
                                                hintTextDirection:
                                                    TextDirection.ltr,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height:
                                                16 * SizeConfig.heightMultiplier!,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              ...getIt<AddfundsCubit>()
                                                  .listOfSuggestionRupees
                                                  .map((i) {
                                                return InkWell(
                                                  onTap: () {
                                                    sendAnalyticsEvents(
                                                      "chip_clicked",
                                                      {
                                                        'page': 'add_funds',
                                                        'cta_text': '$i',
                                                      },
                                                    );
                                                    getIt<AddfundsCubit>()
                                                        .chooseFundRupees(i);
                                                    
                                                    // Force show keyboard using SystemChannels
                                                    SystemChannels.textInput.invokeMethod('TextInput.show');
                                                    // Request focus after a short delay
                                                    Future.delayed(const Duration(milliseconds: 50), () {
                                                      if (mounted) {
                                                        FocusScope.of(context).requestFocus(_inputNode);
                                                      }
                                                    });
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        borderRadius: BorderRadius
                                                            .circular(32 *
                                                                SizeConfig
                                                                    .widthMultiplier!),
                                                        border: Border.all(
                                                            width: 1,
                                                            color:
                                                                AppColors.backGroundGrey)),
                                                    child: Padding(
                                                      padding: EdgeInsets.symmetric(
                                                        horizontal: 10 *
                                                            SizeConfig
                                                                .widthMultiplier!,
                                                        vertical: 6 *
                                                            SizeConfig
                                                                .heightMultiplier!,
                                                      ),
                                                      child: Text(
                                                        "+ ${putComma(i, decimalDigits: 0)}",
                                                        style: AppTextStyle
                                                            .greyMedium14Weight500
                                                            .copyWith(
                                                                color: AppColors
                                                                    .neutral700,
                                                                fontSize: 12 *
                                                                    SizeConfig
                                                                        .textMultiplier!,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              })
                                            ],
                                          ),
                                          if (getIt<AddfundsCubit>()
                                              .errorNoteFundWidget
                                              .isNotEmpty) ...[
                                            SizedBox(
                                              height:
                                                  16 * SizeConfig.heightMultiplier!,
                                            ),
                                            Container(
                                              width: double.infinity,
                                              color:
                                                  AppColors.marketNoteVeryLightRed,
                                              child: Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Image.asset(
                                                      ImagePath.warningImage,
                                                      height: 15 *
                                                          SizeConfig
                                                              .heightMultiplier!,
                                                      width: 15 *
                                                          SizeConfig
                                                              .heightMultiplier!,
                                                    ),
                                                    SizedBox(
                                                      width: 8 *
                                                          SizeConfig
                                                              .heightMultiplier!,
                                                    ),
                                                    Text(
                                                      getIt<AddfundsCubit>()
                                                          .errorNoteFundWidget,
                                                      style: AppTextStyle
                                                          .greyMedium14Weight500
                                                          .copyWith(
                                                              color: AppColors
                                                                  .errorRed,
                                                              fontSize: 10 *
                                                                  SizeConfig
                                                                      .textMultiplier!,
                                                              fontWeight:
                                                                  FontWeight.w700),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                          SizedBox(
                                            height:
                                                2 * SizeConfig.heightMultiplier!,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 32 * SizeConfig.heightMultiplier!,),
                                if (getIt<AddfundsCubit>()
                                        .selectedBankAccountNumber !=
                                    null) ...[
                                  Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Select Bank Account",
                                            style: AppTextStyle
                                                .blackMedium14Weight500.copyWith(
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              sendAnalyticsEvents(
                                                "cta_clicked",
                                                {
                                                  'page': 'add_funds',
                                                  'cta_text': 'change',
                                                  'selected_bank': (getIt<AddfundsCubit>().selectedBankAccountNumber?.bankName ?? "").toLowerCase(),
                                                },
                                              );
                                              selectBankAccountBf();
                                            },
                                            child: Row(
                                              children: [
                                                Text(
                                                  "Change",
                                                  style: AppTextStyle
                                                      .blueSemiBold12Weight600,
                                                ),
                                                const SizedBox(
                                                  width: 2,
                                                ),
                                                Icon(
                                                  Icons.arrow_forward_ios,
                                                  color: AppColors.bluePrimary800,
                                                  size: 12,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 16 * SizeConfig.heightMultiplier!,
                                      ),
                                      getSelectBankAccountListTile(
                                        bankAcNo: getIt<AddfundsCubit>().selectedBankAccountNumber?.bankAccountNumberMasked ?? "",
                                        bankLogo: getIt<AddfundsCubit>().selectedBankAccountNumber?.bankLogoUrl ?? "",
                                        bankTitle: getIt<AddfundsCubit>().selectedBankAccountNumber?.bankName ?? "",
                                        isPrimary: getIt<AddfundsCubit>().selectedBankAccountNumber?.primary ?? false,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 32 * SizeConfig.heightMultiplier!,
                                  ),
                                ],
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  selectBankAccountBf() {
    sendAnalyticsEvents(
      "page_viewed",
      {
        'page': 'change_bank_bf',
      },
    );
    String bankAccountNumber = getIt<AddfundsCubit>().selectedBankAccountNumber?.bankAccountNumber ?? '';
    List<BankList> bankAccounts = getIt<AddfundsCubit>().addFundDefaultMethodModel?.bankList ?? [];
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20.0),
        ),
      ),
      builder: (ctx) => StatefulBuilder(
        builder: (context, setState) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16 * SizeConfig.widthMultiplier!,
              vertical: 16 * SizeConfig.heightMultiplier!,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Change bank account",
                  style: AppTextStyle.blackSemiBold16,
                ),
                SizedBox(
                  height: 20 * SizeConfig.heightMultiplier!,
                ),
                ListView.builder(
                  itemCount: bankAccounts.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (ctx, index) => Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          getSelectBankAccountListTile(
                            bankAcNo: bankAccounts[index].bankAccountNumberMasked ?? "",
                            bankLogo: bankAccounts[index].bankLogoUrl ?? "",
                            bankTitle: bankAccounts[index].bankName ?? "",
                            isPrimary: bankAccounts[index].primary ?? false,
                          ),
                          Radio(
                              value: bankAccounts[index].bankAccountNumber ?? "",
                              groupValue: bankAccountNumber,
                              fillColor: WidgetStateProperty.all(AppColors.bluePrimary800),
                              onChanged: (v){
                                sendAnalyticsEvents(
                                  "option_clicked",
                                  {
                                    'page': 'change_bank_bf',
                                    'option_clicked': (bankAccounts[index].bankName ?? "").toLowerCase(),
                                  },
                                );
                                bankAccountNumber = v ?? "";
                                getIt<AddfundsCubit>().changeSelectedBankAccountNumber(bankAccounts[index]);
                                setState((){});
                                Navigator.pop(context);
                              },
                          ),
                        ],
                      ),
                      Container(
                        height: 1,
                        width: double.infinity,
                        color: AppColors.neutral300,
                        margin: EdgeInsets.symmetric(vertical: 16 * SizeConfig.heightMultiplier!),
                      ),
                      if(index == bankAccounts.length - 1)
                        BlocBuilder<AdsCubit, AdsState>(builder: (context, state) {
                          if (state is AdsLoadedState) {
                            String widgetKey = UnivestAdLocationConstants.selectBankAccountBf;
                            return state.mapOfAdsSize[widgetKey] != null
                                ? showAddWidgetWithoutRefresh(widgetKey, 'add_funds')
                                : const SizedBox.shrink();
                          }
                          return const SizedBox.shrink();
                        })
                    ],
                  ),
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}

getSelectBankAccountListTile({
  required String bankLogo,
  required String bankTitle,
  required String bankAcNo,
  required bool isPrimary,
}) {
  return Row(
    children: [
      Container(
        decoration: BoxDecoration(
            color: AppColors.kPureWhite,
            borderRadius:
            BorderRadius.circular(8 * SizeConfig.widthMultiplier!),
            border: Border.all(width: 1, color: AppColors.grey500)),
        padding: EdgeInsets.symmetric(
            vertical: 4 * SizeConfig.heightMultiplier!,
            horizontal: 8 * SizeConfig.widthMultiplier!),
        child: Center(
          child: Image.network(
            bankLogo,
            width: 38 * SizeConfig.widthMultiplier!,
            height: 32 * SizeConfig.heightMultiplier!,
            errorBuilder: (c, o, s) {
              return Image.asset(
                ImagePath.warningImage,
                height: 38 * SizeConfig.heightMultiplier!,
                width: 32 * SizeConfig.heightMultiplier!,
              );
            },
          ),
        ),
      ),
      SizedBox(
        width: 8 * SizeConfig.widthMultiplier!,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              bankTitle.length > 20 ?
              SizedBox(
                width: 150 * SizeConfig.widthMultiplier!,
                child: Text(
                  bankTitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyle.blackBold14.copyWith(
                    fontSize: 12 * SizeConfig.textMultiplier!,
                    color: AppColors.kPureBlack,
                  ),
                ),
              ) :
              Text(
                bankTitle,
                style: AppTextStyle.blackBold14.copyWith(
                  fontSize: 12 * SizeConfig.textMultiplier!,
                  color: AppColors.kPureBlack,
                ),
              ),
              if (isPrimary)
                Container(
                  margin:
                  EdgeInsets.only(left: 8 * SizeConfig.widthMultiplier!),
                  padding: EdgeInsets.symmetric(
                    horizontal: 8 * SizeConfig.widthMultiplier!,
                    vertical: 2 * SizeConfig.heightMultiplier!,
                  ),
                  decoration: BoxDecoration(
                      color: AppColors.bluePrimary800,
                      borderRadius: BorderRadius.circular(4)),
                  child: Text(
                    "Primary",
                    style: AppTextStyle.whiteSemiBold10Weight600,
                  ),
                )
            ],
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            bankAcNo,
            style: AppTextStyle.greyMedium12Weight500.copyWith(
              fontSize: 10 * SizeConfig.textMultiplier!,
            ),
          ),
        ],
      )
    ],
  );
}

enum AddFundBottomBarCallFrom {
  addFunds,
  manageFunds,
  marginUtilization,
}

class AddFundBottomBar extends StatefulWidget {
  bool isButtonEnabled;

  AddFundBottomBarCallFrom addFundBottomBarCallFrom;
  bool isFromOrderPage;

  AddFundBottomBar(
      {super.key,
      required this.isButtonEnabled,
      required this.addFundBottomBarCallFrom,
      required this.isFromOrderPage});

  @override
  State<AddFundBottomBar> createState() => _AddFundBottomBarState();
}

class _AddFundBottomBarState extends State<AddFundBottomBar> with WidgetsBindingObserver{

  @override
  void initState() {
    WidgetsBinding.instance
        .addPostFrameCallback((_) => setInitialValue());

    super.initState();
  }


  bool isInitialised = false;
  bool isHeadlessInitialised =  false;

  Future<void> setInitialValue() async {
    await getIt<JusPay>().checkJusPayInit(startFor: StartPaymentFlowFor.normal);
    isInitialised = getIt<JusPay>().isInitialisedGlobalNormal;
    isHeadlessInitialised = getIt<JusPay>().isInitialisedGlobalHeadless;
     setState(() {});
  }

  @override
  void dispose() {
    getIt<AddfundsCubit>().showAddFundProgressBar = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
            providers: [
              BlocProvider<AddfundsCubit>.value(value: getIt<AddfundsCubit>()),
            ],
            child: BlocBuilder<AddfundsCubit, AddfundsState>(
              builder: (context, state) {
                if (state is AddfundsLoaded) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                        if(getIt<AddfundsCubit>().addFundDefaultMethodModel!.headlessPayment == true)
                          ...[Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              8 * SizeConfig.widthMultiplier!),
                                          border: Border.all(
                                              width: 1,
                                              color: AppColors.grey500)),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical:
                                                4 * SizeConfig.heightMultiplier!,
                                            horizontal:
                                                8 * SizeConfig.widthMultiplier!),
                                        child: Image.network(
                                          // fit: BoxFit.fill,
                                          getIt<AddfundsCubit>().addFundDefaultMethodModel!.logoUrl ??
                                              '',
                                          height:
                                              32 * SizeConfig.heightMultiplier!,
                                          width:
                                              32 * SizeConfig.heightMultiplier!,
                                          errorBuilder: (c, o, s) {
                                            return Image.asset(
                                              ImagePath.warningImage,
                                              height: 32 *
                                                  SizeConfig.heightMultiplier!,
                                              width: 32 *
                                                  SizeConfig.heightMultiplier!,
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 16 * SizeConfig.widthMultiplier!,
                                    ),
                                    // Column(
                                    //   crossAxisAlignment:
                                    //       CrossAxisAlignment.start,
                                    //   children: [
                                        Expanded(
                                          child: Text(
                                            (getIt<AddfundsCubit>().addFundDefaultMethodModel!
                                                        .headlessPayment ==
                                                    true)
                                                ? getIt<AddfundsCubit>().addFundDefaultMethodModel!
                                                            .lastPaymentMethod
                                                            ?.toLowerCase() ==
                                                        "upi_intent"
                                                    ? "Pay using ${getIt<AddfundsCubit>().addFundDefaultMethodModel!.upiAppName!}"
                                                    : getIt<AddfundsCubit>().addFundDefaultMethodModel!
                                                                .lastPaymentMethod
                                                                ?.toLowerCase() ==
                                                            "upi_collect"
                                                        ? "Pay using ${getIt<AddfundsCubit>().addFundDefaultMethodModel!.vpa!}"
                                                        : "Pay using NetBanking"
                                                : "Amount will be debited from",
                                            maxLines: 1,
                                            style: /*(getIt<AddfundsCubit>().addFundDefaultMethodModel!
                                                        .headlessPayment ==
                                                    true)
                                                ?*/ TextStyle(
                                                    color:
                                                        AppColors.blackShadeColor,
                                                    fontSize: 14 * SizeConfig.textMultiplier!,
                                                    fontWeight: FontWeight.w600)
                                                /*: TextStyle(
                                                    color: AppColors.grey500,
                                                    fontSize: 14 * SizeConfig.textMultiplier!,
                                                    fontWeight: FontWeight.w600,
                                                  )*/,
                                          ),
                                        ),
                                        // SizedBox(
                                        //   height:
                                        //       4 * SizeConfig.heightMultiplier!,
                                        // ),
                                        // Text(
                                        //   '${getIt<AddfundsCubit>().addFundDefaultMethodModel!.bankName ?? ''} ${getIt<AddfundsCubit>().addFundDefaultMethodModel!.bankAccNo ?? ''}',
                                        //   style: !(getIt<AddfundsCubit>().addFundDefaultMethodModel!
                                        //               .headlessPayment ==
                                        //           true)
                                        //       ? TextStyle(
                                        //           color:
                                        //               AppColors.blackShadeColor,
                                        //           fontSize: 12 *
                                        //               SizeConfig.textMultiplier!,
                                        //           fontWeight: FontWeight.w500)
                                        //       : TextStyle(
                                        //           color: AppColors.grey500,
                                        //           fontSize: 12 *
                                        //               SizeConfig.textMultiplier!,
                                        //           fontWeight: FontWeight.w500,
                                        //         ),
                                        // ),
                                    //   ],
                                    // ),
                                  ],
                                ),
                              ),
                              if (getIt<AddfundsCubit>().addFundDefaultMethodModel!.headlessPayment ==
                                  true)
                                InkWell(
                                  onTap: () async {
                                    FocusManager.instance.primaryFocus
                                        ?.unfocus();
                                    if (widget.isButtonEnabled) {
                                      if (widget.addFundBottomBarCallFrom ==
                                          AddFundBottomBarCallFrom
                                              .manageFunds) {
                                        sendAnalyticsEvents(
                                          "cta_clicked",
                                          {
                                            'page': 'manage_funds',
                                            'widget': 'add_funds',
                                            'cta_text': 'change',
                                            'amount': getIt<AddfundsCubit>()
                                                .addFundController
                                                .text,
                                          },
                                        );
                                      } else if (widget
                                              .addFundBottomBarCallFrom ==
                                          AddFundBottomBarCallFrom.addFunds) {
                                        sendAnalyticsEvents(
                                          "cta_clicked",
                                          {
                                            'page': 'add_funds',
                                            'cta_text': 'change',
                                            'amount': getIt<AddfundsCubit>()
                                                .addFundController
                                                .text,
                                          },
                                        );
                                      } else if (widget
                                              .addFundBottomBarCallFrom ==
                                          AddFundBottomBarCallFrom
                                              .marginUtilization) {
                                        sendAnalyticsEvents(
                                          "cta_clicked",
                                          {
                                            'page': 'avl_margin_details',
                                            'widget': 'add_funds',
                                            'cta_text': 'change',
                                            'amount': getIt<AddfundsCubit>()
                                                .addFundController
                                                .text,
                                          },
                                        );
                                      }
                                      if (!getIt<AddfundsCubit>()
                                          .showAddFundProgressBar) {
                                        getIt<AddfundsCubit>()
                                            .changeAddFundButtonStatus(true);
                                        FocusScope.of(context).unfocus();
                                        await getIt<AddfundsCubit>()
                                            .addFundApiCall(
                                                context,
                                                isInitialised: isInitialised,
                                                isHeadlessInitialised: isHeadlessInitialised,
                                                isFromOrderPage:
                                                    widget.isFromOrderPage);
                                      }
                                    }
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text('Change',
                                          style: TextStyle(
                                              color: AppColors.bluePrimary800,
                                              fontSize: 12 *
                                                  SizeConfig.textMultiplier!,
                                              fontWeight: FontWeight.w600)),
                                      SizedBox(
                                        width: 4 * SizeConfig.widthMultiplier!,
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios_outlined,
                                        color: AppColors.bluePrimary800,
                                        size: 12,
                                      )
                                    ],
                                  ),
                                ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 8 * SizeConfig.heightMultiplier!,
                        ),],
                        InkWell(
                          onTap: () async {
                            FocusManager.instance.primaryFocus?.unfocus();
                            if (widget.isButtonEnabled &&
                                !getIt<AddfundsCubit>()
                                    .showAddFundProgressBar) {
                              getIt<AddfundsCubit>()
                                  .changeAddFundButtonStatus(true);
                              if (widget.addFundBottomBarCallFrom ==
                                  AddFundBottomBarCallFrom.manageFunds) {
                                sendAnalyticsEvents(
                                  "cta_clicked",
                                  {
                                    'page': 'manage_funds',
                                    'widget': 'add_funds',
                                    'cta_text': 'proceed_to_add_funds',
                                    'amount': getIt<AddfundsCubit>()
                                        .addFundController
                                        .text,
                                    'payment_method':
                                    getIt<AddfundsCubit>().addFundDefaultMethodModel
                                            ?.lastPaymentMethod
                                            ?.toLowerCase(),
                                    'bank': getIt<AddfundsCubit>().addFundDefaultMethodModel
                                        ?.bankName
                                        ?.toLowerCase(),
                                  },
                                );
                              } else if (widget.addFundBottomBarCallFrom ==
                                  AddFundBottomBarCallFrom.addFunds) {
                                sendAnalyticsEvents(
                                  "cta_clicked",
                                  {
                                    'page': 'add_funds',
                                    'widget': 'add_funds',
                                    'cta_text': 'proceed_to_add_funds',
                                    'amount': getIt<AddfundsCubit>()
                                        .addFundController
                                        .text,
                                    'payment_method':
                                    getIt<AddfundsCubit>().addFundDefaultMethodModel
                                            ?.lastPaymentMethod
                                            ?.toLowerCase(),
                                    'bank': getIt<AddfundsCubit>().addFundDefaultMethodModel
                                        ?.bankName
                                        ?.toLowerCase(),
                                  },
                                );
                              } else if (widget.addFundBottomBarCallFrom ==
                                  AddFundBottomBarCallFrom
                                      .marginUtilization) {
                                sendAnalyticsEvents(
                                  "cta_clicked",
                                  {
                                    'page': 'avl_margin_details',
                                    'widget': 'add_funds',
                                    'cta_text': 'proceed_to_add_funds',
                                    'amount': getIt<AddfundsCubit>()
                                        .addFundController
                                        .text,
                                    'payment_method':
                                    getIt<AddfundsCubit>().addFundDefaultMethodModel
                                            ?.lastPaymentMethod
                                            ?.toLowerCase(),
                                    'bank': getIt<AddfundsCubit>().addFundDefaultMethodModel
                                        ?.bankName
                                        ?.toLowerCase(),
                                  },
                                );
                              }
                              FocusScope.of(context).unfocus();
                              if (getIt<AddfundsCubit>().addFundDefaultMethodModel!
                                      .headlessPayment ==
                                  true) {
                                await getIt<AddfundsCubit>()
                                    .addFundHeadlessApiCall(
                                        context, getIt<AddfundsCubit>().addFundDefaultMethodModel!,
                                        isInitialised: isHeadlessInitialised,
                                        isNormalInitialised: isInitialised,
                                        isFromOrderPage:
                                            widget.isFromOrderPage);
                              } else {
                                await getIt<AddfundsCubit>().addFundApiCall(
                                    context,
                                    isInitialised: isInitialised,
                                    isHeadlessInitialised: isHeadlessInitialised,
                                    isFromOrderPage: widget.isFromOrderPage);
                              }
                            }
                          },
                          child: Container(
                            width: double.infinity,
                            height: 40 * SizeConfig.heightMultiplier!,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: widget.isButtonEnabled
                                    ? AppColors.textGreen
                                    : AppColors.grey500),
                            child: Center(
                              child: getIt<AddfundsCubit>().showAddFundProgressBar
                                  ? const CircularProgressIndicator(
                                      strokeWidth: 1.5,
                                      valueColor:
                                          AlwaysStoppedAnimation<Color>(
                                              Colors.white),
                                    )
                                  : Text(
                                      "Proceed to add funds",
                                      style: AppTextStyle
                                          .greyMedium14Weight500
                                          .copyWith(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700,
                                              color: AppColors.kPureWhite),
                                    ),
                            ),
                          ),
                        ),
                        if(Platform.isIOS)
                          SizedBox(
                            height: 8 * SizeConfig.heightMultiplier!,
                          ),
                    ],
                  );
                } else  {
                  return
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 40 * SizeConfig.heightMultiplier!,
                          width: double.infinity,
                          child: Center(
                              child: CircularProgressIndicator(
                                strokeWidth: 1.5,
                                color: AppColors.whiteTextColor,
                                backgroundColor: AppColors.primaryBlue900,
                              )),
                        ),
                      ],
                    );
                }
              },
            ),
          );
  }
}