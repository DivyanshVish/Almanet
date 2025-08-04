# Top Gainers/Losers Widget Fix - Implementation Guide

## Problem Analysis

The issue occurs because:
1. **Stale Data Persistence**: When the app is opened before market hours (before 9:15 AM), it loads the previous day's top gainers/losers
2. **No Market Session Detection**: The widget doesn't detect when the market opens and fails to refresh the stock list
3. **Socket Updates Only Prices**: The WebSocket only updates individual stock prices but doesn't refresh the entire list of stocks
4. **No Sync with Screener Page**: The widget data becomes out of sync with the screener page data

## Solution Overview

The fix implements:
1. **Market Session Monitoring**: Automatic detection of market open/close times (9:15 AM - 3:30 PM IST)
2. **Automatic Data Refresh**: Triggers data refresh when market opens or when app is resumed after market hours
3. **App Lifecycle Management**: Properly handles app foreground/background transitions
4. **Visual Indicators**: Shows live status and last update time

## Key Changes Made

### 1. Added Market Session Monitoring
```dart
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
  }
}
```

### 2. Added Refresh Callback Mechanism
```dart
class TableView extends StatefulWidget {
  Market? data;
  final VoidCallback? onRefreshData; // NEW: Callback to refresh data from parent
  
  TableView({super.key, required this.data, this.onRefreshData});
}
```

### 3. Enhanced App Lifecycle Handling
```dart
@override
void didChangeAppLifecycleState(AppLifecycleState state) {
  super.didChangeAppLifecycleState(state);
  
  if (state == AppLifecycleState.resumed) {
    // Check if we need to refresh data when app comes to foreground
    _checkAndRefreshIfNeeded();
  }
}
```

### 4. Added Visual Status Indicators
```dart
// Shows live status and last update time
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
          style: TextStyle(fontSize: 10, color: Colors.grey[600]),
        ),
      ],
    ),
  ),
```

## Implementation Steps

### Step 1: Update Your TableView Widget
Replace your existing TableView widget with the fixed version provided in `lib/widgets/table_view_fixed.dart`.

### Step 2: Update Parent Widget/Screen
Modify the parent widget that uses TableView to provide the refresh callback:

```dart
class YourParentWidget extends StatefulWidget {
  @override
  _YourParentWidgetState createState() => _YourParentWidgetState();
}

class _YourParentWidgetState extends State<YourParentWidget> {
  Market? topGainersData;
  Market? topLosersData;

  // Method to refresh data from API
  Future<void> _refreshMarketData() async {
    try {
      // Call your API to get fresh top gainers/losers data
      final freshData = await YourApiService.getTopMovers();
      
      setState(() {
        topGainersData = freshData.topGainers;
        topLosersData = freshData.topLosers;
      });
    } catch (e) {
      print('Error refreshing market data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Top Gainers Widget
        TableView(
          data: topGainersData,
          onRefreshData: _refreshMarketData, // Pass the refresh callback
        ),
        
        // Top Losers Widget
        TableView(
          data: topLosersData,
          onRefreshData: _refreshMarketData, // Pass the refresh callback
        ),
      ],
    );
  }
}
```

### Step 3: Ensure API Integration
Make sure your API service can be called to refresh the top gainers/losers data:

```dart
class YourApiService {
  static Future<MarketMoversResponse> getTopMovers() async {
    // Call your backend API to get fresh data
    final response = await http.get(Uri.parse('your-api-endpoint/top-movers'));
    
    if (response.statusCode == 200) {
      return MarketMoversResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load market data');
    }
  }
}
```

### Step 4: Test the Implementation

#### Test Scenarios:
1. **Pre-Market Opening**: Open app before 9:15 AM, wait until market opens, verify data refreshes
2. **App Resume**: Open app before market hours, minimize app, resume after market opens
3. **Long Session**: Keep app open for extended periods, verify periodic refreshes
4. **Weekend/Holiday**: Verify no unnecessary API calls on non-trading days

#### Expected Behavior:
- ✅ Data refreshes automatically when market opens
- ✅ Shows live indicator during market hours
- ✅ Displays last update time
- ✅ Handles app lifecycle transitions properly
- ✅ Matches screener page data

## Additional Recommendations

### 1. Add Error Handling
```dart
void _refreshDataIfNeeded() {
  if (widget.onRefreshData != null) {
    try {
      widget.onRefreshData!();
      _lastDataRefresh = DateTime.now();
    } catch (e) {
      // Handle refresh errors gracefully
      print('Error refreshing data: $e');
    }
  }
}
```

### 2. Add Loading States
```dart
bool _isRefreshing = false;

void _refreshDataIfNeeded() async {
  if (widget.onRefreshData != null && !_isRefreshing) {
    setState(() => _isRefreshing = true);
    
    try {
      await widget.onRefreshData!();
      _lastDataRefresh = DateTime.now();
    } catch (e) {
      print('Error refreshing data: $e');
    } finally {
      if (mounted) setState(() => _isRefreshing = false);
    }
  }
}
```

### 3. Add Caching Strategy
```dart
// Cache data to avoid unnecessary API calls
class MarketDataCache {
  static Market? _cachedTopGainers;
  static Market? _cachedTopLosers;
  static DateTime? _lastCacheTime;
  
  static bool shouldRefreshCache() {
    if (_lastCacheTime == null) return true;
    
    final now = DateTime.now();
    final timeDiff = now.difference(_lastCacheTime!).inMinutes;
    
    // Refresh cache every 5 minutes during market hours
    return timeDiff >= 5;
  }
}
```

## Testing Checklist

- [ ] Widget refreshes data when market opens (9:15 AM)
- [ ] Widget handles app resume correctly
- [ ] Visual indicators show correct status
- [ ] No unnecessary API calls during off-market hours
- [ ] Data stays in sync with screener page
- [ ] Socket connections work properly after refresh
- [ ] Error handling works for failed API calls
- [ ] Performance is not impacted by monitoring

## Deployment Notes

1. **Gradual Rollout**: Consider A/B testing the fix with a subset of users first
2. **Monitoring**: Add analytics to track refresh events and success rates
3. **Fallback**: Keep the old widget as a fallback option in case of issues
4. **Documentation**: Update your team documentation with the new refresh mechanism

This fix should resolve the issue where users see stale top gainers/losers data when opening the app before market hours.