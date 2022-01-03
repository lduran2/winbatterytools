#!/usr/bin/env pwsh
# Canonical : https://github.com/lduran2/winbatterytools/blob/master/ps1/BatteryRange.ps1
# Alerts when the battery charge is out of range every configured
# interval of time.
#
# By        : Leomar Durán <https://github.com/lduran2/>
# When      : 2022-01-03t01:45R
# Version   : 0.1.0a
#
# CHANGELOG :
#   v0.0.0 - 2022-01-03t01:45R
#       testing results for query with WbemScripting.SWbemLocator
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
# query for full charge ammount
Set-Variable CHARGE_CAP_QUERY -Option Constant `
    -Value 'SELECT * FROM BatteryFullChargedCapacity';

# create services locator
$Locator = New-Object -ComObject 'WbemScripting.SWbemLocator';
# connect to management namespace
$Services = $Locator.ConnectServer($COMPUTER_NAME, $MANAGEMENT_NAMESPACE);
# query for charge capacity
$FullChargeResults = $Services.ExecQuery($CHARGE_CAP_QUERY);

Write-Host($FullChargeResults)

foreach ($result in $FullChargeResults) {
    Write-Host($result.FullChargedCapacity)
} # next $result in $FullChargeResults
