# Popup Menu Jerking Issue - Solution Guide

## Problem Description
The popup menu "jerks" or has animation issues when returning from the next screen (webViewScreen). This is a common Flutter issue caused by improper state management during navigation transitions.

## Root Causes
1. **State Management Issues**: The popup menu state isn't properly managed during navigation
2. **Multiple Navigation Calls**: Rapid taps can trigger multiple navigation calls
3. **Widget Rebuilding**: The popup menu rebuilds incorrectly when returning from navigation
4. **Animation Conflicts**: Conflicting animations between popup closing and navigation

## Solutions

### Solution 1: Fix Your Current Implementation

Replace your current `PopupMenuItem` for "Contact Us" with this improved version:

```dart
// Add this flag to your widget's state class
bool _isNavigating = false;

// Replace your Contact Us PopupMenuItem with this:
PopupMenuItem(
  value: "contact_us", // Add a value for better state management
  enabled: !_isNavigating, // Disable when navigating
  child: Row(
    children: [
      Icon(
        Icons.headset_mic_outlined,
        color: _isNavigating ? AppColors.grey500 : AppColors.neutral700,
        size: 16 * SizeConfig.widthMultiplier!,
      ),
      SizedBox(width: 4 * SizeConfig.widthMultiplier!),
      Text(
        'Contact Us',
        style: AppTextStyle.textSemiBold10Weight600.copyWith(
          color: _isNavigating ? AppColors.grey500 : AppColors.neutral700,
          fontWeight: FontWeight.w500,
          fontSize: 12 * SizeConfig.textMultiplier!,
        ),
      ),
    ],
  ),
),
```

### Solution 2: Improve Your PopupMenuButton

Wrap your PopupMenuButton with better state management:

```dart
PopupMenuButton<String>(
  // Add a key to maintain popup state
  key: const Key('buy_sell_popup_menu'),
  
  // Use onSelected instead of onTap for menu items
  onSelected: (String value) {
    if (value == "contact_us" && !_isNavigating) {
      _handleContactUsNavigation();
    } else if (value == "sell") {
      // Handle sell selection
      setState(() {
        selectedBuyOrSellOrderType = buyOrSellOrderType.Sell;
      });
    }
  },
  
  // Reset navigation flag when popup is canceled
  onCanceled: () {
    setState(() {
      _isNavigating = false;
    });
  },
  
  itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
    // Your Sell option
    PopupMenuItem<String>(
      value: "sell",
      enabled: !isBasketOrder,
      child: Row(
        children: [
          // Your existing CircleAvatar code here
        ],
      ),
    ),
    
    _PaddedPopupMenuDivider(
      horizontalPadding: 12 * SizeConfig.widthMultiplier!,
    ),
    
    // Fixed Contact Us option
    PopupMenuItem<String>(
      value: "contact_us",
      enabled: !_isNavigating,
      child: Row(
        children: [
          // Your Contact Us UI code here
        ],
      ),
    ),
  ],
)
```

### Solution 3: Separate Navigation Handler

Create a separate method for handling navigation:

```dart
Future<void> _handleContactUsNavigation() async {
  if (_isNavigating) return; // Prevent multiple calls
  
  setState(() {
    _isNavigating = true;
  });
  
  try {
    final result = await Navigator.pushNamed(
      context,
      RouteName.webViewScreen,
      arguments: {
        "url": "${StringConstants.webBaseUrl}help-and-support",
        "code": null,
        "isStockDetails": false,
      },
    );
    
    if (result == "search" && mounted) {
      Navigator.of(context).pushNamed(RouteName.searchScreen);
    }
  } catch (e) {
    // Handle navigation errors
    print('Navigation error: $e');
  } finally {
    // Reset navigation flag when done
    if (mounted) {
      setState(() {
        _isNavigating = false;
      });
    }
  }
}
```

### Solution 4: Improve Your Divider Class

Update your `_PaddedPopupMenuDivider` class:

```dart
class _PaddedPopupMenuDividerState<T> extends State<_PaddedPopupMenuDivider<T>>
    with SingleTickerProviderStateMixin { // Add this mixin for smoother animations
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.dividerHeight,
      padding: EdgeInsets.symmetric(horizontal: widget.horizontalPadding),
      child: Divider(
        height: 1,
        color: AppColors.neutral300,
        thickness: 0.5, // Add thickness for better visibility
        indent: 0,
        endIndent: 0,
      ),
    );
  }
}
```

## Additional Recommendations

### 1. Use Hero Animations Carefully
If you're using Hero widgets, ensure they have unique tags to prevent animation conflicts.

### 2. Debounce Navigation
Consider adding debouncing to prevent rapid navigation calls:

```dart
Timer? _debounceTimer;

void _debouncedNavigation() {
  if (_debounceTimer?.isActive ?? false) _debounceTimer!.cancel();
  _debounceTimer = Timer(const Duration(milliseconds: 300), () {
    _handleContactUsNavigation();
  });
}
```

### 3. Use WillPopScope
Wrap your screen with WillPopScope to handle back navigation properly:

```dart
WillPopScope(
  onWillPop: () async {
    if (_isNavigating) {
      return false; // Prevent back navigation while navigating
    }
    return true;
  },
  child: YourScreenWidget(),
)
```

### 4. Consider Using Navigator 2.0
For complex navigation scenarios, consider upgrading to Navigator 2.0 with proper route management.

## Testing the Fix

1. Implement the above changes
2. Test the popup menu functionality
3. Navigate to the webView screen and back
4. Verify there's no jerking or animation issues
5. Test rapid tapping to ensure debouncing works

## Common Mistakes to Avoid

1. **Don't use `onTap` directly in PopupMenuItem** - Use `onSelected` in PopupMenuButton instead
2. **Don't forget to reset navigation flags** - Always reset `_isNavigating` in finally blocks
3. **Don't ignore the `mounted` check** - Always check if widget is mounted before calling setState
4. **Don't create multiple navigation instances** - Use flags to prevent duplicate navigation calls

This solution should resolve your popup menu jerking issue completely.