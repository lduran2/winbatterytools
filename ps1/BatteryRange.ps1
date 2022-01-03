#!/usr/bin/env pwsh
###
# Canonical : https://github.com/lduran2/winbatterytools/blob/master/ps1/BatteryRange.ps1
# Alerts when the battery charge is out of range every configured
# interval of time.
#
# By        : Leomar Durán <https://github.com/lduran2/>
# When      : 2022-01-02t22:10R
# Version   : 0.0.0
#
# CHANGELOG :
#   v0.0.0 - 2022-01-02t22:10R
#       hello world implementation
###
Add-Type -AssemblyName System.Windows.Forms;
[System.Windows.Forms.MessageBox]::Show('Hello, world!', 'Battery Range (PowerShell)');