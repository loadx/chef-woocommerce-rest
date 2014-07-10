afa-time Cookbook
================
Installs and confiugures both timezone information and NTP for time syncronizing


Requirements
------------
#### packages
- `ntp`
- `timezone-ii`

Attributes
----------
#### afa-ntp::default
By default the cookbook sets the following attributes
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
  </tr>
  <tr>
    <td><tt>tz</tt></td>
    <td>String</td>
    <td>Sets the timezone name as defined in `tzdata`</td>
  </tr>
  <tr>
    <td><tt>ntp['servers']</tt></td>
    <td>List</td>
    <td>List of NTP servers to syncronize the time from</td>
  </tr>
  <tr>
    <td><tt>['ntp']['sync_hw_clock']</tt></td>
    <td>Boolean</td>
    <td>Force the hardware clock to be syncronized with NTP on converge</td>
  </tr>
</table>

If you wish to change these over-ride as appopriate and consider putting this in .kitchen.local.yml

Usage
-----
#### afa-ntp::default
include `afa-ntp` in your node's `run_list`.

Authors
---
Mat Brennan (mbrennan@afainsurance.com)

