`{ironmarch}`
================

  - [Introduction](#introduction)
  - [Installation](#installation)
  - [Usage](#usage)
      - [Builders](#builders)
  - [Original Site Data](#original-site-data)
      - [`core_*`](#core_)
      - [`orig_*`](#orig_)
      - [`forums_*`](#forums_)
      - [Other](#other)

<!-- README.Rmd generates README.md. -->

<!-- # `{ironmarch}` -->

<!-- badges: start -->

<!-- [![R build status](https://github.com/knapply/ironmarch/workflows/R-CMD-check/badge.svg)](https://github.com/knapply/ironmarch/actions?workflow=R-CMD-check) -->

[![AppVeyor build
status](https://ci.appveyor.com/api/projects/status/github/knapply/ironmarch?branch=master&svg=true)](https://ci.appveyor.com/project/knapply/ironmarch)
[![Travis-CI Build
Status](https://travis-ci.org/knapply/ironmarch.svg?branch=master)](https://travis-ci.org/knapply/ironmarch)
[![Codecov test
coverage](https://codecov.io/gh/knapply/ironmarch/branch/master/graph/badge.svg)](https://codecov.io/gh/knapply/ironmarch?branch=master)
[![GitHub last
commit](https://img.shields.io/github/last-commit/knapply/ironmarch.svg)](https://github.com/knapply/ironmarch/commits/master)
[![License: GPL
v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)
[![Depends](https://img.shields.io/badge/Depends-GNU_R%3E=3.5-blue.svg)](https://www.r-project.org/)
<!-- badges: end -->

## Introduction

`{ironmarch}` contains data and analytical routines related to
*ironmarch.org*, a now-defunct neo-Nazi/white supremacist message board.

The site data were extracted from the MySQL database that was originally
posted on Internet Archive. You can find more information in
[Bellingcat’s
description](https://www.bellingcat.com/resources/how-tos/2019/11/06/massive-white-supremacist-message-board-leak-how-to-access-and-interpret-the-data/).

## Installation

> Before installing, understand that this is not a typical R package.
> The `/data` folder alone is **142 MB**.

``` r
if (!requireNamespace("remotes", quietly = TRUE)) install.packages("remotes")
remotes::install_github("knapply/ironmarch")
```

## Usage

``` r
library(ironmarch)
```

### Builders

`build_*()` functions reconcile and merge data from the relevant
`im_core*` and `im_orig*` data frames.

``` r
build_messages()
```

    #> # A tibble: 22,309 x 8
    #>    msg_id msg_topic_id msg_date            msg_post                                                      msg_post_key        msg_author_id msg_ip_address msg_is_first_po…
    #>     <int>        <int> <dttm>              <chr>                                                         <chr>                       <int> <chr>          <lgl>           
    #>  1      1            1 2011-09-16 03:49:58 "<p>The best first post to make on our forums is the one whe… 3320f7f06c422ef0fb…             1 178.140.119.2… TRUE            
    #>  2      2            2 2011-09-16 11:54:08 "\n<p>Who are we hosting this forum from?</p>\n<p>I like it … 9204e4883321af2275…            11 109.78.212.13  TRUE            
    #>  3      3            2 2011-09-16 14:39:59 "<p>Crisis Host - they basically provide hosting for free sp… 12fd0309239711d02b…             1 178.140.119.2… FALSE           
    #>  4      4            2 2011-09-16 15:29:01 "<p>Thank you, I'll make a note of it, I am very impressed b… 0658c6f99ac18d9060…            11 109.78.212.13  FALSE           
    #>  5      5            2 2011-09-16 15:32:58 "<p>If you mean the dark+orange skin then that's a skin I al… 570257864e3cb812ee…             1 178.140.119.2… FALSE           
    #>  6      6            2 2011-09-16 15:44:51 "<p>The functionality mostly, thanks for the info.</p>"       aabeacc8f4ccc579c4…            11 109.78.212.13  FALSE           
    #>  7      7            3 2011-09-17 01:43:49 "<p>I don't see why one would want to resuscitate Religio Ro… a36f67c0d722aa8d1d…            16 152.33.69.70   TRUE            
    #>  8      8            3 2011-09-17 01:59:50 "\n<blockquote data-ipsquote=\"\" class=\"ipsQuote\" data-ip… 327b933d818a39dc6a…            14 71.114.56.45   FALSE           
    #>  9     12            5 2011-09-20 14:20:14 "<p>The best first post to make on our forums is the one whe… 0667258c387129ea0d…             1 178.140.121.11 TRUE            
    #> 10     13            5 2011-09-20 14:42:17 "<p>Done and done. I meant to post something there but i am … de1d7fd2737dd852f5…            20 94.103.203.197 FALSE           
    #> # … with 22,299 more rows

``` r
build_members()
```

    #> # A tibble: 1,542 x 83
    #>    member_id name  member_group_id email joined              ip_address allow_admin_mai…  skin warn_level warn_lastwarn restrict_post bday_day bday_month bday_year
    #>        <int> <chr>           <int> <chr> <dttm>              <chr>      <lgl>            <int>      <int>         <int> <lgl>            <int>      <int>     <int>
    #>  1         1 Алек…               4 slav… 2011-09-12 15:46:59 178.140.1… FALSE                0          0             0 FALSE               28          6         0
    #>  2         2 Phal…              13 illu… 2011-09-12 15:52:30 68.37.21.… TRUE                 0          0             0 FALSE                0          0         0
    #>  3         3 Bloo…              13 rene… 2011-09-12 18:10:11 68.10.255… TRUE                 0          0             0 FALSE                0          0         0
    #>  4         4 Mier…              13 homi… 2011-09-12 20:27:35 82.29.169… FALSE                0          0             0 FALSE                0          0         0
    #>  5         5 Will…              14 tash… 2011-09-12 20:58:17 90.214.15… TRUE                 0          0             0 FALSE                7         12         0
    #>  6         7 Dadd…              13 benj… 2011-09-13 01:22:58 81.141.31… TRUE                 0          0             0 FALSE                3          5      1989
    #>  7         8 Mr. …              13 elei… 2011-09-13 04:24:07 98.198.24… TRUE                 0          0             0 FALSE                9          8      1989
    #>  8         9 Woma…              14 sol.… 2011-09-13 10:27:52 88.147.27… FALSE                0          0             0 FALSE               15         10      1970
    #>  9        11 Four…              13 o244… 2011-09-13 12:14:28 109.77.91… FALSE                0          0             0 FALSE                0          0         0
    #> 10        12 Jami…              14 jami… 2011-09-13 17:43:02 86.134.81… TRUE                 0          0             0 FALSE                0          0         0
    #> # … with 1,532 more rows, and 69 more variables: msg_count_new <int>, msg_count_total <int>, msg_show_notification <lgl>, last_visit <dttm>, last_activity <dttm>,
    #> #   mod_posts <lgl>, auto_track <chr>, temp_ban <lgl>, mgroup_others <chr>, member_login_key_expire <dttm>, members_seo_name <chr>, members_cache <chr>,
    #> #   members_disable_pm <int>, failed_logins <chr>, members_profile_views <int>, members_pass_hash <chr>, members_pass_salt <chr>, members_bitoptions <int>,
    #> #   members_day_posts <chr>, notification_cnt <int>, posts <int>, title <chr>, time_offset <chr>, last_post <dttm>, view_sigs <lgl>, msg_count_reset <lgl>,
    #> #   dst_in_use <lgl>, login_anonymous <chr>, ignored_users <chr>, org_perm_id <chr>, member_login_key <chr>, members_auto_dst <lgl>, members_display_name <chr>,
    #> #   members_l_display_name <chr>, members_l_username <chr>, member_banned <lgl>, member_uploader <chr>, language <int>, failed_login_count <int>, pp_last_visitors <chr>,
    #> #   pp_main_photo <chr>, pp_main_width <int>, pp_main_height <int>, pp_thumb_photo <chr>, pp_thumb_width <int>, pp_thumb_height <int>, pp_setting_count_comments <lgl>,
    #> #   pp_reputation_points <int>, pp_gravatar <chr>, pp_photo_type <chr>, signature <chr>, fb_bwoptions <lgl>, tc_last_sid_import <chr>, tc_bwoptions <lgl>,
    #> #   pp_customization <chr>, timezone <chr>, pp_cover_photo <chr>, members_bitoptions2 <int>, create_menu <chr>, marked_site_read <int>, pp_cover_offset <int>,
    #> #   acp_skin <lgl>, acp_language <lgl>, member_title <chr>, member_posts <int>, member_last_post <int>, member_streams <chr>, photo_last_update <dttm>,
    #> #   msg_count_reset_at <dttm>

## Original Site Data

The site data are stored in a series of named lists containing data
frames, all of which are prefixed with `im_`.

  - The following lists correspond to tables whose original names are
    prefixed with `core_`, `orig_`, and `forums_`:
      - `ironmarch::im_core_dfs`
      - `ironmarch::im_orig_dfs`
      - `ironmarch::im_forums_dfs`
  - The remaining tables are stored in `ironmarch::im_other_dfs`.

The following code provides examples of accessing individual tables from
each the `im_*` lists.

``` r
im_core_dfs$core_members
```

    #> # A tibble: 1,207 x 66
    #>    member_id name  member_group_id email joined              ip_address allow_admin_mai…  skin warn_level warn_lastwarn language restrict_post bday_day bday_month
    #>        <int> <chr>           <int> <chr> <dttm>              <chr>      <list>           <int>      <int>         <int>    <int>         <int>    <int>      <int>
    #>  1         1 Алек…               4 slav… 2011-09-12 15:46:59 178.140.1… <raw [1]>            0          0             0        1             0       28          6
    #>  2     14875 Poet…              17 Gray… 2017-08-29 15:39:22 199.66.88… <raw [1]>           NA         NA             0        1             0       NA         NA
    #>  3     14918 Vale…              17 oliv… 2017-09-10 15:51:00 86.10.127… <raw [1]>           NA         NA             0        1             0       NA         NA
    #>  4     14926 cucc…              14 nigg… 2017-09-12 18:29:13 172.104.1… <raw [1]>            0          0             0        1             0        0          0
    #>  5     14921 Hier…              17 Prow… 2017-09-11 11:07:06 2600:8804… <raw [1]>           NA         NA             0        1             0       NA         NA
    #>  6         2 Phal…              13 illu… 2011-09-12 15:52:30 68.37.21.… <raw [1]>            0          0             0        1             0        0          0
    #>  7     14057 Righ               13 righ… 2017-02-20 16:13:25 46.28.53.… <raw [1]>            0          0             0        0             0        0          0
    #>  8     14040 Zaxon              14 helv… 2017-02-18 09:36:32 185.93.18… <raw [1]>            0          2             0        1             0        0          0
    #>  9     14041 Солд…              13 mrel… 2017-02-18 12:06:20 2a02:c7d:… <raw [1]>            0          0             0        1             0       NA         NA
    #> 10         3 Bloo…              13 rene… 2011-09-12 18:10:11 68.10.255… <raw [1]>            0          0             0        1             0        0          0
    #> # … with 1,197 more rows, and 52 more variables: bday_year <int>, msg_count_new <int>, msg_count_total <int>, msg_count_reset <int>, msg_show_notification <lgl>,
    #> #   last_visit <dttm>, last_activity <dttm>, mod_posts <int>, auto_track <chr>, temp_ban <int>, mgroup_others <chr>, member_login_key_expire <dttm>,
    #> #   members_seo_name <chr>, members_cache <chr>, members_disable_pm <int>, failed_logins <chr>, failed_login_count <int>, members_profile_views <int>,
    #> #   members_pass_hash <chr>, members_pass_salt <chr>, members_bitoptions <int>, members_day_posts <chr>, notification_cnt <int>, pp_last_visitors <chr>,
    #> #   pp_main_photo <chr>, pp_main_width <int>, pp_main_height <int>, pp_thumb_photo <chr>, pp_thumb_width <int>, pp_thumb_height <int>, pp_setting_count_comments <lgl>,
    #> #   pp_reputation_points <int>, pp_gravatar <chr>, pp_photo_type <chr>, signature <chr>, fb_bwoptions <lgl>, tc_last_sid_import <chr>, tc_bwoptions <lgl>,
    #> #   pp_customization <chr>, timezone <chr>, pp_cover_photo <chr>, members_bitoptions2 <int>, create_menu <chr>, marked_site_read <int>, pp_cover_offset <int>,
    #> #   acp_skin <lgl>, acp_language <lgl>, member_title <chr>, member_posts <int>, member_last_post <int>, member_streams <chr>, photo_last_update <dttm>

``` r
im_orig_dfs$orig_members
```

    #> # A tibble: 763 x 51
    #>    member_id name  member_group_id email joined              ip_address posts title allow_admin_mai… time_offset  skin warn_level warn_lastwarn last_post          
    #>        <int> <chr>           <int> <chr> <dttm>              <chr>      <int> <chr> <lgl>            <chr>       <int>      <int>         <int> <dttm>             
    #>  1         1 Alex…               4 slav… 2011-09-12 15:46:59 178.140.1…  5613 My s… FALSE            3               9          0             0 2016-03-20 19:37:40
    #>  2         2 Kacen              13 illu… 2011-09-12 15:52:30 68.37.21.…  1267 THE … TRUE             -5              0          0             0 2015-09-25 18:11:45
    #>  3         3 Bloo…              13 rene… 2011-09-12 18:10:11 68.10.255…   487 14/8… TRUE             -8              9          0             0 2015-12-04 02:23:51
    #>  4         4 Mier…              13 homi… 2011-09-12 20:27:35 82.29.169…  1704 Mult… FALSE            0               0          0             0 2016-02-29 22:56:56
    #>  5         5 Will…               5 tash… 2011-09-12 20:58:17 90.214.15…   463 A fox TRUE             0               0          0             0 2012-01-26 15:02:10
    #>  6         6 Inte…              13 mich… 2011-09-12 21:14:03 86.7.229.…     9 <NA>  TRUE             0              NA         NA             0 2013-04-09 07:13:04
    #>  7         7 Benj…               4 benj… 2011-09-13 01:22:58 81.141.31…  3127 2 Mi… TRUE             0               9          0             0 2016-02-25 01:53:44
    #>  8         8 Mr. …              13 elei… 2011-09-13 04:24:07 98.198.24…   167 <NA>  TRUE             -6              0          0             0 2012-10-30 06:52:01
    #>  9         9 Woma…               5 sol.… 2011-09-13 10:27:52 88.147.27…   997 <NA>  FALSE            1               0          0             0 2012-08-25 08:34:25
    #> 10        10 Dene…              13 8056… 2011-09-13 12:13:09 72.76.138…    96 <NA>  TRUE             -5              0          0             0 2013-04-09 04:20:54
    #> # … with 753 more rows, and 37 more variables: restrict_post <chr>, view_sigs <lgl>, bday_day <int>, bday_month <int>, bday_year <int>, msg_count_new <int>,
    #> #   msg_count_total <int>, msg_count_reset <lgl>, msg_show_notification <lgl>, last_visit <dttm>, last_activity <dttm>, dst_in_use <lgl>, mod_posts <chr>,
    #> #   auto_track <chr>, temp_ban <chr>, login_anonymous <chr>, ignored_users <chr>, mgroup_others <chr>, org_perm_id <chr>, member_login_key <chr>,
    #> #   member_login_key_expire <dttm>, members_auto_dst <lgl>, members_display_name <chr>, members_seo_name <chr>, members_cache <chr>, members_disable_pm <int>,
    #> #   members_l_display_name <chr>, members_l_username <chr>, failed_logins <chr>, members_profile_views <int>, members_pass_hash <chr>, members_pass_salt <chr>,
    #> #   member_banned <lgl>, member_uploader <chr>, members_bitoptions <int>, members_day_posts <chr>, notification_cnt <int>

``` r
im_forums_dfs$forums_posts
```

    #> # A tibble: 195,128 x 15
    #>       pid append_edit edit_time           author_id author_name ip_address post_date           post  queued topic_id new_topic edit_name post_key post_edit_reason
    #>     <int> <lgl>       <dttm>                  <int> <chr>       <chr>      <dttm>              <chr>  <int>    <int> <lgl>     <chr>     <chr>    <chr>           
    #>  1    202 FALSE       NA                          7 MoonmanKKK  81.141.31… 2011-09-15 22:08:51 "<p>…      0       47 FALSE     <NA>      89e750e… <NA>            
    #>  2    203 FALSE       NA                         16 Talleyrand  152.33.58… 2011-09-15 22:10:42 "\n<…      0       11 FALSE     <NA>      0bccae6… <NA>            
    #>  3    532 FALSE       2011-09-19 23:14:09         5 Will to Po… 90.219.24… 2011-09-19 23:13:59 "\n<…      0      107 FALSE     Will to … 58e8b72… <NA>            
    #>  4 114067 FALSE       NA                       7508 RIGHT WING… 80.212.44… 2015-05-16 18:00:29 "\n<…      0     5166 FALSE     <NA>      ac5b3c0… <NA>            
    #>  5 114068 FALSE       2015-05-16 18:07:42         0 Nihonjin M… 73.222.21… 2015-05-16 18:02:08 "<p>…      0     5166 FALSE     Nihonjin… 3eb3ae5… <NA>            
    #>  6 114069 FALSE       2015-05-16 19:12:42      7481 ¡VIVA LA R… 86.181.21… 2015-05-16 18:06:36 "\n<…      0     5165 FALSE     Generalp… a72ee7a… <NA>            
    #>  7 114070 FALSE       NA                       9144 Neizbezhno… 121.215.1… 2015-05-16 18:14:36 "<p>…      0     5165 FALSE     <NA>      e2e1256… <NA>            
    #>  8 114071 FALSE       NA                       6321 Culius Jae… 65.28.106… 2015-05-16 18:16:41 "\n<…      0     5167 TRUE      <NA>      774875f… <NA>            
    #>  9      4 FALSE       NA                          1 Alexander … 178.140.1… 2011-09-13 01:06:06 "\n<…      0        3 TRUE      <NA>      cbd8458… <NA>            
    #> 10     83 FALSE       NA                         16 Talleyrand  152.33.17… 2011-09-14 04:43:41 "\n<…      0       37 TRUE      <NA>      0bac739… <NA>            
    #> # … with 195,118 more rows, and 1 more variable: pdelete_time <dttm>

``` r
im_other_dfs$calendar_calendars
```

    #> # A tibble: 12 x 4
    #>    cal_id cal_position cal_title_seo                 cal_color
    #>     <int>        <int> <chr>                         <chr>    
    #>  1      1            5 italian-nationalist-calendar  #000000  
    #>  2      2            8 serbian-nationalist-calendar  #0050a1  
    #>  3      3            6 russian-nationalist-calendar  #c2c2c2  
    #>  4      4           10 orthodox-christian-calendar   #d4a900  
    #>  5      5           11 catholic-christian-calendar   #6e4f99  
    #>  6      6            4 greek-nationalist-calendar    #0091ff  
    #>  7      7            3 german-nationalist-calendar   #e60000  
    #>  8      8            1 american-nationalist-calendar #17d4cd  
    #>  9      9           12 uncategorized-dates           #667070  
    #> 10     10            7 romanian-nationalist-calendar #249637  
    #> 11     11            2 british-nationalist-calendar  #514999  
    #> 12     12            9 spanish-nationalist-calendar  #eb9500

<img src="man/figures/use-all-the-data.jpeg" width="259" style="display: block; margin: auto;" />

### `core_*`

``` r
im_core_dfs
```

    #> $core_acp_search_index
    #> # A tibble: 1,123 x 5
    #>    url                                           app   lang_key                     restriction       keyword          
    #>    <chr>                                         <chr> <chr>                        <chr>             <chr>            
    #>  1 app=core&module=support&controller=systemLogs core  system_logs                  <NA>              sql error logs   
    #>  2 app=core&module=support&controller=systemLogs core  system_logs                  <NA>              sql logs         
    #>  3 app=core&module=support&controller=systemLogs core  system_logs                  <NA>              system logs      
    #>  4 app=core&module=support&controller=systemLogs core  system_logs                  <NA>              driver errors    
    #>  5 app=core&module=support&controller=systemLogs core  system_logs                  <NA>              logs             
    #>  6 app=core&module=support&controller=support    core  menu__core_support_dashboard support_dashboard troubleshoot     
    #>  7 app=core&module=support&controller=support    core  menu__core_support_dashboard support_dashboard support          
    #>  8 app=core&module=support&controller=support    core  menu__core_support_dashboard support_dashboard system           
    #>  9 app=core&module=support&controller=support    core  menu__core_support_dashboard support_dashboard tech support     
    #> 10 app=core&module=support&controller=support    core  menu__core_support_dashboard support_dashboard technical support
    #> # … with 1,113 more rows
    #> 
    #> $core_acronyms
    #> # A tibble: 3 x 4
    #>    a_id a_short a_long                     a_casesensitive
    #>   <int> <chr>   <chr>                      <lgl>          
    #> 1     1 GTKRWN  Gas the Kikes Race War Now FALSE          
    #> 2     2 NA      National Action            TRUE           
    #> 3     3 RWDS    Race War Death Squads      FALSE          
    #> 
    #> $core_admin_login_logs
    #> # A tibble: 23 x 4
    #>    admin_id admin_ip_address admin_time          admin_request                                                                                                            
    #>       <int> <chr>            <dttm>              <chr>                                                                                                                    
    #>  1     6119 162.158.93.88    2017-11-10 00:51:08 "{\"adsess\":\"ek3ium1343v4ipp2n97208c1s1\",\"app\":\"core\",\"module\":\"system\",\"controller\":\"login\",\"ref\":\"\"…
    #>  2     6120 162.158.93.88    2017-11-12 07:54:35 "{\"adsess\":\"ek3ium1343v4ipp2n97208c1s1\",\"app\":\"core\",\"module\":\"system\",\"controller\":\"login\",\"ref\":\"\"…
    #>  3     6124 162.158.93.88    2017-11-15 04:42:11 "{\"adsess\":\"ek3ium1343v4ipp2n97208c1s1\",\"app\":\"core\",\"module\":\"system\",\"controller\":\"login\",\"ref\":\"\"…
    #>  4     6116 162.158.91.198   2017-11-06 20:21:13 "{\"adsess\":\"ek3ium1343v4ipp2n97208c1s1\",\"app\":\"core\",\"module\":\"system\",\"controller\":\"login\",\"ref\":\"\"…
    #>  5     6117 162.158.91.198   2017-11-06 21:52:07 "{\"adsess\":\"ek3ium1343v4ipp2n97208c1s1\",\"app\":\"core\",\"module\":\"system\",\"controller\":\"login\",\"ref\":\"\"…
    #>  6     6109 162.158.91.198   2017-10-26 20:19:13 "{\"adsess\":\"ek3ium1343v4ipp2n97208c1s1\",\"app\":\"core\",\"module\":\"system\",\"controller\":\"login\",\"ref\":\"\"…
    #>  7     6121 162.158.93.88    2017-11-13 21:17:26 "{\"adsess\":\"ek3ium1343v4ipp2n97208c1s1\",\"app\":\"core\",\"module\":\"system\",\"controller\":\"login\",\"ref\":\"\"…
    #>  8     6122 162.158.93.88    2017-11-14 04:47:22 "{\"adsess\":\"ek3ium1343v4ipp2n97208c1s1\",\"app\":\"core\",\"module\":\"system\",\"controller\":\"login\",\"ref\":\"\"…
    #>  9     6125 172.68.182.89    2017-11-18 10:12:12 "{\"adsess\":\"mpiq2ka3o3o4i12vbrvdi6e5i4\",\"app\":\"core\",\"module\":\"system\",\"controller\":\"login\",\"ref\":\"\"…
    #> 10     6126 162.158.93.88    2017-11-20 20:59:00 "{\"adsess\":\"ek3ium1343v4ipp2n97208c1s1\",\"app\":\"core\",\"module\":\"system\",\"controller\":\"login\",\"ref\":\"\"…
    #> # … with 13 more rows
    #> 
    #> $core_admin_logs
    #> # A tibble: 14,595 x 11
    #>             id member_id ctime               note                             ip_address      appcomponent module controller do     lang_key member_name
    #>          <dbl>     <int> <dttm>              <chr>                            <chr>           <chr>        <chr>  <chr>      <chr>  <chr>    <chr>      
    #>  1 Inf.Nae-324         1 2011-09-12 16:05:48 Category 'Iron March HQ'  edited 178.140.119.217 forums       forums forums     doedit <NA>     <NA>       
    #>  2 Inf.Nae-324         1 2011-09-12 16:07:59 Forum 'Adminship Center'  edited 178.140.119.217 forums       forums forums     doedit <NA>     <NA>       
    #>  3   1.50e-323         1 2011-09-12 16:08:15 Forum 'Adminship Center'  edited 178.140.119.217 forums       forums forums     doedit <NA>     <NA>       
    #>  4   2.00e-323         1 2011-09-12 16:11:38 Forum 'Adminship Bunker' created 178.140.119.217 forums       forums forums     donew  <NA>     <NA>       
    #>  5   2.50e-323         1 2011-09-12 16:15:13 Edited Group 'The Adminship'     178.140.119.217 members      groups groups     doedit <NA>     <NA>       
    #>  6   3.00e-323         1 2011-09-12 16:15:53 Edited Group 'Exiled'            178.140.119.217 members      groups groups     doedit <NA>     <NA>       
    #>  7   3.50e-323         1 2011-09-12 16:16:06 Edited Group 'Visitors'          178.140.119.217 members      groups groups     doedit <NA>     <NA>       
    #>  8   4.00e-323         1 2011-09-12 16:16:28 Edited Group 'Black Corps'       178.140.119.217 members      groups groups     doedit <NA>     <NA>       
    #>  9   4.50e-323         1 2011-09-12 16:20:31 Added Group 'Prisoner'           178.140.119.217 members      groups groups     doadd  <NA>     <NA>       
    #> 10   5.00e-323         1 2011-09-12 17:54:03 Forum 'Announcements' created    178.140.119.217 forums       forums forums     donew  <NA>     <NA>       
    #> # … with 14,585 more rows
    #> 
    #> $core_applications
    #> # A tibble: 3 x 10
    #>   app_id app_description    app_directory app_added           app_position app_protected app_location app_update_last_… app_update_version                     app_default
    #>    <int> <chr>              <chr>         <dttm>                     <int> <lgl>         <chr>                    <int> <chr>                                  <lgl>      
    #> 1      1 Manage global too… core          2011-09-12 15:47:14            1 TRUE          root                1511204814 "{\"longversion\":\"102036\",\"versio… FALSE      
    #> 2      3 Manage forums and… forums        2011-09-12 15:47:19            3 FALSE         root                         0  <NA>                                  TRUE       
    #> 3      4 <NA>               calendar      2015-05-12 14:21:25            4 FALSE         ips                          0  <NA>                                  FALSE      
    #> 
    #> $core_attachments
    #> # A tibble: 101 x 12
    #>    attach_id attach_ext attach_file attach_location attach_thumb_lo… attach_is_image attach_hits attach_date         attach_member_id attach_filesize attach_img_width
    #>        <int> <chr>      <chr>       <chr>           <chr>            <lgl>                 <int> <dttm>                         <int>           <int>            <int>
    #>  1       338 jpg        461022_456… monthly_03_201… monthly_03_2013… TRUE                      0 2013-03-11 12:14:54                0          197766             1200
    #>  2         2 jpg        1056.jpg    monthly_09_201… monthly_09_2011… TRUE                      0 2011-09-15 22:10:17                7           82028              375
    #>  3         3 jpg        1057.jpg    monthly_09_201… monthly_09_2011… TRUE                      0 2011-09-15 22:10:20                7           81507              437
    #>  4         4 jpg        1091.jpg    monthly_09_201… monthly_09_2011… TRUE                      0 2011-09-15 22:10:23                7           81670              447
    #>  5         5 jpg        1108.jpg    monthly_09_201… monthly_09_2011… TRUE                      0 2011-09-15 22:10:25                7           76741              442
    #>  6         6 jpg        FASCIST UN… monthly_09_201… monthly_09_2011… TRUE                      0 2011-09-15 22:10:27                7           79003              521
    #>  7         7 jpg        post-2711-… monthly_09_201… monthly_09_2011… TRUE                      0 2011-09-15 22:11:41                7          101963              600
    #>  8         8 jpg        post-2842-… monthly_09_201… monthly_09_2011… TRUE                      0 2011-09-15 22:11:43                7           59702              954
    #>  9         9 jpg        1029.jpg    monthly_09_201… monthly_09_2011… TRUE                      0 2011-09-15 22:16:40                7           65169              693
    #> 10        10 jpg        1030.jpg    monthly_09_201… monthly_09_2011… TRUE                      0 2011-09-15 22:16:45                7           71945              317
    #> # … with 91 more rows, and 1 more variable: attach_img_height <int>
    #> 
    #> $core_attachments_map
    #> # A tibble: 101 x 3
    #>    attachment_id       id1       id2
    #>            <int>     <dbl>     <dbl>
    #>  1             2 2.35e-322 1.01e-321
    #>  2             3 2.35e-322 1.01e-321
    #>  3             4 2.35e-322 1.01e-321
    #>  4             5 2.35e-322 1.01e-321
    #>  5             6 2.35e-322 1.01e-321
    #>  6             7 2.35e-322 1.01e-321
    #>  7             8 2.35e-322 1.01e-321
    #>  8             9 2.35e-322 1.01e-321
    #>  9            10 2.35e-322 1.01e-321
    #> 10            11 2.35e-322 1.01e-321
    #> # … with 91 more rows
    #> 
    #> $core_banfilters
    #> # A tibble: 52 x 5
    #>    ban_id ban_type ban_content                 ban_date            ban_reason              
    #>     <int> <chr>    <chr>                       <dttm>              <chr>                   
    #>  1      1 ip       62.97.238.198               2011-09-18 13:48:53 Tribbles                
    #>  2      2 ip       80.202.110.65               2011-09-18 13:49:39 Also Tribbles           
    #>  3      3 email    jacksonhaddress@hotmail.com 2011-10-06 16:15:37 <NA>                    
    #>  4      4 ip       65.19.38.199                2011-10-06 16:15:37 <NA>                    
    #>  5      5 ip       75.173.64.190               2011-10-06 16:15:37 <NA>                    
    #>  6      6 email    a6428490@nepwk.com          2011-10-07 15:03:48 <NA>                    
    #>  7      7 name     JackW2                      2011-10-07 15:03:48 <NA>                    
    #>  8      8 ip       173.236.27.154              2011-10-07 15:03:48 <NA>                    
    #>  9      9 ip       80.82.69.119                2011-10-07 15:03:48 <NA>                    
    #> 10     10 ip       115.249.239.138             2011-12-19 10:52:08 Spammer - commercial ads
    #> # … with 42 more rows
    #> 
    #> $core_cache
    #> # A tibble: 171 x 3
    #>    cache_key                        cache_value                                                                                                               cache_expire
    #>    <chr>                            <chr>                                                                                                                            <int>
    #>  1 embed_e4cab4adff065e1c44a08d4b1… "\"<div id=\\\"fb-root\\\"><\\/div>\\n<script>(function(d, s, id) {\\n  var js, fjs = d.getElementsByTagName(s)[0];\\n  …   1511322224
    #>  2 embed_6b4bb904504f9db82a398c04a… "\"<blockquote class=\\\"instagram-media\\\" data-instgrm-captioned data-instgrm-version=\\\"7\\\" style=\\\" background…   1511313994
    #>  3 page_5b6871451314a763e2815aa3c7… "{\"output\":\"\\n<!DOCTYPE html>\\n<html lang=\\\"en-US\\\" dir=\\\"ltr\\\" class='focus-g2 focus-guest focus-guest-ale…   1511237711
    #>  4 page_0520ce0fd94d072691719cd417… "{\"output\":\"\\n<!DOCTYPE html>\\n<html lang=\\\"en-US\\\" dir=\\\"ltr\\\" class='focus-g2 focus-guest focus-guest-ale…   1511237756
    #>  5 page_8b0b82300d1957b4f8c2f125ea… "{\"output\":\"\\n<!DOCTYPE html>\\n<html lang=\\\"en-US\\\" dir=\\\"ltr\\\" class='focus-g2 focus-guest focus-guest-ale…   1511237760
    #>  6 page_1471b8a5e4fb244e7a9f94275c… "{\"output\":\"\\n<!DOCTYPE html>\\n<html lang=\\\"en-US\\\" dir=\\\"ltr\\\" class='focus-g2 focus-guest focus-guest-ale…   1511237768
    #>  7 page_77fa5a9b770109ce882c83db1d… "{\"output\":\"\\n<!DOCTYPE html>\\n<html lang=\\\"en-US\\\" dir=\\\"ltr\\\" class='focus-g2 focus-guest focus-guest-ale…   1511237749
    #>  8 page_cd26222ed1107a271079e5114e… "{\"output\":\"\\n<!DOCTYPE html>\\n<html lang=\\\"en-US\\\" dir=\\\"ltr\\\" class='focus-g2 focus-guest focus-guest-ale…   1511237755
    #>  9 page_cee4024758e5a03f7d1395319f… "{\"output\":\"\\n<!DOCTYPE html>\\n<html lang=\\\"en-US\\\" dir=\\\"ltr\\\" class='focus-g2 focus-guest focus-guest-ale…   1511237745
    #> 10 page_8129275e64c9925d82492b124e… "{\"output\":\"\\n<!DOCTYPE html>\\n<html lang=\\\"en-US\\\" dir=\\\"ltr\\\" class='focus-g2 focus-guest focus-guest-ale…   1511237734
    #> # … with 161 more rows
    #> 
    #> $core_deletion_log
    #> # A tibble: 14 x 9
    #>    dellog_id dellog_content_id dellog_content_title   dellog_content_seo_t… dellog_deleted_… dellog_deleted_b… dellog_deleted_date dellog_deleted_by_… dellog_content_per…
    #>        <dbl>             <dbl> <chr>                  <chr>                            <dbl> <chr>             <dttm>              <chr>               <chr>              
    #>  1 5.90e-322         1.01e-318 Nordic Resistance Mov… nordic-resistance-mo…        6.60e-322 Myrrysmies        2017-10-22 17:02:07 myrrysmies          4,2,13,6,10,17,19,…
    #>  2 5.95e-322         1.01e-318 Nordic Resistance Mov… nordic-resistance-mo…        6.60e-322 Myrrysmies        2017-10-22 17:02:07 myrrysmies          4,2,13,6,10,17,19,…
    #>  3 6.00e-322         1.02e-318 romansoldier spergout… romansoldier-spergou…      Inf.Nae-324 Александр Славрос 2017-11-11 07:03:08 александр-славрос   4,13,6,10          
    #>  4 6.05e-322         1.02e-318 SRN PROPAGANDA THREAD  srn-propaganda-thread      Inf.Nae-324 Александр Славрос 2017-11-12 16:32:06 александр-славрос   4,13,6,10          
    #>  5 6.10e-322         1.02e-318 IRONMARCH IN THE MEDIA ironmarch-in-the-med…      Inf.Nae-324 Александр Славрос 2017-11-13 04:53:30 александр-славрос   4,2,13,6,10,17,19,…
    #>  6 6.15e-322         1.02e-318 IRONMARCH IN THE MEDIA ironmarch-in-the-med…      Inf.Nae-324 Александр Славрос 2017-11-13 04:53:30 александр-славрос   4,2,13,6,10,17,19,…
    #>  7 6.20e-322         1.02e-318 IRONMARCH IN THE MEDIA ironmarch-in-the-med…      Inf.Nae-324 Александр Славрос 2017-11-13 04:53:30 александр-славрос   4,2,13,6,10,17,19,…
    #>  8 6.25e-322         1.02e-318 IRONMARCH IN THE MEDIA ironmarch-in-the-med…      Inf.Nae-324 Александр Славрос 2017-11-13 04:53:30 александр-славрос   4,2,13,6,10,17,19,…
    #>  9 6.30e-322         1.02e-318 IRONMARCH IN THE MEDIA ironmarch-in-the-med…      Inf.Nae-324 Александр Славрос 2017-11-13 04:53:30 александр-славрос   4,2,13,6,10,17,19,…
    #> 10 6.35e-322         1.02e-318 IRONMARCH IN THE MEDIA ironmarch-in-the-med…      Inf.Nae-324 Александр Славрос 2017-11-13 04:53:30 александр-славрос   4,2,13,6,10,17,19,…
    #> 11 6.40e-322         1.02e-318 IRONMARCH IN THE MEDIA ironmarch-in-the-med…      Inf.Nae-324 Александр Славрос 2017-11-13 04:53:30 александр-славрос   4,2,13,6,10,17,19,…
    #> 12 6.45e-322         1.02e-318 Unofficial AR posters… unofficial-ar-poster…      Inf.Nae-324 Александр Славрос 2017-11-13 17:37:24 александр-славрос   6,10,13,4,2,17,19,…
    #> 13 6.50e-322         8.77e-319 Trivial HAPPENINGs     trivial-happenings           4.62e-320 Hyperborean       2017-11-18 21:13:52 hyperborean         4,2,13,6,10,17,19,…
    #> 14 6.55e-322         8.70e-319 Trivial HAPPENINGs     trivial-happenings           4.62e-320 Hyperborean       2017-11-18 21:22:59 hyperborean         4,2,13,6,10,17,19,…
    #> 
    #> $core_email_templates
    #> # A tibble: 50 x 7
    #>    template_id template_app template_name      template_data       template_content_html                       template_content_plaintext                  template_key   
    #>          <dbl> <chr>        <chr>              <chr>               <chr>                                       <chr>                                       <chr>          
    #>  1   8.40e-322 core         account_locked     $member, $location… "<br />\n{$email->language->addToStack(\"e… "{$email->language->addToStack(\"email_acc… 2c9e05023522a8…
    #>  2   8.45e-322 core         unsubscribeDigest  $member, $email     "<tr>\n\t<td dir='{dir}' valign=\"top\"><i… "{$email->language->addToStack(\"unsubscri… 31c7983631062a…
    #>  3   8.50e-322 core         digests__areaWrap… $output, $app, $ar… "<!-- Add item counts and link to remainin… "{$output|raw}\n"                           393aa4a806a850…
    #>  4   8.55e-322 core         upgrade            $version, $release… "\n{$email->language->addToStack(\"dashboa… "{$email->language->addToStack(\"dashboard… 3c3b5248a18848…
    #>  5   8.60e-322 core         notification_club… $club, $member, $e… "<br />\n{$email->language->addToStack(\"n… "{$email->language->addToStack(\"notificat… 40a9605ac2f1e4…
    #>  6   8.65e-322 core         notification_new_… $comment, $member,… "\n{{$item = ( $comment instanceof \\IPS\\… "\n{{$item = ( $comment instanceof \\IPS\\… 4441276b51d169…
    #>  7   8.70e-322 core         email_address_cha… $member, $oldEmail… "\n{$email->language->addToStack(\"email_e… "{$email->language->addToStack(\"email_ema… 448de455375a78…
    #>  8   8.75e-322 core         notification_unap… $container, $membe… "\n{{if $member->member_id}}\n{$email->lan… "\n{$email->language->addToStack(\"email_n… 4af00b1787f87c…
    #>  9   8.80e-322 core         contact_form       $member, $name, $f… "{$email->language->addToStack(\"email_con… "\n{$email->language->addToStack(\"email_c… 5b5cb8d6be6e13…
    #> 10   8.85e-322 core         notification_prof… $comment, $email    "\n{$email->language->addToStack(\"email_n… "\n{$email->language->addToStack(\"email_n… 60574710e43dd7…
    #> # … with 40 more rows
    #> 
    #> $core_emoticons
    #> # A tibble: 116 x 7
    #>       id typed        image                    clickable emo_set                          emo_position emo_set_position
    #>    <int> <chr>        <chr>                    <lgl>     <chr>                                   <int>            <int>
    #>  1   110 :berg:       emoticons/berg.png       TRUE      84ba4fa006a1ff548bd1a09d7bd7c791            4                8
    #>  2   109 :derp:       emoticons/derp.png       TRUE      84ba4fa006a1ff548bd1a09d7bd7c791           14                8
    #>  3   108 :uwot:       emoticons/uwot.png       TRUE      84ba4fa006a1ff548bd1a09d7bd7c791           13                8
    #>  4   107 :srsly:      emoticons/srsly.png      TRUE      84ba4fa006a1ff548bd1a09d7bd7c791           10                8
    #>  5   106 :gibsmedat:  emoticons/gibsmedat.png  TRUE      84ba4fa006a1ff548bd1a09d7bd7c791           12                8
    #>  6   105 :wat:        emoticons/wat.png        TRUE      f700487c16e5f786381778914e725e1b            2                6
    #>  7   104 :handy:      emoticons/handy.png      TRUE      f700487c16e5f786381778914e725e1b           24                6
    #>  8   174 :arrowcross: emoticons/arrowcross.png TRUE      f539dc6131bd274ed79f714e1929da89            6                3
    #>  9   171 :ropecult:   emoticons/ropecult.png   TRUE      ebad4264c1c40dd74f6fd2479414fbaa            9                1
    #> 10   101 :moonman:    emoticons/moonman.png    TRUE      f700487c16e5f786381778914e725e1b           20                6
    #> # … with 106 more rows
    #> 
    #> $core_file_logs
    #> # A tibble: 2,014 x 7
    #>       log_id log_filename                    log_msg    log_date            log_data                                    log_container log_url                             
    #>        <dbl> <chr>                           <chr>      <dttm>              <chr>                                       <chr>         <chr>                               
    #>  1 4.10e-320 <NA>                            container… 2017-09-13 14:20:17 "{\"adsess\":\"14atb5v9t0ukpfbbbm4t01nkd0\… css_built_7   <NA>                                
    #>  2 4.32e-320 1200px-British_Union_of_Fascis… file_dele… 2017-09-29 02:40:02  <NA>                                       monthly_2017… http://ironmarch.org/uploads/monthl…
    #>  3 4.32e-320 1200px-Flag_of_the_British_Uni… file_dele… 2017-09-29 02:40:04  <NA>                                       monthly_2017… http://ironmarch.org/uploads/monthl…
    #>  4 4.39e-320 root_map.js.0c4ddc73f847a89309… file_dele… 2017-10-04 22:02:56  <NA>                                       javascript_g… http://ironmarch.org/uploads/javasc…
    #>  5 4.39e-320 root_map.js.b441f57f168a25093a… file_dele… 2017-10-04 22:02:56  <NA>                                       javascript_g… http://ironmarch.org/uploads/javasc…
    #>  6 4.39e-320 root_map.js.d611df9e1a6629af38… file_dele… 2017-10-04 22:02:56  <NA>                                       javascript_g… http://ironmarch.org/uploads/javasc…
    #>  7 4.39e-320 root_map.js.df7eb143e7158f3cdc… file_dele… 2017-10-04 22:03:00  <NA>                                       javascript_g… http://ironmarch.org/uploads/javasc…
    #>  8 4.45e-320 Screenshot_4532.png.0b31f26ee6… file_dele… 2017-10-09 21:33:08  <NA>                                       monthly_2017… https://ironmarch.org/uploads/month…
    #>  9 4.45e-320 Screenshot_4532.thumb.png.aaea… file_dele… 2017-10-09 21:33:08  <NA>                                       monthly_2017… https://ironmarch.org/uploads/month…
    #> 10 4.45e-320 integra.png.34bd040862949f8a67… file_dele… 2017-10-09 21:34:21  <NA>                                       monthly_2017… https://ironmarch.org/uploads/month…
    #> # … with 2,004 more rows
    #> 
    #> $core_follow
    #> # A tibble: 8,066 x 13
    #>    follow_id follow_app follow_area follow_rel_id follow_member_id follow_is_anon follow_added        follow_notify_do follow_notify_m… follow_notify_f…
    #>    <chr>     <chr>      <chr>               <dbl>            <int> <lgl>          <dttm>              <lgl>            <chr>            <chr>           
    #>  1 fd493920… forums     topic           1.80e-322               12 FALSE          2011-09-15 20:43:44 TRUE             36               daily           
    #>  2 1b179c39… forums     topic           3.10e-322               12 FALSE          2011-09-16 06:04:37 TRUE             62               daily           
    #>  3 af062e78… forums     topic           2.35e-322               12 FALSE          2011-09-16 06:09:10 TRUE             47               daily           
    #>  4 bbf8f01f… forums     topic           2.20e-322               12 FALSE          2011-09-16 17:54:26 TRUE             44               daily           
    #>  5 b85184ca… forums     topic           3.25e-322               12 FALSE          2011-09-16 18:11:02 TRUE             65               daily           
    #>  6 e7328cad… forums     topic           3.70e-322               12 FALSE          2011-09-16 18:16:36 TRUE             74               daily           
    #>  7 625eb2d4… forums     topic           3.75e-322               12 FALSE          2011-09-16 18:38:53 TRUE             75               daily           
    #>  8 a87febdf… forums     topic           3.65e-322               12 FALSE          2011-09-16 20:40:45 TRUE             73               daily           
    #>  9 e5f6841c… forums     topic           2.25e-322               12 FALSE          2011-09-17 09:19:19 TRUE             45               daily           
    #> 10 6f7a3413… forums     topic           3.90e-322               12 FALSE          2011-09-17 09:37:43 TRUE             78               daily           
    #> # … with 8,056 more rows, and 3 more variables: follow_notify_sent <dttm>, follow_visible <lgl>, follow_index_id <dbl>
    #> 
    #> $core_groups
    #> # A tibble: 11 x 45
    #>     g_id g_view_board g_other_topics g_edit_profile g_post_new_topi… g_reply_own_top… g_reply_other_t… g_edit_posts g_delete_own_po… g_open_close_po… g_delete_own_to…
    #>    <int> <lgl>        <lgl>          <lgl>          <lgl>            <lgl>            <lgl>            <chr>        <chr>            <lgl>            <lgl>           
    #>  1     2 TRUE         TRUE           FALSE          TRUE             TRUE             TRUE             0            0                FALSE            FALSE           
    #>  2     3 TRUE         TRUE           TRUE           TRUE             TRUE             TRUE             0            0                FALSE            FALSE           
    #>  3     4 TRUE         TRUE           TRUE           TRUE             TRUE             TRUE             1            1                TRUE             TRUE            
    #>  4     6 TRUE         TRUE           TRUE           TRUE             TRUE             TRUE             1            0                FALSE            FALSE           
    #>  5     7 TRUE         TRUE           FALSE          TRUE             TRUE             TRUE             0            0                FALSE            FALSE           
    #>  6    10 TRUE         TRUE           TRUE           TRUE             TRUE             TRUE             1            0                TRUE             TRUE            
    #>  7    13 TRUE         TRUE           TRUE           TRUE             TRUE             TRUE             1            0                FALSE            FALSE           
    #>  8    14 FALSE        NA             TRUE           NA               NA               NA               0            0                NA               NA              
    #>  9    15 FALSE        NA             TRUE           NA               NA               NA               0            0                NA               NA              
    #> 10    16 FALSE        NA             TRUE           NA               NA               NA               0            0                NA               NA              
    #> 11    17 TRUE         NA             TRUE           NA               NA               NA               1            0                NA               NA              
    #> # … with 34 more variables: g_post_polls <lgl>, g_vote_polls <lgl>, g_use_pm <lgl>, g_append_edit <lgl>, g_access_offline <lgl>, g_avoid_q <lgl>, g_avoid_flood <lgl>,
    #> #   g_icon <chr>, prefix <chr>, g_max_messages <int>, g_max_mass_pm <int>, g_search_flood <int>, g_edit_cutoff <int>, g_hide_from_list <lgl>, g_post_closed <lgl>,
    #> #   g_photo_max_vars <chr>, g_edit_topic <lgl>, g_bypass_badwords <lgl>, g_can_msg_attach <lgl>, g_topic_rate_setting <int>, g_dname_changes <int>, g_dname_date <int>,
    #> #   g_mod_preview <lgl>, g_rep_max_positive <int>, g_rep_max_negative <int>, g_signature_limits <chr>, g_bitoptions <int>, g_pm_perday <int>, g_pm_flood_mins <int>,
    #> #   g_bitoptions2 <int>, g_hide_own_posts <chr>, g_lock_unlock_own <chr>, g_can_report <chr>, g_promote_exclude <lgl>
    #> 
    #> $core_hooks_files
    #> # A tibble: 8 x 7
    #>   hook_file_id hook_hook_id hook_file_stored          hook_file_real    hook_classname    hook_data                              hooks_source                             
    #>          <int>        <int> <chr>                     <chr>             <chr>             <chr>                                  <chr>                                    
    #> 1           39            1 boardIndexSideBarAdCode_… boardIndexSideBa… boardIndexSideBa… "a:7:{s:12:\"dataLocation\";s:0:\"\";… "<?php\n\nclass boardIndexSideBarAdCode\…
    #> 2           43            2 boardIndexStatusUpdates_… boardIndexStatus… boardIndexStatus… "a:8:{s:12:\"dataLocation\";s:0:\"\";… "<?php\n\nclass boardIndexStatusUpdates\…
    #> 3           40            3 boardIndexRecentTopics_8… boardIndexRecent… boardIndexRecent… "a:6:{s:15:\"classToOverload\";N;s:9:… "<?php\n\nclass boardIndexRecentTopics\n…
    #> 4           41            4 boardIndexFacebookActivi… boardIndexFacebo… boardIndexFacebo… "a:7:{s:12:\"dataLocation\";s:0:\"\";… "<?php\n\nclass boardIndexFacebookActivi…
    #> 5           42            5 boardIndexTags_45dab7d39… boardIndexTags.p… boardIndexTags    "a:8:{s:12:\"dataLocation\";s:0:\"\";… "<?php\n\nclass boardIndexTags\n{\n\tpub…
    #> 6           44            9 boardIndexCalendar_d15ae… boardIndexCalend… boardIndexCalend… "a:8:{s:12:\"dataLocation\";s:0:\"\";… "<?php\n\nclass boardIndexCalendar\n{\n\…
    #> 7           45           10 calendarUpcomingEvents_2… calendarUpcoming… calendarUpcoming… "a:8:{s:12:\"dataLocation\";s:0:\"\";… "<?php\n/**\n * @file\t\tcalendarUpcomin…
    #> 8           46           11 calendarUpcomingBirthday… calendarUpcoming… calendarUpcoming… "a:8:{s:12:\"dataLocation\";s:0:\"\";… "<?php\n/**\n * @file\t\tcalendarUpcomin…
    #> 
    #> $core_ignored_users
    #> # A tibble: 22 x 6
    #>    ignore_id ignore_owner_id ignore_ignore_id ignore_messages ignore_topics ignore_mentions
    #>        <int>           <int>            <int> <lgl>           <lgl>         <lgl>          
    #>  1         2             143               84 FALSE           FALSE         FALSE          
    #>  2        31           13558               72 FALSE           FALSE         FALSE          
    #>  3         4             255              279 FALSE           FALSE         FALSE          
    #>  4        32           14399             6260 TRUE            TRUE          TRUE           
    #>  5         7             991             1109 FALSE           FALSE         FALSE          
    #>  6         8             288               91 FALSE           FALSE         FALSE          
    #>  7        11              54             6113 FALSE           FALSE         FALSE          
    #>  8        13            7364              132 FALSE           FALSE         FALSE          
    #>  9        15            7901             7508 TRUE            TRUE          FALSE          
    #> 10        17            7643             7481 FALSE           FALSE         FALSE          
    #> # … with 12 more rows
    #> 
    #> $core_item_markers
    #> # A tibble: 32,032 x 6
    #>    item_key             item_member_id item_app item_read_array                                                                            item_global_res… item_app_key_1
    #>    <chr>                         <int> <chr>    <chr>                                                                                                 <int>          <int>
    #>  1 a0a92a50db2fd304aa0…              1 forums   "[]"                                                                                             1511237486             11
    #>  2 400d1e9cf505ab403e3…              1 forums   "[]"                                                                                             1507271991              2
    #>  3 06a3790eac960887918…              1 forums   "[]"                                                                                             1510886634            170
    #>  4 1aefba1dea173e96923…              1 forums   "[]"                                                                                             1511095618             61
    #>  5 1589e340d2ce0ac3d8e…              1 calendar "{\"69\":1459165015,\"71\":1459165271,\"45\":1467033509,\"76\":1459166007,\"77\":14591661…       1459164193              1
    #>  6 6229be092ddca2f51fd…              1 forums   "[]"                                                                                             1511211533            108
    #>  7 b36018625aaf0a414b4…              1 forums   "[]"                                                                                             1511211533            141
    #>  8 7972acd2bf210634f46…              1 forums   "[]"                                                                                             1511211533            144
    #>  9 ba0737a68a711aee2a4…              1 forums   "[]"                                                                                             1511200946             87
    #> 10 dabd5bfc16eeeb478dc…            132 forums   "[]"                                                                                             1458909380            125
    #> # … with 32,022 more rows
    #> 
    #> $core_javascript
    #> # A tibble: 251 x 8
    #>    javascript_id javascript_type javascript_content                                    javascript_app javascript_path javascript_locat… javascript_posi… javascript_name  
    #>            <int> <chr>           <chr>                                                 <chr>          <chr>           <chr>                        <int> <chr>            
    #>  1          1121 framework       "/*\n * transform: A jQuery cssHooks adding cross-br… global         jquery          library                        103 jquery.transform…
    #>  2          1122 framework       "/* jstz.min.js Version: 1.0.6 Build date: 2015-11-0… global         jstz            library                        200 jstz.js          
    #>  3          1123 framework       "\"use strict\";!function(e,t,n){var i=function(t,n)… global         linkify         library                        400 linkify-jquery.m…
    #>  4          1124 framework       "!function(){\"use strict\";var t=\"function\"==type… global         linkify         library                        350 linkify.min.js   
    #>  5          1125 mixins          "/**\n * Invision Community\n * (c) Invision Power S… core           mixins          admin                      1000500 ips.core.groups.…
    #>  6          1126 mixins          "/**\n * Invision Community\n * (c) Invision Power S… global         mixins          admin                      1000100 ips.core.table.js
    #>  7          1127 mixins          "/**\n * Invision Community\n * (c) Invision Power S… global         mixins          front                      1000100 ips.core.table.js
    #>  8          1128 model           "/**\n * Invision Community\n * (c) Invision Power S… global         models/core     front                      1000050 ips.core.comment…
    #>  9          1129 model           "/**\n * Invision Community\n * (c) Invision Power S… core           models/messages front                      1000250 ips.messages.fol…
    #> 10          1130 model           "/**\n * Invision Community\n * (c) Invision Power S… core           models/messages front                      1000250 ips.messages.mes…
    #> # … with 241 more rows
    #> 
    #> $core_leaders
    #> # A tibble: 3 x 2
    #>     leader_id leader_type_id
    #>         <dbl>          <int>
    #> 1 Inf.Nae-324              4
    #> 2 Inf.Nae-324              6
    #> 3   1.50e-323             10
    #> 
    #> $core_like_cache
    #> # A tibble: 5,304 x 6
    #>    like_cache_id          like_cache_app like_cache_area like_cache_rel_… like_cache_data                                                                 like_cache_expi…
    #>    <chr>                  <chr>          <chr>                      <dbl> <chr>                                                                                      <int>
    #>  1 321571a7b843c596b0775… forums         forums                 1.50e-322 "a:3:{s:7:\"members\";N;s:5:\"count\";i:0;s:10:\"count_anon\";i:0;}"                  1458594091
    #>  2 5b1fb15ebe04052fcc548… forums         topics                 1.81e-320 "a:3:{s:7:\"members\";a:1:{i:353;a:2:{s:1:\"n\";s:50:\"ɭยςเŦєгเคภ гคקє-ฬ๏ɭŦ 66…       1458249173
    #>  3 4ed3d61094bae217e654b… forums         topics                 1.81e-320 "a:3:{s:7:\"members\";N;s:5:\"count\";i:0;s:10:\"count_anon\";i:0;}"                  1458156426
    #>  4 b5067d6b91cae760783da… forums         topics                 7.95e-322 "a:3:{s:7:\"members\";a:5:{i:9;a:2:{s:1:\"n\";s:14:\"Woman in Black\";s:1:\"s\…       1458609004
    #>  5 81d82ffa5b6d32b3f05fd… forums         forums                 6.50e-323 "a:3:{s:7:\"members\";N;s:5:\"count\";i:0;s:10:\"count_anon\";i:0;}"                  1458587168
    #>  6 d9409ca5f0c5d76bbdde3… forums         topics                 2.54e-320 "a:3:{s:7:\"members\";N;s:5:\"count\";i:0;s:10:\"count_anon\";i:0;}"                  1458619120
    #>  7 296567d2dffdb49961f95… forums         topics                 2.70e-320 "a:3:{s:7:\"members\";N;s:5:\"count\";i:0;s:10:\"count_anon\";i:0;}"                  1458612718
    #>  8 6ee661dd69ab12a17c6a3… forums         topics                 2.67e-320 "a:3:{s:7:\"members\";N;s:5:\"count\";i:0;s:10:\"count_anon\";i:0;}"                  1458410826
    #>  9 98ca3d02b4a17485d3d5b… forums         topics                 2.60e-320 "a:3:{s:7:\"members\";N;s:5:\"count\";i:0;s:10:\"count_anon\";i:0;}"                  1458596141
    #> 10 a7aac8b0f1a9bd8a346f3… forums         topics                 1.50e-323 "a:3:{s:7:\"members\";N;s:5:\"count\";i:0;s:10:\"count_anon\";i:0;}"                  1458553079
    #> # … with 5,294 more rows
    #> 
    #> $core_log
    #> # A tibble: 7,238 x 9
    #>           id exception_class  exception_code message                          backtrace                             time category  url                           member_id
    #>        <dbl> <chr>            <lgl>          <chr>                            <chr>                                <int> <chr>     <chr>                             <int>
    #>  1 1.26e-319 OutOfRangeExcep… FALSE           <NA>                            "#0 /usr/share/nginx/html/system/…  1.51e9 embed_er… http://ironmarch.org/index.p…         0
    #>  2 1.26e-319 OutOfRangeExcep… FALSE           <NA>                            "#0 /usr/share/nginx/html/system/…  1.51e9 embed_er… http://ironmarch.org/index.p…         0
    #>  3 1.26e-319 <NA>             NA             "\nIPS\\Db\\Exception: Can't co… "#0 /usr/share/nginx/html/init.ph…  1.51e9 uncaught… http://ironmarch.org/index.p…         0
    #>  4 1.26e-319 <NA>             NA             "\nIPS\\Db\\Exception: Can't co… "#0 /usr/share/nginx/html/init.ph…  1.51e9 uncaught… http://ironmarch.org/index.p…         0
    #>  5 1.26e-319 OutOfRangeExcep… FALSE           <NA>                            "#0 /usr/share/nginx/html/system/…  1.51e9 embed_er… http://ironmarch.org/index.p…         0
    #>  6 1.26e-319 OutOfRangeExcep… FALSE           <NA>                            "#0 /usr/share/nginx/html/system/…  1.51e9 embed_er… http://ironmarch.org/index.p…         0
    #>  7 1.26e-319 OutOfRangeExcep… FALSE           <NA>                            "#0 /usr/share/nginx/html/system/…  1.51e9 embed_er… http://ironmarch.org/index.p…         0
    #>  8 1.26e-319 <NA>             NA             "\nIPS\\Db\\Exception: Can't co… "#0 /usr/share/nginx/html/init.ph…  1.51e9 uncaught… http://ironmarch.org/index.p…         0
    #>  9 1.26e-319 OutOfRangeExcep… FALSE           <NA>                            "#0 /usr/share/nginx/html/system/…  1.51e9 embed_er… http://ironmarch.org/index.p…         0
    #> 10 1.26e-319 OutOfRangeExcep… FALSE           <NA>                            "#0 /usr/share/nginx/html/system/…  1.51e9 embed_er… http://ironmarch.org/index.p…         0
    #> # … with 7,228 more rows
    #> 
    #> $core_login_handlers
    #> # A tibble: 10 x 5
    #>    login_key  login_settings                                                    login_order login_acp login_enabled
    #>    <chr>      <chr>                                                                   <int> <lgl>     <lgl>        
    #>  1 Internal   "{\"auth_types\":1}"                                                        1 TRUE      TRUE         
    #>  2 Ldap       "{\"auth_types\":1}"                                                        4 FALSE     FALSE        
    #>  3 External   "{\"auth_types\":1}"                                                        5 FALSE     FALSE        
    #>  4 Facebook   "{\"app_id\":null,\"app_secret\":null,\"real_name\":false}"                 6 FALSE     FALSE        
    #>  5 Twitter    "{\"consumer_key\":null,\"consumer_secret\":null,\"name\":false}"           7 FALSE     FALSE        
    #>  6 Live       "[]"                                                                        8 FALSE     FALSE        
    #>  7 Linkedin   "[]"                                                                        9 FALSE     FALSE        
    #>  8 Google     "[]"                                                                       10 FALSE     FALSE        
    #>  9 Ipsconnect "[]"                                                                       11 FALSE     FALSE        
    #> 10 Convert    "[]"                                                                       12 FALSE     FALSE        
    #> 
    #> $core_member_history
    #> # A tibble: 3,481 x 7
    #>         log_id log_member log_by log_type     log_data                                                                  log_date            log_ip_address
    #>          <dbl>      <dbl>  <dbl> <chr>        <chr>                                                                     <dttm>              <chr>         
    #>  1 Inf.Nae-324  8.00e-323      0 display_name "{\"old\":\"Talleyrand\",\"new\":\"The Normish\"}"                        2011-09-14 05:33:58 152.33.17.196 
    #>  2 Inf.Nae-324  8.00e-323      0 display_name "{\"old\":\"The Normish\",\"new\":\"Talleyrand\"}"                        2011-09-14 05:43:54 152.33.17.196 
    #>  3   1.50e-323  4.00e-323      0 display_name "{\"old\":\"Mr. Elegy\",\"new\":\"Elegos\"}"                              2011-09-14 20:57:39 98.198.24.90  
    #>  4   2.00e-323  5.50e-323      0 display_name "{\"old\":\"Four Suited Jack\",\"new\":\"F.S.J. Zero Twelve\"}"           2011-10-04 18:52:06 109.77.91.235 
    #>  5   2.50e-323  5.70e-322      0 display_name "{\"old\":\"Stork\",\"new\":\"Alabama Crimson Tide footb\"}"              2012-01-19 22:52:07 79.67.83.218  
    #>  6   3.00e-323  5.70e-322      0 display_name "{\"old\":\"Alabama Crimson Tide footb\",\"new\":\"Flash &amp; Circle\"}" 2012-01-21 19:26:39 79.67.83.218  
    #>  7   3.50e-323  8.00e-322      0 display_name "{\"old\":\"Cricket\",\"new\":\"Richard the Cricket\"}"                   2012-02-23 06:11:55 188.95.153.254
    #>  8   4.00e-323  7.00e-322      0 display_name "{\"old\":\"SchwarzFrontUSA\",\"new\":\"AutNatUSA\"}"                     2012-02-28 20:45:34 24.229.117.252
    #>  9   4.50e-323  2.00e-322      0 display_name "{\"old\":\"Ethno Nationalist\",\"new\":\"Ethnic Nationalist\"}"          2012-03-05 16:17:43 82.17.111.92  
    #> 10   5.00e-323  9.85e-322      0 display_name "{\"old\":\"Ma\\u03df\\u03df Extermination\",\"new\":\"Von Totenkopf\"}"  2012-03-28 00:33:49 89.136.88.101 
    #> # … with 3,471 more rows
    #> 
    #> $core_member_status_replies
    #> # A tibble: 487 x 7
    #>    reply_id reply_status_id reply_member_id reply_date reply_content                                                                       reply_approved reply_ip_address
    #>       <int>           <int>           <int>      <int> <chr>                                                                                        <int> <chr>           
    #>  1        1               2              35 1324554161 "<p>Try living in Indiana.</p>"                                                                  1 <NA>            
    #>  2        2               2             132 1328301526 "<p>Try living in Finland. -25 celsius and strong wind. Augh yeah.</p>"                          1 <NA>            
    #>  3        3              23             143 1330034455 "<p>Omg, blocked.</p>"                                                                           1 <NA>            
    #>  4        5              27             164 1332465964 "<p>Yeah it's so annoying dealing with poorly designed web 1.0 stuff. I just got d…              1 <NA>            
    #>  5      710            3024            9446 1486996408 "<p>\n\tI come from a Hindu family but I myself don't particularly keep up with an…              1 100.33.36.131   
    #>  6        7              29             132 1333328200 "<p>*hmm...slavsicles...*</p>"                                                                   1 <NA>            
    #>  7        8              29             130 1333757777 "<p>lolgenocide</p>"                                                                             1 <NA>            
    #>  8        9              29             130 1333758050 "<p>I didn't even know you could comment on these.</p>"                                          1 <NA>            
    #>  9       10              26              84 1335455835 "<p>I thank God for that too! <img src=\"<fileStore.core_Emoticons>/emoticons/Gene…              1 <NA>            
    #> 10       11              49             246 1338862771 "<p>I prefer the \"counter-revolution\", but perhaps that's splitting hairs?</p>"                1 <NA>            
    #> # … with 477 more rows
    #> 
    #> $core_member_status_updates
    #> # A tibble: 553 x 12
    #>    status_id status_member_id status_date status_content status_replies status_last_ids status_is_latest status_is_locked status_hash status_author_id status_author_ip
    #>        <int>            <int>       <int> <chr>                   <int> <chr>           <lgl>            <lgl>            <chr>                  <int> <chr>           
    #>  1         2               14  1316397519 <p>Cold... *b…              3 "a:3:{i:132455… FALSE            FALSE            143f498959…               14 71.114.56.45    
    #>  2         6               35  1319211330 <p>I am so fu…              0 "a:0:{}"        FALSE            FALSE            43695c68bf…               35 71.65.36.98     
    #>  3         7               35  1319935567 <p>Queensrych…              0 "a:0:{}"        FALSE            FALSE            842bc583d6…               35 71.65.36.98     
    #>  4         8               35  1319935570 <p>Queensrych…              0 "a:0:{}"        FALSE            FALSE            842bc583d6…               35 71.65.36.98     
    #>  5        11               35  1321967601 <p>Getting in…              0 "a:0:{}"        FALSE            FALSE            e8410a6b4f…               35 71.65.36.98     
    #>  6        12               89  1324039690 <p>National S…              0 "a:0:{}"        TRUE             FALSE            cd19c9457f…               89 86.144.209.41   
    #>  7        28              143  1332804371 <p>Ahaha, gna…              0 "a:0:{}"        FALSE            FALSE            b1161af476…              143 64.189.76.149   
    #>  8        29              130  1332911151 <p>Dreams of …              3 "a:3:{i:133332… FALSE            FALSE            6fbad0df53…              130 24.92.121.120   
    #>  9        19              143  1328730328 <p>Numbess of…              0 "a:0:{}"        FALSE            FALSE            d0c7e59d96…              143 64.189.79.27    
    #> 10        20              143  1328846880 <p>Sleep addi…              0 "a:0:{}"        FALSE            FALSE            685f847efa…              143 64.189.79.49    
    #> # … with 543 more rows, and 1 more variable: status_approved <int>
    #> 
    #> $core_members
    #> # A tibble: 1,207 x 66
    #>    member_id name  member_group_id email joined              ip_address allow_admin_mai…  skin warn_level warn_lastwarn language restrict_post bday_day bday_month
    #>        <int> <chr>           <int> <chr> <dttm>              <chr>      <list>           <int>      <int>         <int>    <int>         <int>    <int>      <int>
    #>  1         1 Алек…               4 slav… 2011-09-12 15:46:59 178.140.1… <raw [1]>            0          0             0        1             0       28          6
    #>  2     14875 Poet…              17 Gray… 2017-08-29 15:39:22 199.66.88… <raw [1]>           NA         NA             0        1             0       NA         NA
    #>  3     14918 Vale…              17 oliv… 2017-09-10 15:51:00 86.10.127… <raw [1]>           NA         NA             0        1             0       NA         NA
    #>  4     14926 cucc…              14 nigg… 2017-09-12 18:29:13 172.104.1… <raw [1]>            0          0             0        1             0        0          0
    #>  5     14921 Hier…              17 Prow… 2017-09-11 11:07:06 2600:8804… <raw [1]>           NA         NA             0        1             0       NA         NA
    #>  6         2 Phal…              13 illu… 2011-09-12 15:52:30 68.37.21.… <raw [1]>            0          0             0        1             0        0          0
    #>  7     14057 Righ               13 righ… 2017-02-20 16:13:25 46.28.53.… <raw [1]>            0          0             0        0             0        0          0
    #>  8     14040 Zaxon              14 helv… 2017-02-18 09:36:32 185.93.18… <raw [1]>            0          2             0        1             0        0          0
    #>  9     14041 Солд…              13 mrel… 2017-02-18 12:06:20 2a02:c7d:… <raw [1]>            0          0             0        1             0       NA         NA
    #> 10         3 Bloo…              13 rene… 2011-09-12 18:10:11 68.10.255… <raw [1]>            0          0             0        1             0        0          0
    #> # … with 1,197 more rows, and 52 more variables: bday_year <int>, msg_count_new <int>, msg_count_total <int>, msg_count_reset <int>, msg_show_notification <lgl>,
    #> #   last_visit <dttm>, last_activity <dttm>, mod_posts <int>, auto_track <chr>, temp_ban <int>, mgroup_others <chr>, member_login_key_expire <dttm>,
    #> #   members_seo_name <chr>, members_cache <chr>, members_disable_pm <int>, failed_logins <chr>, failed_login_count <int>, members_profile_views <int>,
    #> #   members_pass_hash <chr>, members_pass_salt <chr>, members_bitoptions <int>, members_day_posts <chr>, notification_cnt <int>, pp_last_visitors <chr>,
    #> #   pp_main_photo <chr>, pp_main_width <int>, pp_main_height <int>, pp_thumb_photo <chr>, pp_thumb_width <int>, pp_thumb_height <int>, pp_setting_count_comments <lgl>,
    #> #   pp_reputation_points <int>, pp_gravatar <chr>, pp_photo_type <chr>, signature <chr>, fb_bwoptions <lgl>, tc_last_sid_import <chr>, tc_bwoptions <lgl>,
    #> #   pp_customization <chr>, timezone <chr>, pp_cover_photo <chr>, members_bitoptions2 <int>, create_menu <chr>, marked_site_read <int>, pp_cover_offset <int>,
    #> #   acp_skin <lgl>, acp_language <lgl>, member_title <chr>, member_posts <int>, member_last_post <int>, member_streams <chr>, photo_last_update <dttm>
    #> 
    #> $core_members_known_devices
    #> # A tibble: 4,637 x 7
    #>    device_key            member_id user_agent                                                                        login_key           last_seen anonymous login_handler
    #>    <chr>                     <dbl> <chr>                                                                             <chr>                   <int> <lgl>     <chr>        
    #>  1 00082373c8ebaba4a5d6… 6.62e-320 Mozilla/5.0 (X11; CrOS x86_64 9765.53.0) AppleWebKit/537.36 (KHTML, like Gecko) … 87d2e29b248142dab1…    1.51e9 FALSE     Internal     
    #>  2 000cc82a643f3c4cf739… 7.43e-320 Mozilla/5.0 (Windows NT 6.3; WOW64; rv:56.0) Gecko/20100101 Firefox/56.0          499daed48ad5d31ac2…    1.51e9 FALSE     <NA>         
    #>  3 001984f07aafa143800c… 4.75e-320 Mozilla/5.0 (Windows NT 6.1; rv:52.0) Gecko/20100101 Firefox/52.0                 2834e20cb9829ad3db…    1.51e9 FALSE     Internal     
    #>  4 00273c660ce7c149ca82… 6.59e-320 Mozilla/5.0 (Linux; Android 5.0.2; XT1068 Build/LXB22.46-28) AppleWebKit/537.36 … d2fa09c10d47309571…    1.51e9 FALSE     Internal     
    #>  5 00301de9d149d24f16e6… 7.43e-320 Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chro… 7c5b4eacf4651dc7c1…    1.51e9 FALSE     Internal     
    #>  6 004e28b74461e38756ce… 7.32e-320 Mozilla/5.0 (Linux; Android 7.0; SAMSUNG SM-G935U Build/NRD90M) AppleWebKit/537.… <NA>                   1.50e9 FALSE     <NA>         
    #>  7 00574e72b134158945eb… 4.05e-320 Mozilla/5.0 (iPad; CPU OS 7_0_6 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like… 1c8f47d6362215fc56…    1.51e9 FALSE     Internal     
    #>  8 0058c48a3865eade0aa9… 7.39e-320 Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko              <NA>                   1.51e9 FALSE     Internal     
    #>  9 005ee0ee6afa0c5ddf89… 7.20e-320 Mozilla/5.0 (Linux; Android 7.0; Redmi Note 4 Build/NRD90M) AppleWebKit/537.36 (… 829c239502d1bd3c58…    1.51e9 FALSE     Internal     
    #> 10 009368382d5aeb4f3b1a… 7.12e-320 Mozilla/5.0 (Windows NT 6.1; rv:52.0) Gecko/20100101 Firefox/52.0                 <NA>                   1.50e9 FALSE     Internal     
    #> # … with 4,627 more rows
    #> 
    #> $core_members_known_ip_addresses
    #> # A tibble: 14,903 x 4
    #>    device_key                         member_id ip_address       last_seen
    #>    <chr>                                  <dbl> <chr>                <int>
    #>  1 72c8beef2683dca41ab7c92ab41ca964 Inf.Nae-324 84.85.45.210    1501826677
    #>  2 270fc3e4ff80f6e6c6b0b011b79d5bbd Inf.Nae-324 84.85.45.210    1502042815
    #>  3 729d5284c9efc85e57a372ca55ac533d Inf.Nae-324 5.228.86.255    1502124078
    #>  4 4e7fb2ffc0a94cbe812aee8dfabf8fa6 Inf.Nae-324 89.200.4.210    1503523918
    #>  5 4e7fb2ffc0a94cbe812aee8dfabf8fa6 Inf.Nae-324 84.85.45.210    1504544107
    #>  6 ca626a411d361d01057e95d108d9fc34 Inf.Nae-324 5.228.86.255    1505271409
    #>  7 ca626a411d361d01057e95d108d9fc34 Inf.Nae-324 109.188.126.136 1505289399
    #>  8 ca626a411d361d01057e95d108d9fc34 Inf.Nae-324 109.188.125.197 1505310055
    #>  9 ca626a411d361d01057e95d108d9fc34 Inf.Nae-324 5.228.74.139    1505453063
    #> 10 ca626a411d361d01057e95d108d9fc34 Inf.Nae-324 5.228.78.239    1505972949
    #> # … with 14,893 more rows
    #> 
    #> $core_members_warn_logs
    #> # A tibble: 187 x 17
    #>    wl_id wl_member wl_moderator wl_date             wl_reason wl_points wl_note_member wl_note_mods wl_mq wl_rpa wl_suspend wl_acknowledged wl_content_app wl_content_id1
    #>    <int>     <int>        <int> <dttm>                  <int>     <int> <chr>          <chr>        <chr> <chr>  <chr>      <lgl>           <chr>          <chr>         
    #>  1     2        40            4 2011-10-27 23:38:28         0         1 <NA>           "<p>Racism/… <NA>  <NA>   <NA>       TRUE            <NA>           <NA>          
    #>  2     3        40            4 2011-10-27 23:39:35         0         0 <NA>           "<p>I belie… <NA>  <NA>   <NA>       TRUE            <NA>           <NA>          
    #>  3     4        40            4 2011-12-04 00:16:19         0         0 <NA>           "<p>yhu7jyt… <NA>  <NA>   <NA>       TRUE            <NA>           <NA>          
    #>  4     5        89            7 2011-12-17 22:04:47         0         1 <NA>           "<p>Ridicul… <NA>  <NA>   <NA>       TRUE            <NA>           <NA>          
    #>  5     6        49           14 2011-12-17 22:07:40         0         1 <NA>           "\n<p>Warne… <NA>  <NA>   <NA>       TRUE            <NA>           <NA>          
    #>  6     7        40           14 2011-12-23 20:27:50         0         0 <NA>           "\n<p>Compl… <NA>  <NA>   <NA>       TRUE            <NA>           <NA>          
    #>  7     8        40           14 2011-12-25 14:33:04         0         0 <NA>           "\n<p>See m… <NA>  <NA>   <NA>       TRUE            <NA>           <NA>          
    #>  8     9        40            4 2012-01-01 19:56:58         0         0 <NA>           "<p>He told… <NA>  <NA>   <NA>       TRUE            <NA>           <NA>          
    #>  9    10        40            4 2012-01-28 21:05:49         0         0 <NA>           "<p>Cooldow… <NA>  <NA>   <NA>       TRUE            <NA>           <NA>          
    #> 10    11        49            4 2012-01-28 21:06:46         0         0 <NA>           "<p>Cooldow… <NA>  <NA>   <NA>       TRUE            <NA>           <NA>          
    #> # … with 177 more rows, and 3 more variables: wl_content_id2 <chr>, wl_expire_date <int>, wl_content_module <chr>
    #> 
    #> $core_members_warn_reasons
    #> # A tibble: 6 x 5
    #>   wr_id wr_points_override wr_remove_unit wr_remove_override wr_order
    #>   <int> <lgl>              <chr>          <lgl>                 <int>
    #> 1     1 FALSE              h              FALSE                     1
    #> 2     2 FALSE              h              FALSE                     2
    #> 3     3 FALSE              h              FALSE                     5
    #> 4     4 FALSE              h              FALSE                     4
    #> 5     5 FALSE              h              FALSE                     3
    #> 6     6 TRUE               <NA>           TRUE                      0
    #> 
    #> $core_menu
    #> # A tibble: 18 x 8
    #>             id app      extension           config                                                                               position parent permissions is_menu_child
    #>          <dbl> <chr>    <chr>               <chr>                                                                                   <int>  <int> <chr>       <lgl>        
    #>  1 Inf.Nae-324 core     CustomItem          "{\"menu_custom_item_url\":\"\",\"internal\":\"\"}"                                         1     NA *           FALSE        
    #>  2 Inf.Nae-324 core     CustomItem          "{\"menu_custom_item_url\":\"app=core&module=discover&controller=streams\",\"intern…        2     NA *           FALSE        
    #>  3   1.50e-323 core     AllActivity         "[]"                                                                                        1      2 *           FALSE        
    #>  4   2.00e-323 core     YourActivityStreams "[]"                                                                                        2      2 *           FALSE        
    #>  5   2.50e-323 core     YourActivityStream… "{\"menu_stream_id\":1}"                                                                    3      2 *           FALSE        
    #>  6   3.00e-323 core     YourActivityStream… "{\"menu_stream_id\":2}"                                                                    4      2 *           FALSE        
    #>  7   3.50e-323 core     Search              "[]"                                                                                        5      2 *           FALSE        
    #>  8   4.50e-323 calendar Calendar            "[]"                                                                                        3      1 *           FALSE        
    #>  9   5.00e-323 core     Guidelines          "[]"                                                                                        2      1 *           FALSE        
    #> 10   5.50e-323 core     StaffDirectory      "[]"                                                                                        4      1 *           FALSE        
    #> 11   6.00e-323 core     OnlineUsers         "[]"                                                                                        5      1 *           FALSE        
    #> 12   6.50e-323 core     Menu                "[]"                                                                                        3     NA *           FALSE        
    #> 13   7.00e-323 core     CustomItem          "{\"menu_custom_item_url\":\"http:\\/\\/ropeculture.org\",\"menu_custom_item_target…        3     13 *           TRUE         
    #> 14   7.50e-323 core     CustomItem          "{\"menu_custom_item_url\":\"http:\\/\\/laraj.ca\\/AGwiki\\/\",\"menu_custom_item_t…        2     13 *           TRUE         
    #> 15   8.50e-323 core     CustomItem          "{\"menu_custom_item_url\":\"https:\\/\\/ironpridenetwork.tumblr.com\\/\",\"menu_cu…        1     13 *           TRUE         
    #> 16   9.00e-323 core     Promoted            "[]"                                                                                        6     NA <NA>        FALSE        
    #> 17   9.50e-323 core     Clubs               "[]"                                                                                        7     NA <NA>        FALSE        
    #> 18  10.00e-323 core     Leaderboard         "[]"                                                                                        8     NA <NA>        FALSE        
    #> 
    #> $core_message_posts
    #> # A tibble: 21,715 x 8
    #>    msg_id msg_topic_id msg_date            msg_post                                                      msg_post_key        msg_author_id msg_ip_address msg_is_first_po…
    #>     <int>        <int> <dttm>              <chr>                                                         <chr>                       <int> <chr>          <lgl>           
    #>  1      1            1 2011-09-16 03:49:58 "<p>The best first post to make on our forums is the one whe… 3320f7f06c422ef0fb…             1 178.140.119.2… TRUE            
    #>  2      2            2 2011-09-16 11:54:08 "\n<p>Who are we hosting this forum from?</p>\n<p>I like it … 9204e4883321af2275…            11 109.78.212.13  TRUE            
    #>  3      3            2 2011-09-16 14:39:59 "<p>Crisis Host - they basically provide hosting for free sp… 12fd0309239711d02b…             1 178.140.119.2… FALSE           
    #>  4      4            2 2011-09-16 15:29:01 "<p>Thank you, I'll make a note of it, I am very impressed b… 0658c6f99ac18d9060…            11 109.78.212.13  FALSE           
    #>  5      5            2 2011-09-16 15:32:58 "<p>If you mean the dark+orange skin then that's a skin I al… 570257864e3cb812ee…             1 178.140.119.2… FALSE           
    #>  6      6            2 2011-09-16 15:44:51 "<p>The functionality mostly, thanks for the info.</p>"       aabeacc8f4ccc579c4…            11 109.78.212.13  FALSE           
    #>  7      7            3 2011-09-17 01:43:49 "<p>I don't see why one would want to resuscitate Religio Ro… a36f67c0d722aa8d1d…            16 152.33.69.70   TRUE            
    #>  8      8            3 2011-09-17 01:59:50 "\n<blockquote data-ipsquote=\"\" class=\"ipsQuote\" data-ip… 327b933d818a39dc6a…            14 71.114.56.45   FALSE           
    #>  9     12            5 2011-09-20 14:20:14 "<p>The best first post to make on our forums is the one whe… 0667258c387129ea0d…             1 178.140.121.11 TRUE            
    #> 10     13            5 2011-09-20 14:42:17 "<p>Done and done. I meant to post something there but i am … de1d7fd2737dd852f5…            20 94.103.203.197 FALSE           
    #> # … with 21,705 more rows
    #> 
    #> $core_message_topic_user_map
    #> # A tibble: 8,787 x 12
    #>    map_id map_user_id map_topic_id map_folder_id map_read_time       map_user_active map_user_banned map_has_unread map_is_starter map_left_time map_ignore_noti…
    #>     <int>       <int>        <int> <chr>         <dttm>              <lgl>           <lgl>           <lgl>          <lgl>                  <int> <lgl>           
    #>  1      1          23            1 myconvo       2011-11-04 06:53:06 TRUE            FALSE           FALSE          FALSE                      0 FALSE           
    #>  2      2           1            1 myconvo       2011-09-20 14:19:38 FALSE           FALSE           FALSE          TRUE                       0 FALSE           
    #>  3      3           1            2 myconvo       2011-09-16 15:46:25 FALSE           FALSE           FALSE          FALSE                      0 FALSE           
    #>  4      4          11            2 myconvo       2011-09-20 04:03:38 TRUE            FALSE           FALSE          TRUE                       0 FALSE           
    #>  5      5          14            3 myconvo       2011-09-17 01:59:51 TRUE            FALSE           FALSE          FALSE                      0 FALSE           
    #>  6      6          16            3 myconvo       2011-09-17 18:19:01 FALSE           FALSE           FALSE          TRUE                       0 FALSE           
    #>  7      9          20            5 myconvo       2011-09-20 14:42:17 TRUE            FALSE           FALSE          FALSE                      0 FALSE           
    #>  8     10           1            5 myconvo       2011-11-07 01:36:40 FALSE           FALSE           FALSE          TRUE                       0 FALSE           
    #>  9     11          11            6 myconvo       2011-09-22 14:18:00 TRUE            FALSE           FALSE          FALSE                      0 FALSE           
    #> 10     12           1            6 myconvo       2011-09-22 14:33:52 FALSE           FALSE           FALSE          TRUE                       0 FALSE           
    #> # … with 8,777 more rows, and 1 more variable: map_last_topic_reply <dttm>
    #> 
    #> $core_message_topics
    #> # A tibble: 4,475 x 12
    #>    mt_id mt_date             mt_title mt_starter_id mt_start_time       mt_last_post_time   mt_to_count mt_to_member_id mt_replies mt_first_msg_id mt_is_draft
    #>    <int> <dttm>              <chr>            <int> <dttm>              <dttm>                    <int>           <int>      <int>           <int> <lgl>      
    #>  1     1 2011-09-16 03:49:58 Introdu…             1 2011-09-16 03:49:58 2011-09-16 03:49:58           1              23          0               1 FALSE      
    #>  2     2 2011-09-16 11:54:08 Our hos…            11 2011-09-16 11:54:07 2011-09-16 15:44:51           1               1          4               2 FALSE      
    #>  3     3 2011-09-17 01:43:49 Re: Nov…            16 2011-09-17 01:43:49 2011-09-17 01:59:50           1              14          1               7 FALSE      
    #>  4     5 2011-09-20 14:20:14 Introdu…             1 2011-09-20 14:20:14 2011-09-20 14:42:17           1              20          1              12 FALSE      
    #>  5     6 2011-09-22 14:12:17 msn                  1 2011-09-22 14:12:17 2011-09-22 14:17:57           1              11          1              14 FALSE      
    #>  6     8 2011-09-22 21:21:22 Do you …             2 2011-09-22 21:21:22 2011-09-23 00:14:21           2               8          7              17 FALSE      
    #>  7    10 2011-09-23 20:44:56 Introdu…             1 2011-09-23 20:44:56 2011-09-23 20:44:56           1              25          0              26 FALSE      
    #>  8    11 2011-09-24 09:40:39 Introdu…             1 2011-09-24 09:40:39 2011-09-24 12:12:39           1              39          2              27 FALSE      
    #>  9    12 2011-09-25 17:18:50 Welcome…            14 2011-09-25 17:18:50 2011-09-26 18:52:57           1              35          2              31 FALSE      
    #> 10    13 2011-09-26 01:05:50 Could I…             2 2011-09-26 01:05:49 2011-09-26 01:05:49           1               7          0              32 FALSE      
    #> # … with 4,465 more rows, and 1 more variable: mt_is_deleted <lgl>
    #> 
    #> $core_moderator_logs
    #> # A tibble: 32,547 x 13
    #>             id member_id ctime               note                              ip_address  appcomponent module controller do    lang_key       class   item_id member_name
    #>          <dbl>     <int> <dttm>              <chr>                             <chr>       <chr>        <chr>  <chr>      <chr> <chr>          <chr>     <int> <chr>      
    #>  1 Inf.Nae-324         0 2011-09-12 17:13:41  <NA>                             178.140.11… core         task   <NA>       <NA>  Deleted posts…  <NA>        NA <NA>       
    #>  2 Inf.Nae-324         1 2011-09-12 18:14:50 "{\"topic\":false,\"http:\\/\\/i… 178.140.11… forums       <NA>   <NA>       <NA>  Deleted topic… "IPS\\…       1 <NA>       
    #>  3   1.50e-323         1 2011-09-12 18:14:50 "{\"topic\":false,\"http:\\/\\/i… 178.140.11… forums       <NA>   <NA>       <NA>  Cleared topic…  <NA>        NA <NA>       
    #>  4   2.00e-323         1 2011-09-12 21:42:16 "{\"topic\":false,\"http:\\/\\/i… 178.140.11… forums       <NA>   <NA>       <NA>  Pinned & clos…  <NA>        NA <NA>       
    #>  5   2.50e-323         0 2011-09-12 22:05:07  <NA>                             178.140.11… core         task   <NA>       <NA>  Deleted posts…  <NA>        NA <NA>       
    #>  6   3.00e-323         1 2011-09-13 08:52:25 "{\"topic\":false,\"http:\\/\\/i… 178.140.11… forums       <NA>   <NA>       <NA>  Pinned & clos…  <NA>        NA <NA>       
    #>  7   3.50e-323         1 2011-09-13 09:13:02 "{\"topic\":false,\"http:\\/\\/i… 178.140.11… forums       <NA>   <NA>       <NA>  Pinned & clos…  <NA>        NA <NA>       
    #>  8   4.00e-323         1 2011-09-13 09:47:48 "{\"topic\":false,\"http:\\/\\/i… 178.140.11… forums       <NA>   <NA>       <NA>  Pinned & clos…  <NA>        NA <NA>       
    #>  9   4.50e-323         1 2011-09-13 09:52:23 "{\"topic\":false,\"http:\\/\\/i… 178.140.11… forums       <NA>   <NA>       <NA>  Pinned & clos…  <NA>        NA <NA>       
    #> 10   5.00e-323         1 2011-09-13 09:55:16 "{\"topic\":false,\"http:\\/\\/i… 178.140.11… forums       <NA>   <NA>       <NA>  Pinned & clos…  <NA>        NA <NA>       
    #> # … with 32,537 more rows
    #> 
    #> $core_moderators
    #> # A tibble: 3 x 3
    #>          id perms                                                                                                                                                  updated
    #>       <dbl> <chr>                                                                                                                                                    <int>
    #> 1 2.00e-323 "*"                                                                                                                                                     1.46e9
    #> 2 3.00e-323 "{\"can_manage_sidebar\":false,\"can_use_ip_tools\":true,\"can_edit_member_status\":false,\"can_hide_member_status\":false,\"can_unhide_member_stat…    1.50e9
    #> 3 5.00e-323 "{\"can_manage_sidebar\":false,\"can_use_ip_tools\":true,\"can_edit_member_status\":false,\"can_hide_member_status\":false,\"can_unhide_member_stat…    1.50e9
    #> 
    #> $core_modules
    #> # A tibble: 41 x 8
    #>    sys_module_id sys_module_application sys_module_key sys_module_protected sys_module_position sys_module_area sys_module_default sys_module_default_controller
    #>            <int> <chr>                  <chr>          <lgl>                              <int> <chr>           <lgl>              <chr>                        
    #>  1             1 core                   overview       FALSE                                  1 admin           FALSE              dashboard                    
    #>  2             2 core                   system         TRUE                                   2 admin           FALSE              login                        
    #>  3             3 core                   applications   FALSE                                  3 admin           FALSE              applications                 
    #>  4             4 core                   settings       FALSE                                  4 admin           FALSE              general                      
    #>  5             5 core                   members        FALSE                                  5 admin           FALSE              members                      
    #>  6             6 core                   membersettings FALSE                                  6 admin           FALSE              general                      
    #>  7             7 core                   staff          FALSE                                  7 admin           FALSE              moderators                   
    #>  8             8 core                   customization  FALSE                                  8 admin           FALSE              skins                        
    #>  9             9 core                   languages      FALSE                                  9 admin           FALSE              languages                    
    #> 10            10 core                   editor         FALSE                                 10 admin           FALSE              toolbar                      
    #> # … with 31 more rows
    #> 
    #> $core_notification_defaults
    #> # A tibble: 17 x 2
    #>    notification_key      default
    #>    <chr>                 <chr>  
    #>  1 member_follow         inline 
    #>  2 profile_comment       inline 
    #>  3 profile_reply         inline 
    #>  4 new_status            inline 
    #>  5 new_private_message   email  
    #>  6 private_message_added email  
    #>  7 new_content           email  
    #>  8 new_comment           email  
    #>  9 new_review            email  
    #> 10 follower_content      inline 
    #> 11 quote                 inline 
    #> 12 mention               inline 
    #> 13 new_likes             inline 
    #> 14 warning_mods          inline 
    #> 15 report_center         email  
    #> 16 unapproved_content    email  
    #> 17 event_reminder        email  
    #> 
    #> $core_notification_preferences
    #> # A tibble: 14,486 x 3
    #>    member_id notification_key      preference
    #>        <int> <chr>                 <chr>     
    #>  1         2 private_message_added email     
    #>  2         3 private_message_added email     
    #>  3         3 new_private_message   email     
    #>  4         4 private_message_added email     
    #>  5         4 new_private_message   email     
    #>  6         5 profile_comment       inline    
    #>  7         5 member_follow         inline    
    #>  8     14852 new_content           email     
    #>  9         8 private_message_added email     
    #> 10         8 new_private_message   email     
    #> # … with 14,476 more rows
    #> 
    #> $core_notifications
    #> # A tibble: 34,802 x 13
    #>           id member notification_key item_class     item_id member_data                sent_time read_time notification_app updated_time item_sub_class  item_sub_id extra
    #>        <dbl>  <int> <chr>            <chr>            <dbl> <chr>                          <int>     <int> <chr>                   <int> <chr>                 <dbl> <chr>
    #>  1 1.03e-318  14201 new_likes        "IPS\\forum… 1.00e-318  <NA>                         1.51e9    1.51e9 core               1505322089 "IPS\\forums\\…   1.00e-318 <NA> 
    #>  2 1.03e-318  14852 new_comment      "IPS\\forum… 2.06e-321 "{\"follow_id\":\"b5ffaa8…    1.51e9    1.51e9 core               1505321866 "IPS\\forums\\…   1.00e-318 <NA> 
    #>  3 1.02e-318  14041 new_likes        "IPS\\forum… 9.84e-319  <NA>                         1.50e9    1.51e9 core               1504759005 "IPS\\forums\\…   9.84e-319 <NA> 
    #>  4 1.02e-318  14127 new_likes        "IPS\\forum… 1.00e-318  <NA>                         1.50e9    1.51e9 core               1504759135 "IPS\\forums\\…   1.00e-318 <NA> 
    #>  5 1.04e-318  14404 new_likes        "IPS\\forum… 1.00e-318  <NA>                         1.51e9    1.51e9 core               1505672080 "IPS\\forums\\…   1.00e-318 <NA> 
    #>  6 1.04e-318   9668 new_likes        "IPS\\forum… 1.00e-318  <NA>                         1.51e9    1.51e9 core               1505627303 "IPS\\forums\\…   1.00e-318 <NA> 
    #>  7 1.03e-318  14450 new_comment      "IPS\\forum… 2.83e-320 "{\"follow_id\":\"3843727…    1.51e9   NA      core               1505266309 "IPS\\forums\\…   1.00e-318 <NA> 
    #>  8 1.03e-318  13839 new_likes        "IPS\\forum… 9.80e-319  <NA>                         1.51e9    1.51e9 core               1505266444 "IPS\\forums\\…   9.80e-319 <NA> 
    #>  9 1.03e-318  14102 new_comment      "IPS\\forum… 4.11e-320 "{\"follow_id\":\"a006da6…    1.51e9   NA      core               1505273712 "IPS\\forums\\…   1.00e-318 <NA> 
    #> 10 1.03e-318  14450 new_comment      "IPS\\forum… 4.11e-320 "{\"follow_id\":\"3843727…    1.51e9   NA      core               1505273712 "IPS\\forums\\…   1.00e-318 <NA> 
    #> # … with 34,792 more rows
    #> 
    #> $core_permission_index
    #> # A tibble: 202 x 10
    #>    perm_id app     perm_type    perm_type_id perm_view               perm_2                  perm_3             perm_4             perm_6 owner_only
    #>      <int> <chr>   <chr>               <int> <chr>                   <chr>                   <chr>              <chr>              <chr>  <lgl>     
    #>  1       1 members profile_view            1 2,3,4,6,7,10,13         <NA>                    <NA>               <NA>               <NA>   FALSE     
    #>  2       2 core    help                    1 2,3,4,6,7,10,13         <NA>                    <NA>               <NA>               <NA>   FALSE     
    #>  3       3 forums  forum                   1 2,13,4,6,10,17,19,18,20 <NA>                    <NA>               <NA>               <NA>   FALSE     
    #>  4     125 forums  forum                   2 6,10,13,4,2,17,19,18,20 6,10,13,4,2,17,19,18,20 4                  6,10,13,4,19,18,20 <NA>   FALSE     
    #>  5     110 forums  forum                  92 4,2,13,6,10,17,19,18,20 4,2,13,6,10,17,19,18,20 4,13,6,10,19,18,20 4,13,6,10,19,18,20 <NA>   FALSE     
    #>  6       7 forums  forum                   5 4,2,13,6,10,17,19,18,20 4,2,13,6,10,17,19,18,20 4,13,6,10,19,18,20 4,13,6,10,19,18,20 4,6,10 FALSE     
    #>  7     118 forums  forum                 100 4,2,13,6,10,17,19,18,20 4,2,13,6,10,17,19,18,20 4,13,6,10,19,18,20 4,13,6,10,19,18,20 <NA>   FALSE     
    #>  8       9 forums  forum                   7 4,2,13,6,10,17,19,18,20 <NA>                    <NA>               <NA>               <NA>   TRUE      
    #>  9     109 forums  forum                  91 4,2,13,6,10,17,19,18,20 4,2,13,6,10,17,19,18,20 4,13,6,10,19,18,20 4,13,6,10,19,18,20 <NA>   FALSE     
    #> 10     108 forums  forum                  90 4,2,13,6,10,17,19,18,20 4,2,13,6,10,17,19,18,20 4,13,6,10,19,18,20 4,13,6,10,19,18,20 <NA>   FALSE     
    #> # … with 192 more rows
    #> 
    #> $core_pfields_content
    #> # A tibble: 1,208 x 8
    #>    member_id field_3       field_5   field_6   field_7                      field_11                  field_12                                                    field_13
    #>        <int> <chr>         <chr>     <chr>     <chr>                        <chr>                     <chr>                                                       <chr>   
    #>  1         1 <NA>          Male      Third Ro… <NA>                         FASCISM                    <NA>                                                       <NA>    
    #>  2         2 <NA>          Male      <NA>      <NA>                         Out of context Mussolini…  <NA>                                                       <NA>    
    #>  3         3 <NA>          Male      Dixie     Muay Thai, surfing, running… ≠                          <NA>                                                       <NA>    
    #>  4         4 http://bigbu… Male      Babylon   You                          Theonomy                  "\n<p>\n\tDefinitely not a woman.\n</p>\n\n<p>\n\tWhy did … <NA>    
    #>  5         5 <NA>          Male      Great Br… Politics, history, science … Republican Fascism         <NA>                                                       <NA>    
    #>  6         7 <NA>          Male      United K… <NA>                         Post-Irony                 <NA>                                                       <NA>    
    #>  7         8 <NA>          Male      <NA>      <NA>                         Syndicalist Futurism      "<p>\n\tEarly Revolutionary Style Fascist/Futurist.\n</p>"  <NA>    
    #>  8         9 <NA>          Female    AWOL      <NA>                         Classic Fascism            <NA>                                                       <NA>    
    #>  9        11 <NA>          Male      Ireland   <NA>                         Fascist-esque opposition…  <NA>                                                       <NA>    
    #> 10        12 <NA>          Not Tell… <NA>      <NA>                         Integralism                <NA>                                                       <NA>    
    #> # … with 1,198 more rows
    #> 
    #> $core_pfields_data
    #> # A tibble: 7 x 9
    #>   pf_id pf_content                       pf_type pf_not_null pf_position pf_show_on_reg pf_format                                               pf_group_id pf_search_type
    #>   <int> <chr>                            <chr>   <lgl>             <int> <lgl>          <chr>                                                         <int> <chr>         
    #> 1     3 "null"                           Url     FALSE                 0 FALSE           <NA>                                                             1 loose         
    #> 2     5 "[\"Not Telling\",\"Male\",\"Fe… Select  TRUE                  2 TRUE            <NA>                                                             2 <NA>          
    #> 3     6 "null"                           Text    TRUE                  3 TRUE           "<span class='ft'>{title}</span> <span class='fc'>{con…           2 loose         
    #> 4     7 "null"                           TextAr… FALSE                 4 FALSE           <NA>                                                             2 loose         
    #> 5    13 "null"                           Url     FALSE                 5 FALSE           <NA>                                                             1 loose         
    #> 6    11 "null"                           Text    TRUE                  1 TRUE           "<span class=\"ft\">{title}: </span><span class=\"fc\"…           2 exact         
    #> 7    12 "null"                           Editor  FALSE                 0 FALSE           <NA>                                                             3 <NA>          
    #> 
    #> $core_pfields_groups
    #> # A tibble: 3 x 1
    #>   pf_group_id
    #>         <int>
    #> 1           1
    #> 2           2
    #> 3           3
    #> 
    #> $core_polls
    #> # A tibble: 40 x 7
    #>      pid start_date          choices                                                                starter_id votes poll_question                        poll_view_voters
    #>    <int> <dttm>              <chr>                                                                       <int> <int> <chr>                                <lgl>           
    #>  1     1 2011-12-13 15:25:38 "{\"1\":{\"question\":\"Whodunnit?\",\"choice\":{\"1\":\"Muslims\",\"…          4    13 <NA>                                 FALSE           
    #>  2     3 2012-02-14 00:03:33 "{\"1\":{\"question\":\"Democracy has failed.\",\"choice\":{\"1\":\"N…          4    27 THERE WAS A HUGE EDITING WAR AND WH… FALSE           
    #>  3     4 2012-03-06 16:28:36 "{\"1\":{\"question\":\"Demographics gathered; thank you for your par…         14    41 Answer the Question                  TRUE            
    #>  4     6 2012-05-11 01:31:58 "{\"1\":{\"question\":\"Do you have insomnia?\",\"choice\":{\"1\":\"Y…          0    40 Do you have insomnia?                FALSE           
    #>  5    11 2012-09-06 04:27:51 "{\"1\":{\"question\":\"How would peer-to-peer and torrent downloads …        274    20 How would peer-to-peer and torrent … FALSE           
    #>  6    18 2013-08-10 01:03:42 "{\"1\":{\"question\":\"Wasn&#39;t OP a faggot?\",\"choice\":{\"1\":\…       6201    25 How Gay is the OP?                   TRUE            
    #>  7    20 2013-08-19 20:44:13 "{\"1\":{\"question\":\"Which one should KU ban?\",\"multi\":1,\"choi…          0    23 Mexican or Muslim Immigrants which … FALSE           
    #>  8    23 2013-10-22 13:27:17 "{\"1\":{\"question\":\"Where do you live?\",\"choice\":{\"1\":\"Midw…         35    53 Where do you live?                   FALSE           
    #>  9    24 2014-03-15 05:34:15 "{\"1\":{\"question\":\"Will the fascists crush democracy?\",\"choice…       6122    22 <NA>                                 FALSE           
    #> 10    25 2014-04-30 20:33:11 "{\"1\":{\"question\":\"Is global climate change anthropogenic (human…          0    28 Climate Change                       TRUE            
    #> # … with 30 more rows
    #> 
    #> $core_profile_steps
    #> # A tibble: 2 x 5
    #>       step_id step_completion_act step_required step_extension     step_subcompletion_act                                    
    #>         <dbl> <chr>               <list>        <chr>              <chr>                                                     
    #> 1 Inf.Nae-324 profile_fields      <raw [1]>     core_ProfileFields "[\"core_pfield_11\",\"core_pfield_5\",\"core_pfield_6\"]"
    #> 2 Inf.Nae-324 basic_profile       <raw [1]>     core_Core          "[\"photo\"]"                                             
    #> 
    #> $core_question_and_answer
    #> # A tibble: 4 x 2
    #>   qa_id qa_answers                                                                                
    #>   <int> <chr>                                                                                     
    #> 1    17 "[\"JEWISH QUESTION\",\"THE JEWISH QUESTION\"]"                                           
    #> 2    16 "[\"FASCIST ALMA MATER\"]"                                                                
    #> 3    15 "[\"GAS THE KIKES RACE WAR NOW 1488 BOOTS ON THE GROUND\",\"GAS THE KIKES RACE WAR NOW\"]"
    #> 4    18 "[\"CONCENTRATION CAMP\",\"THE CONCENTRATION CAMP\",\"SHOWERS\",\"THE SHOWERS\"]"         
    #> 
    #> $core_ratings
    #> # A tibble: 91 x 5
    #>             id   item_id member rating ip                                     
    #>          <dbl>     <dbl>  <int>  <int> <chr>                                  
    #>  1 Inf.Nae-324 2.12e-320   1558      5 83.233.70.12                           
    #>  2 Inf.Nae-324 2.12e-320    958      5 188.228.43.35                          
    #>  3   1.50e-323 2.12e-320   6359      5 69.35.163.246                          
    #>  4   2.60e-322 4.12e-320  13901      5 2605:6000:554a:f600:70ab:e9c2:a48b:6b2a
    #>  5   2.50e-323 2.12e-320      7      5 91.125.204.107                         
    #>  6   3.00e-323 2.12e-320    125      5 77.38.156.66                           
    #>  7   3.50e-323 2.12e-320   2820      5 99.249.195.215                         
    #>  8   4.00e-323 2.12e-320   2306      5 88.193.135.245                         
    #>  9   4.50e-323 2.12e-320   6310      5 75.157.149.158                         
    #> 10   5.00e-323 2.90e-320   9679      5 66.169.97.70                           
    #> # … with 81 more rows
    #> 
    #> $core_rc_comments
    #> # A tibble: 53 x 7
    #>       id   rid comment                                                                                         comment_by comment_date        author_name     ip_address  
    #>    <int> <int> <chr>                                                                                                <int> <dttm>              <chr>           <chr>       
    #>  1     1     1 "This is an anti-fascist point of view of course, but I don't see anything reprehensible in it…          9 2011-12-24 09:57:56 Woman in Black  88.147.17.2…
    #>  2    13    10 "done"                                                                                                  49 2012-12-27 20:38:44 Владимир_Борис… 72.78.105.1…
    #>  3    26    74 "<p>Don't report people over differences of opinion</p>\n"                                               4 2014-01-02 11:51:34 Mierce          82.25.135.1…
    #>  4    30    89 "<p>No.</p>\n"                                                                                           1 2015-05-13 16:30:24 Александр Слав… 5.228.66.104
    #>  5    31    89 "<p>I'll need a transplant for my sides :(</p>\n"                                                     2170 2015-05-13 20:18:43 Zeiger          69.70.181.10
    #>  6    32    89 "<p>this is just too good.</p>"                                                                       9475 2015-05-13 21:47:00 mengligiraykhan 95.142.136.…
    #>  7    33    89 "<p>&gt;Puts something on internet.</p>\n<p>&gt;Expects it to remain in one place.</p>\n<p>&nb…       2220 2015-05-15 02:16:03 Kulturkampf     122.128.196…
    #>  8    34    90 "Who are you again?"                                                                                  2170 2015-05-21 06:36:39 Zeiger          66.102.6.221
    #>  9    35    90 "<p>He's the guy that wanted us to remove his drawings I believe.&nbsp;</p>"                          9475 2015-05-21 06:57:15 mengligiraykhan 95.142.136.…
    #> 10    36    90 "<p>Oh yeah, sure &gt;we're the autists, not the the moron who wrote a wall-o-text \"na-na-na-…          1 2015-05-21 07:40:49 Александр Слав… 5.228.66.104
    #> # … with 43 more rows
    #> 
    #> $core_rc_index
    #> # A tibble: 99 x 10
    #>             id class                      content_id   perm_id num_reports num_comments first_report_by first_report_date   last_updated        author
    #>          <dbl> <chr>                           <dbl>     <dbl>       <int>        <int>           <int> <dttm>              <dttm>               <int>
    #>  1 Inf.Nae-324 "IPS\\forums\\Topic\\Post"  2.99e-320 5.15e-322           1            1              11 2011-12-23 23:53:04 2011-12-24 09:57:56     94
    #>  2   5.00e-323 "IPS\\forums\\Topic\\Post"  2.30e-319 5.85e-322           1            1            2099 2012-12-27 20:31:32 2012-12-27 21:54:16      1
    #>  3   7.00e-323 "IPS\\forums\\Topic\\Post"  2.54e-319 5.30e-322           1            0               2 2013-02-19 03:52:40 2013-02-19 04:26:46     47
    #>  4   2.90e-322 "IPS\\forums\\Topic\\Post"  3.11e-319 0.                  1            0            6174 2013-07-24 06:14:10 2013-07-24 06:20:33      0
    #>  5   3.30e-322 "IPS\\forums\\Topic\\Post"  3.23e-319 5.30e-322           1            0            6173 2013-08-21 12:46:49 2013-08-21 14:24:22     16
    #>  6   3.45e-322 "IPS\\forums\\Topic\\Post"  3.40e-319 9.65e-322           1            0               2 2013-09-28 08:18:06 2013-09-28 08:27:39     64
    #>  7   3.50e-322 "IPS\\forums\\Topic\\Post"  3.40e-319 5.30e-322           1            0               2 2013-09-28 08:18:12 2013-09-28 08:27:39     56
    #>  8   3.70e-322 "IPS\\forums\\Topic\\Post"  3.56e-319 5.25e-322           1            1               0 2014-01-02 10:55:27 2014-01-02 11:51:34   9475
    #>  9   4.45e-322 "IPS\\forums\\Topic\\Post"  4.30e-319 1.60e-322           1            4               0 2015-05-13 16:14:59 2015-05-15 03:03:00   1558
    #> 10   4.50e-322 "IPS\\forums\\Topic\\Post"  5.59e-319 6.25e-322           1            5               0 2015-05-21 03:05:23 2015-05-22 15:40:18      1
    #> # … with 89 more rows
    #> 
    #> $core_rc_reports
    #> # A tibble: 106 x 6
    #>       id   rid report                                                                                                                   report_by date_reported ip_address
    #>    <int> <int> <chr>                                                                                                                        <int>         <int> <chr>     
    #>  1     1     1 "\n<blockquote data-ipsquote=\"\" class=\"ipsQuote\" data-ipsquote-username=\"Frost Hammer\" data-cite=\"Frost Hammer\"…        11    1324684384 <NA>      
    #>  2    10    10 "\n<blockquote data-ipsquote=\"\" class=\"ipsQuote\" data-ipsquote-username=\"Sir Barza\" data-cite=\"Sir Barza\" data-…      2099    1356640292 <NA>      
    #>  3    14    14 "\n<blockquote data-ipsquote=\"\" class=\"ipsQuote\" data-ipsquote-username=\"AlbertSakas\" data-cite=\"AlbertSakas\" d…         2    1361245960 <NA>      
    #>  4    59    55 "<p>spam profile</p>"                                                                                                         1209    1366310513 <NA>      
    #>  5    60    56 "<p>more spam profile's</p>"                                                                                                  1209    1366310573 <NA>      
    #>  6    62    58 "\n<blockquote data-ipsquote=\"\" class=\"ipsQuote\" data-ipsquote-contentcommentid=\"63009\" data-ipsquote-username=\"…      6174    1374646450 <NA>      
    #>  7    71    66 "\n<blockquote data-ipsquote=\"\" class=\"ipsQuote\" data-ipsquote-contentcommentid=\"65398\" data-ipsquote-username=\"…      6173    1377089209 <NA>      
    #>  8    74    69 "\n<blockquote data-ipsquote=\"\" class=\"ipsQuote\" data-ipsquote-contentcommentid=\"68874\" data-ipsquote-username=\"…         2    1380356286 <NA>      
    #>  9    75    70 "\n<blockquote data-ipsquote=\"\" class=\"ipsQuote\" data-ipsquote-contentcommentid=\"68873\" data-ipsquote-username=\"…         2    1380356292 <NA>      
    #> 10    79    74 "\n<blockquote data-ipsquote=\"\" class=\"ipsQuote\" data-ipsquote-contentcommentid=\"72083\" data-ipsquote-username=\"…         0    1388660127 <NA>      
    #> # … with 96 more rows
    #> 
    #> $core_reputation_index
    #> # A tibble: 272,129 x 10
    #>             id member_id app    type  type_id rep_date            member_received rep_class                  item_id class_type_id_hash              
    #>          <dbl>     <int> <chr>  <chr>   <int> <dttm>                        <int> <chr>                        <int> <chr>                           
    #>  1 Inf.Nae-324        14 forums pid         4 2011-09-13 23:02:39               1 "IPS\\forums\\Topic\\Post"       3 50f2b277ad846c72f80b986892d82e58
    #>  2   1.50e-323        14 forums pid       124 2011-09-14 20:30:25              13 "IPS\\forums\\Topic\\Post"      47 1bc23c10ff9fbeaa757ca79f41dc3675
    #>  3   2.00e-323        13 forums pid       119 2011-09-14 21:57:39               9 "IPS\\forums\\Topic\\Post"      47 0c9a334ff5f4fd4c226bbd9f638cf774
    #>  4   2.50e-323         9 forums pid       180 2011-09-15 16:49:00               3 "IPS\\forums\\Topic\\Post"      60 295c3840c5925e5a110511a5f8e50c94
    #>  5   6.31e-321        11 forums pid      8457 2012-01-28 19:41:56               7 "IPS\\forums\\Topic\\Post"     416 282f5df83a735d8e751c4ded6f5ad3dd
    #>  6   3.50e-323         3 forums pid       182 2011-09-15 23:40:19               9 "IPS\\forums\\Topic\\Post"      60 0b990d02ac1f6cebde5b70b51a5222d6
    #>  7   4.00e-323         3 forums pid       213 2011-09-16 03:46:29               7 "IPS\\forums\\Topic\\Post"      62 1e781d353db1bc7eb1bc6811210a5e15
    #>  8   4.50e-323         9 forums pid       227 2011-09-16 07:07:43              16 "IPS\\forums\\Topic\\Post"      54 e798f78bba0e2f74e7e15ec8952dc220
    #>  9   5.50e-323        13 forums pid       293 2011-09-16 22:35:02              14 "IPS\\forums\\Topic\\Post"      65 7920d066021ed7f1b239d8b4ea9ceae6
    #> 10   6.00e-323         9 forums pid       345 2011-09-17 13:06:42               1 "IPS\\forums\\Topic\\Post"      65 2cfb930b7ff4a453fc156208ee49a174
    #> # … with 272,119 more rows
    #> 
    #> $core_reputation_leaderboard_history
    #> # A tibble: 8,912 x 4
    #>    leader_date leader_member_id leader_position leader_rep_total
    #>          <int>            <int>           <int>            <int>
    #>  1  1316001597                0               4                0
    #>  2  1316001598                0               3                0
    #>  3  1316001600                9               2                1
    #>  4  1316001600               13               1                1
    #>  5  1316087997                0               4                0
    #>  6  1316087998                0               3                0
    #>  7  1316088000                3               1                1
    #>  8  1316088000                9               2                1
    #>  9  1316174397                0               4                0
    #> 10  1316174400                7               1                1
    #> # … with 8,902 more rows
    #> 
    #> $core_reputation_levels
    #> # A tibble: 16 x 2
    #>    level_id level_points
    #>       <int>        <int>
    #>  1       18      6000000
    #>  2       17        40001
    #>  3        3            0
    #>  4        4          100
    #>  5        5          500
    #>  6        6         1000
    #>  7        7         1488
    #>  8        8         1489
    #>  9        9         1490
    #> 10       10         2000
    #> 11       11         3000
    #> 12       12         9001
    #> 13       13        10000
    #> 14       14        40000
    #> 15       15      6000001
    #> 16       16           50
    #> 
    #> $core_search_index
    #> # A tibble: 196,042 x 17
    #>    index_class    index_id index_object_id index_item_id index_container… index_content index_permissio… index_author index_title index_date_created  index_date_updated 
    #>    <chr>             <dbl>           <int>         <int>            <int> <chr>         <chr>                   <int> <chr>       <dttm>              <dttm>             
    #>  1 "IPS\\core… Inf.Nae-324            3053          3053             9446 "Congrats on… *                       11235 "\n\tCongr… 2017-07-28 16:40:17 2017-07-28 16:40:17
    #>  2 "IPS\\core… Inf.Nae-324            3051          3051             9622 "I approve o… *                        6269 "\n\tI app… 2017-06-28 06:40:14 2017-06-28 06:40:14
    #>  3 "IPS\\core…   1.50e-323            3050          3050            14382 "I have more… *                       13893 "\n\tI hav… 2017-06-22 06:49:22 2017-06-22 06:49:22
    #>  4 "IPS\\core…   2.00e-323            3049          3049             9872 "Hi Rostisla… *                       14568 "Hi Rostis… 2017-06-15 18:10:15 2017-06-15 18:10:15
    #>  5 "IPS\\core…   2.50e-323            3048          3048            14568 "How to kill… *                       14568 "\n\tHow t… 2017-06-14 11:27:41 2017-06-14 11:27:41
    #>  6 "IPS\\core…   3.00e-323            3047          3047            14568 "knöcheltief… *                       14568 "\n\tknöch… 2017-06-13 10:15:50 2017-06-13 10:15:50
    #>  7 "IPS\\core…   3.50e-323            3045          3045                7 "Clear out y… <NA>                    13831 "\n\n\t\n\… 2017-05-26 18:10:42 2017-05-26 18:10:42
    #>  8 "IPS\\core…   4.00e-323            3044          3044             8232 "&gt;tfw you… *                        8232 "\n\t&gt;t… 2017-05-20 21:08:16 2017-05-20 21:08:16
    #>  9 "IPS\\core…   4.50e-323            3043          3043             7986 "Ethiopia be… *                       13698 "\n\n\tEth… 2017-05-19 22:23:04 2017-05-19 22:23:04
    #> 10 "IPS\\core…   5.00e-323            3042          3042            14450 "Iron March … *                       14450 "\n\tIron … 2017-05-16 08:28:53 2017-05-16 08:28:53
    #> # … with 196,032 more rows, and 6 more variables: index_hidden <int>, index_item_index_id <dbl>, index_item_author <int>, index_is_last_comment <lgl>,
    #> #   index_class_type_id_hash <chr>, index_container_class <chr>
    #> 
    #> $core_search_index_item_map
    #> # A tibble: 80,727 x 3
    #>    index_author_id index_item_id index_class                  
    #>              <int>         <int> <chr>                        
    #>  1               1             1 "IPS\\calendar\\Event"       
    #>  2           13661             1 "IPS\\calendar\\Event"       
    #>  3               1             2 "IPS\\calendar\\Event"       
    #>  4              14             2 "IPS\\core\\Statuses\\Status"
    #>  5               1             3 "IPS\\calendar\\Event"       
    #>  6               0             3 "IPS\\forums\\Topic"         
    #>  7               1             3 "IPS\\forums\\Topic"         
    #>  8               2             3 "IPS\\forums\\Topic"         
    #>  9               3             3 "IPS\\forums\\Topic"         
    #> 10               4             3 "IPS\\forums\\Topic"         
    #> # … with 80,717 more rows
    #> 
    #> $core_search_index_tags
    #> # A tibble: 5,057 x 3
    #>     index_id index_tag             index_is_prefix
    #>        <dbl> <chr>                 <lgl>          
    #>  1 3.95e-321 james mason           FALSE          
    #>  2 3.95e-321 siege                 FALSE          
    #>  3 3.95e-321 siegeculture          FALSE          
    #>  4 4.70e-321 newcomer              TRUE           
    #>  5 5.30e-321 last                  FALSE          
    #>  6 5.30e-321 will                  FALSE          
    #>  7 5.30e-321 russian               FALSE          
    #>  8 5.30e-321 fascist               FALSE          
    #>  9 5.30e-321 konstantin rodzaevsky FALSE          
    #> 10 5.30e-321 konstantin            FALSE          
    #> # … with 5,047 more rows
    #> 
    #> $core_sessions
    #> # A tibble: 522 x 21
    #>    id    member_name seo_name member_id ip_address browser running_time login_type member_group current_appcomp… current_module uagent_key uagent_version uagent_type
    #>    <chr> <chr>       <chr>        <int> <chr>      <chr>          <int>      <int>        <int> <chr>            <chr>          <chr>      <chr>          <chr>      
    #>  1 0     <NA>        <NA>            NA <NA>       <NA>              NA          0           NA <NA>             <NA>           <NA>       <NA>           <NA>       
    #>  2 31hi… <NA>        <NA>            NA 162.158.7… Mozill…   1511236789          3            2 calendar         calendar       Googlebot  2.1            search     
    #>  3 97b1… <NA>        <NA>            NA 108.162.2… Mozill…   1511237308          3            2 forums           forums         bingbot    2.0            search     
    #>  4 lkec… <NA>        <NA>            NA 162.158.7… Mozill…   1511236955          3            2 forums           forums         Googlebot  2.1            search     
    #>  5 mfpd… <NA>        <NA>            NA 162.158.1… Mozill…   1511236584          3            2 forums           forums         bingbot    2.0            search     
    #>  6 sga7… <NA>        <NA>            NA 108.162.2… Mozill…   1511235889          3            2 forums           forums         bingbot    2.0            search     
    #>  7 261f… <NA>        <NA>            NA 108.162.2… Mozill…   1511236691          3            2 forums           forums         bingbot    2.0            search     
    #>  8 6ad8… <NA>        <NA>            NA 108.162.2… Mozill…   1511237780          3            2 forums           forums         bingbot    2.0            search     
    #>  9 oiba… <NA>        <NA>            NA 108.162.2… Mozill…   1511237452          3            2 forums           forums         bingbot    2.0            search     
    #> 10 gpbb… <NA>        <NA>            NA 108.162.2… Mozill…   1511237664          3            2 <NA>             <NA>           bingbot    2.0            search     
    #> # … with 512 more rows, and 7 more variables: current_controller <chr>, location_url <chr>, location_lang <chr>, location_data <chr>, location_permissions <chr>,
    #> #   current_id <int>, data <list>
    #> 
    #> $core_share_links
    #> # A tibble: 10 x 5
    #>    share_id share_title     share_key     share_enabled share_position
    #>       <int> <chr>           <chr>         <lgl>                  <int>
    #>  1        1 Twitter         twitter       TRUE                       1
    #>  2        2 Facebook        facebook      TRUE                       2
    #>  3        3 Google Plus One googleplusone TRUE                       3
    #>  4        4 Digg            digg          TRUE                       4
    #>  5        5 Del.icio.us     delicious     TRUE                       5
    #>  6        6 Reddit          reddit        TRUE                       6
    #>  7        7 StumbleUpon     stumble       TRUE                       7
    #>  8        8 Email           email         TRUE                       8
    #>  9       12 Linkedin        linkedin      FALSE                      9
    #> 10       13 Pinterest       pinterest     TRUE                      12
    #> 
    #> $core_sitemap
    #> # A tibble: 22 x 4
    #>    data                                                                                                                     updated sitemap                        last_id
    #>    <chr>                                                                                                                      <int> <chr>                            <dbl>
    #>  1 "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<urlset xmlns=\"http://www.sitemaps.org/schemas/sitemap/0.9\">\n <url>\n…    1.51e9 sitemap_content_calendar_Ca… 0.       
    #>  2 "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<urlset xmlns=\"http://www.sitemaps.org/schemas/sitemap/0.9\">\n <url>\n…    1.51e9 sitemap_content_forums_Topi… 1.29e-320
    #>  3 "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<urlset xmlns=\"http://www.sitemaps.org/schemas/sitemap/0.9\">\n <url>\n…    1.51e9 sitemap_content_forums_Topi… 9.11e-321
    #>  4 "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<urlset xmlns=\"http://www.sitemaps.org/schemas/sitemap/0.9\">\n <url>\n…    1.51e9 sitemap_content_forums_Topi… 6.07e-321
    #>  5 "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<urlset xmlns=\"http://www.sitemaps.org/schemas/sitemap/0.9\">\n <url>\n…    1.51e9 sitemap_content_calendar_Ev… 1.44e-321
    #>  6 "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<urlset xmlns=\"http://www.sitemaps.org/schemas/sitemap/0.9\">\n <url>\n…    1.51e9 sitemap_content_forums_Topi… 3.16e-321
    #>  7 "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<urlset xmlns=\"http://www.sitemaps.org/schemas/sitemap/0.9\">\n <url>\n…    1.51e9 sitemap_content_forums_Forum 0.       
    #>  8 "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<urlset xmlns=\"http://www.sitemaps.org/schemas/sitemap/0.9\">\n <url>\n…    1.51e9 sitemap_content_core_Status… 1.49e-320
    #>  9 "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<urlset xmlns=\"http://www.sitemaps.org/schemas/sitemap/0.9\">\n <url>\n…    1.51e9 sitemap_content_forums_Topi… 1.66e-320
    #> 10  <NA>                                                                                                                     1.51e9 sitemap_profiles_1           0.       
    #> # … with 12 more rows
    #> 
    #> $core_social_promote_sharers
    #> # A tibble: 3 x 2
    #>   sharer_id sharer_key
    #>       <int> <chr>     
    #> 1         1 Facebook  
    #> 2         2 Twitter   
    #> 3         3 Internal  
    #> 
    #> $core_soft_delete_log
    #> # A tibble: 1,035 x 6
    #>    sdl_id sdl_obj_id sdl_obj_key   sdl_obj_member_id sdl_obj_date        sdl_obj_reason                                                    
    #>     <int>      <int> <chr>                     <int> <dttm>              <chr>                                                             
    #>  1     21       3202 topic                         1 2014-06-30 02:31:55 " Pending verification that Vlad has settled down, do not delete "
    #>  2     22        795 topic                         1 2014-06-30 02:32:22 " Pending verification that Vlad has settled down, do not delete "
    #>  3     25       3202 topic                         1 2014-09-07 19:20:25  <NA>                                                             
    #>  4     27       4652 topic                       132 2015-01-06 17:42:21  <NA>                                                             
    #>  5     33       5647 topic                         1 2015-11-17 17:11:20  <NA>                                                             
    #>  6    959       3023 status_status                 1 2017-02-18 04:56:01  <NA>                                                             
    #>  7    958       4991 topic                         1 2016-12-06 10:18:27  <NA>                                                             
    #>  8     36       6281 topic                         1 2016-04-07 22:48:09  <NA>                                                             
    #>  9     38       6483 topic                         1 2016-05-18 19:13:13  <NA>                                                             
    #> 10     39     153418 post                          1 2016-06-09 06:51:02  <NA>                                                             
    #> # … with 1,025 more rows
    #> 
    #> $core_statistics
    #> # A tibble: 21,508 x 4
    #>             id     value_1 value_4       time
    #>          <dbl>       <dbl> <chr>        <int>
    #>  1 Inf.Nae-324   2.85e-322 guests  1501782962
    #>  2 Inf.Nae-324 Inf.Nae-324 members 1501782962
    #>  3   1.50e-323   3.95e-322 guests  1501783809
    #>  4   2.00e-323 Inf.Nae-324 members 1501783809
    #>  5   2.50e-323   3.85e-322 guests  1501784650
    #>  6   3.00e-323 Inf.Nae-324 members 1501784650
    #>  7   3.50e-323   4.60e-322 guests  1501785500
    #>  8   4.00e-323 Inf.Nae-324 members 1501785500
    #>  9   4.50e-323   3.55e-322 guests  1501786369
    #> 10   5.00e-323 Inf.Nae-324 members 1501786369
    #> # … with 21,498 more rows
    #> 
    #> $core_streams
    #> # A tibble: 17 x 14
    #>             id classes       containers              read   follow position member date_type date_relative_d… followed_types ownership include_comments title      default
    #>          <dbl> <chr>         <chr>                   <chr>  <chr>     <int>  <int> <chr>                <int> <chr>          <chr>     <lgl>            <chr>      <lgl>  
    #>  1 Inf.Nae-324  <NA>          <NA>                   unread all           1     NA all                     NA <NA>           all       FALSE            <NA>       TRUE   
    #>  2 Inf.Nae-324  <NA>          <NA>                   all    all           2     NA all                     NA <NA>           started   FALSE            <NA>       FALSE  
    #>  3   1.50e-323  <NA>          <NA>                   all    follo…        3     NA all                     NA items          all       TRUE             <NA>       FALSE  
    #>  4   2.00e-323  <NA>          <NA>                   all    follo…        4     NA all                     NA members        all       TRUE             <NA>       FALSE  
    #>  5   2.50e-323  <NA>          <NA>                   all    all           5     NA all                     NA <NA>           postedin  FALSE            <NA>       FALSE  
    #>  6   3.00e-323 "IPS\\forums…  <NA>                   all    all           1   9620 all                      7 <NA>           all       TRUE             New Shit   FALSE  
    #>  7   3.50e-323 "IPS\\forums…  <NA>                   all    all           2   9620 all                      7 <NA>           all       FALSE            New shit 2 FALSE  
    #>  8   4.50e-323 "IPS\\forums… "{\"IPS\\\\forums\\\\T… unread all           2   9217 all                      7 <NA>           all       FALSE            the new s… FALSE  
    #>  9   5.00e-323 "IPS\\forums…  <NA>                   unread all           1   2170 relative                 7 <NA>           all       FALSE            New topics FALSE  
    #> 10   5.50e-323  <NA>          <NA>                   all    all           1   6113 all                      7 <NA>           all       FALSE            Unread Co… FALSE  
    #> 11   7.00e-323 "IPS\\forums…  <NA>                   unread all           1   9510 all                      7 <NA>           all       FALSE            Unread Co… FALSE  
    #> 12   6.50e-323 "IPS\\forums… "{\"IPS\\\\forums\\\\T… all    all           4   9217 all                      7 <NA>           all       TRUE             group stu… FALSE  
    #> 13   7.50e-323 "IPS\\forums…  <NA>                   unread all           2   9510 all                      7 <NA>           all       FALSE            Unread Co… FALSE  
    #> 14   8.00e-323 "IPS\\forums…  <NA>                   unread all           1   9694 all                      7 <NA>           all       FALSE            RACE WAR   FALSE  
    #> 15   8.50e-323  <NA>          <NA>                   unread all           1     53 all                      7 <NA>           all       FALSE            Unread Co… FALSE  
    #> 16   9.00e-323  <NA>          <NA>                   all    all           3   9510 relative               999 <NA>           started   FALSE            Content I… FALSE  
    #> 17   9.50e-323  <NA>          <NA>                   unread all           2   9694 relative                 3 <NA>           all       FALSE            Unread Co… FALSE  
    #> 
    #> $core_sys_conf_settings
    #> # A tibble: 371 x 6
    #>    conf_id conf_key         conf_value                                                                                                 conf_default conf_keywords conf_app
    #>      <int> <chr>            <chr>                                                                                                      <chr>        <chr>         <chr>   
    #>  1      15 gl_title         "Iron March Forum Charter and Mission Statement"                                                           <NA>         <NA>          <NA>    
    #>  2      16 gl_link           <NA>                                                                                                      <NA>         <NA>          <NA>    
    #>  3      20 site_offline_me… "\n<p style=\"text-align:center;\">\n\t<strong>Hunting hook-nosed gremlins in our tech, check back later.… <NA>         <NA>          <NA>    
    #>  4     533 file_log_pruning "90"                                                                                                       90           <NA>          core    
    #>  5     534 google_maps_api…  <NA>                                                                                                      <NA>         <NA>          core    
    #>  6      21 use_coppa        "0"                                                                                                        0            <NA>          <NA>    
    #>  7      22 coppa_fax         <NA>                                                                                                      <NA>         <NA>          <NA>    
    #>  8      23 coppa_address     <NA>                                                                                                      <NA>         <NA>          <NA>    
    #>  9      24 coppa_consent_e…  <NA>                                                                                                      <NA>         <NA>          <NA>    
    #> 10      25 ipb_copy_number   <NA>                                                                                                      <NA>         <NA>          <NA>    
    #> # … with 361 more rows
    #> 
    #> $core_sys_lang
    #> # A tibble: 2 x 5
    #>   lang_id lang_short  lang_title    lang_default lang_protected
    #>     <int> <chr>       <chr>         <lgl>        <lgl>         
    #> 1       1 en_US       English (USA) TRUE         TRUE          
    #> 2       4 ru_RU.UTF-8 Русский (RU)  FALSE        FALSE         
    #> 
    #> $core_sys_lang_words
    #> # A tibble: 26,118 x 11
    #>    word_id lang_id word_app word_key                               word_default      word_custom      word_default_vers… word_custom_versi… word_js word_export word_theme
    #>      <int>   <int> <chr>    <chr>                                  <chr>             <chr>            <chr>              <chr>              <lgl>   <lgl>            <int>
    #>  1   38289       4 core     core_emoticon_group_f700487c16e5f7863… Nazi Memeticons   <NA>             <NA>               <NA>               FALSE   FALSE               NA
    #>  2       2       1 core     core_group_1                           Validating        Validating       NULL               <NA>               FALSE   FALSE               NA
    #>  3       3       1 core     core_group_2                           Visitors          Visitors         NULL               <NA>               FALSE   FALSE               NA
    #>  4       4       1 core     core_group_3                           Newcomer          Newcomer         NULL               <NA>               FALSE   FALSE               NA
    #>  5       5       1 core     core_group_4                           The Adminship     The Adminship    NULL               <NA>               FALSE   FALSE               NA
    #>  6       6       1 core     core_group_5                           Gassed            Gassed           NULL               <NA>               FALSE   FALSE               NA
    #>  7       7       1 core     core_group_6                           Black Corps       Black Corps      NULL               <NA>               FALSE   FALSE               NA
    #>  8       8       1 core     core_group_7                           Prisoner          Prisoner         NULL               <NA>               FALSE   FALSE               NA
    #>  9       9       1 core     core_group_10                          Black Corps Capt… Black Corps Cap… NULL               <NA>               FALSE   FALSE               NA
    #> 10      10       1 core     core_group_13                          Members           Members          NULL               <NA>               FALSE   FALSE               NA
    #> # … with 26,108 more rows
    #> 
    #> $core_sys_login
    #> # A tibble: 4 x 2
    #>   sys_login_id sys_cookie                                                                                                                                                 
    #>          <int> <chr>                                                                                                                                                      
    #> 1            2 "a:1:{s:12:\"memberFilter\";a:0:{}}"                                                                                                                       
    #> 2            9 "a:1:{s:12:\"memberFilter\";a:19:{s:15:\"c_member_status\";s:3:\"all\";s:15:\"c_member_string\";s:0:\"\";s:17:\"c_member_contains\";s:20:\"members_display…
    #> 3            1 "a:1:{s:12:\"memberFilter\";a:0:{}}"                                                                                                                       
    #> 4            7 "a:1:{s:12:\"memberFilter\";a:0:{}}"                                                                                                                       
    #> 
    #> $core_sys_settings_titles
    #> # A tibble: 37 x 8
    #>    conf_title_id conf_title_title       conf_title_desc                                   conf_title_count conf_title_nosh… conf_title_keyw… conf_title_app conf_title_tab
    #>            <int> <chr>                  <chr>                                                        <int> <lgl>            <chr>            <chr>          <chr>         
    #>  1             1 Ad Code Integration    These settings will allow you to enter ad codes …               13 FALSE            adcodeintegrati… core           System        
    #>  2             2 Community Guidelines   This section allows you to maintain your communi…                7 FALSE            boardguidelines  core           System        
    #>  3             3 Community Offline / O… Use this setting to turn switch your community o…                2 FALSE            boardoffline     core           System        
    #>  4             4 COPPA Set-up           This section allows you to comply with <a href='…                4 FALSE            coppa            core           Members       
    #>  5             5 Copyright Removal      This section allows you to manage your copyright…                2 TRUE             ipbcopyright     core           IPS Apps      
    #>  6             6 CPU Saving &amp; Opti… This section allows certain features to be limit…               22 FALSE            cpusaving        core           Advanced      
    #>  7             7 Date, Time and Number… This section contains the date and time formats …               12 FALSE            date             core           Advanced      
    #>  8             8 Email Set-up           This section will allow you to change the incomi…               11 FALSE            email            core           System        
    #>  9             9 General Configuration  These settings control the basics of the board s…               16 FALSE            general          core           System        
    #> 10            10 IP.Board External Edi… <NA>                                                             1 TRUE             externaledit     core           <NA>          
    #> # … with 27 more rows
    #> 
    #> $core_tags
    #> # A tibble: 5,053 x 11
    #>         tag_id tag_aai_lookup       tag_aap_lookup       tag_meta_app tag_meta_area tag_meta_id tag_meta_parent… tag_member_id tag_added           tag_prefix tag_text    
    #>          <dbl> <chr>                <chr>                <chr>        <chr>               <int>            <int>         <int> <dttm>              <lgl>      <chr>       
    #>  1 Inf.Nae-324 811c8c75196b3ff83da… 956ad2d2939099a2185… forums       forums                111               75             2 2011-09-20 21:45:47 FALSE      father char…
    #>  2 Inf.Nae-324 811c8c75196b3ff83da… 956ad2d2939099a2185… forums       forums                111               75             2 2011-09-20 21:45:47 FALSE      father coug…
    #>  3   1.50e-323 811c8c75196b3ff83da… 956ad2d2939099a2185… forums       forums                111               75             2 2011-09-20 21:45:47 FALSE      charles cou…
    #>  4   2.00e-323 811c8c75196b3ff83da… 956ad2d2939099a2185… forums       forums                111               75             2 2011-09-20 21:45:47 FALSE      coughlin    
    #>  5   2.50e-323 811c8c75196b3ff83da… 956ad2d2939099a2185… forums       forums                111               75             2 2011-09-20 21:45:47 FALSE      united stat…
    #>  6   3.00e-323 811c8c75196b3ff83da… 956ad2d2939099a2185… forums       forums                111               75             2 2011-09-20 21:45:47 FALSE      United Stat…
    #>  7   3.50e-323 811c8c75196b3ff83da… 956ad2d2939099a2185… forums       forums                111               75             2 2011-09-20 21:45:47 FALSE      U.S.        
    #>  8   4.00e-323 811c8c75196b3ff83da… 956ad2d2939099a2185… forums       forums                111               75             2 2011-09-20 21:45:47 FALSE      America     
    #>  9   4.50e-323 811c8c75196b3ff83da… 956ad2d2939099a2185… forums       forums                111               75             2 2011-09-20 21:45:47 FALSE      USA         
    #> 10   5.00e-323 811c8c75196b3ff83da… 956ad2d2939099a2185… forums       forums                111               75             2 2011-09-20 21:45:47 FALSE      Canada      
    #> # … with 5,043 more rows
    #> 
    #> $core_tags_cache
    #> # A tibble: 6,919 x 3
    #>    tag_cache_key               tag_cache_text                                                                                                          tag_cache_date     
    #>    <chr>                       <chr>                                                                                                                   <dttm>             
    #>  1 811c8c75196b3ff83dad05695a… "{\"tags\":[\"father charles coughlin\",\"father coughlin\",\"charles coughlin\",\"coughlin\",\"united states of ameri… 2015-05-11 15:09:03
    #>  2 8bda5c23a73f4a53e664b0a644… "{\"tags\":[\"political compass\"],\"prefix\":\"\"}"                                                                    2015-05-11 15:09:03
    #>  3 c81c72e023eedaf1085a9f10bf… "{\"tags\":[\"actual idealism\",\"giovanni gentile\",\"true\",\"fascism\"],\"prefix\":\"\"}"                            2015-05-11 15:09:09
    #>  4 1b15ddd5286635d6004b2ab75a… "{\"tags\":[],\"prefix\":\"\"}"                                                                                         2015-05-11 15:09:16
    #>  5 49f0aabee7caac9fd601bd3333… "{\"tags\":[\"Monarchy\",\"Britain\"],\"prefix\":\"\"}"                                                                 2015-05-11 15:09:09
    #>  6 127c73f84b3ff08e0a80410d7b… "{\"tags\":[],\"prefix\":\"\"}"                                                                                         2015-05-11 15:09:03
    #>  7 ef9c553b27602531af9b1a2941… "{\"tags\":[\"Introduction\"],\"prefix\":\"\"}"                                                                         2015-05-11 15:09:13
    #>  8 43ac6adba8bf95da38476118dd… "{\"tags\":[\"Religion\"],\"prefix\":\"\"}"                                                                             2015-05-11 15:09:13
    #>  9 462c5b3fb75a8e34d3f9885d9b… "{\"tags\":[],\"prefix\":\"\"}"                                                                                         2015-05-11 15:09:52
    #> 10 a81354916f466c0b3f0cdff453… "{\"tags\":[\"Iron Will\",\"greetings\",\"hello\",\"introduction\",\"introductions\"],\"prefix\":\"\"}"                 2015-05-11 15:09:13
    #> # … with 6,909 more rows
    #> 
    #> $core_tags_perms
    #> # A tibble: 3,311 x 4
    #>    tag_perm_aai_lookup              tag_perm_aap_lookup              tag_perm_text tag_perm_visible
    #>    <chr>                            <chr>                            <chr>         <lgl>           
    #>  1 811c8c75196b3ff83dad05695a6bc80e d63cdc08d52e02e1b82fc40e8377eb77 4,2,3,6,8,1   TRUE            
    #>  2 8bda5c23a73f4a53e664b0a644fdf0c3 85aa9178b923fa1878ad86a0aaf847b8 4,2,3,6,1     TRUE            
    #>  3 c81c72e023eedaf1085a9f10bfa866ce 51deea4867472642fba67a586d8c8060 4,2,3,6,1     TRUE            
    #>  4 74188d2b121682dfe30279ebad107400 e8b9aa1927d352c4af04738164bf7f61 4,2,3,6,1     TRUE            
    #>  5 49f0aabee7caac9fd601bd3333c05b8c a8ec894f1cd7456aede97242cbe1b6a5 4,2,3,6,1     TRUE            
    #>  6 ef9c553b27602531af9b1a2941868f69 f723ce15197189561d1a05725f198b5d 4,5,2,3,6,7,1 TRUE            
    #>  7 43ac6adba8bf95da38476118dd2bcee3 f723ce15197189561d1a05725f198b5d 4,5,2,3,6,7,1 TRUE            
    #>  8 afd1964ed1a568511941a2599f296256 1d7b8a34d35bb07bc2f38523d958299d 4,2,3,6,1     TRUE            
    #>  9 a81354916f466c0b3f0cdff453ed0655 f723ce15197189561d1a05725f198b5d 4,5,2,3,6,7,1 TRUE            
    #> 10 a22a57b42eb6dd2fa966ce45dcc07de2 f723ce15197189561d1a05725f198b5d 4,5,2,3,6,7,1 TRUE            
    #> # … with 3,301 more rows
    #> 
    #> $core_tasks
    #> # A tibble: 26 x 7
    #>           id key              frequency        next_run enabled   app    last_run
    #>        <dbl> <chr>            <chr>               <dbl> <list>    <chr>     <dbl>
    #>  1 9.45e-322 profilesync      P0Y0M0DT1H0M0S  7.47e-315 <raw [1]> core  7.47e-315
    #>  2 9.50e-322 updatecheck      P0Y0M1DT0H0M0S  7.47e-315 <raw [1]> core  7.47e-315
    #>  3 9.55e-322 cleanup          P0Y0M1DT0H0M0S  7.47e-315 <raw [1]> core  7.47e-315
    #>  4 9.60e-322 sitemapgenerator P0Y0M0DT0H15M0S 7.47e-315 <raw [1]> core  7.47e-315
    #>  5 9.65e-322 connect          P0Y0M0DT1H0M0S  7.43e-315 <raw [1]> core  7.43e-315
    #>  6 9.70e-322 queue            P0Y0M0DT0H1M0S  7.46e-315 <raw [1]> core  7.46e-315
    #>  7 9.75e-322 pop              P0Y0M0DT0H10M0S 7.43e-315 <raw [1]> core  7.43e-315
    #>  8 9.80e-322 digest           P0Y0M0DT0H10M0S 7.47e-315 <raw [1]> core  7.47e-315
    #>  9 9.85e-322 publish          P0Y0M0DT0H10M0S 7.47e-315 <raw [1]> core  7.47e-315
    #> 10 9.90e-322 clearcache       P0Y0M0DT0H10M0S 7.47e-315 <raw [1]> core  7.47e-315
    #> # … with 16 more rows
    #> 
    #> $core_tasks_log
    #> # A tibble: 3,085 x 2
    #>    log                                  time
    #>    <chr>                               <int>
    #>  1 "[\"sitemap_ping_already24\"]" 1509570324
    #>  2 "[\"sitemap_ping_already24\"]" 1509569480
    #>  3 "[\"sitemap_ping_already24\"]" 1509568634
    #>  4 "[\"sitemap_ping_already24\"]" 1509567793
    #>  5 "[\"sitemap_ping_already24\"]" 1509566949
    #>  6 "[\"sitemap_ping_already24\"]" 1509566103
    #>  7 "[\"sitemap_ping_already24\"]" 1509719105
    #>  8 "[\"sitemap_ping_already24\"]" 1509718250
    #>  9 "[\"sitemap_ping_already24\"]" 1509717407
    #> 10 "[\"sitemap_ping_already24\"]" 1509716564
    #> # … with 3,075 more rows
    #> 
    #> $core_theme_content_history
    #> # A tibble: 98 x 10
    #>    content_id content_type content_app content_location content_path content_name   content_data               content_content               content_long_ve… content_date
    #>         <int> <chr>        <chr>       <chr>            <chr>        <chr>          <chr>                      <chr>                                    <int>        <int>
    #>  1          1 template     core        admin            forms        message        $lang, $id=NULL, $css='',… "<li{{if $id !== NULL}} id=\…            10000   1460070025
    #>  2          2 template     core        admin            support      whitespace     $files, $id                "<div class=\"ipsPad\">\n\t{…            10000   1460070025
    #>  3          3 template     core        front            forms        message        $lang, $id=NULL, $css='',… "<li{{if $id !== NULL}} id=\…            10000   1460070025
    #>  4          4 template     core        front            forms        template       $id, $action, $tabs, $act… "<div class='ipsBox ipsPad'>…            10000   1460070025
    #>  5          5 template     core        front            global       breadcrumb     $useMicrodata=TRUE, $posi… "<nav class='ipsBreadcrumb i…            10000   1460070025
    #>  6          6 template     core        front            global       error          $title, $message, $code, … "<div class='ipsBox'>\n<sect…            10000   1460070025
    #>  7          7 template     core        front            global       footer         <NA>                       "<div class='ipsPos_left'>\n…           101017   1460071903
    #>  8          8 template     core        front            global       globalTemplate $title,$html,$location=ar… "<!DOCTYPE html>\n<html lang…            10000   1460070025
    #>  9          9 template     core        front            global       ipsfocus_back… <NA>                       "<div id='ipsf_pickerWrap'>\…            10000   1460070025
    #> 10         10 template     core        front            global       ipsfocus_coun… <NA>                       "<div class='ipsfocus_countd…            10000   1460070025
    #> # … with 88 more rows
    #> 
    #> $core_theme_css
    #> # A tibble: 146 x 12
    #>    css_id css_set_id css_updated css_location css_content                           css_added_to css_app  css_path css_name   css_version css_user_edited css_unique_key  
    #>     <int>      <int>       <int> <chr>        <chr>                                        <int> <chr>    <chr>    <chr>      <chr>                 <int> <chr>           
    #>  1    577          0  1504115595 global       "#ipsLayout_body {\n\tmargin: 0 auto…            0 core     framewo… layout.css 102012                    0 4992b583e2b9799…
    #>  2    578          0  1504115595 global       "/* Lightbox: the image viewer used …            0 core     framewo… lightbox.… 102012                    0 a8e84b0b9b74c6d…
    #>  3    673          0  1504115606 front        "\n\n/*.ipsApp .ipsPost_wrap {\n\tpa…            0 forums   .        posts.css  102012                    0 eee04d093b1899e…
    #>  4    674          0  1504115610 front        "/* BOTH */\n@media screen and (max-…            0 calendar .        calendar_… 102012                    0 768ebafbdbba823…
    #>  5    675          0  1504115610 front        ".cCalendar {\n\twidth: 100%;\n\ttab…            0 calendar .        calendar.… 102012                    0 2fcbd2df77f6ce7…
    #>  6    676          0  1504115610 front        ".ipsRichEmbed_phone .ipsRichEmbed .…            0 calendar .        embed.css  102012                    0 da5d27342c8b3b1…
    #>  7    677          0  1504115610 front        ".cCalendarDate {\n\twidth: 80px;\n\…            0 calendar .        profile.c… 102012                    0 652ff1fe80b7600…
    #>  8    667          0  1504115595 admin        "/*.cMenuManager {\n\tpadding-bottom…            0 core     system   menumanag… 102012                    0 6be2eaffcc9cce0…
    #>  9    663          0  1504115595 admin        "#acpPageHeader.cDashboardHeader {\n…            0 core     system   dashboard… 102012                    0 90deba28cb70043…
    #> 10    664          0  1504115595 admin        "table.diff {\n\twidth: 100%;\n}\n\n…            0 core     system   diff.css   102012                    0 e5a705f08d63c53…
    #> # … with 136 more rows
    #> 
    #> $core_theme_settings_fields
    #> # A tibble: 308 x 12
    #>    sc_id sc_set_id sc_key         sc_type sc_content                           sc_updated sc_default sc_tab_key  sc_show_in_vse sc_title             sc_order sc_condition
    #>    <int>     <int> <chr>          <chr>   <chr>                                     <int> <chr>      <chr>       <lgl>          <chr>                   <int> <chr>       
    #>  1     1         1 ajax_paginati… YesNo   "[{\"key\":\"\",\"value\":\"\"}]"    1458844927 1          custom      TRUE           themesetting_ajax_p…       10 <NA>        
    #>  2     2         1 alternate_but… Color   "[{\"key\":\"\",\"value\":\"\"}]"    1458844927 #3e4148    buttoncolo… FALSE          themesetting_altern…        3 <NA>        
    #>  3     3         1 alternate_but… Color   "[]"                                 1458844927 #ffffff    buttoncolo… FALSE          themesetting_altern…        4 <NA>        
    #>  4     4         1 area_backgrou… Color   "[]"                                 1458844927 #e6e8eb    frontendco… FALSE          themesetting_area_b…       11 <NA>        
    #>  5     5         1 area_backgrou… Color   "[]"                                 1458844927 #353c41    frontendco… FALSE          themesetting_area_b…       12 <NA>        
    #>  6     6         1 area_backgrou… Color   "[]"                                 1458844927 #f8f8f8    frontendco… FALSE          themesetting_area_b…       13 <NA>        
    #>  7     7         1 area_backgrou… Color   "[]"                                 1458844927 #ffffff    frontendco… FALSE          themesetting_area_b…       14 <NA>        
    #>  8     8         1 button_bar     Color   "[]"                                 1458844927 #ffffff    buttoncolo… FALSE          themesetting_button…       13 <NA>        
    #>  9     9         1 enable_fluid_… YesNo   "[{\"key\":\"\",\"value\":\"\"},{\"… 1458844927 0          custom      TRUE           themesetting_enable…        7 <NA>        
    #> 10    10         1 fluid_width_s… Number  "[]"                                 1458844927 95         custom      TRUE           themesetting_fluid_…        8 <NA>        
    #> # … with 298 more rows
    #> 
    #> $core_theme_settings_values
    #> # A tibble: 370 x 2
    #>    sv_id sv_value
    #>    <int> <chr>   
    #>  1     1 1       
    #>  2     2 #3e4148 
    #>  3     3 #ffffff 
    #>  4     4 #e6e8eb 
    #>  5     5 #353c41 
    #>  6     6 #f8f8f8 
    #>  7     7 #ffffff 
    #>  8     8 #ffffff 
    #>  9     9 0       
    #> 10    10 95      
    #> # … with 360 more rows
    #> 
    #> $core_theme_templates
    #> # A tibble: 814 x 14
    #>    template_id template_set_id template_group template_content template_name template_data template_updated template_remova… template_added_… template_user_e…
    #>          <int>           <int> <chr>          <chr>            <chr>         <chr>                    <int> <lgl>                       <int>            <int>
    #>  1        3646               7 global         "{{if !\\IPS\\C… reactionBlurb $content            1504548218 TRUE                            0           102012
    #>  2        3644               7 global         "{{if \\IPS\\IP… reputation    $content, $e…       1504547767 TRUE                            0           102012
    #>  3        3645               7 global         "{{$allowRep = … reputationMi… $content, $a…       1504547201 TRUE                            0           102012
    #>  4        3641               0 widgets        "<h3 class='ips… recentReviews $reviews, $o…       1504115610 FALSE                           0                0
    #>  5        3642               0 widgets        "<h3 class='ips… todaysBirthd… $members, $c…       1504115610 FALSE                           0                0
    #>  6        3643               0 widgets        "<h3 class='ips… upcomingEven… $events, $to…       1504115610 FALSE                           0                0
    #>  7        3640               0 view           "\n{{if $club =… view          $event, $com…       1504115610 FALSE                           0                0
    #>  8        3639               0 view           "<!-- Don't use… rsvpControls  $event, $att…       1504115610 FALSE                           0                0
    #>  9        3634               0 view           "{{$coverPhoto … eventStreamB… $event, $dat…       1504115610 FALSE                           0                0
    #> 10        3635               0 view           "<div data-cont… reminder      $event, $rem…       1504115610 FALSE                           0                0
    #> # … with 804 more rows, and 4 more variables: template_app <chr>, template_version <chr>, template_location <chr>, template_unique_key <chr>
    #> 
    #> $core_themes
    #> # A tibble: 3 x 18
    #>   set_id set_name set_key set_parent_array set_child_array set_permissions set_is_default set_author_name set_author_url set_emo_dir set_order set_template_se…
    #>    <int> <chr>    <chr>   <chr>            <chr>           <chr>           <lgl>          <chr>           <chr>          <chr>           <int> <chr>           
    #> 1      1 Default  default <NA>             <NA>            <NA>            FALSE          Invision Power… "http:\\/\\/w… 'default'           0 "{\"ajax_pagina…
    #> 2      5 <NA>     <NA>    []               []              <NA>            FALSE          <NA>             <NA>          default             3 "{\"ajax_pagina…
    #> 3      7 Carbon … <NA>    []               []              4               TRUE           <NA>             <NA>          default             5 "{\"ajax_pagina…
    #> # … with 6 more variables: set_logo_data <chr>, set_long_version <int>, set_css_map <chr>, set_resource_map <chr>, set_is_acp_default <lgl>, set_cache_key <chr>
    #> 
    #> $core_upgrade_history
    #> # A tibble: 83 x 6
    #>    upgrade_id upgrade_version_id upgrade_version_human upgrade_date        upgrade_mid upgrade_app
    #>         <int>              <int> <chr>                 <dttm>              <lgl>       <chr>      
    #>  1          1              32005 3.2.2                 NA                  FALSE       core       
    #>  2          2              32005 3.2.2                 NA                  FALSE       members    
    #>  3          3              32005 3.2.2                 NA                  FALSE       forums     
    #>  4          4              32006 3.2.3                 2013-07-20 14:15:55 FALSE       core       
    #>  5          5              33000 3.3.0 Alpha 1         2013-07-20 14:16:45 FALSE       core       
    #>  6          6              33006 3.3.0 Alpha 2         2013-07-20 14:16:47 FALSE       core       
    #>  7          7              33007 3.3.0 Beta 1          2013-07-20 14:16:50 FALSE       core       
    #>  8          8              33008 3.3.0 Beta 2          2013-07-20 14:16:53 FALSE       core       
    #>  9          9              33009 3.3.0 Beta 3          2013-07-20 14:16:57 FALSE       core       
    #> 10         10              33010 3.3.0 Beta 4          2013-07-20 14:17:02 FALSE       core       
    #> # … with 73 more rows
    #> 
    #> $core_validating
    #> # A tibble: 7 x 8
    #>   vid                              member_id entry_date          new_reg email_chg ip_address      prev_email                  email_sent
    #>   <chr>                                <int> <dttm>              <lgl>   <lgl>     <chr>           <chr>                            <int>
    #> 1 aa642e9d1532b1fa216bc7b9b54ea4a7     14926 2017-09-20 02:21:44 FALSE   TRUE      172.104.115.118 ggleenzzbb@protonmail.com   1505874104
    #> 2 1bc617ab51baab4c07c8024e12b26842     15217 2017-11-20 21:41:40 TRUE    FALSE     162.158.238.80  0                           1511214100
    #> 3 f0994a4f063fb3d9c1592366cb42bcc7     15218 2017-11-20 22:08:23 TRUE    FALSE     108.162.237.143 0                           1511215703
    #> 4 dc22d0b68db1b84a06add104072fa26e     13881 2017-11-19 05:57:23 FALSE   TRUE      108.162.221.29  fnzles@gmail.com            1511071043
    #> 5 7c6de8054a341e44ca874716d4dec734     13780 2017-11-19 06:39:02 FALSE   TRUE      162.158.74.178  patrick.west2815@gmail.com  1511204816
    #> 6 09e572cc5ff099002626cc7b6ba6bc5b      9861 2017-11-03 11:18:11 FALSE   TRUE      162.158.255.47  svartskjorta@protonmail.com 1510139461
    #> 7 cfb40c9e556c5e57bbac3fe92b7b6003     15012 2017-11-10 14:45:01 FALSE   TRUE      162.158.186.73  0                           1510325101
    #> 
    #> $core_view_updates
    #> # A tibble: 30 x 1
    #>           id
    #>        <dbl>
    #>  1 1.70e-322
    #>  2 7.10e-322
    #>  3 2.06e-321
    #>  4 2.06e-321
    #>  5 2.06e-321
    #>  6 2.53e-321
    #>  7 3.16e-321
    #>  8 3.68e-321
    #>  9 4.96e-321
    #> 10 5.37e-321
    #> # … with 20 more rows
    #> 
    #> $core_voters
    #> # A tibble: 1,729 x 8
    #>      vid ip_address       vote_date   tid member_id forum_id member_choices     poll
    #>    <int> <chr>                <int> <int>     <int>    <int> <chr>             <int>
    #>  1     1 77.249.103.246  1323790101   370        13       88 "{\"1\":[\"2\"]}"     1
    #>  2     2 86.21.53.46     1323790499   370         4       88 "{\"1\":[\"1\"]}"     1
    #>  3     3 108.13.155.97   1323791995   370        29       88 "{\"1\":[\"1\"]}"     1
    #>  4     4 86.7.229.239    1323800768   370         0       88 "{\"1\":[\"1\"]}"     1
    #>  5     5 31.220.211.18   1323801140   370         7       88 "{\"1\":[\"1\"]}"     1
    #>  6     6 152.33.21.65    1323805321   370        16       88 "{\"1\":[\"1\"]}"     1
    #>  7     7 192.101.250.250 1323822724   370        68       88 "{\"1\":[\"1\"]}"     1
    #>  8     8 71.185.163.249  1323843605   370        49       88 "{\"1\":[\"1\"]}"     1
    #>  9     9 131.181.251.22  1323871708   370        65       88 "{\"1\":[\"2\"]}"     1
    #> 10    27 201.236.119.199 1324958167   370        44       88 "{\"1\":[\"1\"]}"     1
    #> # … with 1,719 more rows
    #> 
    #> $core_widget_areas
    #> # A tibble: 7 x 6
    #>            id widgets                                                                                                                      app    module controller area  
    #>         <dbl> <chr>                                                                                                                        <chr>  <chr>  <chr>      <chr> 
    #> 1 Inf.Nae-324 "[]"                                                                                                                         core   system register   header
    #> 2 Inf.Nae-324 "[]"                                                                                                                         core   system register   footer
    #> 3   4.95e-322 "[{\"app\":\"core\",\"key\":\"whosOnline\",\"unique\":\"3aa134vwr\",\"configuration\":[]}]"                                  forums forums index      footer
    #> 4   5.05e-322 "[{\"app\":\"calendar\",\"key\":\"upcomingEvents\",\"unique\":\"xvp65ucul\",\"configuration\":{\"widget_calendar\":0,\"auto… forums forums index      sideb…
    #> 5   4.90e-322 "[{\"app\":\"core\",\"key\":\"announcements\",\"unique\":\"announcements\",\"configuration\":{\"toshow\":5,\"sort_by\":\"as… forums forums index      header
    #> 6   4.40e-322 "[{\"app\":\"core\",\"key\":\"activeUsers\",\"unique\":\"jacu4nt2w\",\"configuration\":[]}]"                                 forums forums topic      footer
    #> 7   4.45e-322 "[{\"app\":\"core\",\"key\":\"activeUsers\",\"unique\":\"y27o9vdig\",\"configuration\":[]}]"                                 forums forums forums     footer
    #> 
    #> $core_widgets
    #> # A tibble: 19 x 9
    #>             id key         app     class            caches                                                               restrict      default_area allow_reuse menu_style
    #>          <dbl> <chr>       <chr>   <chr>            <chr>                                                                <chr>         <chr>        <lgl>       <chr>     
    #>  1 Inf.Nae-324 activeUsers core    "\\IPS\\Widget"   <NA>                                                                "[]"          <NA>         FALSE       menu      
    #>  2 Inf.Nae-324 announceme… core    "\\IPS\\Widget\…  <NA>                                                                "[\"sidebar\… header       FALSE       menu      
    #>  3   1.50e-323 stats       core    "\\IPS\\Widget\… "{\"widget_stats_w60l1hu6e_0fe875246c01cbd5259d84869b6015a0\":15112… "[]"          <NA>         FALSE       menu      
    #>  4   2.00e-323 relatedCon… core    "\\IPS\\Widget"   <NA>                                                                "[]"          <NA>         FALSE       menu      
    #>  5   2.50e-323 recentStat… core    "\\IPS\\Widget\…  <NA>                                                                "[]"          <NA>         FALSE       menu      
    #>  6   3.00e-323 topContrib… core    "\\IPS\\Widget\…  <NA>                                                                "[]"          <NA>         FALSE       menu      
    #>  7   3.50e-323 whosOnline  core    "\\IPS\\Widget"   <NA>                                                                "[]"          <NA>         FALSE       menu      
    #>  8   4.00e-323 members     core    "\\IPS\\Widget\… "{\"widget_members_9cpqnvkfg_9d0a3036f314dff851b8d28aa855b461\":151… "[\"sidebar\… <NA>         TRUE        modal     
    #>  9   4.50e-323 forumStati… forums  "\\IPS\\Widget\… "{\"widget_forumStatistics_lm3oql1w5_0fe875246c01cbd5259d84869b6015… "[]"          <NA>         FALSE       menu      
    #> 10   5.00e-323 hotTopics   forums  "\\IPS\\Widget\…  <NA>                                                                "[]"          <NA>         FALSE       menu      
    #> 11   5.50e-323 topicFeed   forums  "\\IPS\\Widget\… "{\"widget_topicFeed_bbjn03rba_878ef67970fdccad41122bd40f0074cb\":1… "[]"          <NA>         TRUE        modal     
    #> 12   6.00e-323 postFeed    forums  "\\IPS\\Widget\…  <NA>                                                                "[]"          <NA>         TRUE        modal     
    #> 13   6.50e-323 poll        forums  "\\IPS\\Widget\…  <NA>                                                                "[\"sidebar\… <NA>         TRUE        modal     
    #> 14   7.00e-323 todaysBirt… calend… "\\IPS\\Widget\…  <NA>                                                                "[]"          <NA>         FALSE       menu      
    #> 15   7.50e-323 upcomingEv… calend… "\\IPS\\Widget\… "{\"widget_upcomingEvents_xvp65ucul_48007f5bf6346f40c1ba35cbe75dba7… "[]"          <NA>         FALSE       menu      
    #> 16   8.00e-323 recentRevi… calend… "\\IPS\\Widget\…  <NA>                                                                "[]"          <NA>         FALSE       menu      
    #> 17   8.50e-323 guestSignUp core    "\\IPS\\Widget\…  <NA>                                                                "[\"sidebar\… <NA>         FALSE       modal     
    #> 18   9.00e-323 promoted    core    "\\IPS\\Widget\…  <NA>                                                                "[\"sidebar\… <NA>         FALSE       menu      
    #> 19   9.50e-323 clubs       core    "\\IPS\\Widget"   <NA>                                                                "[\"sidebar\… <NA>         TRUE        modal

### `orig_*`

``` r
im_orig_dfs
```

    #> $orig_admin_login_logs
    #> # A tibble: 45 x 6
    #>    admin_id admin_ip_address admin_username   admin_time          admin_success admin_post_details                                                                        
    #>       <int> <chr>            <chr>            <dttm>              <lgl>         <chr>                                                                                     
    #>  1     5447 5.228.77.158     Alexander Slavr… 2016-03-01 06:09:38 TRUE          "a:2:{s:3:\"get\";a:4:{s:6:\"adsess\";s:0:\"\";s:3:\"app\";s:4:\"core\";s:6:\"module\";s:…
    #>  2     5446 5.228.77.158     Alexander Slavr… 2016-02-29 22:17:57 TRUE          "a:2:{s:3:\"get\";a:4:{s:6:\"adsess\";s:0:\"\";s:3:\"app\";s:4:\"core\";s:6:\"module\";s:…
    #>  3     5445 5.228.77.158     Alexander Slavr… 2016-02-29 21:33:12 TRUE          "a:2:{s:3:\"get\";a:4:{s:6:\"adsess\";s:0:\"\";s:3:\"app\";s:4:\"core\";s:6:\"module\";s:…
    #>  4     5444 5.228.77.158     Alexander Slavr… 2016-02-29 20:57:19 TRUE          "a:2:{s:3:\"get\";a:4:{s:6:\"adsess\";s:0:\"\";s:3:\"app\";s:4:\"core\";s:6:\"module\";s:…
    #>  5     5443 5.228.77.158     Alexander Slavr… 2016-02-27 22:36:39 TRUE          "a:2:{s:3:\"get\";a:4:{s:6:\"adsess\";s:0:\"\";s:3:\"app\";s:4:\"core\";s:6:\"module\";s:…
    #>  6     5420 5.228.77.158     Alexander Slavr… 2016-01-28 16:04:07 TRUE          "a:2:{s:3:\"get\";a:4:{s:6:\"adsess\";s:0:\"\";s:3:\"app\";s:4:\"core\";s:6:\"module\";s:…
    #>  7     5421 5.228.77.158     Alexander Slavr… 2016-01-29 06:22:19 TRUE          "a:2:{s:3:\"get\";a:4:{s:6:\"adsess\";s:0:\"\";s:3:\"app\";s:4:\"core\";s:6:\"module\";s:…
    #>  8     5422 5.228.77.158     Alexander Slavr… 2016-02-01 17:35:57 TRUE          "a:2:{s:3:\"get\";a:4:{s:6:\"adsess\";s:0:\"\";s:3:\"app\";s:4:\"core\";s:6:\"module\";s:…
    #>  9     5423 5.228.77.158     Alexander Slavr… 2016-02-01 20:23:29 TRUE          "a:2:{s:3:\"get\";a:4:{s:6:\"adsess\";s:0:\"\";s:3:\"app\";s:4:\"core\";s:6:\"module\";s:…
    #> 10     5424 5.228.77.158     Alexander Slavr… 2016-02-01 22:26:30 TRUE          "a:2:{s:3:\"get\";a:4:{s:6:\"adsess\";s:0:\"\";s:3:\"app\";s:4:\"core\";s:6:\"module\";s:…
    #> # … with 35 more rows
    #> 
    #> $orig_admin_logs
    #> # A tibble: 7,836 x 9
    #>             id member_id ctime               note                             ip_address      appcomponent module section do    
    #>          <dbl>     <int> <dttm>              <chr>                            <chr>           <chr>        <chr>  <chr>   <chr> 
    #>  1 Inf.Nae-324         1 2011-09-12 16:05:48 Category 'Iron March HQ'  edited 178.140.119.217 forums       forums forums  doedit
    #>  2 Inf.Nae-324         1 2011-09-12 16:07:59 Forum 'Adminship Center'  edited 178.140.119.217 forums       forums forums  doedit
    #>  3   1.50e-323         1 2011-09-12 16:08:15 Forum 'Adminship Center'  edited 178.140.119.217 forums       forums forums  doedit
    #>  4   2.00e-323         1 2011-09-12 16:11:38 Forum 'Adminship Bunker' created 178.140.119.217 forums       forums forums  donew 
    #>  5   2.50e-323         1 2011-09-12 16:15:13 Edited Group 'The Adminship'     178.140.119.217 members      groups groups  doedit
    #>  6   3.00e-323         1 2011-09-12 16:15:53 Edited Group 'Exiled'            178.140.119.217 members      groups groups  doedit
    #>  7   3.50e-323         1 2011-09-12 16:16:06 Edited Group 'Visitors'          178.140.119.217 members      groups groups  doedit
    #>  8   4.00e-323         1 2011-09-12 16:16:28 Edited Group 'Black Corps'       178.140.119.217 members      groups groups  doedit
    #>  9   4.50e-323         1 2011-09-12 16:20:31 Added Group 'Prisoner'           178.140.119.217 members      groups groups  doadd 
    #> 10   5.00e-323         1 2011-09-12 17:54:03 Forum 'Announcements' created    178.140.119.217 forums       forums forums  donew 
    #> # … with 7,826 more rows
    #> 
    #> $orig_attachments
    #> # A tibble: 101 x 15
    #>    attach_id attach_ext attach_file attach_location attach_thumb_lo… attach_is_image attach_hits attach_date         attach_post_key attach_member_id attach_filesize
    #>        <int> <chr>      <chr>       <chr>           <chr>            <lgl>                 <int> <dttm>              <chr>                      <int>           <int>
    #>  1       338 jpg        461022_456… monthly_03_201… monthly_03_2013… TRUE                      8 2013-03-11 12:14:54 1fe5b562f954e5…                0          197766
    #>  2         2 jpg        1056.jpg    monthly_09_201… monthly_09_2011… TRUE                      5 2011-09-15 22:10:17 4714fbd5cc6bd2…                7           82028
    #>  3         3 jpg        1057.jpg    monthly_09_201… monthly_09_2011… TRUE                      6 2011-09-15 22:10:20 4714fbd5cc6bd2…                7           81507
    #>  4         4 jpg        1091.jpg    monthly_09_201… monthly_09_2011… TRUE                      5 2011-09-15 22:10:23 4714fbd5cc6bd2…                7           81670
    #>  5         5 jpg        1108.jpg    monthly_09_201… monthly_09_2011… TRUE                      4 2011-09-15 22:10:25 4714fbd5cc6bd2…                7           76741
    #>  6         6 jpg        FASCIST UN… monthly_09_201… monthly_09_2011… TRUE                      9 2011-09-15 22:10:27 4714fbd5cc6bd2…                7           79003
    #>  7         7 jpg        post-2711-… monthly_09_201… monthly_09_2011… TRUE                      7 2011-09-15 22:11:41 4714fbd5cc6bd2…                7          101963
    #>  8         8 jpg        post-2842-… monthly_09_201… monthly_09_2011… TRUE                      5 2011-09-15 22:11:43 4714fbd5cc6bd2…                7           59702
    #>  9         9 jpg        1029.jpg    monthly_09_201… monthly_09_2011… TRUE                      9 2011-09-15 22:16:40 99d96711b02775…                7           65169
    #> 10        10 jpg        1030.jpg    monthly_09_201… monthly_09_2011… TRUE                     12 2011-09-15 22:16:45 99d96711b02775…                7           71945
    #> # … with 91 more rows, and 4 more variables: attach_rel_id <int>, attach_img_width <int>, attach_img_height <int>, attach_parent_id <int>
    #> 
    #> $orig_attachments_type
    #> # A tibble: 31 x 5
    #>    atype_id atype_extension atype_mimetype           atype_post atype_img                           
    #>       <int> <chr>           <chr>                    <lgl>      <chr>                               
    #>  1        1 aiff            audio/x-aiff             TRUE       style_extra/mime_types/quicktime.gif
    #>  2        2 bmp             image/x-MS-bmp           TRUE       style_extra/mime_types/gif.gif      
    #>  3        3 css             unknown/unknown          TRUE       style_extra/mime_types/script.gif   
    #>  4        4 doc             application/msword       TRUE       style_extra/mime_types/doc.gif      
    #>  5        5 gif             image/gif                TRUE       style_extra/mime_types/gif.gif      
    #>  6        6 gz              application/x-gzip       TRUE       style_extra/mime_types/zip.gif      
    #>  7        7 hqx             application/mac-binhex40 TRUE       style_extra/mime_types/stuffit.gif  
    #>  8        8 htm             unknown/unknown          TRUE       style_extra/mime_types/html.gif     
    #>  9        9 html            unknown/unknown          TRUE       style_extra/mime_types/html.gif     
    #> 10       10 ico             image/ico                TRUE       style_extra/mime_types/gif.gif      
    #> # … with 21 more rows
    #> 
    #> $orig_banfilters
    #> # A tibble: 52 x 5
    #>    ban_id ban_type ban_content                 ban_date            ban_reason              
    #>     <int> <chr>    <chr>                       <dttm>              <chr>                   
    #>  1      1 ip       62.97.238.198               2011-09-18 13:48:53 Tribbles                
    #>  2      2 ip       80.202.110.65               2011-09-18 13:49:39 Also Tribbles           
    #>  3      3 email    jacksonhaddress@hotmail.com 2011-10-06 16:15:37 <NA>                    
    #>  4      4 ip       65.19.38.199                2011-10-06 16:15:37 <NA>                    
    #>  5      5 ip       75.173.64.190               2011-10-06 16:15:37 <NA>                    
    #>  6      6 email    a6428490@nepwk.com          2011-10-07 15:03:48 <NA>                    
    #>  7      7 name     JackW2                      2011-10-07 15:03:48 <NA>                    
    #>  8      8 ip       173.236.27.154              2011-10-07 15:03:48 <NA>                    
    #>  9      9 ip       80.82.69.119                2011-10-07 15:03:48 <NA>                    
    #> 10     10 ip       115.249.239.138             2011-12-19 10:52:08 Spammer - commercial ads
    #> # … with 42 more rows
    #> 
    #> $orig_bbcode_mediatag
    #> # A tibble: 9 x 4
    #>   mediatag_id mediatag_name   mediatag_match                                mediatag_replace                                                                              
    #>         <int> <chr>           <chr>                                         <chr>                                                                                         
    #> 1           1 YouTube         "http(?:s)?://(www.)?youtube.com/watch\\?(\\… "<iframe id=\"ytplayer\" class=\"EmbeddedVideo\" type=\"text/html\" width=\"640\" height=\"39…
    #> 2           9 GameTrailers    "http://www.gametrailers.com/{1}/{2}/{3}"     "<embed src=\"http://media.mtvnservices.com/mgid:moses:$1:gametrailers.com:$3\" width=\"512\"…
    #> 3           2 Flash Movie/Ga… "{1}.swf"                                     "<embed src=\"$1.swf\" play=\"true\" loop=\"true\" quality=\"best\" type=\"application/x-shoc…
    #> 4           3 Google Video    "http://video.google.com/videoplay?docid={1}" "<embed style=\"width:400px; height:326px;\" id=\"VideoPlayback\" type=\"application/x-shockw…
    #> 5           4 MySpace Video   "http://www.myspace.com/video/{1}/(\\d+)$"    "<object width=\"425px\" height=\"360px\" >\n<param name=\"allowScriptAccess\" value=\"always…
    #> 6          10 YouTu.be        "http://(www.)?youtu.be/([\\d\\w-_]+?)"       "<iframe id=\"ytplayer\" class=\"EmbeddedVideo\" type=\"text/html\" width=\"640\" height=\"39…
    #> 7           6 Flickr Image S… "http://www.flickr.com/photos/{1}/sets/{2}/"  "<iframe align=\"center\" src=\"http://www.flickr.com/slideShow/index.gne?user_id=$1&set_id=$…
    #> 8           7 MP3             "{1}.mp3"                                     "<object type=\"application/x-shockwave-flash\" data=\"{board_url}/public/mp3player.swf\" wid…
    #> 9           8 Vimeo           "http{1}://vimeo.com/{2}"                     "<iframe src=\"http$1://player.vimeo.com/video/$2\" class=\"EmbeddedVideo\" width=\"400\" hei…
    #> 
    #> $orig_cache_store
    #> # A tibble: 49 x 4
    #>    cs_key      cs_value                                                                                                                                cs_array cs_updated
    #>    <chr>       <chr>                                                                                                                                   <lgl>         <int>
    #>  1 bbcode      "a:34:{s:7:\"acronym\";a:21:{s:9:\"bbcode_id\";s:1:\"8\";s:12:\"bbcode_title\";s:7:\"Acronym\";s:11:\"bbcode_desc\";s:78:\"Allows you … TRUE     1414352133
    #>  2 moderators  "a:0:{}"                                                                                                                                TRUE     1458514682
    #>  3 multimod    "a:0:{}"                                                                                                                                TRUE     1414352127
    #>  4 banfilters  "a:35:{i:0;s:13:\"62.97.238.198\";i:1;s:13:\"80.202.110.65\";i:2;s:12:\"65.19.38.199\";i:3;s:13:\"75.173.64.190\";i:4;s:14:\"173.236.2… TRUE     1456812672
    #>  5 attachtypes "a:30:{s:4:\"aiff\";a:4:{s:15:\"atype_extension\";s:4:\"aiff\";s:14:\"atype_mimetype\";s:12:\"audio/x-aiff\";s:10:\"atype_post\";s:1:\… TRUE     1414352127
    #>  6 emoticons   "a:98:{i:0;a:4:{s:5:\"typed\";s:2:\":)\";s:5:\"image\";s:9:\"smile.png\";s:9:\"clickable\";s:1:\"0\";s:7:\"emo_set\";s:18:\"GeneralIMe… TRUE     1455876496
    #>  7 badwords    "a:0:{}"                                                                                                                                TRUE     1414352133
    #>  8 systemvars  "a:5:{s:10:\"mail_queue\";i:0;s:13:\"task_next_run\";s:10:\"1458844080\";s:15:\"itemMarkerClean\";i:1374328666;s:9:\"loadlimit\";s:15:… TRUE     1458844081
    #>  9 adminnotes  "You can use this section to keep notes for all members who access the Admin CP. It is globally editable by all admins who have access… FALSE    1315842847
    #> 10 ranks       "a:0:{}"                                                                                                                                TRUE     1414352133
    #> # … with 39 more rows
    #> 
    #> $orig_cal_event_ratings
    #> # A tibble: 7 x 5
    #>   rating_id rating_eid rating_member_id rating_value rating_ip_address
    #>       <int>      <int>            <int>        <int> <chr>            
    #> 1         1         14             7508            5 80.212.44.94     
    #> 2         2         27             9288            5 87.116.152.228   
    #> 3         3          4                3            5 68.10.238.177    
    #> 4         4         35             9240            5 193.153.191.93   
    #> 5         5         79             1558            1 83.233.71.27     
    #> 6         6         80             9510            5 86.15.81.183     
    #> 7         7         82             1558            1 83.233.71.27     
    #> 
    #> $orig_cal_events
    #> # A tibble: 108 x 17
    #>    event_id event_member_id event_content event_title event_smilies event_perms event_saved         event_lastupdated   event_recurring event_start_date   
    #>       <int>           <int> <chr>         <chr>       <lgl>         <chr>       <dttm>              <dttm>                        <int> <dttm>             
    #>  1        1               1 "[url=\"http… Joseph Goe… FALSE         6,10,5,13,… 2015-05-12 14:42:08 2016-03-17 15:47:08               3 2015-04-30 17:00:00
    #>  2        2               1 "[url=\"http… NiccolÃ² M… FALSE         *           2015-05-12 14:44:50 2015-05-12 21:23:01               3 2015-05-02 17:00:00
    #>  3        3               1 "[url=\"http… Oswald Spe… FALSE         *           2015-05-12 14:45:42 2015-05-12 21:23:42               3 2015-05-07 17:00:00
    #>  4        4               1 "[url=\"http… Oswald Spe… FALSE         *           2015-05-12 14:46:32 2015-05-12 21:24:32               3 2015-05-28 17:00:00
    #>  5        5               1 "[url=\"http… Julius Evo… FALSE         *           2015-05-12 14:47:51 2015-05-12 15:26:41               3 2015-06-10 17:00:00
    #>  6        6               1 "NiccolÃ² Ma… NiccolÃ² M… FALSE         *           2015-05-12 14:48:44 2015-05-12 15:16:18               3 2015-06-20 17:00:00
    #>  7        7               1 "[url=\"http… Summer Sol… FALSE         *           2015-05-12 14:56:31 2015-05-12 15:07:14               3 2015-06-19 17:00:00
    #>  8        8               1 "[url=\"http… Martin Bor… TRUE          *           2015-05-12 20:56:34 2015-05-12 21:22:15               3 2015-05-01 17:00:00
    #>  9        9               1 "[url=\"http… FidÃ©l PÃ¡… FALSE         *           2015-05-12 21:02:51 2015-05-12 21:02:51               3 2015-05-05 17:00:00
    #> 10       10               1 "[url=\"http… Baldur von… FALSE         *           2015-05-12 21:05:57 2015-05-12 21:05:57               3 2015-05-08 17:00:00
    #> # … with 98 more rows, and 7 more variables: event_end_date <dttm>, event_title_seo <chr>, event_rating_total <int>, event_rating_hits <lgl>, event_rating_avg <int>,
    #> #   event_post_key <chr>, event_sequence <lgl>
    #> 
    #> $orig_content_cache_posts
    #> # A tibble: 39,103 x 3
    #>    cache_content_id cache_content                                                                                                                      cache_updated      
    #>               <int> <chr>                                                                                                                              <dttm>             
    #>  1            25733 "<blockquote class='ipsBlockquote' data-author=\"FascistCapitalist\" data-cid=\"25729\" data-time=\"1340693471\"><p> <br />Your n… 2016-03-18 03:51:34
    #>  2            25732 "<blockquote class='ipsBlockquote' data-author=\"Alexander Slavros\" data-cid=\"25725\" data-time=\"1340692867\"><p> <br />Now yo… 2016-03-18 03:51:34
    #>  3            25730 "<blockquote class='ipsBlockquote' data-author=\"NatCap\" data-cid=\"25724\" data-time=\"1340692856\"><p>No, I learn from my mist… 2016-03-18 03:51:34
    #>  4           147440 "<div><iframe id=\"ytplayer\" class=\"EmbeddedVideo\" type=\"text/html\" width=\"640\" height=\"390\" src=\"http://youtube.com/em… 2016-03-20 17:34:03
    #>  5           147691 "<p><a href='http://www.breitbart.com/2016-presidential-race/2016/03/13/exclusive-jackie-mason-on-trump-israel-is-his-favorite-th… 2016-03-17 15:32:16
    #>  6           141523 "<p>Where can I find the adult swim pilot?</p>\n"                                                                                  2016-03-17 19:20:35
    #>  7           141525 "<blockquote  class=\"ipsBlockquote\" data-author=\"Panzertanz\" data-cid=\"141523\" data-time=\"1452989188\">\n<div>\n<p>Where c… 2016-03-17 19:20:35
    #>  8            96938 "<p>Remove the term class entirely. It's nothing but a degenerate version of what once was. Frankly no need for a term at all, th… 2016-03-17 03:59:43
    #>  9            96951 "Volksgemeinschaft - <a href='http://ironmarch.org/index.php?/topic/4242-volksgemeinschaft/?hl=volksgemeinschaft' class='bbc_url'… 2016-03-17 03:59:43
    #> 10            96956 "<blockquote  class=\"ipsBlockquote\" data-author=\"Haggis\" data-cid=\"96933\" data-time=\"1416423509\">\n<div>\n<p>Isn't that p… 2016-03-17 03:59:43
    #> # … with 39,093 more rows
    #> 
    #> $orig_content_cache_sigs
    #> # A tibble: 280 x 3
    #>    cache_content_id cache_content                                                                                                                      cache_updated      
    #>               <int> <chr>                                                                                                                              <dttm>             
    #>  1              805 "<p><span>â€œNeither let us be slandered from our duty by false accusations against us, nor frightened from it by menaces of dest… 2015-11-15 19:30:28
    #>  2              364 "<p>\"Either write something worth reading or do something worth writing.\"<br>\n\"Even peace may be purchased at too high a pric… 2015-11-15 19:30:28
    #>  3              287 "<p><em>Speak softly, and carry a big stick.</em></p>\n<p>&nbsp;</p>\n<p><em>I'd like to think that Europe has more to unite over… 2016-03-19 06:43:48
    #>  4               16 "<span rel='lightbox'><img class='bbc_img' src='http://i1111.photobucket.com/albums/h476/Blablabla1337/Untitled.jpg' alt='Posted … 2016-03-15 22:35:44
    #>  5                8 "&quot;We want less liberal verbiage and more respect for the deep liberty of man. Man&#39;s liberty is respected only when he is… 2015-11-23 17:14:25
    #>  6              161 "<p class='bbc_center'><em class='bbc'><strong class='bbc'>Now therefore fear the L<span style='font-size: 10px;'>ORD</span>, and… 2016-02-25 18:03:49
    #>  7             6120 "<p><span rel='lightbox'><img class='bbc_img' src=\"http://i.imgur.com/f9lhXQU.png\" alt=\"f9lhXQU.png\"></span><span rel='lightb… 2015-10-12 23:36:32
    #>  8              255 "<strong class='bbc'>\t&quot;Bereiten Sie sich auf den Tag der Wahrheit vor. Er ist nahe und nicht mehr aufzuhalten&quot; - Ursul… 2016-02-07 05:56:41
    #>  9              130 "<p><span style=\"font-size:10px;\">\"For I could wish that I myself were cursed and cut off from Christ for the sake of my peopl… 2016-02-25 18:03:49
    #> 10             7760 "<p><span style=\"font-size:10px;\"><span style=\"font-family:arial, helvetica, sans-serif;\">\"What you have inherited from your… 2016-03-19 06:43:48
    #> # … with 270 more rows
    #> 
    #> $orig_core_applications
    #> # A tibble: 4 x 14
    #>   app_id app_title app_public_title app_description app_author app_version app_long_version app_directory app_added           app_position app_protected app_location
    #>    <int> <chr>     <chr>            <chr>           <chr>      <chr>                  <int> <chr>         <dttm>                     <int> <lgl>         <chr>       
    #> 1      1 System    Help Files       Manage global … Invision … 3.4.7                  34013 core          2011-09-12 15:47:14            1 TRUE          root        
    #> 2      2 Members   Members          Manage members… Invision … 3.4.7                  34013 members       2011-09-12 15:47:17            2 TRUE          root        
    #> 3      3 Forums    Forums           Manage forums … Invision … 3.4.7                  34013 forums        2011-09-12 15:47:19            3 TRUE          root        
    #> 4      4 Fascist … Fascist Calendar <NA>            <NA>       <NA>                   33004 calendar      2015-05-12 14:21:25            4 FALSE         ips         
    #> # … with 2 more variables: app_website <chr>, app_update_check <chr>
    #> 
    #> $orig_core_hooks
    #> # A tibble: 8 x 15
    #>   hook_id hook_enabled hook_name hook_desc hook_author hook_email hook_website hook_requiremen… hook_version_hu… hook_version_lo… hook_installed      hook_updated       
    #>     <int> <lgl>        <chr>     <chr>     <chr>       <chr>      <chr>        <chr>            <chr>            <chr>            <dttm>              <dttm>             
    #> 1       1 TRUE         Ad Code … Displays… Invision P… <NA>       http://www.… "a:4:{s:20:\"ho… 1.0.0            <NA>             2011-09-12 15:49:13 2014-10-26 19:35:14
    #> 2       2 FALSE        Status U… Displays… Invision P… <NA>       http://www.… "a:3:{s:21:\"re… 1.0.0            10000            2011-09-12 15:49:16 2014-10-26 19:35:20
    #> 3       3 TRUE         Recent T… Adds a l… Invision P… <NA>       www.invisio… "a:4:{s:20:\"ho… 1.0.0            1000             2011-09-12 15:49:19 2014-10-26 19:35:17
    #> 4       4 FALSE        Facebook… Displays… Invision P… <NA>       http://www.… "a:4:{s:20:\"ho… 1.0.0            10000            2011-09-12 15:49:19 2014-10-26 19:35:17
    #> 5       5 FALSE        Tags Sid… Adds a l… Invision P… <NA>       <NA>         "a:3:{s:21:\"re… 1.0.0            10000            2011-09-12 15:49:19 2014-10-26 19:35:17
    #> 6       9 FALSE        Calendar  Displays… Invision P… <NA>       http://www.… "a:3:{s:21:\"re… 1.0.0            <NA>             2015-05-12 14:21:42 2015-05-12 14:21:42
    #> 7      10 TRUE         Upcoming… Shows up… Invision P… support@i… http://invi… "a:3:{s:21:\"re… 1.0              10000            2015-05-12 14:21:42 2015-05-12 14:21:42
    #> 8      11 TRUE         Upcoming… Shows up… Invision P… support@i… http://invi… "a:3:{s:21:\"re… 1.0.0            10000            2015-05-12 14:21:42 2015-05-12 14:21:42
    #> # … with 3 more variables: hook_position <int>, hook_extra_data <chr>, hook_key <chr>
    #> 
    #> $orig_core_hooks_files
    #> # A tibble: 8 x 7
    #>   hook_file_id hook_hook_id hook_file_stored          hook_file_real    hook_classname    hook_data                              hooks_source                             
    #>          <int>        <int> <chr>                     <chr>             <chr>             <chr>                                  <chr>                                    
    #> 1           39            1 boardIndexSideBarAdCode_… boardIndexSideBa… boardIndexSideBa… "a:7:{s:12:\"dataLocation\";s:0:\"\";… "<?php\n\nclass boardIndexSideBarAdCode\…
    #> 2           43            2 boardIndexStatusUpdates_… boardIndexStatus… boardIndexStatus… "a:8:{s:12:\"dataLocation\";s:0:\"\";… "<?php\n\nclass boardIndexStatusUpdates\…
    #> 3           40            3 boardIndexRecentTopics_8… boardIndexRecent… boardIndexRecent… "a:6:{s:15:\"classToOverload\";N;s:9:… "<?php\n\nclass boardIndexRecentTopics\n…
    #> 4           41            4 boardIndexFacebookActivi… boardIndexFacebo… boardIndexFacebo… "a:7:{s:12:\"dataLocation\";s:0:\"\";… "<?php\n\nclass boardIndexFacebookActivi…
    #> 5           42            5 boardIndexTags_45dab7d39… boardIndexTags.p… boardIndexTags    "a:8:{s:12:\"dataLocation\";s:0:\"\";… "<?php\n\nclass boardIndexTags\n{\n\tpub…
    #> 6           44            9 boardIndexCalendar_d15ae… boardIndexCalend… boardIndexCalend… "a:8:{s:12:\"dataLocation\";s:0:\"\";… "<?php\n\nclass boardIndexCalendar\n{\n\…
    #> 7           45           10 calendarUpcomingEvents_2… calendarUpcoming… calendarUpcoming… "a:8:{s:12:\"dataLocation\";s:0:\"\";… "<?php\n/**\n * @file\t\tcalendarUpcomin…
    #> 8           46           11 calendarUpcomingBirthday… calendarUpcoming… calendarUpcoming… "a:8:{s:12:\"dataLocation\";s:0:\"\";… "<?php\n/**\n * @file\t\tcalendarUpcomin…
    #> 
    #> $orig_core_item_markers
    #> # A tibble: 4,622 x 9
    #>    item_key      item_member_id item_app item_last_update item_last_saved     item_unread_cou… item_read_array                             item_global_res… item_app_key_1
    #>    <chr>                  <int> <chr>               <int> <dttm>                         <int> <chr>                                                  <int>          <int>
    #>  1 f802c0ccb1f5…              1 forums         1458516124 2016-03-20 23:22:04                0 a:0:{}                                            1458516124             12
    #>  2 66931e5c90c8…              1 forums         1458550878 2016-03-21 09:01:18                0 a:0:{}                                            1458550878             30
    #>  3 1d45d85274a0…              1 forums         1458550876 2016-03-21 09:01:16                0 a:0:{}                                            1458550876             39
    #>  4 9b51b6f781ff…           9555 forums         1458397436 2016-03-19 14:23:56                1 a:9:{i:1375;i:1458397436;i:4350;i:14514563…       1448314772             83
    #>  5 427cd625e989…           7543 forums         1456516956 2016-02-26 20:02:36                5 a:6:{i:5915;i:1454280057;i:6024;i:14546726…       1454255762             45
    #>  6 66931e5c90c8…              4 forums         1458142789 2016-03-16 15:39:49                1 a:3:{i:6182;i:1457620742;i:3751;i:14581427…       1457430338             30
    #>  7 e1aac5f7e88b…              1 forums         1458550828 2016-03-21 09:00:28                0 a:0:{}                                            1458550828             96
    #>  8 068d4d230e17…           7424 forums         1458544359 2016-03-21 07:12:39                0 a:0:{}                                            1458544359             99
    #>  9 068d4d230e17…           1558 forums         1458547314 2016-03-21 08:01:54                1 a:1:{i:34;i:1458547314;}                          1457907380             99
    #> 10 f802c0ccb1f5…             25 forums         1458435302 2016-03-20 00:55:02                1 a:2:{i:4462;i:1458434014;i:5909;i:14584353…       1457909062             12
    #> # … with 4,612 more rows
    #> 
    #> $orig_core_item_markers_storage
    #> # A tibble: 16 x 3
    #>    item_member_id item_markers                                                                                                                         item_last_saved    
    #>             <int> <chr>                                                                                                                                <dttm>             
    #>  1              2 "a:2:{s:4:\"core\";a:1:{s:32:\"d86530f90ffffe3b6972886702421230\";a:12:{s:8:\"item_key\";s:32:\"d86530f90ffffe3b6972886702421230\";… 2013-07-20 12:30:09
    #>  2           6134 "a:1:{s:6:\"forums\";a:25:{s:32:\"e579e6f5c915ee71478eab863d645f88\";a:12:{s:8:\"item_key\";s:32:\"e579e6f5c915ee71478eab863d645f88… 2013-07-20 12:37:56
    #>  3              1 "a:2:{s:4:\"core\";a:1:{s:32:\"d86530f90ffffe3b6972886702421230\";a:12:{s:8:\"item_key\";s:32:\"d86530f90ffffe3b6972886702421230\";… 2013-07-20 13:42:10
    #>  4           6171 "a:1:{s:6:\"forums\";a:62:{s:32:\"2d63352170754e06fd37ff5cb6367a58\";a:12:{s:8:\"item_key\";s:32:\"2d63352170754e06fd37ff5cb6367a58… 2013-07-20 13:57:47
    #>  5             53 "a:1:{s:6:\"forums\";a:40:{s:32:\"66931e5c90c88e9b543f83942ddf64f3\";a:12:{s:8:\"item_key\";s:32:\"66931e5c90c88e9b543f83942ddf64f3… 2013-07-20 12:52:07
    #>  6            100 "a:1:{s:6:\"forums\";a:53:{s:32:\"19c7cdf2c28bc394331ecdc70909472b\";a:12:{s:8:\"item_key\";s:32:\"19c7cdf2c28bc394331ecdc70909472b… 2013-07-20 12:53:50
    #>  7            333 "a:1:{s:6:\"forums\";a:62:{s:32:\"063bc0b035563ace0e251e0003b7c428\";a:12:{s:8:\"item_key\";s:32:\"063bc0b035563ace0e251e0003b7c428… 2013-07-20 13:46:10
    #>  8            158 "a:1:{s:6:\"forums\";a:64:{s:32:\"e579e6f5c915ee71478eab863d645f88\";a:12:{s:8:\"item_key\";s:32:\"e579e6f5c915ee71478eab863d645f88… 2013-07-20 13:52:03
    #>  9           6173 "a:1:{s:6:\"forums\";a:2:{s:32:\"a0a92a50db2fd304aa0944a3a7b045cd\";a:12:{s:8:\"item_key\";s:32:\"a0a92a50db2fd304aa0944a3a7b045cd\… 2013-07-20 13:26:20
    #> 10           1558 "a:1:{s:6:\"forums\";a:52:{s:32:\"a27da7ded3a0abefa2b2ec9fc946d63e\";a:12:{s:8:\"item_key\";s:32:\"a27da7ded3a0abefa2b2ec9fc946d63e… 2013-07-20 13:29:02
    #> 11            326 "a:1:{s:6:\"forums\";a:64:{s:32:\"e179fb6036a5b492e0f862b4a44af695\";a:12:{s:8:\"item_key\";s:32:\"e179fb6036a5b492e0f862b4a44af695… 2013-07-20 13:56:21
    #> 12             67 "a:1:{s:6:\"forums\";a:64:{s:32:\"02334ce0f7bbb53da73adf5845dc6766\";a:12:{s:8:\"item_key\";s:32:\"02334ce0f7bbb53da73adf5845dc6766… 2013-07-20 13:59:35
    #> 13             16 "a:2:{s:4:\"core\";a:1:{s:32:\"d86530f90ffffe3b6972886702421230\";a:12:{s:8:\"item_key\";s:32:\"d86530f90ffffe3b6972886702421230\";… 2013-07-20 12:29:24
    #> 14           2306 "a:1:{s:6:\"forums\";a:68:{s:32:\"e579e6f5c915ee71478eab863d645f88\";a:12:{s:8:\"item_key\";s:32:\"e579e6f5c915ee71478eab863d645f88… 2013-07-20 13:05:14
    #> 15           6122 "a:1:{s:6:\"forums\";a:36:{s:32:\"a27da7ded3a0abefa2b2ec9fc946d63e\";a:12:{s:8:\"item_key\";s:32:\"a27da7ded3a0abefa2b2ec9fc946d63e… 2013-07-20 13:20:49
    #> 16            861 "a:1:{s:6:\"forums\";a:56:{s:32:\"14e846e5abdbefa852d83879c9d8a160\";a:12:{s:8:\"item_key\";s:32:\"14e846e5abdbefa852d83879c9d8a160… 2013-07-20 13:30:53
    #> 
    #> $orig_core_like
    #> # A tibble: 3,706 x 14
    #>    like_id like_lookup_id like_lookup_area like_app like_area like_rel_id like_member_id like_is_anon like_added like_notify_do like_notify_meta like_notify_freq
    #>    <chr>   <chr>          <chr>            <chr>    <chr>           <dbl>          <int> <lgl>             <int> <lgl>          <chr>            <chr>           
    #>  1 566ef5… 3caa34857a82b… 5bfcef749155abe… forums   topics      1.80e-322             12 FALSE        1316119424 TRUE           36               daily           
    #>  2 b1d0c5… 62cff97fc731b… 5bfcef749155abe… forums   topics      3.10e-322             12 FALSE        1316153077 TRUE           62               daily           
    #>  3 20be4f… 931c090caa276… 5bfcef749155abe… forums   topics      2.35e-322             12 FALSE        1316153350 TRUE           47               daily           
    #>  4 1434a9… 6f4697434da82… 5bfcef749155abe… forums   topics      2.20e-322             12 FALSE        1316195666 TRUE           44               daily           
    #>  5 d44c69… 3c56c2b66d924… 5bfcef749155abe… forums   topics      3.25e-322             12 FALSE        1316196662 TRUE           65               daily           
    #>  6 419626… 69ba2d75c9f6b… 5bfcef749155abe… forums   topics      3.70e-322             12 FALSE        1316196996 TRUE           74               daily           
    #>  7 ac34f2… f7bc87f248ac8… 5bfcef749155abe… forums   topics      3.75e-322             12 FALSE        1316198333 TRUE           75               daily           
    #>  8 4ae380… 7c140e71cf209… 5bfcef749155abe… forums   topics      3.65e-322             12 FALSE        1316205645 TRUE           73               daily           
    #>  9 61f9d6… ff09767e2af56… 146d17a150010d5… forums   topics      6.15e-321             67 FALSE        1343683685 TRUE           1243             immediate       
    #> 10 c67159… 5569f85f692c4… 5bfcef749155abe… forums   topics      2.25e-322             12 FALSE        1316251159 TRUE           45               daily           
    #> # … with 3,696 more rows, and 2 more variables: like_notify_sent <int>, like_visible <lgl>
    #> 
    #> $orig_core_like_cache
    #> # A tibble: 5,304 x 6
    #>    like_cache_id          like_cache_app like_cache_area like_cache_rel_… like_cache_data                                                                 like_cache_expi…
    #>    <chr>                  <chr>          <chr>                      <dbl> <chr>                                                                                      <int>
    #>  1 321571a7b843c596b0775… forums         forums                 1.50e-322 "a:3:{s:7:\"members\";N;s:5:\"count\";i:0;s:10:\"count_anon\";i:0;}"                  1458594091
    #>  2 5b1fb15ebe04052fcc548… forums         topics                 1.81e-320 "a:3:{s:7:\"members\";a:1:{i:353;a:2:{s:1:\"n\";s:50:\"É­à¸¢Ï‚à¹€Å¦Ñ”Ð³à¹€à¸„à…        1458249173
    #>  3 4ed3d61094bae217e654b… forums         topics                 1.81e-320 "a:3:{s:7:\"members\";N;s:5:\"count\";i:0;s:10:\"count_anon\";i:0;}"                  1458156426
    #>  4 b5067d6b91cae760783da… forums         topics                 7.95e-322 "a:3:{s:7:\"members\";a:5:{i:9;a:2:{s:1:\"n\";s:14:\"Woman in Black\";s:1:\"s\…       1458609004
    #>  5 81d82ffa5b6d32b3f05fd… forums         forums                 6.50e-323 "a:3:{s:7:\"members\";N;s:5:\"count\";i:0;s:10:\"count_anon\";i:0;}"                  1458587168
    #>  6 d9409ca5f0c5d76bbdde3… forums         topics                 2.54e-320 "a:3:{s:7:\"members\";N;s:5:\"count\";i:0;s:10:\"count_anon\";i:0;}"                  1458619120
    #>  7 296567d2dffdb49961f95… forums         topics                 2.70e-320 "a:3:{s:7:\"members\";N;s:5:\"count\";i:0;s:10:\"count_anon\";i:0;}"                  1458612718
    #>  8 6ee661dd69ab12a17c6a3… forums         topics                 2.67e-320 "a:3:{s:7:\"members\";N;s:5:\"count\";i:0;s:10:\"count_anon\";i:0;}"                  1458410826
    #>  9 98ca3d02b4a17485d3d5b… forums         topics                 2.60e-320 "a:3:{s:7:\"members\";N;s:5:\"count\";i:0;s:10:\"count_anon\";i:0;}"                  1458596141
    #> 10 a7aac8b0f1a9bd8a346f3… forums         topics                 1.50e-323 "a:3:{s:7:\"members\";N;s:5:\"count\";i:0;s:10:\"count_anon\";i:0;}"                  1458553079
    #> # … with 5,294 more rows
    #> 
    #> $orig_core_share_links
    #> # A tibble: 10 x 5
    #>    share_id share_title     share_key     share_position share_canonical
    #>       <int> <chr>           <chr>                  <int> <lgl>          
    #>  1        1 Twitter         twitter                    1 TRUE           
    #>  2        2 Facebook        facebook                   2 TRUE           
    #>  3        3 Google Plus One googleplusone              3 TRUE           
    #>  4        4 Digg            digg                       4 TRUE           
    #>  5        5 Del.icio.us     delicious                  6 TRUE           
    #>  6        6 Reddit          reddit                     7 TRUE           
    #>  7        7 StumbleUpon     stumble                    8 TRUE           
    #>  8        8 Email           email                      9 TRUE           
    #>  9       10 Print           print                     10 FALSE          
    #> 10       11 Download        download                  11 FALSE          
    #> 
    #> $orig_core_share_links_log
    #> # A tibble: 83,860 x 7
    #>    log_id log_date            log_member_id log_url                                                        log_title                          log_share_key log_ip_address
    #>     <int> <dttm>                      <int> <chr>                                                          <chr>                              <chr>         <chr>         
    #>  1      1 2011-10-07 06:30:51             0 http://ironmarch.org/index.php?/topic/169-women-in-a-patriarc… Women in a Patriarchy              stumble       63.249.110.243
    #>  2      2 2011-10-10 15:30:45             0 http://ironmarch.org/index.php?/topic/195-germany-re-investig… Germany re-investigating Nazi dea… stumble       209.249.53.40 
    #>  3      3 2011-10-10 16:03:20             0 http://ironmarch.org/index.php?/topic/195-germany-re-investig… Germany re-investigating Nazi dea… delicious     209.249.53.40 
    #>  4      4 2011-10-10 16:17:08             0 http://ironmarch.org/index.php?/topic/195-germany-re-investig… Germany re-investigating Nazi dea… email         209.249.53.40 
    #>  5      5 2011-10-10 18:19:39             0 http://ironmarch.org/index.php?/topic/195-germany-re-investig… Germany re-investigating Nazi dea… twitter       209.249.53.40 
    #>  6      6 2011-10-10 18:45:46             0 http://ironmarch.org/index.php?/topic/195-germany-re-investig… Germany re-investigating Nazi dea… print         209.249.53.40 
    #>  7      7 2011-10-10 20:23:55             0 http://ironmarch.org/index.php?/topic/195-germany-re-investig… Germany re-investigating Nazi dea… digg          209.249.53.40 
    #>  8      8 2011-10-10 22:19:18             0 http://ironmarch.org/index.php?/topic/195-germany-re-investig… Germany re-investigating Nazi dea… facebook      209.249.53.40 
    #>  9      9 2011-10-11 00:42:53             0 http://ironmarch.org/index.php?/topic/195-germany-re-investig… Germany re-investigating Nazi dea… reddit        209.249.53.40 
    #> 10     10 2011-10-11 01:27:17             0 http://ironmarch.org/index.php?/topic/195-germany-re-investig… Germany re-investigating Nazi dea… download      209.249.53.40 
    #> # … with 83,850 more rows
    #> 
    #> $orig_core_soft_delete_log
    #> # A tibble: 7 x 5
    #>   sdl_id sdl_obj_id sdl_obj_member_id sdl_obj_date        sdl_obj_reason                                                    
    #>    <int>      <int>             <int> <dttm>              <chr>                                                             
    #> 1     21       3202                 1 2014-06-30 02:31:55 " Pending verification that Vlad has settled down, do not delete "
    #> 2     22        795                 1 2014-06-30 02:32:22 " Pending verification that Vlad has settled down, do not delete "
    #> 3     25       3202                 1 2014-09-07 19:20:25  <NA>                                                             
    #> 4     27       4652               132 2015-01-06 17:42:21  <NA>                                                             
    #> 5     33       5647                 1 2015-11-17 17:11:20  <NA>                                                             
    #> 6     34       4991                 1 2015-11-17 17:11:57  <NA>                                                             
    #> 7     35       4991                 1 2015-11-17 19:08:55  <NA>                                                             
    #> 
    #> $orig_core_sys_conf_settings
    #> # A tibble: 357 x 14
    #>    conf_id conf_title conf_description conf_group conf_type conf_key conf_value conf_default conf_extra conf_evalphp conf_position conf_start_group conf_add_cache
    #>      <int> <chr>      <chr>                 <int> <chr>     <chr>    <chr>      <chr>        <chr>      <chr>                <int> <chr>            <lgl>         
    #>  1       1 Enable Ad… This setting wi…          1 yes_no    ad_code… <NA>       0            <NA>        <NA>                    1 Global Settings  TRUE          
    #>  2       2 Groups ex… Any groups that…          1 multi     ad_code… <NA>       <NA>         #show_gro… "if ( $save…             2 <NA>             TRUE          
    #>  3       3 Header Co… This code will …          1 textarea  ad_code… <NA>       <NA>         <NA>        <NA>                    3 <NA>             TRUE          
    #>  4       4 Footer Co… This code will …          1 textarea  ad_code… <NA>       <NA>         <NA>        <NA>                    4 <NA>             TRUE          
    #>  5       5 Override … Using this sett…          1 textarea  ad_code… <NA>       <NA>         <NA>        <NA>                    5 Board Index      TRUE          
    #>  6       6 Override … Using this sett…          1 textarea  ad_code… <NA>       <NA>         <NA>        <NA>                    6 <NA>             TRUE          
    #>  7       7 Sidebar C… This code will …          1 textarea  ad_code… <NA>       <NA>         <NA>        <NA>                    7 <NA>             TRUE          
    #>  8       8 Override … Using this sett…          1 textarea  ad_code… <NA>       <NA>         <NA>        <NA>                    8 Forum View       TRUE          
    #>  9       9 Override … Using this sett…          1 textarea  ad_code… <NA>       <NA>         <NA>        <NA>                    9 <NA>             TRUE          
    #> 10      10 Code to d… This ad code wi…          1 textarea  ad_code… <NA>       <NA>         <NA>        <NA>                   10 <NA>             TRUE          
    #> # … with 347 more rows, and 1 more variable: conf_keywords <chr>
    #> 
    #> $orig_core_sys_lang_words
    #> # A tibble: 10,603 x 7
    #>    word_id word_app word_pack  word_key            word_default        word_default_version word_js
    #>      <int> <chr>    <chr>      <chr>               <chr>               <chr>                <lgl>  
    #>  1       1 core     admin_ajax ls_groups           "Groups Form"       32005                FALSE  
    #>  2       2 core     admin_ajax ls_view_more_groups "View more groups"  32005                FALSE  
    #>  3       3 core     admin_ajax ls_grouptitles      "Groups"            32005                FALSE  
    #>  4       4 core     admin_ajax ls_view_more_mem    "View more members" 32005                FALSE  
    #>  5       5 core     admin_ajax ls_members          "Members"           32005                FALSE  
    #>  6       6 core     admin_ajax lsnoresults         "No results"        32005                FALSE  
    #>  7       7 core     admin_ajax livesearchmemid     "ID: "              32005                FALSE  
    #>  8       8 core     admin_ajax ls_help             "Help Files"        32005                FALSE  
    #>  9       9 core     admin_ajax ls_acppages         "ACP Pages"         32005                FALSE  
    #> 10      10 core     admin_ajax ls_settings         "Settings"          32005                FALSE  
    #> # … with 10,593 more rows
    #> 
    #> $orig_core_sys_login
    #> # A tibble: 4 x 2
    #>   sys_login_id sys_cookie                                                                                                                                                 
    #>          <int> <chr>                                                                                                                                                      
    #> 1            2 "a:1:{s:12:\"memberFilter\";a:0:{}}"                                                                                                                       
    #> 2            9 "a:1:{s:12:\"memberFilter\";a:19:{s:15:\"c_member_status\";s:3:\"all\";s:15:\"c_member_string\";s:0:\"\";s:17:\"c_member_contains\";s:20:\"members_display…
    #> 3            1 "a:1:{s:12:\"memberFilter\";a:0:{}}"                                                                                                                       
    #> 4            7 "a:1:{s:12:\"memberFilter\";a:0:{}}"                                                                                                                       
    #> 
    #> $orig_core_sys_module
    #> # A tibble: 41 x 9
    #>    sys_module_id sys_module_title sys_module_applica… sys_module_key sys_module_description          sys_module_vers… sys_module_prote… sys_module_posit… sys_module_admin
    #>            <int> <chr>            <chr>               <chr>          <chr>                           <chr>            <lgl>                         <int> <lgl>           
    #>  1             1 Global           core                global         Global functions such as loggi… 1.0.0            TRUE                              1 FALSE           
    #>  2             2 User CP          core                usercp         The user&#39;s control panel    1.0.0            TRUE                              2 FALSE           
    #>  3             3 Task Manager     core                task           Runs the tasks                  1.0.0            TRUE                              3 FALSE           
    #>  4             4 Attachments      core                attach         Attachments handling            1.0.0            TRUE                              4 FALSE           
    #>  5             5 Logs             core                logs           Various IP.Board Logs           1.0.0            TRUE                              1 TRUE            
    #>  6             6 Look &amp; Feel  core                templates      Manage your templates and CSS   1.0.0            TRUE                              1 TRUE            
    #>  7             7 My Control Panel core                mycp           View your tasks, calendars and… 1.0.0            TRUE                              1 TRUE            
    #>  8             8 Diagnostics      core                diagnostics    <NA>                            1.0.0            TRUE                              2 TRUE            
    #>  9             9 System Settings  core                settings       Manage your system settings     1.0.0            TRUE                              2 TRUE            
    #> 10            10 Post Content     core                posts          Manage BBCode, banned words an… 1.0.0            TRUE                              2 TRUE            
    #> # … with 31 more rows
    #> 
    #> $orig_core_sys_settings_titles
    #> # A tibble: 37 x 8
    #>    conf_title_id conf_title_title       conf_title_desc                                   conf_title_count conf_title_nosh… conf_title_keyw… conf_title_app conf_title_tab
    #>            <int> <chr>                  <chr>                                                        <int> <lgl>            <chr>            <chr>          <chr>         
    #>  1             1 Ad Code Integration    These settings will allow you to enter ad codes …               13 FALSE            adcodeintegrati… core           System        
    #>  2             2 Community Guidelines   This section allows you to maintain your communi…                7 FALSE            boardguidelines  core           System        
    #>  3             3 Community Offline / O… Use this setting to turn switch your community o…                2 FALSE            boardoffline     core           System        
    #>  4             4 COPPA Set-up           This section allows you to comply with <a href='…                4 FALSE            coppa            core           Members       
    #>  5             5 Copyright Removal      This section allows you to manage your copyright…                2 TRUE             ipbcopyright     core           IPS Apps      
    #>  6             6 CPU Saving &amp; Opti… This section allows certain features to be limit…               22 FALSE            cpusaving        core           Advanced      
    #>  7             7 Date, Time and Number… This section contains the date and time formats …               12 FALSE            date             core           Advanced      
    #>  8             8 Email Set-up           This section will allow you to change the incomi…               11 FALSE            email            core           System        
    #>  9             9 General Configuration  These settings control the basics of the board s…               16 FALSE            general          core           System        
    #> 10            10 IP.Board External Edi… <NA>                                                             1 TRUE             externaledit     core           <NA>          
    #> # … with 27 more rows
    #> 
    #> $orig_core_tags
    #> # A tibble: 3,129 x 8
    #>         tag_id tag_aai_lookup                   tag_aap_lookup                   tag_meta_id tag_meta_parent_id tag_member_id tag_added           tag_text                
    #>          <dbl> <chr>                            <chr>                                  <int>              <int>         <int> <dttm>              <chr>                   
    #>  1 Inf.Nae-324 2cd36a5d4c630ce3802cb8c7a09086c9 956ad2d2939099a2185452a31071f22e         111                 75             2 2011-09-20 21:45:47 father charles coughlin 
    #>  2 Inf.Nae-324 2cd36a5d4c630ce3802cb8c7a09086c9 956ad2d2939099a2185452a31071f22e         111                 75             2 2011-09-20 21:45:47 father coughlin         
    #>  3   1.50e-323 2cd36a5d4c630ce3802cb8c7a09086c9 956ad2d2939099a2185452a31071f22e         111                 75             2 2011-09-20 21:45:47 charles coughlin        
    #>  4   2.00e-323 2cd36a5d4c630ce3802cb8c7a09086c9 956ad2d2939099a2185452a31071f22e         111                 75             2 2011-09-20 21:45:47 coughlin                
    #>  5   2.50e-323 2cd36a5d4c630ce3802cb8c7a09086c9 956ad2d2939099a2185452a31071f22e         111                 75             2 2011-09-20 21:45:47 united states of america
    #>  6   3.00e-323 2cd36a5d4c630ce3802cb8c7a09086c9 956ad2d2939099a2185452a31071f22e         111                 75             2 2011-09-20 21:45:47 United States           
    #>  7   3.50e-323 2cd36a5d4c630ce3802cb8c7a09086c9 956ad2d2939099a2185452a31071f22e         111                 75             2 2011-09-20 21:45:47 U.S.                    
    #>  8   4.00e-323 2cd36a5d4c630ce3802cb8c7a09086c9 956ad2d2939099a2185452a31071f22e         111                 75             2 2011-09-20 21:45:47 America                 
    #>  9   4.50e-323 2cd36a5d4c630ce3802cb8c7a09086c9 956ad2d2939099a2185452a31071f22e         111                 75             2 2011-09-20 21:45:47 USA                     
    #> 10   5.00e-323 2cd36a5d4c630ce3802cb8c7a09086c9 956ad2d2939099a2185452a31071f22e         111                 75             2 2011-09-20 21:45:47 Canada                  
    #> # … with 3,119 more rows
    #> 
    #> $orig_core_tags_cache
    #> # A tibble: 4,499 x 3
    #>    tag_cache_key               tag_cache_text                                                                                                          tag_cache_date     
    #>    <chr>                       <chr>                                                                                                                   <dttm>             
    #>  1 2cd36a5d4c630ce3802cb8c7a0… "a:2:{s:4:\"tags\";a:10:{i:0;s:23:\"father charles coughlin\";i:1;s:15:\"father coughlin\";i:2;s:16:\"charles coughlin… 2015-05-11 15:09:03
    #>  2 4ce4adba46f760c9b88d213875… "a:2:{s:4:\"tags\";a:1:{i:0;s:17:\"political compass\";}s:6:\"prefix\";s:0:\"\";}"                                      2015-05-11 15:09:03
    #>  3 b3b80a1bea32e7e8a6cb28da73… "a:2:{s:4:\"tags\";a:4:{i:0;s:15:\"actual idealism\";i:1;s:16:\"giovanni gentile\";i:2;s:4:\"true\";i:3;s:7:\"fascism\… 2015-05-11 15:09:09
    #>  4 1b15ddd5286635d6004b2ab75a… "a:2:{s:4:\"tags\";a:0:{}s:6:\"prefix\";s:0:\"\";}"                                                                     2015-05-11 15:09:16
    #>  5 efee20aa641a2fa36717fdebf1… "a:2:{s:4:\"tags\";a:2:{i:0;s:8:\"Monarchy\";i:1;s:7:\"Britain\";}s:6:\"prefix\";s:0:\"\";}"                            2015-05-11 15:09:09
    #>  6 127c73f84b3ff08e0a80410d7b… "a:2:{s:4:\"tags\";a:0:{}s:6:\"prefix\";s:0:\"\";}"                                                                     2015-05-11 15:09:03
    #>  7 43ca3f67301b77f135a3c7f5bc… "a:2:{s:4:\"tags\";a:1:{i:0;s:12:\"Introduction\";}s:6:\"prefix\";s:0:\"\";}"                                           2015-05-11 15:09:13
    #>  8 d9eb242b0c991f1e1e7041149b… "a:2:{s:4:\"tags\";a:1:{i:0;s:8:\"Religion\";}s:6:\"prefix\";s:0:\"\";}"                                                2015-05-11 15:09:13
    #>  9 462c5b3fb75a8e34d3f9885d9b… "a:2:{s:4:\"tags\";a:0:{}s:6:\"prefix\";s:0:\"\";}"                                                                     2015-05-11 15:09:52
    #> 10 679dbd12c814a0ed5e4c74ba73… "a:2:{s:4:\"tags\";a:5:{i:0;s:9:\"Iron Will\";i:1;s:9:\"greetings\";i:2;s:5:\"hello\";i:3;s:12:\"introduction\";i:4;s:… 2015-05-11 15:09:13
    #> # … with 4,489 more rows
    #> 
    #> $orig_core_tags_perms
    #> # A tibble: 891 x 4
    #>    tag_perm_aai_lookup              tag_perm_aap_lookup              tag_perm_text tag_perm_visible
    #>    <chr>                            <chr>                            <chr>         <lgl>           
    #>  1 2cd36a5d4c630ce3802cb8c7a09086c9 d63cdc08d52e02e1b82fc40e8377eb77 4,2,3,6,8,1   TRUE            
    #>  2 4ce4adba46f760c9b88d21387527a79e 85aa9178b923fa1878ad86a0aaf847b8 4,2,3,6,1     TRUE            
    #>  3 b3b80a1bea32e7e8a6cb28da73ae7c3f 51deea4867472642fba67a586d8c8060 4,2,3,6,1     TRUE            
    #>  4 74188d2b121682dfe30279ebad107400 e8b9aa1927d352c4af04738164bf7f61 4,2,3,6,1     TRUE            
    #>  5 efee20aa641a2fa36717fdebf117f463 a8ec894f1cd7456aede97242cbe1b6a5 4,2,3,6,1     TRUE            
    #>  6 43ca3f67301b77f135a3c7f5bc1a3b78 f723ce15197189561d1a05725f198b5d 4,5,2,3,6,7,1 TRUE            
    #>  7 d9eb242b0c991f1e1e7041149b0d11b6 f723ce15197189561d1a05725f198b5d 4,5,2,3,6,7,1 TRUE            
    #>  8 8aee0d7062abe55f54920a64ad22d30b 1d7b8a34d35bb07bc2f38523d958299d 4,2,3,6,1     TRUE            
    #>  9 679dbd12c814a0ed5e4c74ba735ac610 f723ce15197189561d1a05725f198b5d 4,5,2,3,6,7,1 TRUE            
    #> 10 a9152cee70f17ba6f23da0ba4b111ed6 f723ce15197189561d1a05725f198b5d 4,5,2,3,6,7,1 TRUE            
    #> # … with 881 more rows
    #> 
    #> $orig_core_uagents
    #> # A tibble: 59 x 8
    #>    uagent_id uagent_key uagent_name uagent_regex                          uagent_regex_capture uagent_type uagent_position uagent_default_regex                 
    #>        <int> <chr>      <chr>       <chr>                                                <int> <chr>                 <int> <chr>                                
    #>  1       215 lotus      Lotus Notes "Lotus[ \\-]?Notes[ /]([0-9.]{1,10})"                    1 browser                1027 "Lotus[ \\-]?Notes[ /]([0-9.]{1,10})"
    #>  2       214 firefox    Firefox     "Firefox/([0-9.+]{1,10})"                                1 browser                1026 "Firefox/([0-9.+]{1,10})"            
    #>  3       213 firebird   Firebird    "Firebird/([0-9.+]{1,10})"                               1 browser                1025 "Firebird/([0-9.+]{1,10})"           
    #>  4       212 curl       Curl        "curl[ /]([0-9.]{1,10})"                                 1 browser                1024 "curl[ /]([0-9.]{1,10})"             
    #>  5        15 msnbot     MSN/Bing    "msnbot[ /]([0-9.]{1,10})"                               1 search                   14 "msnbot[ /]([0-9.]{1,10})"           
    #>  6       211 chrome     Chrome      "Chrome/([0-9.]{1,10})"                                  1 browser                1023 "Chrome/([0-9.]{1,10})"              
    #>  7       210 chimera    Chimera     "chimera/([0-9.+]{1,10})"                                1 browser                1022 "chimera/([0-9.+]{1,10})"            
    #>  8       209 camino     Camino      "camino/([0-9.+]{1,10})"                                 1 browser                1021 "camino/([0-9.+]{1,10})"             
    #>  9       208 aol        AOL         "aol[ /\\-]([0-9.]{1,10})"                               1 browser                1020 "aol[ /\\-]([0-9.]{1,10})"           
    #> 10       207 amaya      Amaya       "amaya/([0-9.]{1,10})"                                   1 browser                1019 "amaya/([0-9.]{1,10})"               
    #> # … with 49 more rows
    #> 
    #> $orig_custom_bbcode
    #> # A tibble: 34 x 16
    #>    bbcode_id bbcode_title bbcode_desc bbcode_tag bbcode_replace bbcode_useoption bbcode_example bbcode_menu_opt… bbcode_menu_con… bbcode_single_t… bbcode_php_plug…
    #>        <int> <chr>        <chr>       <chr>      <chr>          <lgl>            <chr>          <chr>            <chr>            <lgl>            <chr>           
    #>  1         1 Post Snap B… This tag d… snapback    <NA>          FALSE            [snapback]100… <NA>             <NA>             FALSE            defaults.php    
    #>  2         2 Right        Aligns con… right      "<p class='bb… FALSE            [right]Some t… <NA>             <NA>             FALSE            <NA>            
    #>  3         3 Left         Aligns con… left       "<p class='bb… FALSE            [left]Left al… <NA>             <NA>             FALSE            <NA>            
    #>  4         4 Center       Aligns con… center     "<p class='bb… FALSE            [center]Cente… <NA>             Enter content t… FALSE            <NA>            
    #>  5         5 Topic Link   This tag p… topic      "<a href='{ba… TRUE             [topic=1]Clic… Enter the topic… Enter the title… FALSE            <NA>            
    #>  6         6 Post Link    This tag p… post       "<a href='{ba… TRUE             [post=1]Click… Enter the Post … Enter the title… FALSE            <NA>            
    #>  7         7 Spoiler      Spoiler tag spoiler    "<div class='… FALSE            [spoiler]Some… <NA>             Enter the text … FALSE            <NA>            
    #>  8         8 Acronym      Allows you… acronym    "<acronym tit… TRUE             [acronym='Lau… Enter the descr… Enter the acron… FALSE            <NA>            
    #>  9         9 Bold Text    Makes text… b          "<strong clas… FALSE            [b]This text … <NA>             <NA>             FALSE            <NA>            
    #> 10        10 Italic Text  Makes the … i          "<em class='b… FALSE            [i]This text … <NA>             <NA>             FALSE            <NA>            
    #> # … with 24 more rows, and 5 more variables: bbcode_no_parsing <lgl>, bbcode_protected <lgl>, bbcode_aliases <chr>, bbcode_optional_option <lgl>, bbcode_image <chr>
    #> 
    #> $orig_dnames_change
    #> # A tibble: 500 x 7
    #>    dname_id dname_member_id dname_date dname_ip_address dname_previous             dname_current              dname_discount
    #>       <int>           <int>      <int> <chr>            <chr>                      <chr>                      <lgl>         
    #>  1        1              16 1315978438 152.33.17.196    Talleyrand                 The Normish                FALSE         
    #>  2        2              16 1315979034 152.33.17.196    The Normish                Talleyrand                 FALSE         
    #>  3        3               8 1316033859 98.198.24.90     Mr. Elegy                  Elegos                     FALSE         
    #>  4        4              17 1316047013 97.119.6.169     social_justice             American Federalist        FALSE         
    #>  5       55             164 1349431769 134.88.170.184   Yorick                     Y11                        FALSE         
    #>  6        6              11 1317754326 109.77.91.235    Four Suited Jack           F.S.J. Zero Twelve         FALSE         
    #>  7        8             114 1327013527 79.67.83.218     Stork                      Alabama Crimson Tide footb FALSE         
    #>  8        9             114 1327173999 79.67.83.218     Alabama Crimson Tide footb Flash &amp; Circle         FALSE         
    #>  9       10             160 1329977515 188.95.153.254   Cricket                    Richard the Cricket        FALSE         
    #> 10       11             140 1330461934 24.229.117.252   SchwarzFrontUSA            AutNatUSA                  FALSE         
    #> # … with 490 more rows
    #> 
    #> $orig_emoticons
    #> # A tibble: 98 x 6
    #>       id typed    image       clickable emo_set emo_position
    #>    <int> <chr>    <chr>       <lgl>     <chr>          <int>
    #>  1     1 :)       smile.png   FALSE     default            1
    #>  2     2 ;)       wink.png    FALSE     default            2
    #>  3     3 :P       tongue.png  FALSE     default            3
    #>  4     4 :D       biggrin.png FALSE     default            4
    #>  5     5 :lol:    laugh.png   FALSE     default            5
    #>  6     6 :(       sad.png     FALSE     default            6
    #>  7     7 :angry:  angry.png   FALSE     default            7
    #>  8     8 :mellow: mellow.png  FALSE     default            8
    #>  9     9 :huh:    huh.png     FALSE     default            9
    #> 10    10 ^_^      happy.png   FALSE     default           10
    #> # … with 88 more rows
    #> 
    #> $orig_error_logs
    #> # A tibble: 61 x 7
    #>    log_id log_member log_date            log_error                          log_error_code log_ip_address log_request_uri                                                 
    #>     <int>      <int> <dttm>              <chr>                              <chr>          <chr>          <chr>                                                           
    #>  1 103794          0 2016-03-01 00:26:16 "You are not allowed to visit thi… 1001           173.245.203.69 /index.php?app=core&module=global&section=login&do=logout&k=662…
    #>  2 103793          0 2016-03-01 00:26:10 "You are not allowed to visit thi… 1001           173.245.203.69 /index.php?app=core&module=help                                 
    #>  3 103792          0 2016-03-01 00:25:58 "You are not allowed to visit thi… 1001           173.245.203.69 /index.php?app=core&module=global&section=register&do=reval     
    #>  4 103791          0 2016-03-01 00:25:54 "You are not allowed to visit thi… 1001           173.245.203.69 /                                                               
    #>  5 103790          0 2016-03-01 00:24:12 "You are not allowed to visit thi… 1001           173.245.203.69 /index.php?app=core&module=global&section=login&do=logout&k=662…
    #>  6 103789          0 2016-03-01 00:24:08 "You are not allowed to visit thi… 1001           173.245.203.69 /index.php?app=core&module=global&section=login&do=logout&k=662…
    #>  7 103788          0 2016-03-01 00:23:38 "You are not allowed to visit thi… 1001           173.245.203.69 /index.php?/user/9919-kaliyuga/                                 
    #>  8 103787          0 2016-03-01 00:23:06 "You are not allowed to visit thi… 1001           173.245.203.69 /index.php?app=core&module=usercp                               
    #>  9 103786          0 2016-03-01 00:22:45 "You are not allowed to visit thi… 1001           173.245.203.69 /index.php?app=core&module=global&section=register&do=reval     
    #> 10 103785          0 2016-03-01 00:21:05 "You are not allowed to visit thi… 1001           173.245.203.69 /                                                               
    #> # … with 51 more rows
    #> 
    #> $orig_faq
    #> # A tibble: 10 x 6
    #>       id title       text                                                                  description                                                     position app   
    #>    <int> <chr>       <chr>                                                                 <chr>                                                              <int> <chr> 
    #>  1     1 Searching   "The search feature can be used to search all areas of the community… How to use the search feature.                                         8 core  
    #>  2     2 Your Setti… "<p>\n\tYou can access your settings from any page by selecting your… Editing contact information, personal information, signatures,…        3 core  
    #>  3     3 How to Reg… "To be able to enjoy all of the features available to the community,… How to register and the added benefits of being a registered m…        1 core  
    #>  4     4 Logging In… "&lt;strong&gt;Logging In&lt;/strong&gt;<br />\nOnce you have signed… How to log in and out from the board, how to remain anonymous …        2 core  
    #>  5     5 Contacting… "If you need to contact a moderator, or simply wish to view the comp… Where to find a list of the board moderators and administrator…       10 core  
    #>  6     6 Personal M… "The personal messenger can be used to have private conversations wi… How to send personal messages, track them, edit your messenger…        6 membe…
    #>  7     7 Members     "&lt;strong&gt;Member List&lt;/strong&gt;<br />\nThe member list con… A guide to the member list and member profiles, including prof…        7 membe…
    #>  8     8 Posting     "<!-- isHtml:1 --><!-- isHtml:1 --><p><strong>The Post Editor</stron… A guide to the features available when posting or sending mess…        5 forums
    #>  9     9 Topics and… "<p>\n\t<em><b>Viewing The Board Index</b></em></p>\n<p>\n\t&nbsp;</… A guide to forums, topics, posts and polls.                            4 forums
    #> 10    10 Calendar    "The calendar can be used to post events for other members of the co… More information on the boards calendar feature.                      11 calen…
    #> 
    #> $orig_forum_perms
    #> # A tibble: 8 x 2
    #>   perm_id perm_name           
    #>     <int> <chr>               
    #> 1       1 Validating Forum Set
    #> 2       3 Member Forum Set    
    #> 3       2 Guest Forum Set     
    #> 4       4 Admin Forum Set     
    #> 5       5 Banned Forum Set    
    #> 6       6 Moderator Forum Set 
    #> 7       7 Prisoner            
    #> 8      12 Newcomer            
    #> 
    #> $orig_forums
    #> # A tibble: 132 x 36
    #>       id topics posts last_post           last_poster_id last_poster_name name  description position use_ibc last_title last_id sort_key sort_order prune topicfilter
    #>    <int>  <int> <int> <dttm>                       <int> <chr>            <chr> <chr>          <int> <lgl>   <chr>        <int> <chr>    <chr>      <int> <chr>      
    #>  1     1      0     0 NA                               0  <NA>            Iron… <NA>               1 FALSE   <NA>             0 <NA>     <NA>           0 <NA>       
    #>  2    92     25   517 2016-02-07 18:26:19           9503 "HermannTheGerm… Acti… Discussion…        2 TRUE    Are you f…    4457 last_po… Z-A          100 all        
    #>  3     2     14   307 2016-02-19 08:35:50           2820 "ZHICA"          Admi… Forum Anno…        1 TRUE    IM Proud …    5869 last_po… Z-A          100 all        
    #>  4    10      0     0 NA                               0  <NA>            The … <NA>              10 TRUE    <NA>            NA <NA>     <NA>           0 <NA>       
    #>  5     5     33  1382 2016-03-18 12:26:14              1 "Ð\u0090Ð»ÐµÐºÑ… The … All things…        2 TRUE    New Heade…      62 last_po… Z-A          100 all        
    #>  6     7      0     0 NA                               0  <NA>            The … <NA>               7 FALSE   <NA>            NA <NA>     <NA>           0 <NA>       
    #>  7    97     51  1101 2016-03-13 17:16:33           9510 "TheDrifter"     Movi… Discussion…        3 TRUE    Game of T…    5220 last_po… Z-A          100 all        
    #>  8    90     19   561 2016-03-21 07:07:09           9521 "Unity"          Spor… Sports and…        9 TRUE    Your phys…    4329 last_po… Z-A          100 all        
    #>  9    12    105  3997 2016-03-20 22:56:42           9149 "Oskar Dirlewan… Gene… General di…        2 TRUE    Torture       6097 last_po… Z-A          100 all        
    #> 10    11    937 18143 2016-03-21 08:37:42           9950 "Schmiss"        Intr… Introduce …        1 TRUE    Yo            6199 last_po… Z-A          100 all        
    #> # … with 122 more rows, and 20 more variables: show_rules <lgl>, allow_poll <lgl>, allow_pollbump <lgl>, inc_postcount <lgl>, skin_id <lgl>, parent_id <int>,
    #> #   notify_modq_emails <chr>, sub_can_post <lgl>, permission_showtopic <lgl>, forum_allow_rating <lgl>, forum_last_deletion <int>, newest_title <chr>, newest_id <int>,
    #> #   can_view_others <lgl>, name_seo <chr>, seo_last_title <chr>, seo_last_name <chr>, last_x_topic_ids <chr>, deleted_topics <lgl>, viglink <lgl>
    #> 
    #> $orig_groups
    #> # A tibble: 9 x 47
    #>    g_id g_view_board g_mem_info g_other_topics g_use_search g_edit_profile g_post_new_topi… g_reply_own_top… g_reply_other_t… g_edit_posts g_delete_own_po…
    #>   <int> <lgl>        <lgl>      <lgl>          <lgl>        <lgl>          <lgl>            <lgl>            <lgl>            <lgl>        <lgl>           
    #> 1     1 TRUE         TRUE       TRUE           TRUE         FALSE          FALSE            FALSE            FALSE            FALSE        FALSE           
    #> 2     2 TRUE         TRUE       TRUE           TRUE         FALSE          TRUE             TRUE             TRUE             FALSE        FALSE           
    #> 3     3 TRUE         TRUE       TRUE           TRUE         TRUE           TRUE             TRUE             TRUE             TRUE         FALSE           
    #> 4     4 TRUE         TRUE       TRUE           TRUE         TRUE           TRUE             TRUE             TRUE             TRUE         TRUE            
    #> 5     5 FALSE        FALSE      FALSE          FALSE        FALSE          FALSE            FALSE            FALSE            FALSE        FALSE           
    #> 6     6 TRUE         TRUE       TRUE           TRUE         TRUE           TRUE             TRUE             TRUE             TRUE         FALSE           
    #> 7     7 TRUE         TRUE       TRUE           TRUE         TRUE           TRUE             TRUE             TRUE             TRUE         FALSE           
    #> 8    10 TRUE         TRUE       TRUE           TRUE         TRUE           TRUE             TRUE             TRUE             TRUE         FALSE           
    #> 9    13 TRUE         TRUE       TRUE           TRUE         TRUE           TRUE             TRUE             TRUE             TRUE         FALSE           
    #> # … with 36 more variables: g_open_close_posts <lgl>, g_delete_own_topics <lgl>, g_post_polls <lgl>, g_vote_polls <lgl>, g_use_pm <lgl>, g_is_supmod <lgl>,
    #> #   g_access_cp <lgl>, g_title <chr>, g_append_edit <lgl>, g_access_offline <lgl>, g_avoid_q <lgl>, g_avoid_flood <lgl>, g_icon <chr>, g_attach_max <dbl>, prefix <chr>,
    #> #   suffix <chr>, g_max_mass_pm <int>, g_search_flood <int>, g_edit_cutoff <int>, g_promotion <chr>, g_hide_from_list <lgl>, g_post_closed <lgl>, g_perm_id <chr>,
    #> #   g_photo_max_vars <chr>, g_dohtml <lgl>, g_edit_topic <lgl>, g_bypass_badwords <lgl>, g_can_msg_attach <lgl>, g_topic_rate_setting <int>, g_dname_changes <int>,
    #> #   g_dname_date <int>, g_rep_max_positive <int>, g_rep_max_negative <int>, g_signature_limits <chr>, g_can_add_friends <lgl>, g_bitoptions <int>
    #> 
    #> $orig_ignored_users
    #> # A tibble: 15 x 5
    #>    ignore_id ignore_owner_id ignore_ignore_id ignore_messages ignore_topics
    #>        <int>           <int>            <int> <lgl>           <lgl>        
    #>  1         2             143               84 FALSE           FALSE        
    #>  2         3             143              190 FALSE           FALSE        
    #>  3         4             255              279 FALSE           FALSE        
    #>  4         5             288              234 TRUE            FALSE        
    #>  5         6             331                2 FALSE           FALSE        
    #>  6         7             991             1109 FALSE           FALSE        
    #>  7         8             288               91 FALSE           FALSE        
    #>  8        11              54             6113 FALSE           FALSE        
    #>  9        12            6209                2 FALSE           FALSE        
    #> 10        13            7364              132 FALSE           FALSE        
    #> 11        15            7901             7508 TRUE            TRUE         
    #> 12        17            7643             7481 FALSE           FALSE        
    #> 13        19            9304             9727 FALSE           FALSE        
    #> 14        20             293             6113 FALSE           FALSE        
    #> 15        21            9835             9679 TRUE            TRUE         
    #> 
    #> $orig_inline_notifications
    #> # A tibble: 47,066 x 13
    #>    notify_id notify_to_id notify_sent         notify_read notify_title notify_text notify_from_id notify_type_key notify_url notify_meta_app notify_meta_area
    #>        <int>        <int> <dttm>                    <int> <chr>        <chr>                <int> <chr>           <chr>      <chr>           <chr>           
    #>  1    344972         9217 2016-01-12 03:58:13           1 <a href='ht… "Hello!\n\…           9476 new_likes       http://ir… <NA>            <NA>            
    #>  2    344973         6155 2016-01-12 03:59:14           1 <a href='ht… "Hello!\n\…           6321 new_likes       http://ir… <NA>            <NA>            
    #>  3    344971         9679 2016-01-12 03:56:20           1 <a href='ht… "Vinokura,…           9801 followed_topics http://ir… forums          topics          
    #>  4    345399         7424 2016-01-12 23:28:12           1 <a href='ht… "Bear,\n\n…           1558 followed_topics http://ir… forums          topics          
    #>  5    344817         8232 2016-01-11 21:35:06           1 <a href='ht… "Raven,\n\…           6155 followed_topics http://ir… forums          topics          
    #>  6    335396         7903 2015-12-28 17:43:16           1 <a href='ht… "TripleKMa…           9288 followed_topics http://ir… forums          topics          
    #>  7    335397         1109 2015-12-28 17:43:16           0 <a href='ht… "Leonidas,…           9288 followed_topics http://ir… forums          topics          
    #>  8    335398           67 2015-12-28 17:43:16           0 <a href='ht… "Ã‰tat de …           9288 followed_topics http://ir… forums          topics          
    #>  9    335399          131 2015-12-28 17:43:16           1 <a href='ht… "Confedera…           9288 followed_topics http://ir… forums          topics          
    #> 10    350561         8310 2016-01-20 03:59:57           1 <a href='ht… "Commonwea…           2170 followed_topics http://ir… forums          topics          
    #> # … with 47,056 more rows, and 2 more variables: notify_meta_id <int>, notify_meta_key <chr>
    #> 
    #> $orig_login_methods
    #> # A tibble: 3 x 8
    #>   login_id login_title         login_description                       login_folder_name login_settings login_enabled login_safemode login_order
    #>      <int> <chr>               <chr>                                   <chr>             <lgl>          <lgl>         <lgl>                <int>
    #> 1        1 IPB Internal        The standard method of authentication   internal          FALSE          TRUE          FALSE                    1
    #> 2        2 LDAP Authentication LDAP / Active Directory Authentication  ldap              TRUE           FALSE         TRUE                     4
    #> 3        3 External Database   Authentication via an external database external          FALSE          FALSE         TRUE                     5
    #> 
    #> $orig_member_status_actions
    #> # A tibble: 927 x 7
    #>    action_id action_status_id action_reply_id action_member_id action_date action_key action_status_owner
    #>        <int>            <int>           <int>            <int>       <int> <chr>                    <int>
    #>  1         1                1               0               22  1316098429 new                         22
    #>  2         2                2               0               14  1316397519 new                         14
    #>  3         6                6               0               35  1319211330 new                         35
    #>  4         7                7               0               35  1319935567 new                         35
    #>  5         8                8               0               35  1319935570 new                         35
    #>  6        10               11               0               35  1321967601 new                         35
    #>  7        11               12               0               89  1324039690 new                         89
    #>  8        12                2               1               35  1324554161 reply                       14
    #>  9        17                2               2              132  1328301526 reply                       14
    #> 10        19               19               0              143  1328730328 new                        143
    #> # … with 917 more rows
    #> 
    #> $orig_member_status_replies
    #> # A tibble: 475 x 5
    #>    reply_id reply_status_id reply_member_id reply_date reply_content                                                                                                      
    #>       <int>           <int>           <int>      <int> <chr>                                                                                                              
    #>  1        1               2              35 1324554161 Try living in Indiana.                                                                                             
    #>  2        2               2             132 1328301526 Try living in Finland. -25 celsius and strong wind. Augh yeah.                                                     
    #>  3        3              23             143 1330034455 Omg, blocked.                                                                                                      
    #>  4        5              27             164 1332465964 Yeah it&#39;s so annoying dealing with poorly designed web 1.0 stuff. I just got done browsing through AlternateHi…
    #>  5        6              26             191 1333131553 And I&#39;m a country girl                                                                                         
    #>  6        7              29             132 1333328200 *hmm...slavsicles...*                                                                                              
    #>  7        8              29             130 1333757777 lolgenocide                                                                                                        
    #>  8        9              29             130 1333758050 I didn&#39;t even know you could comment on these.                                                                 
    #>  9       10              26              84 1335455835 I thank God for that too&#33; ;)                                                                                   
    #> 10       11              49             246 1338862771 I prefer the &quot;counter-revolution&quot;, but perhaps that&#39;s splitting hairs?                               
    #> # … with 465 more rows
    #> 
    #> $orig_member_status_updates
    #> # A tibble: 560 x 12
    #>    status_id status_member_id status_date status_content status_replies status_last_ids status_is_latest status_is_locked status_hash status_author_id status_author_ip
    #>        <int>            <int>       <int> <chr>                   <int> <chr>           <lgl>                       <int> <chr>                  <int> <chr>           
    #>  1         1               22  1316098429 Testing                     0 "a:0:{}"        TRUE                            0 fa6a5a3224…               22 178.2.19.130    
    #>  2         2               14  1316397519 Cold... *brrr*              3 "a:3:{i:132455… FALSE                           0 143f498959…               14 71.114.56.45    
    #>  3         6               35  1319211330 I am so fucki…              0 "a:0:{}"        FALSE                           0 43695c68bf…               35 71.65.36.98     
    #>  4         7               35  1319935567 Queensryche                 0 "a:0:{}"        FALSE                           0 842bc583d6…               35 71.65.36.98     
    #>  5         8               35  1319935570 Queensryche                 0 "a:0:{}"        FALSE                           0 842bc583d6…               35 71.65.36.98     
    #>  6        11               35  1321967601 Getting into …              0 "a:0:{}"        FALSE                           0 e8410a6b4f…               35 71.65.36.98     
    #>  7        12               89  1324039690 National Soci…              0 "a:0:{}"        TRUE                            0 cd19c9457f…               89 86.144.209.41   
    #>  8        28              143  1332804371 Ahaha, gnat s…              0 "a:0:{}"        FALSE                           0 b1161af476…              143 64.189.76.149   
    #>  9        29              130  1332911151 Dreams of Sta…              3 "a:3:{i:133332… FALSE                           0 6fbad0df53…              130 24.92.121.120   
    #> 10        19              143  1328730328 Numbess of bo…              0 "a:0:{}"        FALSE                           0 d0c7e59d96…              143 64.189.79.27    
    #> # … with 550 more rows, and 1 more variable: status_approved <lgl>
    #> 
    #> $orig_members
    #> # A tibble: 763 x 51
    #>    member_id name  member_group_id email joined              ip_address posts title allow_admin_mai… time_offset  skin warn_level warn_lastwarn last_post          
    #>        <int> <chr>           <int> <chr> <dttm>              <chr>      <int> <chr> <lgl>            <chr>       <int>      <int>         <int> <dttm>             
    #>  1         1 Alex…               4 slav… 2011-09-12 15:46:59 178.140.1…  5613 My s… FALSE            3               9          0             0 2016-03-20 19:37:40
    #>  2         2 Kacen              13 illu… 2011-09-12 15:52:30 68.37.21.…  1267 THE … TRUE             -5              0          0             0 2015-09-25 18:11:45
    #>  3         3 Bloo…              13 rene… 2011-09-12 18:10:11 68.10.255…   487 14/8… TRUE             -8              9          0             0 2015-12-04 02:23:51
    #>  4         4 Mier…              13 homi… 2011-09-12 20:27:35 82.29.169…  1704 Mult… FALSE            0               0          0             0 2016-02-29 22:56:56
    #>  5         5 Will…               5 tash… 2011-09-12 20:58:17 90.214.15…   463 A fox TRUE             0               0          0             0 2012-01-26 15:02:10
    #>  6         6 Inte…              13 mich… 2011-09-12 21:14:03 86.7.229.…     9 <NA>  TRUE             0              NA         NA             0 2013-04-09 07:13:04
    #>  7         7 Benj…               4 benj… 2011-09-13 01:22:58 81.141.31…  3127 2 Mi… TRUE             0               9          0             0 2016-02-25 01:53:44
    #>  8         8 Mr. …              13 elei… 2011-09-13 04:24:07 98.198.24…   167 <NA>  TRUE             -6              0          0             0 2012-10-30 06:52:01
    #>  9         9 Woma…               5 sol.… 2011-09-13 10:27:52 88.147.27…   997 <NA>  FALSE            1               0          0             0 2012-08-25 08:34:25
    #> 10        10 Dene…              13 8056… 2011-09-13 12:13:09 72.76.138…    96 <NA>  TRUE             -5              0          0             0 2013-04-09 04:20:54
    #> # … with 753 more rows, and 37 more variables: restrict_post <chr>, view_sigs <lgl>, bday_day <int>, bday_month <int>, bday_year <int>, msg_count_new <int>,
    #> #   msg_count_total <int>, msg_count_reset <lgl>, msg_show_notification <lgl>, last_visit <dttm>, last_activity <dttm>, dst_in_use <lgl>, mod_posts <chr>,
    #> #   auto_track <chr>, temp_ban <chr>, login_anonymous <chr>, ignored_users <chr>, mgroup_others <chr>, org_perm_id <chr>, member_login_key <chr>,
    #> #   member_login_key_expire <dttm>, members_auto_dst <lgl>, members_display_name <chr>, members_seo_name <chr>, members_cache <chr>, members_disable_pm <int>,
    #> #   members_l_display_name <chr>, members_l_username <chr>, failed_logins <chr>, members_profile_views <int>, members_pass_hash <chr>, members_pass_salt <chr>,
    #> #   member_banned <lgl>, member_uploader <chr>, members_bitoptions <int>, members_day_posts <chr>, notification_cnt <int>
    #> 
    #> $orig_members_warn_logs
    #> # A tibble: 163 x 20
    #>    wl_id wl_member wl_moderator wl_date             wl_reason wl_points wl_note_member wl_note_mods wl_mq wl_mq_unit wl_rpa wl_rpa_unit wl_suspend wl_suspend_unit
    #>    <int>     <int>        <int> <dttm>                  <int>     <int> <chr>          <chr>        <int> <chr>       <int> <chr>            <int> <chr>          
    #>  1     1        33            9 2011-09-21 11:32:21         0         1 <NA>           "Personal a…     0 h               0 h                    0 h              
    #>  2     2        40            4 2011-10-27 23:38:28         0         1 <NA>           "Racism/eth…     0 h               0 h                    0 h              
    #>  3     3        40            4 2011-10-27 23:39:35         0         0 <NA>           "I believe …     0 h               0 h                    0 h              
    #>  4     4        40            4 2011-12-04 00:16:19         0         0 <NA>           "yhu7jytf"       0 h               0 h                    0 h              
    #>  5     5        89            7 2011-12-17 22:04:47         0         1 <NA>           "Ridiculous…     0 h              -1 <NA>                 0 h              
    #>  6     6        49           14 2011-12-17 22:07:40         0         1 <NA>           "Warned for…     0 h               0 h                    0 h              
    #>  7     7        40           14 2011-12-23 20:27:50         0         0 <NA>           "Completely…     0 h               0 h                    0 h              
    #>  8     8        40           14 2011-12-25 14:33:04         0         0 <NA>           "See my pre…     0 h               0 h                    0 h              
    #>  9     9        40            4 2012-01-01 19:56:58         0         0 <NA>           "He told me…     0 h              -1 <NA>                 0 h              
    #> 10    10        40            4 2012-01-28 21:05:49         0         0 <NA>           "Cooldown?"      0 h               0 h                    0 h              
    #> # … with 153 more rows, and 6 more variables: wl_ban_group <int>, wl_expire <int>, wl_expire_unit <chr>, wl_content_app <chr>, wl_content_id1 <chr>, wl_expire_date <lgl>
    #> 
    #> $orig_members_warn_reasons
    #> # A tibble: 5 x 3
    #>   wr_id wr_name                wr_order
    #>   <int> <chr>                     <int>
    #> 1     1 Spamming                      1
    #> 2     2 Inappropriate Language        2
    #> 3     3 Signature Violation           3
    #> 4     4 Abusive Behaviour             4
    #> 5     5 Topic Bumping                 5
    #> 
    #> $orig_message_posts
    #> # A tibble: 13,341 x 8
    #>    msg_id msg_topic_id msg_date            msg_post                                                      msg_post_key        msg_author_id msg_ip_address msg_is_first_po…
    #>     <int>        <int> <dttm>              <chr>                                                         <chr>                       <int> <chr>          <lgl>           
    #>  1      1            1 2011-09-16 03:49:58 "The best first post to make on our forums is the one where … 3320f7f06c422ef0fb…             1 178.140.119.2… TRUE            
    #>  2      2            2 2011-09-16 11:54:08 "Who are we hosting this forum from?<br />\n<br />\nI like i… 9204e4883321af2275…            11 109.78.212.13  TRUE            
    #>  3      3            2 2011-09-16 14:39:59 "Crisis Host - they basically provide hosting for free speec… 12fd0309239711d02b…             1 178.140.119.2… FALSE           
    #>  4      4            2 2011-09-16 15:29:01 "Thank you, I'll make a note of it, I am very impressed by t… 0658c6f99ac18d9060…            11 109.78.212.13  FALSE           
    #>  5      5            2 2011-09-16 15:32:58 "If you mean the dark+orange skin then that's a skin I also … 570257864e3cb812ee…             1 178.140.119.2… FALSE           
    #>  6      6            2 2011-09-16 15:44:51 "The functionality mostly, thanks for the info."              aabeacc8f4ccc579c4…            11 109.78.212.13  FALSE           
    #>  7      7            3 2011-09-17 01:43:49 "I don't see why one would want to resuscitate Religio Roman… a36f67c0d722aa8d1d…            16 152.33.69.70   TRUE            
    #>  8      8            3 2011-09-17 01:59:50 "[quote name='Talleyrand' timestamp='1316223829']<br />\nI d… 327b933d818a39dc6a…            14 71.114.56.45   FALSE           
    #>  9     12            5 2011-09-20 14:20:14 "The best first post to make on our forums is the one where … 0667258c387129ea0d…             1 178.140.121.11 TRUE            
    #> 10     13            5 2011-09-20 14:42:17 "Done and done. I meant to post something there but i am awf… de1d7fd2737dd852f5…            20 94.103.203.197 FALSE           
    #> # … with 13,331 more rows
    #> 
    #> $orig_message_topic_user_map
    #> # A tibble: 6,025 x 11
    #>    map_id map_user_id map_topic_id map_folder_id map_read_time       map_user_active map_user_banned map_has_unread map_is_starter map_ignore_notific… map_last_topic_rep…
    #>     <int>       <int>        <int> <chr>         <dttm>              <lgl>           <lgl>           <lgl>          <lgl>          <lgl>               <dttm>             
    #>  1      1          23            1 myconvo       2011-11-04 06:53:06 TRUE            FALSE           FALSE          FALSE          FALSE               2011-09-16 03:49:58
    #>  2      2           1            1 myconvo       2011-09-20 14:19:38 FALSE           FALSE           FALSE          TRUE           FALSE               2011-09-16 03:49:58
    #>  3      3           1            2 myconvo       2011-09-16 15:46:25 FALSE           FALSE           FALSE          FALSE          FALSE               2011-09-16 15:44:51
    #>  4      4          11            2 myconvo       2011-09-20 04:03:38 TRUE            FALSE           FALSE          TRUE           FALSE               2011-09-16 15:44:51
    #>  5      5          14            3 myconvo       2011-09-17 01:59:51 TRUE            FALSE           FALSE          FALSE          FALSE               2011-09-17 01:59:50
    #>  6      6          16            3 myconvo       2011-09-17 18:19:01 FALSE           FALSE           FALSE          TRUE           FALSE               2011-09-17 01:59:50
    #>  7      9          20            5 myconvo       2011-09-20 14:42:17 TRUE            FALSE           FALSE          FALSE          FALSE               2011-09-20 14:42:17
    #>  8     10           1            5 myconvo       2011-11-07 01:36:40 FALSE           FALSE           FALSE          TRUE           FALSE               2011-09-20 14:42:17
    #>  9     11          11            6 myconvo       2011-09-22 14:18:00 TRUE            FALSE           FALSE          FALSE          FALSE               2011-09-22 14:17:57
    #> 10     12           1            6 myconvo       2011-09-22 14:33:52 FALSE           FALSE           FALSE          TRUE           FALSE               2011-09-22 14:17:57
    #> # … with 6,015 more rows
    #> 
    #> $orig_message_topics
    #> # A tibble: 3,101 x 14
    #>    mt_id mt_date             mt_title mt_starter_id mt_start_time       mt_last_post_time   mt_invited_memb… mt_to_count mt_to_member_id mt_replies mt_last_msg_id
    #>    <int> <dttm>              <chr>            <int> <dttm>              <dttm>              <chr>                  <int>           <int>      <int>          <int>
    #>  1     1 2011-09-16 03:49:58 Introdu…             1 2011-09-16 03:49:58 2011-09-16 03:49:58 a:0:{}                     0              23          0              1
    #>  2     2 2011-09-16 11:54:08 Our hos…            11 2011-09-16 11:54:07 2011-09-16 15:44:51 a:0:{}                     0               1          4              6
    #>  3     3 2011-09-17 01:43:49 Re: Nov…            16 2011-09-17 01:43:49 2011-09-17 01:59:50 a:0:{}                     0              14          1              8
    #>  4     5 2011-09-20 14:20:14 Introdu…             1 2011-09-20 14:20:14 2011-09-20 14:42:17 a:0:{}                     0              20          1             13
    #>  5     6 2011-09-22 14:12:17 msn                  1 2011-09-22 14:12:17 2011-09-22 14:17:57 a:0:{}                     0              11          1             15
    #>  6     8 2011-09-22 21:21:22 Do you …             2 2011-09-22 21:21:22 2011-09-23 00:14:21 a:0:{}                     1               8          7             24
    #>  7    10 2011-09-23 20:44:56 Introdu…             1 2011-09-23 20:44:56 2011-09-23 20:44:56 a:0:{}                     0              25          0             26
    #>  8    11 2011-09-24 09:40:39 Introdu…             1 2011-09-24 09:40:39 2011-09-24 12:12:39 a:0:{}                     0              39          2             29
    #>  9    12 2011-09-25 17:18:50 Welcome…            14 2011-09-25 17:18:50 2011-09-26 18:52:57 a:0:{}                     0              35          2             35
    #> 10    13 2011-09-26 01:05:50 Could I…             2 2011-09-26 01:05:49 2011-09-26 01:05:49 a:0:{}                     0               7          0             32
    #> # … with 3,091 more rows, and 3 more variables: mt_first_msg_id <int>, mt_is_draft <lgl>, mt_is_deleted <lgl>
    #> 
    #> $orig_moderator_logs
    #> # A tibble: 11,937 x 12
    #>       id forum_id topic_id post_id member_id member_name  ip_address  http_referer                        ctime               topic_title    action      query_string     
    #>    <int>    <int>    <int>   <int>     <int> <chr>        <chr>       <chr>                               <dttm>              <chr>          <chr>       <chr>            
    #>  1     1        0        0       0         0 Guest        178.140.11… http://ironmarch.org/               2011-09-12 17:13:41 <NA>           Deleted po… app=core&amp;mod…
    #>  2     2        2        1       0         1 Alexander S… 178.140.11… http://ironmarch.org/index.php?app… 2011-09-12 18:14:50 Welcome&#33;   Deleted to… app=forums&amp;m…
    #>  3     3        0        0       0         1 Alexander S… 178.140.11… http://ironmarch.org/index.php?app… 2011-09-12 18:14:50 <NA>           Cleared to… app=forums&amp;m…
    #>  4     4        4        0       0         1 Alexander S… 178.140.11… http://ironmarch.org/index.php?app… 2011-09-12 21:42:16 Iron March Fo… Pinned & c… <NA>             
    #>  5     5        0        0       0         0 Guest        178.140.11… http://ironmarch.org/index.php?/fo… 2011-09-12 22:05:07 <NA>           Deleted po… app=core&amp;mod…
    #>  6     6       53        0       0         1 Alexander S… 178.140.11… http://ironmarch.org/index.php?app… 2011-09-13 08:52:25 Debate Duel R… Pinned & c… <NA>             
    #>  7     7        5        0       0         1 Alexander S… 178.140.11… http://ironmarch.org/index.php?app… 2011-09-13 09:13:02 Welcome Emiss… Pinned & c… <NA>             
    #>  8     8       61        0       0         1 Alexander S… 178.140.11… http://ironmarch.org/index.php?app… 2011-09-13 09:47:48 Support Center Pinned & c… <NA>             
    #>  9     9        8        0       0         1 Alexander S… 178.140.11… http://ironmarch.org/index.php?app… 2011-09-13 09:52:23 What Do I Pos… Pinned & c… <NA>             
    #> 10    10        9        0       0         1 Alexander S… 178.140.11… http://ironmarch.org/index.php?app… 2011-09-13 09:55:16 What Do I Pos… Pinned & c… <NA>             
    #> # … with 11,927 more rows
    #> 
    #> $orig_permission_index
    #> # A tibble: 135 x 12
    #>    perm_id app     perm_type    perm_type_id perm_view   perm_2      perm_3  perm_4  perm_5 perm_6 perm_7 owner_only
    #>      <int> <chr>   <chr>               <int> <chr>       <chr>       <chr>   <chr>   <chr>  <chr>  <chr>  <lgl>     
    #>  1       1 members profile_view            1 *           <NA>        <NA>    <NA>    <NA>   <NA>   <NA>   FALSE     
    #>  2       2 core    help                    1 *           <NA>        <NA>    <NA>    <NA>   <NA>   <NA>   FALSE     
    #>  3       3 forums  forum                   1 ,1,2,3,4,6, ,6,         ,6,     ,6,     ,,     ,,     ,,     FALSE     
    #>  4     125 forums  forum                   2 ,4,2,3,6,1, ,4,2,3,6,1, ,4,3,6, ,4,6,   ,,     ,,     ,,     FALSE     
    #>  5     110 forums  forum                  92 ,4,2,3,6,1, ,4,2,3,6,1, ,4,3,6, ,4,3,6, ,,     ,,     ,,     FALSE     
    #>  6       7 forums  forum                   5 ,4,2,3,6,1, ,4,2,3,6,1, ,4,3,6, ,4,3,6, ,6,    ,4,6,  ,,     FALSE     
    #>  7     118 forums  forum                 100 ,4,2,3,6,1, ,4,2,3,6,1, ,4,3,6, ,4,3,6, ,,     ,,     ,,     FALSE     
    #>  8       9 forums  forum                   7 ,4,2,3,6,1, ,,          ,,      ,,      ,,     ,,     ,,     TRUE      
    #>  9     109 forums  forum                  91 ,4,2,3,6,1, ,4,2,3,6,1, ,4,3,6, ,4,3,6, ,,     ,,     ,,     FALSE     
    #> 10     108 forums  forum                  90 ,4,2,3,6,1, ,4,2,3,6,1, ,4,3,6, ,4,3,6, ,,     ,,     ,,     FALSE     
    #> # … with 125 more rows
    #> 
    #> $orig_pfields_content
    #> # A tibble: 764 x 12
    #>    member_id field_1 field_2 field_3         field_4 field_5 field_6     field_7                                field_8 field_9 field_10    field_11                      
    #>        <int> <chr>   <chr>   <chr>           <chr>   <chr>   <chr>       <chr>                                  <chr>   <chr>   <chr>       <chr>                         
    #>  1         1 <NA>    <NA>    <NA>            <NA>    m       Third Rome   <NA>                                  <NA>    <NA>    <NA>        FASCISM                       
    #>  2         2 <NA>    <NA>    <NA>            <NA>    m       <NA>         <NA>                                  <NA>    <NA>    <NA>        Out of context Mussolini quot…
    #>  3      9882 <NA>    <NA>    <NA>            <NA>    <NA>    <NA>         <NA>                                  <NA>    <NA>    <NA>        Fascist                       
    #>  4         3 <NA>    <NA>    <NA>            <NA>    m       Dixie       "Working out, guns, video games, read… <NA>    <NA>    <NA>        â‰                            
    #>  5         4 <NA>    <NA>    http://bigbust… <NA>    m       Babylon     "You"                                  <NA>    <NA>    <NA>        Theonomy                      
    #>  6         5 <NA>    <NA>    <NA>            <NA>    m       Great Brit… "Politics, history, science fiction, … <NA>    <NA>    <NA>        Republican Fascism            
    #>  7         6 <NA>    <NA>    <NA>            <NA>    m       United Kin…  <NA>                                  <NA>    <NA>    <NA>        Integralist                   
    #>  8         7 <NA>    <NA>    <NA>            <NA>    m       United Kin… "http://integralistparty.zzl.org/\r\n… <NA>    <NA>    Benjamin R… Post-Irony                    
    #>  9         8 <NA>    <NA>    <NA>            <NA>    m       <NA>         <NA>                                  <NA>    <NA>    <NA>        Syndicalist Futurism          
    #> 10         9 <NA>    <NA>    <NA>            <NA>    f       AWOL         <NA>                                  <NA>    <NA>    <NA>        Classic Fascism               
    #> # … with 754 more rows
    #> 
    #> $orig_pfields_data
    #> # A tibble: 11 x 12
    #>    pf_id pf_title  pf_content       pf_type  pf_not_null pf_position pf_show_on_reg pf_topic_format                   pf_group_id pf_icon            pf_key pf_search_type
    #>    <int> <chr>     <chr>            <chr>    <lgl>             <int> <lgl>          <chr>                                   <int> <chr>              <chr>  <chr>         
    #>  1     1 AIM       <NA>             input    FALSE                 0 FALSE           <NA>                                       1 style_extra/cprof… aim    loose         
    #>  2     2 MSN       <NA>             input    FALSE                 0 FALSE           <NA>                                       1 style_extra/cprof… msn    loose         
    #>  3     3 Website … <NA>             input    FALSE                 0 FALSE           <NA>                                       1 style_extra/cprof… websi… loose         
    #>  4     4 ICQ       <NA>             input    FALSE                 0 FALSE           <NA>                                       1 style_extra/cprof… icq    loose         
    #>  5     5 Gender    u=Not Telling|m… drop     FALSE                 2 FALSE           <NA>                                       2 <NA>               gender loose         
    #>  6     6 Location: <NA>             input    FALSE                 3 FALSE          "<span class='ft'>{title}</span>…           2 <NA>               locat… loose         
    #>  7     7 Interest… <NA>             textarea FALSE                 4 FALSE           <NA>                                       2 <NA>               inter… loose         
    #>  8     8 Yahoo     <NA>             input    FALSE                 0 FALSE           <NA>                                       1 style_extra/cprof… yahoo  loose         
    #>  9     9 Jabber    <NA>             input    FALSE                 0 FALSE           <NA>                                       1 style_extra/cprof… jabber loose         
    #> 10    10 Skype     <NA>             input    FALSE                 0 FALSE           <NA>                                       1 style_extra/cprof… skype  loose         
    #> 11    11 Ideology  <NA>             input    TRUE                  1 TRUE           "<span class=\"ft\">{title}:</sp…           2 <NA>               ideol… exact         
    #> 
    #> $orig_pfields_groups
    #> # A tibble: 2 x 3
    #>   pf_group_id pf_group_name       pf_group_key
    #>         <int> <chr>               <chr>       
    #> 1           1 Contact Methods     contact     
    #> 2           2 Profile Information profile_info
    #> 
    #> $orig_polls
    #> # A tibble: 24 x 9
    #>      pid   tid start_date          choices                                                     starter_id votes forum_id poll_question                    poll_view_voters
    #>    <int> <int> <dttm>              <chr>                                                            <int> <int>    <int> <chr>                            <lgl>           
    #>  1     1   370 2011-12-13 15:25:38 "a:1:{i:1;a:3:{s:8:\"question\";s:10:\"Whodunnit?\";s:6:\"…          4    13       88 <NA>                             FALSE           
    #>  2     3   599 2012-02-14 00:03:33 "a:1:{i:1;a:3:{s:8:\"question\";s:21:\"Democracy has faile…          4    12       13 THERE WAS A HUGE EDITING WAR AN… FALSE           
    #>  3     4   682 2012-03-06 16:28:36 "a:1:{i:1;a:3:{s:8:\"question\";s:55:\"Demographics gather…         14    41       99 Answer the Question              TRUE            
    #>  4     6   939 2012-05-11 01:31:58 "a:1:{i:1;a:3:{s:8:\"question\";s:21:\"Do you have insomni…          0    39       99 Do you have insomnia?            FALSE           
    #>  5    11  1422 2012-09-06 04:27:51 "a:1:{i:1;a:3:{s:8:\"question\";s:56:\"How would peer-to-p…        274    20       24 How would peer-to-peer and torr… FALSE           
    #>  6    18  2784 2013-08-10 01:03:42 "a:1:{i:1;a:3:{s:8:\"question\";s:23:\"Wasn&#39;t OP a fag…       6201    22       99 How Gay is the OP?               TRUE            
    #>  7    20  2830 2013-08-19 20:44:13 "a:1:{i:1;a:4:{s:8:\"question\";s:24:\"Which one should KU…          0    25       78 Mexican or Muslim Immigrants wh… FALSE           
    #>  8    23  3136 2013-10-22 13:27:17 "a:1:{i:1;a:3:{s:8:\"question\";s:18:\"Where do you live?\…         35    52       45 Where do you live?               FALSE           
    #>  9    24  3731 2014-03-15 05:34:15 "a:1:{i:1;a:3:{s:8:\"question\";s:34:\"Will the fascists c…       6122    22       88 <NA>                             FALSE           
    #> 10    25  3897 2014-04-30 20:33:11 "a:1:{i:1;a:3:{s:8:\"question\";s:54:\"Is global climate c…       6306    23       26 Climate Change                   TRUE            
    #> # … with 14 more rows
    #> 
    #> $orig_posts
    #> # A tibble: 139,068 x 17
    #>       pid append_edit edit_time           author_id author_name use_sig use_emo ip_address post_date           post  queued topic_id new_topic edit_name post_key
    #>     <int> <lgl>       <dttm>                  <int> <chr>       <lgl>   <lgl>   <chr>      <dttm>              <chr>  <int>    <int> <lgl>     <chr>     <chr>   
    #>  1    202 FALSE       NA                          7 MoonmanKKK  TRUE    TRUE    81.141.31… 2011-09-15 22:08:51 "Ver…      0       47 FALSE     <NA>      89e750e…
    #>  2    203 FALSE       NA                         16 Talleyrand  TRUE    TRUE    152.33.58… 2011-09-15 22:10:42 "Oh,…      0       11 FALSE     <NA>      0bccae6…
    #>  3    532 FALSE       2011-09-19 23:14:09         5 Will to Po… TRUE    TRUE    90.219.24… 2011-09-19 23:13:59 "[qu…      0      107 FALSE     Will to … 58e8b72…
    #>  4 114067 FALSE       NA                       7508 RIGHT WING… TRUE    TRUE    80.212.44… 2015-05-16 18:00:29 "<bl…      0     5166 FALSE     <NA>      ac5b3c0…
    #>  5 114068 FALSE       2015-05-16 18:07:42      9486 Nihonjin M… TRUE    TRUE    73.222.21… 2015-05-16 18:02:08 "<p>…      0     5166 FALSE     Nihonjin… 3eb3ae5…
    #>  6 114069 FALSE       2015-05-16 19:12:42      7481 Â¡VIVA LA … TRUE    TRUE    86.181.21… 2015-05-16 18:06:36 "<bl…      0     5165 FALSE     Generalp… a72ee7a…
    #>  7 114070 FALSE       NA                       9144 Neizbezhno… TRUE    TRUE    121.215.1… 2015-05-16 18:14:36 "<p>…      0     5165 FALSE     <NA>      e2e1256…
    #>  8 114071 FALSE       NA                       6321 Culius Jae… TRUE    TRUE    65.28.106… 2015-05-16 18:16:41 "<p>…      0     5167 TRUE      <NA>      774875f…
    #>  9      4 FALSE       NA                          1 Alexander … TRUE    TRUE    178.140.1… 2011-09-13 01:06:06 "Wel…      0        3 TRUE      <NA>      cbd8458…
    #> 10     83 FALSE       NA                         16 Talleyrand  TRUE    TRUE    152.33.17… 2011-09-14 04:43:41 "Hel…      0       37 TRUE      <NA>      0bac739…
    #> # … with 139,058 more rows, and 2 more variables: post_edit_reason <chr>, pdelete_time <dttm>
    #> 
    #> $orig_profile_friends
    #> # A tibble: 4,593 x 5
    #>    friends_id friends_member_id friends_friend_id friends_approved friends_added
    #>         <int>             <int>             <int> <lgl>                    <int>
    #>  1          1                10                 2 TRUE                1315921996
    #>  2          2                 2                10 TRUE                1315921996
    #>  3        218                13                10 TRUE                1327664896
    #>  4        217                10                13 TRUE                1327664896
    #>  5          5                 2                 1 TRUE                1315937852
    #>  6          6                 1                 2 TRUE                1315937852
    #>  7        259                 2               132 TRUE                1328295675
    #>  8        260               132                 2 TRUE                1328295675
    #>  9          9                22                 1 TRUE                1316098018
    #> 10         10                 1                22 TRUE                1316098018
    #> # … with 4,583 more rows
    #> 
    #> $orig_profile_portal
    #> # A tibble: 764 x 23
    #>    pp_member_id pp_last_visitors pp_rating_hits pp_rating_value pp_rating_real pp_main_photo pp_main_width pp_main_height pp_thumb_photo pp_thumb_width pp_thumb_height
    #>           <int> <chr>                     <int>           <int>          <int> <chr>                 <int>          <int> <chr>                   <int>           <int>
    #>  1            1 a:6:{i:14585562…             30             136              5 profile/phot…           150            200 profile/photo…            100             100
    #>  2         9659 a:1:{i:14429407…              1               1              1 profile/phot…           113            141 profile/photo…            100             100
    #>  3         6180 a:6:{i:13927958…              0               0              0 <NA>                      0              0 <NA>                        0               0
    #>  4            2 a:6:{i:14559000…             10              45              5 <NA>                      0              0 <NA>                        0               0
    #>  5            3 a:6:{i:14571305…              3              14              5 profile/phot…           150             98 profile/photo…            100             100
    #>  6            4 a:6:{i:14571393…              7              31              4 http://i.img…           100            100 http://i.imgu…            100             100
    #>  7            5 a:6:{i:13747911…              2               2              1 <NA>                      0              0 <NA>                        0               0
    #>  8            6 a:6:{i:14343615…              0               0              0 http://i560.…           100            100 http://i560.p…            100             100
    #>  9            7 a:6:{i:14585121…             24             108              5 profile/phot…           150            191 profile/photo…            100             100
    #> 10            8 a:6:{i:14551305…              2              10              5 http://uploa…           100            100 http://upload…            100             100
    #> # … with 754 more rows, and 12 more variables: pp_setting_moderate_comments <lgl>, pp_setting_moderate_friends <lgl>, pp_setting_count_friends <lgl>,
    #> #   pp_setting_count_comments <lgl>, pp_setting_count_visitors <lgl>, pp_about_me <chr>, pp_reputation_points <int>, pp_gravatar <chr>, pp_photo_type <chr>,
    #> #   signature <chr>, pp_customization <chr>, pp_profile_update <dttm>
    #> 
    #> $orig_profile_ratings
    #> # A tibble: 1,253 x 5
    #>    rating_id rating_for_member_id rating_by_member_id rating_ip_address rating_value
    #>        <int>                <int>               <int> <chr>                    <int>
    #>  1         1                   44                  22 178.7.118.182                5
    #>  2         2                    1                  89 86.145.168.97                4
    #>  3         3                    1                  11 109.77.25.198                5
    #>  4         4                    1                   2 68.37.21.125                 5
    #>  5         5                    1                  10 71.255.83.251                5
    #>  6         6                   61                 134 99.22.216.224                5
    #>  7         7                   64                  13 77.249.103.246               1
    #>  8         8                   64                 101 92.251.65.142                1
    #>  9         9                  100                 101 92.251.65.142                5
    #> 10        10                   84                  13 77.249.103.246               1
    #> # … with 1,243 more rows
    #> 
    #> $orig_question_and_answer
    #> # A tibble: 4 x 3
    #>   qa_id qa_question                                                                                      qa_answers                                                       
    #>   <int> <chr>                                                                                            <chr>                                                            
    #> 1    17 Name the specialized subforum from the Specific Subjects forum where we discuss the Merchant (a… "JEWISH QUESTION\r\nTHE JEWISH QUESTION"                         
    #> 2    16 Input the second key term listed in the IronMarch Mission Statement (answer in all caps, no pun… "FASCIST ALMA MATER"                                             
    #> 3    15 The Slogan of IronMarch is (answer in all caps, no punctuation):                                 "GAS THE KIKES RACE WAR NOW 1488 BOOTS ON THE GROUND\r\nGAS THE …
    #> 4    18 The place where you will end up if you fuck up on IronMarch (answer in all caps, no punctuation) "CONCENTRATION CAMP\r\nTHE CONCENTRATION CAMP\r\nSHOWERS\r\nTHE …
    #> 
    #> $orig_rc_classes
    #> # A tibble: 5 x 8
    #>   com_id class_title     class_desc                       my_class group_can_report      mod_group_perm extra_data                                                   app  
    #>    <int> <chr>           <chr>                            <chr>    <chr>                 <chr>          <chr>                                                        <chr>
    #> 1      1 Simple Plugin … Plugin that does not require an… default  ,3,4,6,7,8,9,10,11,1… ,4,6,10,       "a:5:{s:14:\"required_input\";a:1:{s:8:\"video_id\";s:13:\"… core 
    #> 2      2 Forum Plugin    This is the plugin used for rep… post     ,1,2,3,4,6,7,8,9,10,… ,4,6,10,       "a:1:{s:15:\"report_supermod\";i:1;}"                        foru…
    #> 3      3 Private Messag… This plugin allows private mess… messages ,1,2,3,4,6,7,8,9,10,… ,4,6,10,       "a:1:{s:18:\"plugi_messages_add\";s:5:\"4\";}"               memb…
    #> 4      4 Member Profiles Allows you to report member pro… profiles ,1,2,3,4,6,7,8,9,10,… ,4,6,10,       "N;"                                                         memb…
    #> 5      5 Calendar Plugin Allows calendar entries to be r… calendar ,1,2,3,4,6,           ,4,6,          "N;"                                                         cale…
    #> 
    #> $orig_rc_comments
    #> # A tibble: 21 x 7
    #>       id   rid comment                                                                         comment_by comment_date        author_name                     ip_address  
    #>    <int> <int> <chr>                                                                                <int> <dttm>              <chr>                           <chr>       
    #>  1     1     1 "This is an anti-fascist point of view of course, but I don't see anything rep…          9 2011-12-24 09:57:56 "Woman in Black"                88.147.17.2…
    #>  2    13    10 "done"                                                                                  49 2012-12-27 20:38:44 "Ð’Ð»Ð°Ð´Ð¸Ð¼Ð¸Ñ€_Ð‘Ð¾Ñ€Ð¸Ñ\u0… 72.78.105.1…
    #>  3    26    74 "<p>Don't report people over differences of opinion</p>\n"                               4 2014-01-02 11:51:34 "Mierce"                        82.25.135.1…
    #>  4    30    89 "<p>No.</p>\n"                                                                           1 2015-05-13 16:30:24 "Ð\u0090Ð»ÐµÐºÑ\u0081Ð°Ð½Ð´Ñ€ … 5.228.66.104
    #>  5    31    89 "<p>I'll need a transplant for my sides :(</p>\n"                                     2170 2015-05-13 20:18:43 "Zeiger"                        69.70.181.10
    #>  6    32    89 "<p>this is just too good.</p>"                                                       9475 2015-05-13 21:47:00 "mengligiraykhan"               95.142.136.…
    #>  7    33    89 "<p>&gt;Puts something on internet.</p>\n<p>&gt;Expects it to remain in one pl…       2220 2015-05-15 02:16:03 "Kulturkampf"                   122.128.196…
    #>  8    34    90 "Who are you again?"                                                                  2170 2015-05-21 06:36:39 "Zeiger"                        66.102.6.221
    #>  9    35    90 "<p>He's the guy that wanted us to remove his drawings I believe.&nbsp;</p>"          9475 2015-05-21 06:57:15 "mengligiraykhan"               95.142.136.…
    #> 10    36    90 "<p>Oh yeah, sure &gt;we're the autists, not the the moron who wrote a wall-o-…          1 2015-05-21 07:40:49 "Ð\u0090Ð»ÐµÐºÑ\u0081Ð°Ð½Ð´Ñ€ … 5.228.66.104
    #> # … with 11 more rows
    #> 
    #> $orig_rc_modpref
    #> # A tibble: 21 x 3
    #>    mem_id rss_key                     rss_cache                                                                                                                           
    #>     <int> <chr>                       <chr>                                                                                                                               
    #>  1      1 a31e419a0c3ec13258bcf36c8b…  <NA>                                                                                                                               
    #>  2      4 570882a0ed9e1c0b83c8c145e2…  <NA>                                                                                                                               
    #>  3     14 40cf3bd33995c06ae9639bbcd4…  <NA>                                                                                                                               
    #>  4      0 <NA>                        "<?xml version=\"1.0\" encoding=\"UTF-8\" ?>\n<rss version=\"2.0\">\n<channel>\n\t<title>Report Notification</title>\n\t<link>http:…
    #>  5      7 d8a331ee70aba8ad92f8be8580…  <NA>                                                                                                                               
    #>  6      9 1c0febd1e77291c90b0575eaa1…  <NA>                                                                                                                               
    #>  7    132 2c47a8124da7d34842c658d4e3…  <NA>                                                                                                                               
    #>  8     13 2b4ae5b7d09b495defbc2ab90d…  <NA>                                                                                                                               
    #>  9     35 ce51ea7ca7936a0bfd8718ea41…  <NA>                                                                                                                               
    #> 10      2 aa6ce80b32ecf268295630da1d…  <NA>                                                                                                                               
    #> # … with 11 more rows
    #> 
    #> $orig_rc_reports
    #> # A tibble: 25 x 5
    #>       id   rid report                                                                                                                              report_by date_reported
    #>    <int> <int> <chr>                                                                                                                                   <int>         <int>
    #>  1     1     1 "[quote name='Frost Hammer']Before I start, I'd like to clarify that I am not a communist, socialist, anarchist, or a liberal.  I'…        11    1324684384
    #>  2    10    10 "[quote name='Sir Barza']Please, delete this.[/quote]<br />\n<br />\nHe wants that post deleted.<br />\n"                                2099    1356640292
    #>  3    14    14 "[quote name='AlbertSakas']Ð¡ÐµÐ±Ñ\u008f Ð½Ð¸Ñ‡ÐµÐ³Ð¾ Ð½Ðµ Ð¾Ñ\u0081Ñ‚Ð°ÐµÑ‚Ñ\u0081Ñ\u008f Ñ\u008dÑ‚Ð¾ ÑƒÐ¶Ðµ Ð¼ÐµÐ½ÑŒÑˆÐµ Ð½ÑƒÐ¶Ð…         2    1361245960
    #>  4    59    55 "spam profile"                                                                                                                           1209    1366310513
    #>  5    60    56 "more spam profile&#39;s"                                                                                                                1209    1366310573
    #>  6    62    58 "<blockquote  class=\"ipsBlockquote\" data-author=\"FezWearingFascist\" data-cid=\"63009\" data-time=\"1374632045\"><div><p>For a …      6174    1374646450
    #>  7    71    66 "<blockquote  class=\"ipsBlockquote\" data-author=\"RammStein\" data-cid=\"65398\" data-time=\"1377088722\"><div><p>Check this out…      6173    1377089209
    #>  8    74    69 "<blockquote  class=\"ipsBlockquote\" data-author=\"Ð‰Ð¾Ñ‚Ð¸Ñ›ÐµÐ²aÑ†\" data-cid=\"68874\" data-time=\"1380353577\"><div><p><a dat…         2    1380356286
    #>  9    75    70 "<blockquote  class=\"ipsBlockquote\" data-author=\"Ð‰Ð¾Ñ‚Ð¸Ñ›ÐµÐ²aÑ†\" data-cid=\"68873\" data-time=\"1380353513\"><div><p><a dat…         2    1380356292
    #> 10    79    74 "<blockquote  class=\"ipsBlockquote\" data-author=\"mengligiraykhan\" data-cid=\"72083\" data-time=\"1384052388\"><div><p></p><blo…         0    1388660127
    #> # … with 15 more rows
    #> 
    #> $orig_rc_reports_index
    #> # A tibble: 23 x 14
    #>       id uid         title              url                 rc_class updated_by date_updated date_created exdat1 exdat2 exdat3 num_comments seoname            seotemplate
    #>    <int> <chr>       <chr>              <chr>                  <int>      <int>        <int>        <int>  <int>  <int>  <int>        <int> <chr>              <chr>      
    #>  1     1 0b3ad95361… Why Fascism is Ri… /index.php?showtop…        2          9   1324720676   1324684384     57    422   6049            1 why-fascism-is-ri… showtopic  
    #>  2    10 d94e3b7efb… World Union of Fr… /index.php?showtop…        2          4   1356645256   1356640292     22   1827  46608            1 world-union-of-fr… showtopic  
    #>  3    14 4007c1340c… Operation Igloo    /index.php?showtop…        2          1   1361248006   1361245960      4   1751  51441            0 operation-igloo    showtopic  
    #>  4    58 264d9769a5… IRA dirtbag kicke… /index.php?showtop…        2          1   1374646833   1374646450      9   2688  63009            0 ira-dirtbag-kicke… showtopic  
    #>  5    66 cd32ce61d1… Jews want Negros … /index.php?showtop…        2          4   1377095062   1377089209      8   2842  65398            0 jews-want-negros-… showtopic  
    #>  6    69 933fabf496… Belgrade faggot p… /index.php?showtop…        2         16   1380356859   1380356286      8   3021  68874            0 belgrade-faggot-p… showtopic  
    #>  7    70 3a36b4740c… Belgrade faggot p… /index.php?showtop…        2         16   1380356859   1380356292      8   3020  68873            0 belgrade-faggot-p… showtopic  
    #>  8    74 9ca0654c69… Gabor Vona visits… /index.php?showtop…        2          4   1388663494   1388660127      9   3182  72083            1 gabor-vona-visits… showtopic  
    #>  9    89 7b4bea0fa2… Liberal Degenerat… /index.php?app=for…        2       2170   1431658980   1431533699     30   3751  87110            4 liberal-degenerat… <NA>       
    #> 10    90 f5578cdeac… Iron March Charte… /index.php?app=for…        2       2170   1432309218   1432177523      2   5130 113172            5 iron-march-charte… <NA>       
    #> # … with 13 more rows
    #> 
    #> $orig_rc_status
    #> # A tibble: 3 x 8
    #>   status title        points_per_report minutes_to_apoint is_new is_complete is_active rorder
    #>    <int> <chr>        <lgl>                         <dbl> <lgl>  <lgl>       <lgl>      <int>
    #> 1      1 New Report   TRUE                              5 TRUE   FALSE       TRUE           1
    #> 2      2 Under Review TRUE                              5 FALSE  FALSE       TRUE           2
    #> 3      3 Complete     FALSE                             0 FALSE  TRUE        FALSE          3
    #> 
    #> $orig_rc_status_sev
    #> # A tibble: 11 x 4
    #>       id status points img                                            
    #>    <int>  <int>  <int> <chr>                                          
    #>  1     1      1      1 style_extra/report_icons/flag_gray.png         
    #>  2     2      1      2 style_extra/report_icons/flag_blue.png         
    #>  3     3      1      4 style_extra/report_icons/flag_green.png        
    #>  4     4      1      7 style_extra/report_icons/flag_orange.png       
    #>  5     5      1     12 style_extra/report_icons/flag_red.png          
    #>  6     6      2      1 style_extra/report_icons/flag_gray_review.png  
    #>  7     7      3      0 style_extra/report_icons/completed.png         
    #>  8     8      2      2 style_extra/report_icons/flag_blue_review.png  
    #>  9     9      2      4 style_extra/report_icons/flag_green_review.png 
    #> 10    10      2      7 style_extra/report_icons/flag_orange_review.png
    #> 11    11      2     12 style_extra/report_icons/flag_red_review.png   
    #> 
    #> $orig_reputation_cache
    #> # A tibble: 55 x 5
    #>           id type_id rep_points rep_like_cache                                                                                                         cache_date         
    #>        <dbl>   <int>      <int> <chr>                                                                                                                  <dttm>             
    #>  1 2.81e-317  117582          0 "a:2:{s:10:\"cache_data\";a:0:{}s:12:\"cache_expire\";i:1458804537;}"                                                  2016-03-23 07:28:57
    #>  2 2.81e-317  117681          0 "a:2:{s:10:\"cache_data\";a:0:{}s:12:\"cache_expire\";i:1458804537;}"                                                  2016-03-23 07:28:57
    #>  3 2.81e-317  117682          0 "a:2:{s:10:\"cache_data\";a:0:{}s:12:\"cache_expire\";i:1458804537;}"                                                  2016-03-23 07:28:57
    #>  4 2.81e-317  117695          0 "a:2:{s:10:\"cache_data\";a:0:{}s:12:\"cache_expire\";i:1458804537;}"                                                  2016-03-23 07:28:57
    #>  5 2.81e-317  117702          0 "a:2:{s:10:\"cache_data\";a:0:{}s:12:\"cache_expire\";i:1458804537;}"                                                  2016-03-23 07:28:57
    #>  6 2.49e-317  117573          2 "a:2:{s:10:\"cache_data\";a:6:{s:3:\"app\";s:6:\"forums\";s:4:\"type\";s:3:\"pid\";s:2:\"id\";s:6:\"117573\";s:5:\"co… 2016-03-23 07:28:57
    #>  7 2.81e-317  117578          1 "a:2:{s:10:\"cache_data\";a:6:{s:3:\"app\";s:6:\"forums\";s:4:\"type\";s:3:\"pid\";s:2:\"id\";s:6:\"117578\";s:5:\"co… 2016-03-23 07:28:57
    #>  8 2.81e-317  117577          2 "a:2:{s:10:\"cache_data\";a:6:{s:3:\"app\";s:6:\"forums\";s:4:\"type\";s:3:\"pid\";s:2:\"id\";s:6:\"117577\";s:5:\"co… 2016-03-23 07:28:57
    #>  9 2.81e-317  117576          0 "a:2:{s:10:\"cache_data\";a:0:{}s:12:\"cache_expire\";i:1458804537;}"                                                  2016-03-23 07:28:57
    #> 10 3.84e-317  147832          0 "a:2:{s:10:\"cache_data\";a:0:{}s:12:\"cache_expire\";i:1458714276;}"                                                  2016-03-22 06:24:36
    #> # … with 45 more rows
    #> 
    #> $orig_reputation_index
    #> # A tibble: 141,550 x 6
    #>             id member_id app    type  type_id rep_date           
    #>          <dbl>     <int> <chr>  <chr>   <int> <dttm>             
    #>  1 Inf.Nae-324        14 forums pid         4 2011-09-13 23:02:39
    #>  2   1.50e-323        14 forums pid       124 2011-09-14 20:30:25
    #>  3   2.00e-323        13 forums pid       119 2011-09-14 21:57:39
    #>  4   2.50e-323         9 forums pid       180 2011-09-15 16:49:00
    #>  5   6.31e-321        11 forums pid      8457 2012-01-28 19:41:56
    #>  6   3.50e-323         3 forums pid       182 2011-09-15 23:40:19
    #>  7   4.00e-323         3 forums pid       213 2011-09-16 03:46:29
    #>  8   4.50e-323         9 forums pid       227 2011-09-16 07:07:43
    #>  9   2.35e-322        41 forums pid      1170 2011-09-29 08:03:42
    #> 10   5.50e-323        13 forums pid       293 2011-09-16 22:35:02
    #> # … with 141,540 more rows
    #> 
    #> $orig_reputation_levels
    #> # A tibble: 5 x 3
    #>   level_id level_points level_title
    #>      <int>        <int> <chr>      
    #> 1        1          -20 Bad        
    #> 2        2          -10 Poor       
    #> 3        3            0 Neutral    
    #> 4        4           10 Good       
    #> 5        5           20 Excellent  
    #> 
    #> $orig_reputation_totals
    #> # A tibble: 145,845 x 4
    #>    rt_key                           rt_app_type                      rt_total rt_type_id
    #>    <chr>                            <chr>                               <int>      <int>
    #>  1 f569df187fe4fb506119366eb62767f0 a17de1b4e5015b2ca6ba5cb6ca3b488d        2          3
    #>  2 4541627f84f4558678ebfd2c23fcc983 a17de1b4e5015b2ca6ba5cb6ca3b488d        1          4
    #>  3 36ee8a9877305932043b8e83f0d48f77 a17de1b4e5015b2ca6ba5cb6ca3b488d        1         15
    #>  4 9629b004883a463f9caaa0245d835add a17de1b4e5015b2ca6ba5cb6ca3b488d        1         35
    #>  5 9679d18bb14119059ad833a65bef5728 a17de1b4e5015b2ca6ba5cb6ca3b488d        1         43
    #>  6 0cac233272c7966e1227ba401fe2d861 a17de1b4e5015b2ca6ba5cb6ca3b488d        4         46
    #>  7 a378e216c62e758dac8361a5a04f7a08 a17de1b4e5015b2ca6ba5cb6ca3b488d        3         54
    #>  8 99e865095aab71ffb7f96591f1926e68 a17de1b4e5015b2ca6ba5cb6ca3b488d        1         67
    #>  9 d1c7f59602e6b8be00c2cdd0a9e1cbdb a17de1b4e5015b2ca6ba5cb6ca3b488d        1         78
    #> 10 55a9e27a0cf8c5c536152c9a3fcae189 a17de1b4e5015b2ca6ba5cb6ca3b488d        2         97
    #> # … with 145,835 more rows
    #> 
    #> $orig_search_keywords
    #> # A tibble: 20,079 x 2
    #>    keyword                                                                                                                                                           count
    #>    <chr>                                                                                                                                                             <int>
    #>  1 #jesuiscouteau ironmarch.org                                                                                                                                          1
    #>  2 #rekt gif                                                                                                                                                             1
    #>  3 #shrekt                                                                                                                                                               1
    #>  4 &#036;hre.kersan.photo                                                                                                                                                1
    #>  5 &#39;craig fraser&#39; sigurd                                                                                                                                         1
    #>  6 &#39;elementos - urkultur                                                                                                                                             1
    #>  7 &#39;Hammer of the Patriot A handbook By Charles Chapel.                                                                                                              1
    #>  8 &#39;the whole of National Socialism [the Nazi political philosophy] is based on Marxism.                                                                             1
    #>  9 &gt;I am a fierce goddess warrior who embraces the human spirit fully. I believe we&#39;re all equals, but that womyn have a special insight on the human condit…     1
    #> 10 &quot; central Asian albinos&quot;                                                                                                                                    1
    #> # … with 20,069 more rows
    #> 
    #> $orig_search_sessions
    #> # A tibble: 1,274 x 5
    #>    session_id              session_created     session_updated     session_member_… session_data                                                                          
    #>    <chr>                   <dttm>              <dttm>                         <int> <chr>                                                                                 
    #>  1 6e420afb24d93b4be3b7d1… 2016-03-21 01:39:32 2016-03-21 01:39:32                0 "a:1:{s:18:\"search_app_filters\";N;}"                                                
    #>  2 d7f949091d1eb1519316b0… 2016-03-21 03:59:10 2016-03-21 03:59:10                0 "a:1:{s:18:\"search_app_filters\";a:1:{s:6:\"forums\";a:3:{s:11:\"searchInKey\";s:0:\…
    #>  3 8e9e710abf320faf2e0c22… 2016-03-21 00:30:03 2016-03-21 00:30:03                0 "a:1:{s:18:\"search_app_filters\";N;}"                                                
    #>  4 9271fa2f10b4185972cd6c… 2016-03-21 00:30:39 2016-03-21 00:30:40             6113 "a:1:{s:18:\"search_app_filters\";N;}"                                                
    #>  5 42c32a7f77bc2c1a455310… 2016-03-21 02:52:17 2016-03-21 02:52:17                0 "a:1:{s:18:\"search_app_filters\";a:1:{s:6:\"forums\";a:3:{s:11:\"searchInKey\";s:0:\…
    #>  6 51255c2817137efa446903… 2016-03-20 14:13:22 2016-03-20 14:13:23                0 "a:1:{s:18:\"search_app_filters\";N;}"                                                
    #>  7 c82c6c8102f35030877b89… 2016-03-20 15:38:41 2016-03-20 15:38:41                0 "a:1:{s:18:\"search_app_filters\";N;}"                                                
    #>  8 8d8a85409816c2eb870207… 2016-03-20 15:40:02 2016-03-20 15:40:02                0 "a:1:{s:18:\"search_app_filters\";N;}"                                                
    #>  9 ee348f4d0aa10188f3cbb7… 2016-03-21 06:46:55 2016-03-21 06:46:55                0 "a:1:{s:18:\"search_app_filters\";N;}"                                                
    #> 10 e181d0d6387affe28077b7… 2016-03-20 21:21:33 2016-03-20 21:21:36                0 "a:1:{s:18:\"search_app_filters\";N;}"                                                
    #> # … with 1,264 more rows
    #> 
    #> $orig_search_visitors
    #> # A tibble: 696 x 6
    #>       id member date                engine keywords                                       url                                                                             
    #>    <int>  <int> <dttm>              <chr>  <chr>                                          <chr>                                                                           
    #>  1 42351      0 2016-02-18 17:59:40 Google file:///porn/288/public/liked.php              showuser=288&tab=reputation&app_tab=forums&type=received&st=585                 
    #>  2 42352      0 2016-02-18 19:28:31 Bing   evola yuga                                     showuser=7508&tab=reputation&app_tab=forums&type=received&st=15                 
    #>  3 42353      0 2016-02-18 19:28:32 Bing   evola yuga                                     showuser=7508&tab=reputation&app_tab=forums&type=received&st=15                 
    #>  4 42354      0 2016-02-18 20:08:43 Bing   pros and cons of authorian government          showtopic=2869                                                                  
    #>  5 42355      0 2016-02-18 20:55:28 Google fascist authors                                showtopic=92                                                                    
    #>  6 42356      0 2016-02-18 21:15:31 Google Light skin vs shitskin                         showtopic=5378                                                                  
    #>  7 42357      0 2016-02-18 21:27:47 Google sigurd legion                                  showtopic=4447                                                                  
    #>  8 42358      0 2016-02-19 00:17:57 Bing   were there any reported rapes during the holo… showtopic=2064                                                                  
    #>  9 42359      0 2016-02-19 03:05:49 Google kike on a stick                                app=core&module=search&do=search&search_tags=muh%2Bkike%2Bon%2Ba%2Bstick&search…
    #> 10 42360      0 2016-02-19 06:37:51 Google Ironmarch chinese in africa                    showtopic=206                                                                   
    #> # … with 686 more rows
    #> 
    #> $orig_sessions
    #> # A tibble: 240 x 19
    #>    id    member_name seo_name member_id ip_address browser running_time login_type member_group location_1_type location_1_id location_2_type location_2_id
    #>    <chr> <chr>       <chr>        <int> <chr>      <chr>          <int> <lgl>             <int> <chr>                   <int> <chr>                   <int>
    #>  1 60f2… <NA>        <NA>             0 166.137.1… Mozill…   1458838967 FALSE                 2 topic                    2333 forum                       0
    #>  2 ca7c… <NA>        <NA>             0 180.76.15… Mozill…   1458840813 FALSE                 2 <NA>                        0 <NA>                        0
    #>  3 b6a6… Goeth       goeth         9363 99.92.244… Mozill…   1458838996 FALSE                13 <NA>                        0 forum                      10
    #>  4 828d… GladiumSpi… gladium…      9634 45.21.34.… Mozill…   1458839012 FALSE                13 <NA>                        0 <NA>                        0
    #>  5 d356… <NA>        <NA>             0 180.76.15… Mozill…   1458843698 FALSE                 2 <NA>                        0 <NA>                        0
    #>  6 5451… <NA>        <NA>             0 213.205.2… Mozill…   1458843368 FALSE                 2 <NA>                        0 <NA>                        0
    #>  7 869d… <NA>        <NA>             0 97.67.240… Mozill…   1458842942 FALSE                 2 topic                     336 forum                       0
    #>  8 afd3… <NA>        <NA>             0 86.3.91.23 Mozill…   1458842308 FALSE                 2 topic                    2415 forum                       0
    #>  9 2cc2… <NA>        <NA>             0 91.144.13… Wget/1…   1458837947 FALSE                 2 topic                    3306 forum                       0
    #> 10 7082… <NA>        <NA>             0 212.21.66… Mozill…   1458839341 FALSE                 2 <NA>                        0 <NA>                        0
    #> # … with 230 more rows, and 6 more variables: current_appcomponent <chr>, current_module <chr>, current_section <chr>, uagent_key <chr>, uagent_version <chr>,
    #> #   uagent_type <chr>
    #> 
    #> $orig_skin_cache
    #> # A tibble: 350 x 17
    #>    cache_id cache_updated       cache_type cache_set_id cache_key_1 cache_value_1 cache_key_2 cache_value_2 cache_value_3 cache_content cache_key_3 cache_key_4
    #>       <int> <dttm>              <chr>             <int> <chr>       <chr>         <chr>       <chr>         <chr>         <chr>         <chr>       <chr>      
    #>  1     3022 2014-10-26 19:34:17 replaceme…            0 <NA>        <NA>          <NA>        <NA>          <NA>          "a:89:{s:10:… <NA>        <NA>       
    #>  2     3023 2014-10-26 19:35:36 phptempla…            1 group       skin_boards   <NA>        <NA>          <NA>          "class skin_… <NA>        <NA>       
    #>  3     3028 2014-10-26 19:35:36 phptempla…            1 group       skin_global_… <NA>        <NA>          <NA>          "class skin_… <NA>        <NA>       
    #>  4     3024 2014-10-26 19:35:36 phptempla…            1 group       skin_editors  <NA>        <NA>          <NA>          "class skin_… <NA>        <NA>       
    #>  5     3026 2014-10-26 19:35:36 phptempla…            1 group       skin_forum    <NA>        <NA>          <NA>          "class skin_… <NA>        <NA>       
    #>  6     3027 2014-10-26 19:35:36 phptempla…            1 group       skin_global   <NA>        <NA>          <NA>          "class skin_… <NA>        <NA>       
    #>  7     3025 2014-10-26 19:35:36 phptempla…            1 group       skin_emails   <NA>        <NA>          <NA>          "class skin_… <NA>        <NA>       
    #>  8     3030 2014-10-26 19:35:36 phptempla…            1 group       skin_help     <NA>        <NA>          <NA>          "class skin_… <NA>        <NA>       
    #>  9     3033 2014-10-26 19:35:36 phptempla…            1 group       skin_messagi… <NA>        <NA>          <NA>          "class skin_… <NA>        <NA>       
    #> 10     3031 2014-10-26 19:35:36 phptempla…            1 group       skin_legends  <NA>        <NA>          <NA>          "class skin_… <NA>        <NA>       
    #> # … with 340 more rows, and 5 more variables: cache_value_4 <chr>, cache_key_5 <chr>, cache_value_5 <chr>, cache_key_6 <chr>, cache_value_6 <chr>
    #> 
    #> $orig_skin_collections
    #> # A tibble: 4 x 15
    #>   set_id set_name set_key set_is_default set_author_name set_author_url set_image_dir set_css_groups set_added set_output_form… set_locked_uage… set_hide_from_l…
    #>    <int> <chr>    <chr>   <lgl>          <chr>           <chr>          <chr>         <chr>              <int> <chr>            <chr>            <lgl>           
    #> 1      1 IP.Board default FALSE          Invision Power… http://www.in… master        "a:15:{s:5:\"…    1.31e9 html              <NA>            TRUE            
    #> 2      2 IP.Boar… mobile  FALSE          Invision Power… http://www.in… mobile        "a:5:{s:5:\"1…    1.31e9 html             "a:2:{s:6:\"gro… TRUE            
    #> 3      6 IP.Boar… xmlskin FALSE          Invision Power… http://www.in… master        "a:15:{s:5:\"…    1.37e9 xml               <NA>            FALSE           
    #> 4      9 ironmar… ipbfsC… TRUE           <NA>            <NA>           ironmarch345  "a:16:{s:5:\"…    0.     html              <NA>            FALSE           
    #> # … with 3 more variables: set_minify <lgl>, set_master_key <chr>, set_order <int>
    #> 
    #> $orig_skin_css
    #> # A tibble: 50 x 11
    #>    css_id css_set_id css_updated css_group   css_content                                  css_position css_app css_app_hide css_attributes      css_modules css_master_key
    #>     <int>      <int>       <int> <chr>       <chr>                                               <int> <chr>   <lgl>        <chr>               <chr>       <chr>         
    #>  1    195          0  1414352049 ipb_ucp     "/*****************************************…            1 core    TRUE         "title=\"Main\" me… usercp      root          
    #>  2    186          0  1414352049 ipb_ckedit… "/*****************************************…            1 core    TRUE         "title=\"Main\" me… <NA>        root          
    #>  3    187          0  1414352049 ipb_common  "/*****************************************…            1 core    FALSE        "title=\"Main\" me… <NA>        root          
    #>  4    188          0  1414352049 ipb_editor  "/*****************************************…            1 core    TRUE         "title=\"Main\" me… <NA>        root          
    #>  5    189          0  1414352049 ipb_help    "/*****************************************…            0 core    FALSE        "title=\"Main\" me… help        root          
    #>  6    190          0  1414352049 ipb_ie      "/*****************************************…            0 core    FALSE         <NA>               <NA>        root          
    #>  7    191          0  1414352049 ipb_login_… "/*****************************************…            1 core    TRUE         "title=\"Main\" me… global      root          
    #>  8    192          0  1414352049 ipb_print   "* {\n\tfont-family: Georgia, \"Times New R…            1 core    FALSE        "media=\"print\""   <NA>        root          
    #>  9    193          0  1414352049 ipb_search  "/*****************************************…            2 core    TRUE         "title=\"Main\" me… search      root          
    #> 10    194          0  1414352049 ipb_styles  "/*****************************************…            1 core    FALSE        "title=\"Main\" me… <NA>        root          
    #> # … with 40 more rows
    #> 
    #> $orig_skin_css_previous
    #> # A tibble: 35 x 7
    #>    p_css_id p_css_group    p_css_content                                                                p_css_app p_css_attributes          p_css_modules p_css_master_key
    #>       <int> <chr>          <chr>                                                                        <chr>     <chr>                     <chr>         <chr>           
    #>  1        1 ipb_ucp        "/************************************************************************/… core      "title=\"Main\" media=\"… usercp        root            
    #>  2        2 ipb_ckeditor   "/***************************************************************/\n/* IP.B… core      "title=\"Main\" media=\"… <NA>          root            
    #>  3        3 ipb_common     "/************************************************************************/… core      "title=\"Main\" media=\"… <NA>          root            
    #>  4        4 ipb_editor     "/***************************************************************/\n/* IP.B… core      "title=\"Main\" media=\"… <NA>          root            
    #>  5        5 ipb_help       "/************************************************************************/… core      "title=\"Main\" media=\"… help          root            
    #>  6        6 ipb_ie         "/********************************************/\n/* IE6 SPECIFIC */\n/*****… core       <NA>                     <NA>          root            
    #>  7        7 ipb_login_reg… "/************************************************************************/… core      "title=\"Main\" media=\"… global        root            
    #>  8        8 ipb_print      "* {\n\tfont-family: Georgia, \"Times New Roman\", serif;\n}\n\nhtml #conte… core      "media=\"print\""         <NA>          root            
    #>  9        9 ipb_search     "/************************************************************************/… core      "title=\"Main\" media=\"… search        root            
    #> 10       10 ipb_styles     "/************************************************************************/… core      "title=\"Main\" media=\"… <NA>          root            
    #> # … with 25 more rows
    #> 
    #> $orig_skin_replacements
    #> # A tibble: 201 x 6
    #>    replacement_id replacement_key   replacement_content                                                    replacement_set_id replacement_added_to replacement_master_key
    #>             <int> <chr>             <chr>                                                                               <int>                <int> <chr>                 
    #>  1              1 add_folder        <img src='{style_image_url}/folder_add.png' alt='{lang:add_folder}' />                  0                    0 root                  
    #>  2              2 add_friend        <img src='{style_image_url}/user_add.png' alt='{lang:add_friend}' />                    0                    0 root                  
    #>  3              3 add_poll_choice   <img src='{style_image_url}/add.png' alt='+' />                                         0                    0 root                  
    #>  4              4 add_poll_question <img src='{style_image_url}/add.png' alt='+' />                                         0                    0 root                  
    #>  5              5 blog_add_entry    <img src='{style_image_url}/blog/book_add.png' alt='+' />                               0                    0 root                  
    #>  6              6 blog_banish       <img src='{style_image_url}/blog/layout_delete.png' alt='' />                           0                    0 root                  
    #>  7              7 blog_blocks       <img src='{style_image_url}/blog/layout_add.png' alt='' />                              0                    0 root                  
    #>  8              8 blog_blog         <img src='{style_image_url}/blog/blog.png' alt='' />                                    0                    0 root                  
    #>  9              9 blog_category     <img src='{style_image_url}/folder.png' alt='-' />                                      0                    0 root                  
    #> 10             10 blog_comments     <img src='{style_image_url}/blog/comments.png' alt='' />                                0                    0 root                  
    #> # … with 191 more rows
    #> 
    #> $orig_skin_templates
    #> # A tibble: 1,002 x 12
    #>    template_id template_set_id template_group template_content template_name template_data template_updated template_remova… template_added_… template_user_a…
    #>          <int>           <int> <chr>          <chr>            <chr>         <chr>                    <int> <lgl>                       <int> <lgl>           
    #>  1        3389               0 skin_stats     "<h1 class='ips… top_posters   "$rows"             1414352049 FALSE                           0 FALSE           
    #>  2        3388               0 skin_stats     "<if test=\"has… group_strip   "$group=\"\"…       1414352049 FALSE                           0 FALSE           
    #>  3        3385               0 skin_search    "<div class='re… searchRowGen… "$r, $result…       1414352049 FALSE                           0 FALSE           
    #>  4        3386               0 skin_search    "<if test=\"whi… topicPostSea… "$data, $res…       1414352049 FALSE                           0 FALSE           
    #>  5        3387               0 skin_search    "<php>\n\t$date… userPostsView "$results, $…       1414352049 FALSE                           0 FALSE           
    #>  6        3384               0 skin_search    "<input type='h… searchResult… "$results, $…       1414352049 FALSE                           0 FALSE           
    #>  7        3382               0 skin_search    "{parse stripin… searchResults "$results, $…       1414352049 FALSE                           0 FALSE           
    #>  8        3383               0 skin_search    "{parse js_modu… searchResult… "$results, $…       1414352049 FALSE                           0 FALSE           
    #>  9        3381               0 skin_search    "<style type='t… searchAdvanc… "$filters=''…       1414352049 FALSE                           0 FALSE           
    #> 10        3377               0 skin_search    "<php>\n$st = I… helpSearchRe… "$r, $result…       1414352049 FALSE                           0 FALSE           
    #> # … with 992 more rows, and 2 more variables: template_user_edited <lgl>, template_master_key <chr>
    #> 
    #> $orig_skin_templates_previous
    #> # A tibble: 786 x 6
    #>    p_template_id p_template_group p_template_content                                 p_template_name    p_template_data                                  p_template_maste…
    #>            <int> <chr>            <chr>                                              <chr>              <chr>                                            <chr>            
    #>  1             1 skin_stats       "<h1 class='ipsType_pagetitle'>{$this->lang->word… top_posters        "$rows"                                          root             
    #>  2             2 skin_stats       "<if test=\"hasPaginationTop:|:$pagination\">\n\t… group_strip        "$group=\"\", $members=array(), $pagination=''"  root             
    #>  3             3 skin_search      "<div class='result_info'>\n\t<h3>{$r['content_ti… searchRowGenericF… "$r, $resultAsTitle=false"                       root             
    #>  4             4 skin_search      "<if test=\"whichWayToGo:|:$resultAsTitle\">\n\t{… topicPostSearchRe… "$data, $resultAsTitle=false"                    root             
    #>  5             5 skin_search      "<php>\n\t$datecut = ( $this->settings['search_uc… userPostsView      "$results, $pagination, $total, $member, $limit… root             
    #>  6             6 skin_search      "<input type='hidden' name=\"usedInJsLater\" id=\… searchResultsWrap… "$results, $sortDropDown, $sortIn, $pagination,… root             
    #>  7             7 skin_search      "{parse striping=\"searchStripe\" classes=\"row1,… searchResults      "$results, $titlesOnly"                          root             
    #>  8             8 skin_search      "{parse js_module=\"forums\"}\n<if test=\"asTawpi… searchResultsAsFo… "$results, $titlesOnly"                          root             
    #>  9             9 skin_search      "<style type='text/css'>\n \t@import url('{$this-… searchAdvancedForm "$filters='', $msg='', $current_app, $removed_s… root             
    #> 10            10 skin_search      "<span class='icon'>\n\t{parse template=\"userSma… memberSearchResult "$r, $resultAsTitle=false"                       root             
    #> # … with 776 more rows
    #> 
    #> $orig_spam_service_log
    #> # A tibble: 97 x 5
    #>       id log_date            log_code email_address                 ip_address    
    #>    <int> <dttm>                 <int> <chr>                         <chr>         
    #>  1  9891 2016-03-03 05:59:36        1 shadoomoken@hotmail.com       64.150.252.208
    #>  2  9890 2016-03-03 01:03:48        1 jeff.foxworthy.1488@gmail.com 93.72.237.41  
    #>  3  9889 2016-03-03 00:46:47        1 tinobraga101@gmail.com        24.78.212.91  
    #>  4  9888 2016-03-02 14:39:36        1 notcute@gmail.com             46.233.9.234  
    #>  5  9887 2016-03-02 13:09:17        1 caleb133.me@hotmail.com       58.110.49.210 
    #>  6  9886 2016-03-02 12:46:44        1 count_dusseldorf@yahoo.com    74.128.184.174
    #>  7  9885 2016-03-01 13:26:57        1 hatecrime.jonez@gmail.com     172.58.40.119 
    #>  8  9884 2016-03-01 06:11:21        1 caseyjcooper2012@gmail.com    73.82.53.143  
    #>  9  9883 2016-03-01 04:52:06        1 adil902@hotmail.com           90.229.153.151
    #> 10  9882 2016-03-01 02:52:46        1 douglas@blaglab.com           203.12.30.50  
    #> # … with 87 more rows
    #> 
    #> $orig_task_logs
    #> # A tibble: 18,240 x 5
    #>    log_id log_title                      log_date            log_ip          log_desc                                           
    #>     <int> <chr>                          <dttm>              <chr>           <chr>                                              
    #>  1 551033 Archiver                       2016-01-28 09:18:11 82.145.209.174  0 items archived                                   
    #>  2 551034 Daily Topic &amp; Forum Digest 2016-01-28 09:22:36 72.169.96.56    Daily Topic & Forum Digest Sent                    
    #>  3 551032 RSS Import Update              2016-01-28 09:09:13 174.4.165.99    RSS Import completed (0)                           
    #>  4 551031 Archiver                       2016-01-28 09:03:25 69.143.99.235   0 items archived                                   
    #>  5 551030 Daily Topic &amp; Forum Digest 2016-01-28 09:02:25 101.173.1.158   Daily Topic & Forum Digest Sent                    
    #>  6 551029 Clean Up MySQL                 2016-01-28 09:02:16 104.238.169.29  Cleaned up sleeping mysql processes                
    #>  7 551028 Hourly Clean Out               2016-01-28 08:54:08 46.177.178.59   Old reg_images, sessions and search results removed
    #>  8 551027 Archiver                       2016-01-28 08:48:05 212.93.218.213  0 items archived                                   
    #>  9 551026 Daily Topic &amp; Forum Digest 2016-01-28 08:42:06 195.156.244.164 Daily Topic & Forum Digest Sent                    
    #> 10 551025 RSS Import Update              2016-01-28 08:38:16 46.177.178.59   RSS Import completed (0)                           
    #> # … with 18,230 more rows
    #> 
    #> $orig_task_manager
    #> # A tibble: 28 x 15
    #>    task_id task_title task_file task_next_run task_week_day task_month_day task_hour task_minute task_cronkey task_log task_description task_enabled task_key
    #>      <int> <chr>      <chr>             <int>         <int>          <int>     <int>       <int> <chr>        <lgl>    <chr>            <lgl>        <chr>   
    #>  1       1 Hourly Cl… cleanout…    1458844680            -1             -1        -1          59 c86e4fce9ea… TRUE     Kill old sessio… TRUE         cleanout
    #>  2       2 Content C… contentc…    1458874800            -1             -1         3           0 ed109382749… TRUE     Removes old con… TRUE         content…
    #>  3       3 Item Mark… itemmark…    1458864000            -1             -1         0           0 e86f06abc2c… TRUE     Cleans out &#39… TRUE         itemmar…
    #>  4       4 Prune Logs logprune…    1459058400            -1             27         6           0 89e1afc4024… TRUE     This task will … TRUE         logprune
    #>  5       5 Clean Up … mysqlcle…    1458845400            -1             -1        -1          30 2a192045a26… TRUE     Cleans up sleep… TRUE         mysqlcl…
    #>  6      24 Archiver   archive.…    1458844560            -1             -1        -1          15 65b2fa32944… TRUE     Task to archive… TRUE         core_ar…
    #>  7       7 Optimize … optimize…    1458878400            -1             -1         4           0 68607053553… TRUE     Task runs once … TRUE         optimiz…
    #>  8       8 POP3 Inco… pop3emai…    1315842488            -1             -1        -1          30 35c4cff4ea0… FALSE    Polls a POP3 ac… FALSE        pop3ema…
    #>  9       9 Daily Sta… rebuilds…    1458864000            -1             -1         0           0 8a29604e940… TRUE     Rebuilds board … TRUE         rebuild…
    #> 10      10 Send Bulk… bulkmail…    1374129660            -1             -1        -1          -1 7e09800dd1a… FALSE    Dynamically ass… FALSE        bulkmail
    #> # … with 18 more rows, and 2 more variables: task_safemode <lgl>, task_application <chr>
    #> 
    #> $orig_topic_ratings
    #> # A tibble: 17 x 5
    #>    rating_id rating_tid rating_member_id rating_value rating_ip_address
    #>        <int>      <int>            <int>        <int> <chr>            
    #>  1         1       4287             1558            5 83.233.70.12     
    #>  2         2       4287              958            5 188.228.43.35    
    #>  3         3       4287             6359            5 69.35.163.246    
    #>  4         4       4287             7888            5 54.87.97.146     
    #>  5         5       4287                7            5 91.125.204.107   
    #>  6         6       4287              125            5 77.38.156.66     
    #>  7         7       4287             2820            5 99.249.195.215   
    #>  8         8       4287             2306            5 88.193.135.245   
    #>  9         9       4287             6310            5 75.157.149.158   
    #> 10        10       5869             9679            5 66.169.97.70     
    #> 11        11       5869             6113            5 74.65.55.196     
    #> 12        12       5869             9568            5 58.7.200.210     
    #> 13        13       5869             1558            1 83.233.71.27     
    #> 14        14       5869             7600            5 24.51.110.134    
    #> 15        15       5869             6249            5 108.71.197.158   
    #> 16        16       5869             9388            5 86.93.229.17     
    #> 17        17       5869             9769            5 92.18.10.232     
    #> 
    #> $orig_topics
    #> # A tibble: 5,073 x 27
    #>      tid title state posts starter_id start_date          last_poster_id last_post           icon_id starter_name last_poster_name poll_state last_vote views forum_id
    #>    <int> <chr> <chr> <int>      <int> <dttm>                       <int> <dttm>              <lgl>   <chr>        <chr>            <chr>          <int> <int>    <int>
    #>  1  5182 "Hei… clos…     8       9491 2015-05-20 07:29:54           7504 2015-05-20 19:12:06 NA      "ManAmongth… "Krsnik"         0                  0   467       11
    #>  2     3 "The… clos…    50          1 2011-09-13 01:06:06             16 2012-01-04 03:27:02 NA      "Ð\u0090Ð»Ð… "Talleyrand"     0                  0  5336        2
    #>  3  3674 "â€œ… open     11       7346 2014-03-01 23:36:53             49 2014-03-05 00:58:25 NA      "thecolonel" "Vladimir"       0                  0  1559       97
    #>  4     7 "Sup… clos…     0          1 2011-09-13 09:47:48              1 2011-09-13 09:47:48 NA      "Ð\u0090Ð»Ð… "Ð\u0090Ð»ÐµÐºÑ… 0                  0  1134       61
    #>  5     8 "Wha… clos…     0          1 2011-09-13 09:52:23              1 2011-09-13 09:52:23 NA      "Ð\u0090Ð»Ð… "Ð\u0090Ð»ÐµÐºÑ… 0                  0  2071       87
    #>  6     9 "Wha… clos…     0          1 2011-09-13 09:55:16              1 2011-09-13 09:55:16 NA      "Ð\u0090Ð»Ð… "Ð\u0090Ð»ÐµÐºÑ… 0                  0  1839       88
    #>  7  5167 "The… open     13       6321 2015-05-16 18:16:41           6269 2015-05-18 01:40:21 NA      "Culius Jae… "Another Americ… 0                  0   715       26
    #>  8  5168 "Chi… open     19       7508 2015-05-16 22:42:30           7508 2016-01-23 15:37:12 NA      "RIGHT WING… "RIGHT WING DEA… 0                  0  1306       13
    #>  9    11 "Rag… open    752          1 2011-09-13 10:23:27           9571 2015-09-12 00:38:13 NA      "Ð\u0090Ð»Ð… "Captain Oaklea… 0                  0 42055       99
    #> 10  4306 "Vol… open      2          1 2014-09-22 19:22:56              1 2014-09-22 20:30:05 NA      "Ð\u0090Ð»Ð… "Ð\u0090Ð»ÐµÐºÑ… 0                  0   615      160
    #> # … with 5,063 more rows, and 12 more variables: approved <int>, author_mode <lgl>, pinned <lgl>, topic_hasattach <int>, topic_firstpost <int>, topic_rating_total <int>,
    #> #   topic_rating_hits <int>, title_seo <chr>, seo_last_name <chr>, seo_first_name <chr>, tdelete_time <int>, last_real_post <dttm>
    #> 
    #> $orig_upgrade_history
    #> # A tibble: 68 x 6
    #>    upgrade_id upgrade_version_id upgrade_version_human upgrade_date        upgrade_mid upgrade_app
    #>         <int>              <int> <chr>                 <dttm>              <lgl>       <chr>      
    #>  1          1              32005 3.2.2                 NA                  FALSE       core       
    #>  2          2              32005 3.2.2                 NA                  FALSE       members    
    #>  3          3              32005 3.2.2                 NA                  FALSE       forums     
    #>  4          4              32006 3.2.3                 2013-07-20 14:15:55 FALSE       core       
    #>  5          5              33000 3.3.0 Alpha 1         2013-07-20 14:16:45 FALSE       core       
    #>  6          6              33006 3.3.0 Alpha 2         2013-07-20 14:16:47 FALSE       core       
    #>  7          7              33007 3.3.0 Beta 1          2013-07-20 14:16:50 FALSE       core       
    #>  8          8              33008 3.3.0 Beta 2          2013-07-20 14:16:53 FALSE       core       
    #>  9          9              33009 3.3.0 Beta 3          2013-07-20 14:16:57 FALSE       core       
    #> 10         10              33010 3.3.0 Beta 4          2013-07-20 14:17:02 FALSE       core       
    #> # … with 58 more rows
    #> 
    #> $orig_validating
    #> # A tibble: 19 x 9
    #>    vid                              member_id real_group temp_group entry_date          lost_pass new_reg ip_address     user_verified
    #>    <chr>                                <int>      <int>      <int> <dttm>              <lgl>     <lgl>   <chr>          <lgl>        
    #>  1 213206515dad4a6af9def3cc176390ca      9571         13         13 2016-02-08 02:38:29 TRUE      FALSE   108.219.107.29 FALSE        
    #>  2 28f2c3b68740a42723478aab68e46530      9955          3          1 2016-03-16 20:13:58 FALSE     TRUE    91.159.112.166 TRUE         
    #>  3 77b98b6544584e339fc6897c3d105f54      6208         13         13 2016-01-26 04:01:15 TRUE      FALSE   68.6.168.190   FALSE        
    #>  4 6cf7021c18a5d98184862a23ae318e48      9800         13         13 2016-03-21 15:56:10 TRUE      FALSE   93.138.98.250  FALSE        
    #>  5 f6015c2d4a76e1f55e71c1f4440236d0      9780         13         13 2016-03-23 21:14:46 TRUE      FALSE   73.52.78.42    FALSE        
    #>  6 3a07d37f3f454ec6cbfc605fb82bf8e5      9211         13         13 2016-02-04 14:11:54 TRUE      FALSE   176.23.4.227   FALSE        
    #>  7 f013d8c3cd0e8f1c34d1810005de3138      9112         13         13 2016-03-18 20:58:14 TRUE      FALSE   66.211.247.238 FALSE        
    #>  8 bd80381a7648547182e817df65b021d8      9916          3          3 2016-03-02 03:06:15 TRUE      FALSE   24.150.209.35  FALSE        
    #>  9 fa746334a9a9a12a0999dc77ee372659      9303         13         13 2016-03-04 21:59:12 TRUE      FALSE   154.20.14.79   FALSE        
    #> 10 e4dbae4833ea08475bb7cd6a12969259      9666         13         13 2016-03-05 15:09:55 TRUE      FALSE   71.38.121.63   FALSE        
    #> 11 63be5660fdac90527c12b1eb172b3c73      9954          3          1 2016-03-15 22:04:25 FALSE     TRUE    107.15.203.244 TRUE         
    #> 12 b6d3f7faa1f3180becdca7cd0a2eb98b      9952          3          1 2016-03-15 00:00:14 FALSE     TRUE    209.240.61.114 TRUE         
    #> 13 ea857371b7fb759cb0827605be7beb20      9953          3          1 2016-03-15 02:31:59 FALSE     TRUE    184.57.9.189   TRUE         
    #> 14 87ab81cf28aaf06088a7a7b64f655456      9956          3          1 2016-03-17 18:36:53 FALSE     TRUE    104.176.70.251 TRUE         
    #> 15 05304126208ae65ff4fa55ca820101f7      9957          3          1 2016-03-18 18:48:49 FALSE     TRUE    178.162.216.49 TRUE         
    #> 16 85cac03d40879ae62ed6b9c09df7bd5b      9958          3          1 2016-03-19 00:45:15 FALSE     TRUE    69.120.9.58    TRUE         
    #> 17 60c7ac647f666d135b5c26b513cd4e91      9959          3          1 2016-03-19 08:48:44 FALSE     TRUE    96.41.6.72     TRUE         
    #> 18 cc4117dfb5b38f64db88d2ee35c3e034      9959          0          1 2016-03-19 08:54:03 TRUE      FALSE   96.41.6.72     FALSE        
    #> 19 bbd0e0e8a5ce33f42c1bbac76a917e0a      9960          3          1 2016-03-19 19:11:43 FALSE     TRUE    24.61.214.45   TRUE         
    #> 
    #> $orig_voters
    #> # A tibble: 789 x 7
    #>      vid ip_address       vote_date   tid member_id forum_id member_choices                  
    #>    <int> <chr>                <int> <int>     <int>    <int> <chr>                           
    #>  1     1 77.249.103.246  1323790101   370        13       88 "a:1:{i:1;a:1:{i:0;s:1:\"2\";}}"
    #>  2     2 86.21.53.46     1323790499   370         4       88 "a:1:{i:1;a:1:{i:0;s:1:\"1\";}}"
    #>  3     3 108.13.155.97   1323791995   370        29       88 "a:1:{i:1;a:1:{i:0;s:1:\"1\";}}"
    #>  4     4 86.7.229.239    1323800768   370         6       88 "a:1:{i:1;a:1:{i:0;s:1:\"1\";}}"
    #>  5     5 31.220.211.18   1323801140   370         7       88 "a:1:{i:1;a:1:{i:0;s:1:\"1\";}}"
    #>  6     6 152.33.21.65    1323805321   370        16       88 "a:1:{i:1;a:1:{i:0;s:1:\"1\";}}"
    #>  7     7 192.101.250.250 1323822724   370        68       88 "a:1:{i:1;a:1:{i:0;s:1:\"1\";}}"
    #>  8     8 71.185.163.249  1323843605   370        49       88 "a:1:{i:1;a:1:{i:0;s:1:\"1\";}}"
    #>  9     9 131.181.251.22  1323871708   370        65       88 "a:1:{i:1;a:1:{i:0;s:1:\"2\";}}"
    #> 10    27 201.236.119.199 1324958167   370        44       88 "a:1:{i:1;a:1:{i:0;s:1:\"1\";}}"
    #> # … with 779 more rows
    #> 
    #> $orig_warn_logs
    #> # A tibble: 64 x 8
    #>    wlog_id wlog_mid wlog_notes                                                                            wlog_contact wlog_contact_cont… wlog_date wlog_type wlog_addedby
    #>      <int>    <int> <chr>                                                                                 <chr>        <chr>                  <int> <chr>            <int>
    #>  1       1       33 "a:15:{s:7:\"content\";s:102:\"Personal attack and name-calling during the debate wi… none         <NA>                  1.32e9 neg                  9
    #>  2       2       40 "a:15:{s:7:\"content\";s:24:\"Racism/ethnic slurs etc.\";s:3:\"mod\";s:1:\"0\";s:8:\… none         <NA>                  1.32e9 neg                  4
    #>  3       3       40 "a:15:{s:7:\"content\";s:77:\"I believe that my previous adjustment of the warning b… none         <NA>                  1.32e9 custom               4
    #>  4       4       40 "a:15:{s:7:\"content\";s:8:\"yhu7jytf\";s:3:\"mod\";s:1:\"0\";s:8:\"mod_unit\";s:1:\… none         <NA>                  1.32e9 custom               4
    #>  5       5       89 "a:15:{s:7:\"content\";s:52:\"Ridiculous drama and frankly embarassing behaviour. \"… none         <NA>                  1.32e9 neg                  7
    #>  6       6       49 "a:15:{s:7:\"content\";s:202:\"Warned for excessive flaming in the topic &#39;Ask me… none         <NA>                  1.32e9 neg                 14
    #>  7       7       40 "a:15:{s:7:\"content\";s:224:\"Completely disgraceful trolling and flaming contained… none         <NA>                  1.32e9 nochan              14
    #>  8       8       40 "a:15:{s:7:\"content\";s:131:\"See my previous log. It appears that I did not actual… none         <NA>                  1.32e9 custom              14
    #>  9      14       40 "a:15:{s:7:\"content\";s:9:\"Cooldown?\";s:3:\"mod\";s:1:\"0\";s:8:\"mod_unit\";s:1:… none         <NA>                  1.33e9 custom               4
    #> 10      11       40 "a:15:{s:7:\"content\";s:14:\"He told me to.\";s:3:\"mod\";s:1:\"0\";s:8:\"mod_unit\… none         <NA>                  1.33e9 nochan               4
    #> # … with 54 more rows

### `forums_*`

``` r
im_forums_dfs
```

    #> $forums_forums
    #> # A tibble: 144 x 39
    #>       id topics posts last_post           last_poster_id last_poster_name position use_ibc use_html last_title last_id sort_order prune topicfilter show_rules allow_poll
    #>    <int>  <int> <int> <dttm>                       <int> <chr>               <int> <lgl>   <lgl>    <chr>        <int> <chr>      <int> <chr>       <lgl>      <lgl>     
    #>  1     1      0     0 NA                               0 <NA>                    1 FALSE   FALSE    <NA>            NA <NA>           0 <NA>        FALSE      FALSE     
    #>  2    92     36   676 2017-10-26 21:13:19           9549 Riftbolt                2 TRUE    FALSE    Spraypain…    6475 Z-A          100 all         FALSE      TRUE      
    #>  3     2     18   475 2017-10-06 06:39:51              1 Александр Славр…        1 TRUE    FALSE    IronMarch…    8329 Z-A          100 all         FALSE      TRUE      
    #>  4    10      0     0 NA                               0 <NA>                   10 TRUE    FALSE    <NA>            NA <NA>           0 <NA>        FALSE      FALSE     
    #>  5     5     39  1680 2017-11-20 21:48:41           9288 Змајевит                2 TRUE    FALSE    IRONMARCH…    7286 Z-A          100 all         FALSE      TRUE      
    #>  6     7      0     0 NA                               0 <NA>                    7 FALSE   FALSE    <NA>            NA <NA>           0 <NA>        FALSE      FALSE     
    #>  7    97     72  1409 2017-08-17 00:45:31          14542 Hank Hill               3 TRUE    FALSE    Game of T…    5220 Z-A          100 all         FALSE      TRUE      
    #>  8    90     31   762 2017-10-27 01:03:10          13771 BloodEagle              9 TRUE    FALSE    Your phys…    4329 Z-A          100 all         FALSE      TRUE      
    #>  9    12    150  5596 2017-11-10 03:40:21          12999 Stribog                 3 TRUE    FALSE    Video Gam…     310 Z-A          100 all         FALSE      TRUE      
    #> 10    11   1740 33616 2017-11-21 02:58:31           9668 MOONLORD                2 TRUE    FALSE    Introduct…    8515 Z-A          100 all         FALSE      TRUE      
    #> # … with 134 more rows, and 23 more variables: allow_pollbump <lgl>, inc_postcount <lgl>, skin_id <lgl>, parent_id <int>, notify_modq_emails <chr>, sub_can_post <lgl>,
    #> #   permission_showtopic <lgl>, forum_allow_rating <lgl>, forum_last_deletion <int>, newest_title <chr>, newest_id <int>, can_view_others <lgl>, name_seo <chr>,
    #> #   seo_last_title <chr>, seo_last_name <chr>, last_x_topic_ids <chr>, forums_bitoptions <int>, disable_sharelinks <lgl>, deleted_topics <lgl>, viglink <lgl>,
    #> #   qa_rate_questions <chr>, qa_rate_answers <chr>, icon <chr>
    #> 
    #> $forums_posts
    #> # A tibble: 195,128 x 15
    #>       pid append_edit edit_time           author_id author_name ip_address post_date           post  queued topic_id new_topic edit_name post_key post_edit_reason
    #>     <int> <lgl>       <dttm>                  <int> <chr>       <chr>      <dttm>              <chr>  <int>    <int> <lgl>     <chr>     <chr>    <chr>           
    #>  1    202 FALSE       NA                          7 MoonmanKKK  81.141.31… 2011-09-15 22:08:51 "<p>…      0       47 FALSE     <NA>      89e750e… <NA>            
    #>  2    203 FALSE       NA                         16 Talleyrand  152.33.58… 2011-09-15 22:10:42 "\n<…      0       11 FALSE     <NA>      0bccae6… <NA>            
    #>  3    532 FALSE       2011-09-19 23:14:09         5 Will to Po… 90.219.24… 2011-09-19 23:13:59 "\n<…      0      107 FALSE     Will to … 58e8b72… <NA>            
    #>  4 114067 FALSE       NA                       7508 RIGHT WING… 80.212.44… 2015-05-16 18:00:29 "\n<…      0     5166 FALSE     <NA>      ac5b3c0… <NA>            
    #>  5 114068 FALSE       2015-05-16 18:07:42         0 Nihonjin M… 73.222.21… 2015-05-16 18:02:08 "<p>…      0     5166 FALSE     Nihonjin… 3eb3ae5… <NA>            
    #>  6 114069 FALSE       2015-05-16 19:12:42      7481 ¡VIVA LA R… 86.181.21… 2015-05-16 18:06:36 "\n<…      0     5165 FALSE     Generalp… a72ee7a… <NA>            
    #>  7 114070 FALSE       NA                       9144 Neizbezhno… 121.215.1… 2015-05-16 18:14:36 "<p>…      0     5165 FALSE     <NA>      e2e1256… <NA>            
    #>  8 114071 FALSE       NA                       6321 Culius Jae… 65.28.106… 2015-05-16 18:16:41 "\n<…      0     5167 TRUE      <NA>      774875f… <NA>            
    #>  9      4 FALSE       NA                          1 Alexander … 178.140.1… 2011-09-13 01:06:06 "\n<…      0        3 TRUE      <NA>      cbd8458… <NA>            
    #> 10     83 FALSE       NA                         16 Talleyrand  152.33.17… 2011-09-14 04:43:41 "\n<…      0       37 TRUE      <NA>      0bac739… <NA>            
    #> # … with 195,118 more rows, and 1 more variable: pdelete_time <dttm>
    #> 
    #> $forums_topics
    #> # A tibble: 7,168 x 25
    #>      tid title state posts starter_id start_date          last_poster_id last_post           icon_id starter_name last_poster_name poll_state last_vote views forum_id
    #>    <int> <chr> <chr> <int>      <int> <dttm>                       <int> <dttm>              <lgl>   <chr>        <chr>            <chr>          <int> <int>    <int>
    #>  1  5182 Heil… clos…     9          0 2015-05-20 07:29:54           7504 2015-05-20 19:12:06 NA      ManAmongthe… Arete            0                  0   678       11
    #>  2     3 The … clos…    51          1 2011-09-13 01:06:06             16 2012-01-04 03:27:02 NA      Александр С… Talleyrand       0                  0  6464        2
    #>  3  3674 “Non… open     12       7346 2014-03-01 23:36:53             49 2014-03-05 00:58:25 NA      thecolonel   Vladimir         0                  0  1839       97
    #>  4     7 Supp… clos…     1          1 2011-09-13 09:47:48              1 2011-09-13 09:47:48 NA      Александр С… Александр Славр… 0                  0  1404       61
    #>  5     8 What… clos…     1          1 2011-09-13 09:52:23              1 2011-09-13 09:52:23 NA      Александр С… Александр Славр… 0                  0  2705       87
    #>  6     9 What… clos…     1          1 2011-09-13 09:55:16              1 2011-09-13 09:55:16 NA      Александр С… Александр Славр… 0                  0  2368       88
    #>  7  5167 The … open     14       6321 2015-05-16 18:16:41           6269 2015-05-18 01:40:21 NA      Culius Jaes… Another American 0                  0  1262       26
    #>  8  5168 Chin… open     20       7508 2015-05-16 22:42:30           7508 2016-01-23 15:37:12 NA      RIGHT WING … Blackhat 14      0                  0  2223       13
    #>  9    11 Rage… open    833          1 2011-09-13 10:23:27          14238 2017-11-18 01:49:43 NA      Alexander S… Eternal Leaf     0                  0 52195       99
    #> 10  4306 Volg… open      3          1 2014-09-22 19:22:56              1 2014-09-22 20:30:05 NA      Александр С… Александр Славр… 0                  0   927      160
    #> # … with 7,158 more rows, and 10 more variables: approved <int>, author_mode <lgl>, pinned <lgl>, topic_firstpost <int>, topic_rating_total <int>,
    #> #   topic_rating_hits <int>, title_seo <chr>, last_real_post <dttm>, popular_time <int>, topic_hiddenposts <int>

### Other

``` r
im_other_dfs
```

    #> $bbcode_mediatag
    #> # A tibble: 9 x 4
    #>   mediatag_id mediatag_name   mediatag_match                                mediatag_replace                                                                              
    #>         <int> <chr>           <chr>                                         <chr>                                                                                         
    #> 1           1 YouTube         "http(?:s)?://(www.)?youtube.com/watch\\?(\\… "<iframe id=\"ytplayer\" class=\"EmbeddedVideo\" type=\"text/html\" width=\"640\" height=\"39…
    #> 2           9 GameTrailers    "http://www.gametrailers.com/{1}/{2}/{3}"     "<embed src=\"http://media.mtvnservices.com/mgid:moses:$1:gametrailers.com:$3\" width=\"512\"…
    #> 3           2 Flash Movie/Ga… "{1}.swf"                                     "<embed src=\"$1.swf\" play=\"true\" loop=\"true\" quality=\"best\" type=\"application/x-shoc…
    #> 4           3 Google Video    "http://video.google.com/videoplay?docid={1}" "<embed style=\"width:400px; height:326px;\" id=\"VideoPlayback\" type=\"application/x-shockw…
    #> 5           4 MySpace Video   "http://www.myspace.com/video/{1}/(\\d+)$"    "<object width=\"425px\" height=\"360px\" >\n<param name=\"allowScriptAccess\" value=\"always…
    #> 6          10 YouTu.be        "http://(www.)?youtu.be/([\\d\\w-_]+?)"       "<iframe id=\"ytplayer\" class=\"EmbeddedVideo\" type=\"text/html\" width=\"640\" height=\"39…
    #> 7           6 Flickr Image S… "http://www.flickr.com/photos/{1}/sets/{2}/"  "<iframe align=\"center\" src=\"http://www.flickr.com/slideShow/index.gne?user_id=$1&set_id=$…
    #> 8           7 MP3             "{1}.mp3"                                     "<object type=\"application/x-shockwave-flash\" data=\"{board_url}/public/mp3player.swf\" wid…
    #> 9           8 Vimeo           "http{1}://vimeo.com/{2}"                     "<iframe src=\"http$1://player.vimeo.com/video/$2\" class=\"EmbeddedVideo\" width=\"400\" hei…
    #> 
    #> $calendar_calendars
    #> # A tibble: 12 x 4
    #>    cal_id cal_position cal_title_seo                 cal_color
    #>     <int>        <int> <chr>                         <chr>    
    #>  1      1            5 italian-nationalist-calendar  #000000  
    #>  2      2            8 serbian-nationalist-calendar  #0050a1  
    #>  3      3            6 russian-nationalist-calendar  #c2c2c2  
    #>  4      4           10 orthodox-christian-calendar   #d4a900  
    #>  5      5           11 catholic-christian-calendar   #6e4f99  
    #>  6      6            4 greek-nationalist-calendar    #0091ff  
    #>  7      7            3 german-nationalist-calendar   #e60000  
    #>  8      8            1 american-nationalist-calendar #17d4cd  
    #>  9      9           12 uncategorized-dates           #667070  
    #> 10     10            7 romanian-nationalist-calendar #249637  
    #> 11     11            2 british-nationalist-calendar  #514999  
    #> 12     12            9 spanish-nationalist-calendar  #eb9500  
    #> 
    #> $calendar_event_comments
    #> # A tibble: 170 x 10
    #>    comment_id comment_eid comment_mid comment_date        comment_text                  comment_append_… comment_edit_ti… comment_edit_na… comment_ip_addr… comment_author
    #>         <int>       <int>       <int> <dttm>              <chr>                         <lgl>                       <int> <chr>            <chr>            <chr>         
    #>  1          1         150        7636 2016-03-30 12:25:46 "<p>\n\tArriba Espana!\n</p>" FALSE                           0 <NA>             69.121.225.238   Bogatyr       
    #>  2          2         150        7508 2016-04-01 19:17:45 "<p>\n\tIt's just a prank br… FALSE                           0 <NA>             85.164.207.226   ?✔️??????     
    #>  3          3         150           0 2016-04-01 21:15:34 "<p>\n\tHaving an armistice … FALSE                           0 beeblebrox       72.229.6.209     beeblebrox    
    #>  4          4         154        7636 2016-04-17 13:36:49 "<p>\n\tRest In Peace.\n</p>" FALSE                           0 <NA>             69.121.225.238   Bogatyr       
    #>  5          5         147        9876 2016-04-20 05:24:10 "\n<p>\n\tIn memory of the g… FALSE                           0 <NA>             174.64.6.46      Pelayo        
    #>  6          6         147        9621 2016-04-20 06:37:56 "\n<p>\n\t<img class=\"ipsIm… FALSE                           0 <NA>             68.109.194.141   Pho           
    #>  7          7         147        4873 2016-04-20 07:02:33 "\n<p>\n\tHappy 127th fam.\n… FALSE                           0 <NA>             174.4.165.99     Rintrah       
    #>  8          8         147        9679 2016-04-20 07:09:12 "<p>\n\twhat a guy\n</p>"     FALSE                           0 <NA>             66.169.97.70     Vinokura      
    #>  9          9         147        9510 2016-04-20 14:22:09 "\n<blockquote class=\"ipsQu… FALSE                           0 <NA>             86.15.81.183     TheDrifter    
    #> 10         10         147        9519 2016-04-20 17:10:30 "<p>\n\tRIP\n</p>"            FALSE                           0 <NA>             5.245.137.34     TheAdnanite   
    #> # … with 160 more rows
    #> 
    #> $calendar_events
    #> # A tibble: 277 x 28
    #>    event_id event_calendar_… event_member_id event_content event_title event_comments event_approved event_saved         event_lastupdated   event_recurring
    #>       <int>            <int>           <int> <chr>         <chr>                <int> <lgl>          <dttm>              <dttm>              <chr>          
    #>  1        1                7               1 "\n<p>\n\t<a… Joseph Goe…              1 TRUE           2015-05-12 14:42:08 2016-06-27 19:03:43 FREQ=YEARLY;IN…
    #>  2        2                1               1 "\n<p>\n\t<a… Niccolò Ma…              0 TRUE           2015-05-12 14:44:50 2016-03-25 15:59:34 FREQ=YEARLY;IN…
    #>  3        3                7               1 "\n<p>\n\t<a… Oswald Spe…              0 TRUE           2015-05-12 14:45:42 2016-06-27 19:05:38 FREQ=YEARLY;IN…
    #>  4        4                7               1 "\n<p>\n\t<a… Oswald Spe…              1 TRUE           2015-05-12 14:46:32 2016-06-27 19:10:47 FREQ=YEARLY;IN…
    #>  5        5                1               1 "\n<p>\n\t<a… Julius Evo…              0 TRUE           2015-05-12 14:47:51 2016-03-25 21:14:22 FREQ=YEARLY;IN…
    #>  6        6                1               1 "\n<p>\n\tNi… Niccolò Ma…              0 TRUE           2015-05-12 14:48:44 2016-03-25 21:36:56 FREQ=YEARLY;IN…
    #>  7        7                9               1 "\n<p>\n\t<a… Summer Sol…              0 TRUE           2015-05-12 14:56:31 2016-03-25 21:35:32 FREQ=YEARLY;IN…
    #>  8        8                7               1 "\n<p>\n\t<a… Martin Bor…              0 TRUE           2015-05-12 20:56:34 2016-06-27 19:03:59 FREQ=YEARLY;IN…
    #>  9        9                9               1 "\n<p>\n\t<a… Fidél Pálf…              0 TRUE           2015-05-12 21:02:51 2016-06-27 19:04:51 FREQ=YEARLY;IN…
    #> 10       10                7               1 "\n<p>\n\t<a… Baldur von…              0 TRUE           2015-05-12 21:05:57 2016-06-27 19:05:54 FREQ=YEARLY;IN…
    #> # … with 267 more rows, and 18 more variables: event_start_date <dttm>, event_end_date <dttm>, event_title_seo <chr>, event_rating <int>, event_post_key <chr>,
    #> #   event_sequence <lgl>, event_all_day <lgl>, event_ip_address <chr>, event_last_comment <dttm>, event_last_review <dttm>, event_approved_by <dbl>,
    #> #   event_approved_on <dttm>, event_location <chr>, event_rsvp_limit <int>, event_cover_photo <chr>, event_cover_offset <int>, event_unapproved_reviews <lgl>,
    #> #   event_hidden_reviews <lgl>
    #> 
    #> $custom_bbcode
    #> # A tibble: 34 x 16
    #>    bbcode_id bbcode_title bbcode_desc bbcode_tag bbcode_replace bbcode_useoption bbcode_example bbcode_menu_opt… bbcode_menu_con… bbcode_single_t… bbcode_php_plug…
    #>        <int> <chr>        <chr>       <chr>      <chr>          <lgl>            <chr>          <chr>            <chr>            <lgl>            <chr>           
    #>  1         1 Post Snap B… This tag d… snapback    <NA>          FALSE            [snapback]100… <NA>             <NA>             FALSE            defaults.php    
    #>  2         2 Right        Aligns con… right      "<p class='bb… FALSE            [right]Some t… <NA>             <NA>             FALSE            <NA>            
    #>  3         3 Left         Aligns con… left       "<p class='bb… FALSE            [left]Left al… <NA>             <NA>             FALSE            <NA>            
    #>  4         4 Center       Aligns con… center     "<p class='bb… FALSE            [center]Cente… <NA>             Enter content t… FALSE            <NA>            
    #>  5         5 Topic Link   This tag p… topic      "<a href='{ba… TRUE             [topic=1]Clic… Enter the topic… Enter the title… FALSE            <NA>            
    #>  6         6 Post Link    This tag p… post       "<a href='{ba… TRUE             [post=1]Click… Enter the Post … Enter the title… FALSE            <NA>            
    #>  7         7 Spoiler      Spoiler tag spoiler    "<div class='… FALSE            [spoiler]Some… <NA>             Enter the text … FALSE            <NA>            
    #>  8         8 Acronym      Allows you… acronym    "<acronym tit… TRUE             [acronym='Lau… Enter the descr… Enter the acron… FALSE            <NA>            
    #>  9         9 Bold Text    Makes text… b          "<strong clas… FALSE            [b]This text … <NA>             <NA>             FALSE            <NA>            
    #> 10        10 Italic Text  Makes the … i          "<em class='b… FALSE            [i]This text … <NA>             <NA>             FALSE            <NA>            
    #> # … with 24 more rows, and 5 more variables: bbcode_no_parsing <lgl>, bbcode_protected <lgl>, bbcode_aliases <chr>, bbcode_optional_option <lgl>, bbcode_image <chr>
    #> 
    #> $rc_reports_index
    #> # A tibble: 23 x 14
    #>       id uid         title              url                 rc_class updated_by date_updated date_created exdat1 exdat2 exdat3 num_comments seoname            seotemplate
    #>    <int> <chr>       <chr>              <chr>                  <int>      <int>        <int>        <int>  <int>  <int>  <int>        <int> <chr>              <chr>      
    #>  1     1 0b3ad95361… Why Fascism is Ri… /index.php?showtop…        2          9   1324720676   1324684384     57    422   6049            1 why-fascism-is-ri… showtopic  
    #>  2    10 d94e3b7efb… World Union of Fr… /index.php?showtop…        2          4   1356645256   1356640292     22   1827  46608            1 world-union-of-fr… showtopic  
    #>  3    14 4007c1340c… Operation Igloo    /index.php?showtop…        2          1   1361248006   1361245960      4   1751  51441            0 operation-igloo    showtopic  
    #>  4    58 264d9769a5… IRA dirtbag kicke… /index.php?showtop…        2          1   1374646833   1374646450      9   2688  63009            0 ira-dirtbag-kicke… showtopic  
    #>  5    66 cd32ce61d1… Jews want Negros … /index.php?showtop…        2          4   1377095062   1377089209      8   2842  65398            0 jews-want-negros-… showtopic  
    #>  6    69 933fabf496… Belgrade faggot p… /index.php?showtop…        2         16   1380356859   1380356286      8   3021  68874            0 belgrade-faggot-p… showtopic  
    #>  7    70 3a36b4740c… Belgrade faggot p… /index.php?showtop…        2         16   1380356859   1380356292      8   3020  68873            0 belgrade-faggot-p… showtopic  
    #>  8    74 9ca0654c69… Gabor Vona visits… /index.php?showtop…        2          4   1388663494   1388660127      9   3182  72083            1 gabor-vona-visits… showtopic  
    #>  9    89 7b4bea0fa2… Liberal Degenerat… /index.php?app=for…        2       2170   1431658980   1431533699     30   3751  87110            4 liberal-degenerat… <NA>       
    #> 10    90 f5578cdeac… Iron March Charte… /index.php?app=for…        2       2170   1432309218   1432177523      2   5130 113172            5 iron-march-charte… <NA>       
    #> # … with 13 more rows
    #> 
    #> $x_utf_convert_session_tables
    #> # A tibble: 152 x 2
    #>    table_name           table_schema                                                                                                                                      
    #>    <chr>                <chr>                                                                                                                                             
    #>  1 admin_login_logs     "{\"name\":\"admin_login_logs\",\"definition\":{\"name\":\"admin_login_logs\",\"columns\":{\"admin_id\":{\"allow_null\":false,\"auto_increment\":…
    #>  2 admin_logs           "{\"name\":\"admin_logs\",\"definition\":{\"name\":\"admin_logs\",\"columns\":{\"id\":{\"allow_null\":false,\"auto_increment\":true,\"binary\":fa…
    #>  3 admin_permission_ro… "{\"name\":\"admin_permission_rows\",\"definition\":{\"name\":\"admin_permission_rows\",\"columns\":{\"row_id\":{\"allow_null\":false,\"auto_incr…
    #>  4 announcements        "{\"name\":\"announcements\",\"definition\":{\"name\":\"announcements\",\"columns\":{\"announce_id\":{\"allow_null\":false,\"auto_increment\":tru…
    #>  5 api_log              "{\"name\":\"api_log\",\"definition\":{\"name\":\"api_log\",\"columns\":{\"api_log_id\":{\"allow_null\":false,\"auto_increment\":true,\"binary\":…
    #>  6 api_users            "{\"name\":\"api_users\",\"definition\":{\"name\":\"api_users\",\"columns\":{\"api_user_id\":{\"allow_null\":false,\"auto_increment\":true,\"bina…
    #>  7 attachments          "{\"name\":\"attachments\",\"definition\":{\"name\":\"attachments\",\"columns\":{\"attach_id\":{\"allow_null\":false,\"auto_increment\":true,\"bi…
    #>  8 attachments_type     "{\"name\":\"attachments_type\",\"definition\":{\"name\":\"attachments_type\",\"columns\":{\"atype_id\":{\"allow_null\":false,\"auto_increment\":…
    #>  9 backup_log           "{\"name\":\"backup_log\",\"definition\":{\"name\":\"backup_log\",\"columns\":{\"log_id\":{\"allow_null\":false,\"auto_increment\":true,\"binary\…
    #> 10 backup_queue         "{\"name\":\"backup_queue\",\"definition\":{\"name\":\"backup_queue\",\"columns\":{\"queue_id\":{\"allow_null\":false,\"auto_increment\":true,\"b…
    #> # … with 142 more rows
