#!/usr/bin/env pwsh
# Canonical : https://github.com/lduran2/winbatterytools/blob/master/ps1/BatteryRange.ps1
# Alerts when the battery charge is out of range every configured
# interval of time.
#
# By        : Leomar Durán <https://github.com/lduran2/>
# When      : 2022-01-03t03:40R
# Version   : 1.0.0
#
# CHANGELOG :
#   v1.0.0 - 2022-01-03t03:40R
#       successfully printing charge capacity using `WmiObject`
#
#   v0.1.0a - 2022-01-03t01:45R
#       testing results for query with `WbemScripting.SWbemLocator`
#
#   v0.0.0 - 2022-01-02t22:10R
#       hello world implementation
###

# import Forms for MessageBox
Add-Type -AssemblyName System.Windows.Forms;

# Limits after which to display messages
Set-Variable BATTERY_MAX -Option Constant -Value 85;    # upper limit
Set-Variable BATTERY_MIN -Option Constant -Value 15;    # lower limit
# interval to sleep between charge checks
Set-Variable INTERVAL_TO_SLEEP -Option Constant -Value 2;   # [min]
# whether to log life cycle messages
Set-Variable VERBOSE -Option Constant -Value $true;

# the management instrumentation namespace, containing battery data
Set-Variable MANAGEMENT_NAMESPACE -Option Constant -Value 'root\WMI';
# this computer
Set-Variable COMPUTER_NAME -Option Constant -Value '.';
# class for full charge amount
Set-Variable CHARGE_CAP_CLASS -Option Constant `
    -Value 'BatteryFullChargedCapacity';

# query for charge capacity
$FullChargeResult = Get-WmiObject -Computer $COMPUTER_NAME `
    -Namespace $MANAGEMENT_NAMESPACE -Class $CHARGE_CAP_CLASS;

# print the result
Write-Host($FullChargeResult.FullChargedCapacity)
