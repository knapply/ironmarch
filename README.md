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

[![R build
status](https://github.com/knapply/ironmarch/workflows/R-CMD-check/badge.svg)](https://github.com/knapply/ironmarch/actions?workflow=R-CMD-check)
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
    #>    msg_id msg_topic_id msg_date            msg_post msg_post_key msg_author_id
    #>     <int>        <int> <dttm>              <chr>    <chr>                <int>
    #>  1      1            1 2011-09-16 03:49:58 "<p>The… 3320f7f06c4…             1
    #>  2      2            2 2011-09-16 11:54:08 "\n<p>W… 9204e488332…            11
    #>  3      3            2 2011-09-16 14:39:59 "<p>Cri… 12fd0309239…             1
    #>  4      4            2 2011-09-16 15:29:01 "<p>Tha… 0658c6f99ac…            11
    #>  5      5            2 2011-09-16 15:32:58 "<p>If … 570257864e3…             1
    #>  6      6            2 2011-09-16 15:44:51 "<p>The… aabeacc8f4c…            11
    #>  7      7            3 2011-09-17 01:43:49 "<p>I d… a36f67c0d72…            16
    #>  8      8            3 2011-09-17 01:59:50 "\n<blo… 327b933d818…            14
    #>  9     12            5 2011-09-20 14:20:14 "<p>The… 0667258c387…             1
    #> 10     13            5 2011-09-20 14:42:17 "<p>Don… de1d7fd2737…            20
    #> # … with 22,299 more rows, and 2 more variables: msg_ip_address <chr>,
    #> #   msg_is_first_post <lgl>

``` r
build_members()
```

    #> # A tibble: 1,542 x 83
    #>    member_id name  member_group_id email joined              ip_address allow_admin_mai…
    #>        <int> <chr>           <int> <chr> <dttm>              <chr>      <lgl>           
    #>  1         1 Алек…               4 slav… 2011-09-12 15:46:59 178.140.1… FALSE           
    #>  2         2 Phal…              13 illu… 2011-09-12 15:52:30 68.37.21.… TRUE            
    #>  3         3 Bloo…              13 rene… 2011-09-12 18:10:11 68.10.255… TRUE            
    #>  4         4 Mier…              13 homi… 2011-09-12 20:27:35 82.29.169… FALSE           
    #>  5         5 Will…              14 tash… 2011-09-12 20:58:17 90.214.15… TRUE            
    #>  6         7 Dadd…              13 benj… 2011-09-13 01:22:58 81.141.31… TRUE            
    #>  7         8 Mr. …              13 elei… 2011-09-13 04:24:07 98.198.24… TRUE            
    #>  8         9 Woma…              14 sol.… 2011-09-13 10:27:52 88.147.27… FALSE           
    #>  9        11 Four…              13 o244… 2011-09-13 12:14:28 109.77.91… FALSE           
    #> 10        12 Jami…              14 jami… 2011-09-13 17:43:02 86.134.81… TRUE            
    #> # … with 1,532 more rows, and 76 more variables: skin <int>, warn_level <int>,
    #> #   warn_lastwarn <int>, restrict_post <lgl>, bday_day <int>, bday_month <int>,
    #> #   bday_year <int>, msg_count_new <int>, msg_count_total <int>,
    #> #   msg_show_notification <lgl>, last_visit <dttm>, last_activity <dttm>,
    #> #   mod_posts <lgl>, auto_track <chr>, temp_ban <lgl>, mgroup_others <chr>,
    #> #   member_login_key_expire <dttm>, members_seo_name <chr>, members_cache <chr>,
    #> #   members_disable_pm <int>, failed_logins <chr>, members_profile_views <int>,
    #> #   members_pass_hash <chr>, members_pass_salt <chr>, members_bitoptions <int>,
    #> #   members_day_posts <chr>, notification_cnt <int>, posts <int>, title <chr>,
    #> #   time_offset <chr>, last_post <dttm>, view_sigs <lgl>, msg_count_reset <lgl>,
    #> #   dst_in_use <lgl>, login_anonymous <chr>, ignored_users <chr>, org_perm_id <chr>,
    #> #   member_login_key <chr>, members_auto_dst <lgl>, members_display_name <chr>,
    #> #   members_l_display_name <chr>, members_l_username <chr>, member_banned <lgl>,
    #> #   member_uploader <chr>, language <int>, failed_login_count <int>,
    #> #   pp_last_visitors <chr>, pp_main_photo <chr>, pp_main_width <int>,
    #> #   pp_main_height <int>, pp_thumb_photo <chr>, pp_thumb_width <int>,
    #> #   pp_thumb_height <int>, pp_setting_count_comments <lgl>, pp_reputation_points <int>,
    #> #   pp_gravatar <chr>, pp_photo_type <chr>, signature <chr>, fb_bwoptions <lgl>,
    #> #   tc_last_sid_import <chr>, tc_bwoptions <lgl>, pp_customization <chr>, timezone <chr>,
    #> #   pp_cover_photo <chr>, members_bitoptions2 <int>, create_menu <chr>,
    #> #   marked_site_read <int>, pp_cover_offset <int>, acp_skin <lgl>, acp_language <lgl>,
    #> #   member_title <chr>, member_posts <int>, member_last_post <int>, member_streams <chr>,
    #> #   photo_last_update <dttm>, msg_count_reset_at <dttm>

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
    #>    member_id name  member_group_id email joined              ip_address allow_admin_mai…
    #>        <int> <chr>           <int> <chr> <dttm>              <chr>      <list>          
    #>  1         1 Алек…               4 slav… 2011-09-12 15:46:59 178.140.1… <raw [1]>       
    #>  2     14875 Poet…              17 Gray… 2017-08-29 15:39:22 199.66.88… <raw [1]>       
    #>  3     14918 Vale…              17 oliv… 2017-09-10 15:51:00 86.10.127… <raw [1]>       
    #>  4     14926 cucc…              14 nigg… 2017-09-12 18:29:13 172.104.1… <raw [1]>       
    #>  5     14921 Hier…              17 Prow… 2017-09-11 11:07:06 2600:8804… <raw [1]>       
    #>  6         2 Phal…              13 illu… 2011-09-12 15:52:30 68.37.21.… <raw [1]>       
    #>  7     14057 Righ               13 righ… 2017-02-20 16:13:25 46.28.53.… <raw [1]>       
    #>  8     14040 Zaxon              14 helv… 2017-02-18 09:36:32 185.93.18… <raw [1]>       
    #>  9     14041 Солд…              13 mrel… 2017-02-18 12:06:20 2a02:c7d:… <raw [1]>       
    #> 10         3 Bloo…              13 rene… 2011-09-12 18:10:11 68.10.255… <raw [1]>       
    #> # … with 1,197 more rows, and 59 more variables: skin <int>, warn_level <int>,
    #> #   warn_lastwarn <int>, language <int>, restrict_post <int>, bday_day <int>,
    #> #   bday_month <int>, bday_year <int>, msg_count_new <int>, msg_count_total <int>,
    #> #   msg_count_reset <int>, msg_show_notification <lgl>, last_visit <dttm>,
    #> #   last_activity <dttm>, mod_posts <int>, auto_track <chr>, temp_ban <int>,
    #> #   mgroup_others <chr>, member_login_key_expire <dttm>, members_seo_name <chr>,
    #> #   members_cache <chr>, members_disable_pm <int>, failed_logins <chr>,
    #> #   failed_login_count <int>, members_profile_views <int>, members_pass_hash <chr>,
    #> #   members_pass_salt <chr>, members_bitoptions <int>, members_day_posts <chr>,
    #> #   notification_cnt <int>, pp_last_visitors <chr>, pp_main_photo <chr>,
    #> #   pp_main_width <int>, pp_main_height <int>, pp_thumb_photo <chr>,
    #> #   pp_thumb_width <int>, pp_thumb_height <int>, pp_setting_count_comments <lgl>,
    #> #   pp_reputation_points <int>, pp_gravatar <chr>, pp_photo_type <chr>, signature <chr>,
    #> #   fb_bwoptions <lgl>, tc_last_sid_import <chr>, tc_bwoptions <lgl>,
    #> #   pp_customization <chr>, timezone <chr>, pp_cover_photo <chr>,
    #> #   members_bitoptions2 <int>, create_menu <chr>, marked_site_read <int>,
    #> #   pp_cover_offset <int>, acp_skin <lgl>, acp_language <lgl>, member_title <chr>,
    #> #   member_posts <int>, member_last_post <int>, member_streams <chr>,
    #> #   photo_last_update <dttm>

``` r
im_orig_dfs$orig_members
```

    #> # A tibble: 763 x 51
    #>    member_id name  member_group_id email joined              ip_address posts title
    #>        <int> <chr>           <int> <chr> <dttm>              <chr>      <int> <chr>
    #>  1         1 Alex…               4 slav… 2011-09-12 15:46:59 178.140.1…  5613 My s…
    #>  2         2 Kacen              13 illu… 2011-09-12 15:52:30 68.37.21.…  1267 THE …
    #>  3         3 Bloo…              13 rene… 2011-09-12 18:10:11 68.10.255…   487 14/8…
    #>  4         4 Mier…              13 homi… 2011-09-12 20:27:35 82.29.169…  1704 Mult…
    #>  5         5 Will…               5 tash… 2011-09-12 20:58:17 90.214.15…   463 A fox
    #>  6         6 Inte…              13 mich… 2011-09-12 21:14:03 86.7.229.…     9 <NA> 
    #>  7         7 Benj…               4 benj… 2011-09-13 01:22:58 81.141.31…  3127 2 Mi…
    #>  8         8 Mr. …              13 elei… 2011-09-13 04:24:07 98.198.24…   167 <NA> 
    #>  9         9 Woma…               5 sol.… 2011-09-13 10:27:52 88.147.27…   997 <NA> 
    #> 10        10 Dene…              13 8056… 2011-09-13 12:13:09 72.76.138…    96 <NA> 
    #> # … with 753 more rows, and 43 more variables: allow_admin_mails <lgl>,
    #> #   time_offset <chr>, skin <int>, warn_level <int>, warn_lastwarn <int>,
    #> #   last_post <dttm>, restrict_post <chr>, view_sigs <lgl>, bday_day <int>,
    #> #   bday_month <int>, bday_year <int>, msg_count_new <int>, msg_count_total <int>,
    #> #   msg_count_reset <lgl>, msg_show_notification <lgl>, last_visit <dttm>,
    #> #   last_activity <dttm>, dst_in_use <lgl>, mod_posts <chr>, auto_track <chr>,
    #> #   temp_ban <chr>, login_anonymous <chr>, ignored_users <chr>, mgroup_others <chr>,
    #> #   org_perm_id <chr>, member_login_key <chr>, member_login_key_expire <dttm>,
    #> #   members_auto_dst <lgl>, members_display_name <chr>, members_seo_name <chr>,
    #> #   members_cache <chr>, members_disable_pm <int>, members_l_display_name <chr>,
    #> #   members_l_username <chr>, failed_logins <chr>, members_profile_views <int>,
    #> #   members_pass_hash <chr>, members_pass_salt <chr>, member_banned <lgl>,
    #> #   member_uploader <chr>, members_bitoptions <int>, members_day_posts <chr>,
    #> #   notification_cnt <int>

``` r
im_forums_dfs$forums_posts
```

    #> # A tibble: 195,128 x 15
    #>       pid append_edit edit_time           author_id author_name ip_address
    #>     <int> <lgl>       <dttm>                  <int> <chr>       <chr>     
    #>  1    202 FALSE       NA                          7 MoonmanKKK  81.141.31…
    #>  2    203 FALSE       NA                         16 Talleyrand  152.33.58…
    #>  3    532 FALSE       2011-09-19 23:14:09         5 Will to Po… 90.219.24…
    #>  4 114067 FALSE       NA                       7508 RIGHT WING… 80.212.44…
    #>  5 114068 FALSE       2015-05-16 18:07:42         0 Nihonjin M… 73.222.21…
    #>  6 114069 FALSE       2015-05-16 19:12:42      7481 ¡VIVA LA R… 86.181.21…
    #>  7 114070 FALSE       NA                       9144 Neizbezhno… 121.215.1…
    #>  8 114071 FALSE       NA                       6321 Culius Jae… 65.28.106…
    #>  9      4 FALSE       NA                          1 Alexander … 178.140.1…
    #> 10     83 FALSE       NA                         16 Talleyrand  152.33.17…
    #> # … with 195,118 more rows, and 9 more variables: post_date <dttm>, post <chr>,
    #> #   queued <int>, topic_id <int>, new_topic <lgl>, edit_name <chr>, post_key <chr>,
    #> #   post_edit_reason <chr>, pdelete_time <dttm>

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
    #>    url                            app   lang_key              restriction    keyword      
    #>    <chr>                          <chr> <chr>                 <chr>          <chr>        
    #>  1 app=core&module=support&contr… core  system_logs           <NA>           sql error lo…
    #>  2 app=core&module=support&contr… core  system_logs           <NA>           sql logs     
    #>  3 app=core&module=support&contr… core  system_logs           <NA>           system logs  
    #>  4 app=core&module=support&contr… core  system_logs           <NA>           driver errors
    #>  5 app=core&module=support&contr… core  system_logs           <NA>           logs         
    #>  6 app=core&module=support&contr… core  menu__core_support_d… support_dashb… troubleshoot 
    #>  7 app=core&module=support&contr… core  menu__core_support_d… support_dashb… support      
    #>  8 app=core&module=support&contr… core  menu__core_support_d… support_dashb… system       
    #>  9 app=core&module=support&contr… core  menu__core_support_d… support_dashb… tech support 
    #> 10 app=core&module=support&contr… core  menu__core_support_d… support_dashb… technical su…
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
    #>  1     6119 162.158.93.88    2017-11-10 00:51:08 "{\"adsess\":\"ek3ium1343v4ipp2n97208c1s…
    #>  2     6120 162.158.93.88    2017-11-12 07:54:35 "{\"adsess\":\"ek3ium1343v4ipp2n97208c1s…
    #>  3     6124 162.158.93.88    2017-11-15 04:42:11 "{\"adsess\":\"ek3ium1343v4ipp2n97208c1s…
    #>  4     6116 162.158.91.198   2017-11-06 20:21:13 "{\"adsess\":\"ek3ium1343v4ipp2n97208c1s…
    #>  5     6117 162.158.91.198   2017-11-06 21:52:07 "{\"adsess\":\"ek3ium1343v4ipp2n97208c1s…
    #>  6     6109 162.158.91.198   2017-10-26 20:19:13 "{\"adsess\":\"ek3ium1343v4ipp2n97208c1s…
    #>  7     6121 162.158.93.88    2017-11-13 21:17:26 "{\"adsess\":\"ek3ium1343v4ipp2n97208c1s…
    #>  8     6122 162.158.93.88    2017-11-14 04:47:22 "{\"adsess\":\"ek3ium1343v4ipp2n97208c1s…
    #>  9     6125 172.68.182.89    2017-11-18 10:12:12 "{\"adsess\":\"mpiq2ka3o3o4i12vbrvdi6e5i…
    #> 10     6126 162.158.93.88    2017-11-20 20:59:00 "{\"adsess\":\"ek3ium1343v4ipp2n97208c1s…
    #> # … with 13 more rows
    #> 
    #> $core_admin_logs
    #> # A tibble: 14,595 x 11
    #>             id member_id ctime               note  ip_address appcomponent module
    #>          <dbl>     <int> <dttm>              <chr> <chr>      <chr>        <chr> 
    #>  1 Inf.Nae-324         1 2011-09-12 16:05:48 Cate… 178.140.1… forums       forums
    #>  2 Inf.Nae-324         1 2011-09-12 16:07:59 Foru… 178.140.1… forums       forums
    #>  3   1.50e-323         1 2011-09-12 16:08:15 Foru… 178.140.1… forums       forums
    #>  4   2.00e-323         1 2011-09-12 16:11:38 Foru… 178.140.1… forums       forums
    #>  5   2.50e-323         1 2011-09-12 16:15:13 Edit… 178.140.1… members      groups
    #>  6   3.00e-323         1 2011-09-12 16:15:53 Edit… 178.140.1… members      groups
    #>  7   3.50e-323         1 2011-09-12 16:16:06 Edit… 178.140.1… members      groups
    #>  8   4.00e-323         1 2011-09-12 16:16:28 Edit… 178.140.1… members      groups
    #>  9   4.50e-323         1 2011-09-12 16:20:31 Adde… 178.140.1… members      groups
    #> 10   5.00e-323         1 2011-09-12 17:54:03 Foru… 178.140.1… forums       forums
    #> # … with 14,585 more rows, and 4 more variables: controller <chr>, do <chr>,
    #> #   lang_key <chr>, member_name <chr>
    #> 
    #> $core_applications
    #> # A tibble: 3 x 10
    #>   app_id app_description app_directory app_added           app_position app_protected
    #>    <int> <chr>           <chr>         <dttm>                     <int> <lgl>        
    #> 1      1 Manage global … core          2011-09-12 15:47:14            1 TRUE         
    #> 2      3 Manage forums … forums        2011-09-12 15:47:19            3 FALSE        
    #> 3      4 <NA>            calendar      2015-05-12 14:21:25            4 FALSE        
    #> # … with 4 more variables: app_location <chr>, app_update_last_check <int>,
    #> #   app_update_version <chr>, app_default <lgl>
    #> 
    #> $core_attachments
    #> # A tibble: 101 x 12
    #>    attach_id attach_ext attach_file attach_location attach_thumb_lo… attach_is_image
    #>        <int> <chr>      <chr>       <chr>           <chr>            <lgl>          
    #>  1       338 jpg        461022_456… monthly_03_201… monthly_03_2013… TRUE           
    #>  2         2 jpg        1056.jpg    monthly_09_201… monthly_09_2011… TRUE           
    #>  3         3 jpg        1057.jpg    monthly_09_201… monthly_09_2011… TRUE           
    #>  4         4 jpg        1091.jpg    monthly_09_201… monthly_09_2011… TRUE           
    #>  5         5 jpg        1108.jpg    monthly_09_201… monthly_09_2011… TRUE           
    #>  6         6 jpg        FASCIST UN… monthly_09_201… monthly_09_2011… TRUE           
    #>  7         7 jpg        post-2711-… monthly_09_201… monthly_09_2011… TRUE           
    #>  8         8 jpg        post-2842-… monthly_09_201… monthly_09_2011… TRUE           
    #>  9         9 jpg        1029.jpg    monthly_09_201… monthly_09_2011… TRUE           
    #> 10        10 jpg        1030.jpg    monthly_09_201… monthly_09_2011… TRUE           
    #> # … with 91 more rows, and 6 more variables: attach_hits <int>, attach_date <dttm>,
    #> #   attach_member_id <int>, attach_filesize <int>, attach_img_width <int>,
    #> #   attach_img_height <int>
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
    #> 10     10 ip       115.249.239.138             2011-12-19 10:52:08 Spammer - commercial a…
    #> # … with 42 more rows
    #> 
    #> $core_cache
    #> # A tibble: 171 x 3
    #>    cache_key                 cache_value                                      cache_expire
    #>    <chr>                     <chr>                                                   <int>
    #>  1 embed_e4cab4adff065e1c44… "\"<div id=\\\"fb-root\\\"><\\/div>\\n<script>(…   1511322224
    #>  2 embed_6b4bb904504f9db82a… "\"<blockquote class=\\\"instagram-media\\\" da…   1511313994
    #>  3 page_5b6871451314a763e28… "{\"output\":\"\\n<!DOCTYPE html>\\n<html lang=…   1511237711
    #>  4 page_0520ce0fd94d0726917… "{\"output\":\"\\n<!DOCTYPE html>\\n<html lang=…   1511237756
    #>  5 page_8b0b82300d1957b4f8c… "{\"output\":\"\\n<!DOCTYPE html>\\n<html lang=…   1511237760
    #>  6 page_1471b8a5e4fb244e7a9… "{\"output\":\"\\n<!DOCTYPE html>\\n<html lang=…   1511237768
    #>  7 page_77fa5a9b770109ce882… "{\"output\":\"\\n<!DOCTYPE html>\\n<html lang=…   1511237749
    #>  8 page_cd26222ed1107a27107… "{\"output\":\"\\n<!DOCTYPE html>\\n<html lang=…   1511237755
    #>  9 page_cee4024758e5a03f7d1… "{\"output\":\"\\n<!DOCTYPE html>\\n<html lang=…   1511237745
    #> 10 page_8129275e64c9925d824… "{\"output\":\"\\n<!DOCTYPE html>\\n<html lang=…   1511237734
    #> # … with 161 more rows
    #> 
    #> $core_deletion_log
    #> # A tibble: 14 x 9
    #>    dellog_id dellog_content_… dellog_content_… dellog_content_… dellog_deleted_…
    #>        <dbl>            <dbl> <chr>            <chr>                       <dbl>
    #>  1 5.90e-322        1.01e-318 Nordic Resistan… nordic-resistan…        6.60e-322
    #>  2 5.95e-322        1.01e-318 Nordic Resistan… nordic-resistan…        6.60e-322
    #>  3 6.00e-322        1.02e-318 romansoldier sp… romansoldier-sp…      Inf.Nae-324
    #>  4 6.05e-322        1.02e-318 SRN PROPAGANDA … srn-propaganda-…      Inf.Nae-324
    #>  5 6.10e-322        1.02e-318 IRONMARCH IN TH… ironmarch-in-th…      Inf.Nae-324
    #>  6 6.15e-322        1.02e-318 IRONMARCH IN TH… ironmarch-in-th…      Inf.Nae-324
    #>  7 6.20e-322        1.02e-318 IRONMARCH IN TH… ironmarch-in-th…      Inf.Nae-324
    #>  8 6.25e-322        1.02e-318 IRONMARCH IN TH… ironmarch-in-th…      Inf.Nae-324
    #>  9 6.30e-322        1.02e-318 IRONMARCH IN TH… ironmarch-in-th…      Inf.Nae-324
    #> 10 6.35e-322        1.02e-318 IRONMARCH IN TH… ironmarch-in-th…      Inf.Nae-324
    #> 11 6.40e-322        1.02e-318 IRONMARCH IN TH… ironmarch-in-th…      Inf.Nae-324
    #> 12 6.45e-322        1.02e-318 Unofficial AR p… unofficial-ar-p…      Inf.Nae-324
    #> 13 6.50e-322        8.77e-319 Trivial HAPPENI… trivial-happeni…        4.62e-320
    #> 14 6.55e-322        8.70e-319 Trivial HAPPENI… trivial-happeni…        4.62e-320
    #> # … with 4 more variables: dellog_deleted_by_name <chr>, dellog_deleted_date <dttm>,
    #> #   dellog_deleted_by_seo_name <chr>, dellog_content_permissions <chr>
    #> 
    #> $core_email_templates
    #> # A tibble: 50 x 7
    #>    template_id template_app template_name template_data template_conten… template_conten…
    #>          <dbl> <chr>        <chr>         <chr>         <chr>            <chr>           
    #>  1   8.40e-322 core         account_lock… $member, $lo… "<br />\n{$emai… "{$email->langu…
    #>  2   8.45e-322 core         unsubscribeD… $member, $em… "<tr>\n\t<td di… "{$email->langu…
    #>  3   8.50e-322 core         digests__are… $output, $ap… "<!-- Add item … "{$output|raw}\…
    #>  4   8.55e-322 core         upgrade       $version, $r… "\n{$email->lan… "{$email->langu…
    #>  5   8.60e-322 core         notification… $club, $memb… "<br />\n{$emai… "{$email->langu…
    #>  6   8.65e-322 core         notification… $comment, $m… "\n{{$item = ( … "\n{{$item = ( …
    #>  7   8.70e-322 core         email_addres… $member, $ol… "\n{$email->lan… "{$email->langu…
    #>  8   8.75e-322 core         notification… $container, … "\n{{if $member… "\n{$email->lan…
    #>  9   8.80e-322 core         contact_form  $member, $na… "{$email->langu… "\n{$email->lan…
    #> 10   8.85e-322 core         notification… $comment, $e… "\n{$email->lan… "\n{$email->lan…
    #> # … with 40 more rows, and 1 more variable: template_key <chr>
    #> 
    #> $core_emoticons
    #> # A tibble: 116 x 7
    #>       id typed     image         clickable emo_set           emo_position emo_set_position
    #>    <int> <chr>     <chr>         <lgl>     <chr>                    <int>            <int>
    #>  1   110 :berg:    emoticons/be… TRUE      84ba4fa006a1ff54…            4                8
    #>  2   109 :derp:    emoticons/de… TRUE      84ba4fa006a1ff54…           14                8
    #>  3   108 :uwot:    emoticons/uw… TRUE      84ba4fa006a1ff54…           13                8
    #>  4   107 :srsly:   emoticons/sr… TRUE      84ba4fa006a1ff54…           10                8
    #>  5   106 :gibsmed… emoticons/gi… TRUE      84ba4fa006a1ff54…           12                8
    #>  6   105 :wat:     emoticons/wa… TRUE      f700487c16e5f786…            2                6
    #>  7   104 :handy:   emoticons/ha… TRUE      f700487c16e5f786…           24                6
    #>  8   174 :arrowcr… emoticons/ar… TRUE      f539dc6131bd274e…            6                3
    #>  9   171 :ropecul… emoticons/ro… TRUE      ebad4264c1c40dd7…            9                1
    #> 10   101 :moonman: emoticons/mo… TRUE      f700487c16e5f786…           20                6
    #> # … with 106 more rows
    #> 
    #> $core_file_logs
    #> # A tibble: 2,014 x 7
    #>       log_id log_filename   log_msg  log_date            log_data   log_container log_url 
    #>        <dbl> <chr>          <chr>    <dttm>              <chr>      <chr>         <chr>   
    #>  1 4.10e-320 <NA>           contain… 2017-09-13 14:20:17 "{\"adses… css_built_7   <NA>    
    #>  2 4.32e-320 1200px-Britis… file_de… 2017-09-29 02:40:02  <NA>      monthly_2017… http://…
    #>  3 4.32e-320 1200px-Flag_o… file_de… 2017-09-29 02:40:04  <NA>      monthly_2017… http://…
    #>  4 4.39e-320 root_map.js.0… file_de… 2017-10-04 22:02:56  <NA>      javascript_g… http://…
    #>  5 4.39e-320 root_map.js.b… file_de… 2017-10-04 22:02:56  <NA>      javascript_g… http://…
    #>  6 4.39e-320 root_map.js.d… file_de… 2017-10-04 22:02:56  <NA>      javascript_g… http://…
    #>  7 4.39e-320 root_map.js.d… file_de… 2017-10-04 22:03:00  <NA>      javascript_g… http://…
    #>  8 4.45e-320 Screenshot_45… file_de… 2017-10-09 21:33:08  <NA>      monthly_2017… https:/…
    #>  9 4.45e-320 Screenshot_45… file_de… 2017-10-09 21:33:08  <NA>      monthly_2017… https:/…
    #> 10 4.45e-320 integra.png.3… file_de… 2017-10-09 21:34:21  <NA>      monthly_2017… https:/…
    #> # … with 2,004 more rows
    #> 
    #> $core_follow
    #> # A tibble: 8,066 x 13
    #>    follow_id follow_app follow_area follow_rel_id follow_member_id follow_is_anon
    #>    <chr>     <chr>      <chr>               <dbl>            <int> <lgl>         
    #>  1 fd493920… forums     topic           1.80e-322               12 FALSE         
    #>  2 1b179c39… forums     topic           3.10e-322               12 FALSE         
    #>  3 af062e78… forums     topic           2.35e-322               12 FALSE         
    #>  4 bbf8f01f… forums     topic           2.20e-322               12 FALSE         
    #>  5 b85184ca… forums     topic           3.25e-322               12 FALSE         
    #>  6 e7328cad… forums     topic           3.70e-322               12 FALSE         
    #>  7 625eb2d4… forums     topic           3.75e-322               12 FALSE         
    #>  8 a87febdf… forums     topic           3.65e-322               12 FALSE         
    #>  9 e5f6841c… forums     topic           2.25e-322               12 FALSE         
    #> 10 6f7a3413… forums     topic           3.90e-322               12 FALSE         
    #> # … with 8,056 more rows, and 7 more variables: follow_added <dttm>,
    #> #   follow_notify_do <lgl>, follow_notify_meta <chr>, follow_notify_freq <chr>,
    #> #   follow_notify_sent <dttm>, follow_visible <lgl>, follow_index_id <dbl>
    #> 
    #> $core_groups
    #> # A tibble: 11 x 45
    #>     g_id g_view_board g_other_topics g_edit_profile g_post_new_topi… g_reply_own_top…
    #>    <int> <lgl>        <lgl>          <lgl>          <lgl>            <lgl>           
    #>  1     2 TRUE         TRUE           FALSE          TRUE             TRUE            
    #>  2     3 TRUE         TRUE           TRUE           TRUE             TRUE            
    #>  3     4 TRUE         TRUE           TRUE           TRUE             TRUE            
    #>  4     6 TRUE         TRUE           TRUE           TRUE             TRUE            
    #>  5     7 TRUE         TRUE           FALSE          TRUE             TRUE            
    #>  6    10 TRUE         TRUE           TRUE           TRUE             TRUE            
    #>  7    13 TRUE         TRUE           TRUE           TRUE             TRUE            
    #>  8    14 FALSE        NA             TRUE           NA               NA              
    #>  9    15 FALSE        NA             TRUE           NA               NA              
    #> 10    16 FALSE        NA             TRUE           NA               NA              
    #> 11    17 TRUE         NA             TRUE           NA               NA              
    #> # … with 39 more variables: g_reply_other_topics <lgl>, g_edit_posts <chr>,
    #> #   g_delete_own_posts <chr>, g_open_close_posts <lgl>, g_delete_own_topics <lgl>,
    #> #   g_post_polls <lgl>, g_vote_polls <lgl>, g_use_pm <lgl>, g_append_edit <lgl>,
    #> #   g_access_offline <lgl>, g_avoid_q <lgl>, g_avoid_flood <lgl>, g_icon <chr>,
    #> #   prefix <chr>, g_max_messages <int>, g_max_mass_pm <int>, g_search_flood <int>,
    #> #   g_edit_cutoff <int>, g_hide_from_list <lgl>, g_post_closed <lgl>,
    #> #   g_photo_max_vars <chr>, g_edit_topic <lgl>, g_bypass_badwords <lgl>,
    #> #   g_can_msg_attach <lgl>, g_topic_rate_setting <int>, g_dname_changes <int>,
    #> #   g_dname_date <int>, g_mod_preview <lgl>, g_rep_max_positive <int>,
    #> #   g_rep_max_negative <int>, g_signature_limits <chr>, g_bitoptions <int>,
    #> #   g_pm_perday <int>, g_pm_flood_mins <int>, g_bitoptions2 <int>,
    #> #   g_hide_own_posts <chr>, g_lock_unlock_own <chr>, g_can_report <chr>,
    #> #   g_promote_exclude <lgl>
    #> 
    #> $core_hooks_files
    #> # A tibble: 8 x 7
    #>   hook_file_id hook_hook_id hook_file_stored hook_file_real hook_classname hook_data
    #>          <int>        <int> <chr>            <chr>          <chr>          <chr>    
    #> 1           39            1 boardIndexSideB… boardIndexSid… boardIndexSid… "a:7:{s:…
    #> 2           43            2 boardIndexStatu… boardIndexSta… boardIndexSta… "a:8:{s:…
    #> 3           40            3 boardIndexRecen… boardIndexRec… boardIndexRec… "a:6:{s:…
    #> 4           41            4 boardIndexFaceb… boardIndexFac… boardIndexFac… "a:7:{s:…
    #> 5           42            5 boardIndexTags_… boardIndexTag… boardIndexTags "a:8:{s:…
    #> 6           44            9 boardIndexCalen… boardIndexCal… boardIndexCal… "a:8:{s:…
    #> 7           45           10 calendarUpcomin… calendarUpcom… calendarUpcom… "a:8:{s:…
    #> 8           46           11 calendarUpcomin… calendarUpcom… calendarUpcom… "a:8:{s:…
    #> # … with 1 more variable: hooks_source <chr>
    #> 
    #> $core_ignored_users
    #> # A tibble: 22 x 6
    #>    ignore_id ignore_owner_id ignore_ignore_id ignore_messages ignore_topics
    #>        <int>           <int>            <int> <lgl>           <lgl>        
    #>  1         2             143               84 FALSE           FALSE        
    #>  2        31           13558               72 FALSE           FALSE        
    #>  3         4             255              279 FALSE           FALSE        
    #>  4        32           14399             6260 TRUE            TRUE         
    #>  5         7             991             1109 FALSE           FALSE        
    #>  6         8             288               91 FALSE           FALSE        
    #>  7        11              54             6113 FALSE           FALSE        
    #>  8        13            7364              132 FALSE           FALSE        
    #>  9        15            7901             7508 TRUE            TRUE         
    #> 10        17            7643             7481 FALSE           FALSE        
    #> # … with 12 more rows, and 1 more variable: ignore_mentions <lgl>
    #> 
    #> $core_item_markers
    #> # A tibble: 32,032 x 6
    #>    item_key   item_member_id item_app item_read_array      item_global_res… item_app_key_1
    #>    <chr>               <int> <chr>    <chr>                           <int>          <int>
    #>  1 a0a92a50d…              1 forums   "[]"                       1511237486             11
    #>  2 400d1e9cf…              1 forums   "[]"                       1507271991              2
    #>  3 06a3790ea…              1 forums   "[]"                       1510886634            170
    #>  4 1aefba1de…              1 forums   "[]"                       1511095618             61
    #>  5 1589e340d…              1 calendar "{\"69\":1459165015…       1459164193              1
    #>  6 6229be092…              1 forums   "[]"                       1511211533            108
    #>  7 b36018625…              1 forums   "[]"                       1511211533            141
    #>  8 7972acd2b…              1 forums   "[]"                       1511211533            144
    #>  9 ba0737a68…              1 forums   "[]"                       1511200946             87
    #> 10 dabd5bfc1…            132 forums   "[]"                       1458909380            125
    #> # … with 32,022 more rows
    #> 
    #> $core_javascript
    #> # A tibble: 251 x 8
    #>    javascript_id javascript_type javascript_cont… javascript_app javascript_path
    #>            <int> <chr>           <chr>            <chr>          <chr>          
    #>  1          1121 framework       "/*\n * transfo… global         jquery         
    #>  2          1122 framework       "/* jstz.min.js… global         jstz           
    #>  3          1123 framework       "\"use strict\"… global         linkify        
    #>  4          1124 framework       "!function(){\"… global         linkify        
    #>  5          1125 mixins          "/**\n * Invisi… core           mixins         
    #>  6          1126 mixins          "/**\n * Invisi… global         mixins         
    #>  7          1127 mixins          "/**\n * Invisi… global         mixins         
    #>  8          1128 model           "/**\n * Invisi… global         models/core    
    #>  9          1129 model           "/**\n * Invisi… core           models/messages
    #> 10          1130 model           "/**\n * Invisi… core           models/messages
    #> # … with 241 more rows, and 3 more variables: javascript_location <chr>,
    #> #   javascript_position <int>, javascript_name <chr>
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
    #>    like_cache_id like_cache_app like_cache_area like_cache_rel_… like_cache_data
    #>    <chr>         <chr>          <chr>                      <dbl> <chr>          
    #>  1 321571a7b843… forums         forums                 1.50e-322 "a:3:{s:7:\"me…
    #>  2 5b1fb15ebe04… forums         topics                 1.81e-320 "a:3:{s:7:\"me…
    #>  3 4ed3d61094ba… forums         topics                 1.81e-320 "a:3:{s:7:\"me…
    #>  4 b5067d6b91ca… forums         topics                 7.95e-322 "a:3:{s:7:\"me…
    #>  5 81d82ffa5b6d… forums         forums                 6.50e-323 "a:3:{s:7:\"me…
    #>  6 d9409ca5f0c5… forums         topics                 2.54e-320 "a:3:{s:7:\"me…
    #>  7 296567d2dffd… forums         topics                 2.70e-320 "a:3:{s:7:\"me…
    #>  8 6ee661dd69ab… forums         topics                 2.67e-320 "a:3:{s:7:\"me…
    #>  9 98ca3d02b4a1… forums         topics                 2.60e-320 "a:3:{s:7:\"me…
    #> 10 a7aac8b0f1a9… forums         topics                 1.50e-323 "a:3:{s:7:\"me…
    #> # … with 5,294 more rows, and 1 more variable: like_cache_expire <int>
    #> 
    #> $core_log
    #> # A tibble: 7,238 x 9
    #>           id exception_class exception_code message backtrace   time category url  
    #>        <dbl> <chr>           <lgl>          <chr>   <chr>      <int> <chr>    <chr>
    #>  1 1.26e-319 OutOfRangeExce… FALSE           <NA>   "#0 /usr… 1.51e9 embed_e… http…
    #>  2 1.26e-319 OutOfRangeExce… FALSE           <NA>   "#0 /usr… 1.51e9 embed_e… http…
    #>  3 1.26e-319 <NA>            NA             "\nIPS… "#0 /usr… 1.51e9 uncaugh… http…
    #>  4 1.26e-319 <NA>            NA             "\nIPS… "#0 /usr… 1.51e9 uncaugh… http…
    #>  5 1.26e-319 OutOfRangeExce… FALSE           <NA>   "#0 /usr… 1.51e9 embed_e… http…
    #>  6 1.26e-319 OutOfRangeExce… FALSE           <NA>   "#0 /usr… 1.51e9 embed_e… http…
    #>  7 1.26e-319 OutOfRangeExce… FALSE           <NA>   "#0 /usr… 1.51e9 embed_e… http…
    #>  8 1.26e-319 <NA>            NA             "\nIPS… "#0 /usr… 1.51e9 uncaugh… http…
    #>  9 1.26e-319 OutOfRangeExce… FALSE           <NA>   "#0 /usr… 1.51e9 embed_e… http…
    #> 10 1.26e-319 OutOfRangeExce… FALSE           <NA>   "#0 /usr… 1.51e9 embed_e… http…
    #> # … with 7,228 more rows, and 1 more variable: member_id <int>
    #> 
    #> $core_login_handlers
    #> # A tibble: 10 x 5
    #>    login_key  login_settings                           login_order login_acp login_enabled
    #>    <chr>      <chr>                                          <int> <lgl>     <lgl>        
    #>  1 Internal   "{\"auth_types\":1}"                               1 TRUE      TRUE         
    #>  2 Ldap       "{\"auth_types\":1}"                               4 FALSE     FALSE        
    #>  3 External   "{\"auth_types\":1}"                               5 FALSE     FALSE        
    #>  4 Facebook   "{\"app_id\":null,\"app_secret\":null,\…           6 FALSE     FALSE        
    #>  5 Twitter    "{\"consumer_key\":null,\"consumer_secr…           7 FALSE     FALSE        
    #>  6 Live       "[]"                                               8 FALSE     FALSE        
    #>  7 Linkedin   "[]"                                               9 FALSE     FALSE        
    #>  8 Google     "[]"                                              10 FALSE     FALSE        
    #>  9 Ipsconnect "[]"                                              11 FALSE     FALSE        
    #> 10 Convert    "[]"                                              12 FALSE     FALSE        
    #> 
    #> $core_member_history
    #> # A tibble: 3,481 x 7
    #>         log_id log_member log_by log_type  log_data     log_date            log_ip_address
    #>          <dbl>      <dbl>  <dbl> <chr>     <chr>        <dttm>              <chr>         
    #>  1 Inf.Nae-324  8.00e-323      0 display_… "{\"old\":\… 2011-09-14 05:33:58 152.33.17.196 
    #>  2 Inf.Nae-324  8.00e-323      0 display_… "{\"old\":\… 2011-09-14 05:43:54 152.33.17.196 
    #>  3   1.50e-323  4.00e-323      0 display_… "{\"old\":\… 2011-09-14 20:57:39 98.198.24.90  
    #>  4   2.00e-323  5.50e-323      0 display_… "{\"old\":\… 2011-10-04 18:52:06 109.77.91.235 
    #>  5   2.50e-323  5.70e-322      0 display_… "{\"old\":\… 2012-01-19 22:52:07 79.67.83.218  
    #>  6   3.00e-323  5.70e-322      0 display_… "{\"old\":\… 2012-01-21 19:26:39 79.67.83.218  
    #>  7   3.50e-323  8.00e-322      0 display_… "{\"old\":\… 2012-02-23 06:11:55 188.95.153.254
    #>  8   4.00e-323  7.00e-322      0 display_… "{\"old\":\… 2012-02-28 20:45:34 24.229.117.252
    #>  9   4.50e-323  2.00e-322      0 display_… "{\"old\":\… 2012-03-05 16:17:43 82.17.111.92  
    #> 10   5.00e-323  9.85e-322      0 display_… "{\"old\":\… 2012-03-28 00:33:49 89.136.88.101 
    #> # … with 3,471 more rows
    #> 
    #> $core_member_status_replies
    #> # A tibble: 487 x 7
    #>    reply_id reply_status_id reply_member_id reply_date reply_content reply_approved
    #>       <int>           <int>           <int>      <int> <chr>                  <int>
    #>  1        1               2              35 1324554161 "<p>Try livi…              1
    #>  2        2               2             132 1328301526 "<p>Try livi…              1
    #>  3        3              23             143 1330034455 "<p>Omg, blo…              1
    #>  4        5              27             164 1332465964 "<p>Yeah it'…              1
    #>  5      710            3024            9446 1486996408 "<p>\n\tI co…              1
    #>  6        7              29             132 1333328200 "<p>*hmm...s…              1
    #>  7        8              29             130 1333757777 "<p>lolgenoc…              1
    #>  8        9              29             130 1333758050 "<p>I didn't…              1
    #>  9       10              26              84 1335455835 "<p>I thank …              1
    #> 10       11              49             246 1338862771 "<p>I prefer…              1
    #> # … with 477 more rows, and 1 more variable: reply_ip_address <chr>
    #> 
    #> $core_member_status_updates
    #> # A tibble: 553 x 12
    #>    status_id status_member_id status_date status_content status_replies status_last_ids
    #>        <int>            <int>       <int> <chr>                   <int> <chr>          
    #>  1         2               14  1316397519 <p>Cold... *b…              3 "a:3:{i:132455…
    #>  2         6               35  1319211330 <p>I am so fu…              0 "a:0:{}"       
    #>  3         7               35  1319935567 <p>Queensrych…              0 "a:0:{}"       
    #>  4         8               35  1319935570 <p>Queensrych…              0 "a:0:{}"       
    #>  5        11               35  1321967601 <p>Getting in…              0 "a:0:{}"       
    #>  6        12               89  1324039690 <p>National S…              0 "a:0:{}"       
    #>  7        28              143  1332804371 <p>Ahaha, gna…              0 "a:0:{}"       
    #>  8        29              130  1332911151 <p>Dreams of …              3 "a:3:{i:133332…
    #>  9        19              143  1328730328 <p>Numbess of…              0 "a:0:{}"       
    #> 10        20              143  1328846880 <p>Sleep addi…              0 "a:0:{}"       
    #> # … with 543 more rows, and 6 more variables: status_is_latest <lgl>,
    #> #   status_is_locked <lgl>, status_hash <chr>, status_author_id <int>,
    #> #   status_author_ip <chr>, status_approved <int>
    #> 
    #> $core_members
    #> # A tibble: 1,207 x 66
    #>    member_id name  member_group_id email joined              ip_address allow_admin_mai…
    #>        <int> <chr>           <int> <chr> <dttm>              <chr>      <list>          
    #>  1         1 Алек…               4 slav… 2011-09-12 15:46:59 178.140.1… <raw [1]>       
    #>  2     14875 Poet…              17 Gray… 2017-08-29 15:39:22 199.66.88… <raw [1]>       
    #>  3     14918 Vale…              17 oliv… 2017-09-10 15:51:00 86.10.127… <raw [1]>       
    #>  4     14926 cucc…              14 nigg… 2017-09-12 18:29:13 172.104.1… <raw [1]>       
    #>  5     14921 Hier…              17 Prow… 2017-09-11 11:07:06 2600:8804… <raw [1]>       
    #>  6         2 Phal…              13 illu… 2011-09-12 15:52:30 68.37.21.… <raw [1]>       
    #>  7     14057 Righ               13 righ… 2017-02-20 16:13:25 46.28.53.… <raw [1]>       
    #>  8     14040 Zaxon              14 helv… 2017-02-18 09:36:32 185.93.18… <raw [1]>       
    #>  9     14041 Солд…              13 mrel… 2017-02-18 12:06:20 2a02:c7d:… <raw [1]>       
    #> 10         3 Bloo…              13 rene… 2011-09-12 18:10:11 68.10.255… <raw [1]>       
    #> # … with 1,197 more rows, and 59 more variables: skin <int>, warn_level <int>,
    #> #   warn_lastwarn <int>, language <int>, restrict_post <int>, bday_day <int>,
    #> #   bday_month <int>, bday_year <int>, msg_count_new <int>, msg_count_total <int>,
    #> #   msg_count_reset <int>, msg_show_notification <lgl>, last_visit <dttm>,
    #> #   last_activity <dttm>, mod_posts <int>, auto_track <chr>, temp_ban <int>,
    #> #   mgroup_others <chr>, member_login_key_expire <dttm>, members_seo_name <chr>,
    #> #   members_cache <chr>, members_disable_pm <int>, failed_logins <chr>,
    #> #   failed_login_count <int>, members_profile_views <int>, members_pass_hash <chr>,
    #> #   members_pass_salt <chr>, members_bitoptions <int>, members_day_posts <chr>,
    #> #   notification_cnt <int>, pp_last_visitors <chr>, pp_main_photo <chr>,
    #> #   pp_main_width <int>, pp_main_height <int>, pp_thumb_photo <chr>,
    #> #   pp_thumb_width <int>, pp_thumb_height <int>, pp_setting_count_comments <lgl>,
    #> #   pp_reputation_points <int>, pp_gravatar <chr>, pp_photo_type <chr>, signature <chr>,
    #> #   fb_bwoptions <lgl>, tc_last_sid_import <chr>, tc_bwoptions <lgl>,
    #> #   pp_customization <chr>, timezone <chr>, pp_cover_photo <chr>,
    #> #   members_bitoptions2 <int>, create_menu <chr>, marked_site_read <int>,
    #> #   pp_cover_offset <int>, acp_skin <lgl>, acp_language <lgl>, member_title <chr>,
    #> #   member_posts <int>, member_last_post <int>, member_streams <chr>,
    #> #   photo_last_update <dttm>
    #> 
    #> $core_members_known_devices
    #> # A tibble: 4,637 x 7
    #>    device_key    member_id user_agent        login_key   last_seen anonymous login_handler
    #>    <chr>             <dbl> <chr>             <chr>           <int> <lgl>     <chr>        
    #>  1 00082373c8eb… 6.62e-320 Mozilla/5.0 (X11… 87d2e29b24…    1.51e9 FALSE     Internal     
    #>  2 000cc82a643f… 7.43e-320 Mozilla/5.0 (Win… 499daed48a…    1.51e9 FALSE     <NA>         
    #>  3 001984f07aaf… 4.75e-320 Mozilla/5.0 (Win… 2834e20cb9…    1.51e9 FALSE     Internal     
    #>  4 00273c660ce7… 6.59e-320 Mozilla/5.0 (Lin… d2fa09c10d…    1.51e9 FALSE     Internal     
    #>  5 00301de9d149… 7.43e-320 Mozilla/5.0 (Win… 7c5b4eacf4…    1.51e9 FALSE     Internal     
    #>  6 004e28b74461… 7.32e-320 Mozilla/5.0 (Lin… <NA>           1.50e9 FALSE     <NA>         
    #>  7 00574e72b134… 4.05e-320 Mozilla/5.0 (iPa… 1c8f47d636…    1.51e9 FALSE     Internal     
    #>  8 0058c48a3865… 7.39e-320 Mozilla/5.0 (Win… <NA>           1.51e9 FALSE     Internal     
    #>  9 005ee0ee6afa… 7.20e-320 Mozilla/5.0 (Lin… 829c239502…    1.51e9 FALSE     Internal     
    #> 10 009368382d5a… 7.12e-320 Mozilla/5.0 (Win… <NA>           1.50e9 FALSE     Internal     
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
    #>    wl_id wl_member wl_moderator wl_date             wl_reason wl_points wl_note_member
    #>    <int>     <int>        <int> <dttm>                  <int>     <int> <chr>         
    #>  1     2        40            4 2011-10-27 23:38:28         0         1 <NA>          
    #>  2     3        40            4 2011-10-27 23:39:35         0         0 <NA>          
    #>  3     4        40            4 2011-12-04 00:16:19         0         0 <NA>          
    #>  4     5        89            7 2011-12-17 22:04:47         0         1 <NA>          
    #>  5     6        49           14 2011-12-17 22:07:40         0         1 <NA>          
    #>  6     7        40           14 2011-12-23 20:27:50         0         0 <NA>          
    #>  7     8        40           14 2011-12-25 14:33:04         0         0 <NA>          
    #>  8     9        40            4 2012-01-01 19:56:58         0         0 <NA>          
    #>  9    10        40            4 2012-01-28 21:05:49         0         0 <NA>          
    #> 10    11        49            4 2012-01-28 21:06:46         0         0 <NA>          
    #> # … with 177 more rows, and 10 more variables: wl_note_mods <chr>, wl_mq <chr>,
    #> #   wl_rpa <chr>, wl_suspend <chr>, wl_acknowledged <lgl>, wl_content_app <chr>,
    #> #   wl_content_id1 <chr>, wl_content_id2 <chr>, wl_expire_date <int>,
    #> #   wl_content_module <chr>
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
    #>             id app    extension  config          position parent permissions is_menu_child
    #>          <dbl> <chr>  <chr>      <chr>              <int>  <int> <chr>       <lgl>        
    #>  1 Inf.Nae-324 core   CustomItem "{\"menu_custo…        1     NA *           FALSE        
    #>  2 Inf.Nae-324 core   CustomItem "{\"menu_custo…        2     NA *           FALSE        
    #>  3   1.50e-323 core   AllActivi… "[]"                   1      2 *           FALSE        
    #>  4   2.00e-323 core   YourActiv… "[]"                   2      2 *           FALSE        
    #>  5   2.50e-323 core   YourActiv… "{\"menu_strea…        3      2 *           FALSE        
    #>  6   3.00e-323 core   YourActiv… "{\"menu_strea…        4      2 *           FALSE        
    #>  7   3.50e-323 core   Search     "[]"                   5      2 *           FALSE        
    #>  8   4.50e-323 calen… Calendar   "[]"                   3      1 *           FALSE        
    #>  9   5.00e-323 core   Guidelines "[]"                   2      1 *           FALSE        
    #> 10   5.50e-323 core   StaffDire… "[]"                   4      1 *           FALSE        
    #> 11   6.00e-323 core   OnlineUse… "[]"                   5      1 *           FALSE        
    #> 12   6.50e-323 core   Menu       "[]"                   3     NA *           FALSE        
    #> 13   7.00e-323 core   CustomItem "{\"menu_custo…        3     13 *           TRUE         
    #> 14   7.50e-323 core   CustomItem "{\"menu_custo…        2     13 *           TRUE         
    #> 15   8.50e-323 core   CustomItem "{\"menu_custo…        1     13 *           TRUE         
    #> 16   9.00e-323 core   Promoted   "[]"                   6     NA <NA>        FALSE        
    #> 17   9.50e-323 core   Clubs      "[]"                   7     NA <NA>        FALSE        
    #> 18  10.00e-323 core   Leaderboa… "[]"                   8     NA <NA>        FALSE        
    #> 
    #> $core_message_posts
    #> # A tibble: 21,715 x 8
    #>    msg_id msg_topic_id msg_date            msg_post msg_post_key msg_author_id
    #>     <int>        <int> <dttm>              <chr>    <chr>                <int>
    #>  1      1            1 2011-09-16 03:49:58 "<p>The… 3320f7f06c4…             1
    #>  2      2            2 2011-09-16 11:54:08 "\n<p>W… 9204e488332…            11
    #>  3      3            2 2011-09-16 14:39:59 "<p>Cri… 12fd0309239…             1
    #>  4      4            2 2011-09-16 15:29:01 "<p>Tha… 0658c6f99ac…            11
    #>  5      5            2 2011-09-16 15:32:58 "<p>If … 570257864e3…             1
    #>  6      6            2 2011-09-16 15:44:51 "<p>The… aabeacc8f4c…            11
    #>  7      7            3 2011-09-17 01:43:49 "<p>I d… a36f67c0d72…            16
    #>  8      8            3 2011-09-17 01:59:50 "\n<blo… 327b933d818…            14
    #>  9     12            5 2011-09-20 14:20:14 "<p>The… 0667258c387…             1
    #> 10     13            5 2011-09-20 14:42:17 "<p>Don… de1d7fd2737…            20
    #> # … with 21,705 more rows, and 2 more variables: msg_ip_address <chr>,
    #> #   msg_is_first_post <lgl>
    #> 
    #> $core_message_topic_user_map
    #> # A tibble: 8,787 x 12
    #>    map_id map_user_id map_topic_id map_folder_id map_read_time       map_user_active
    #>     <int>       <int>        <int> <chr>         <dttm>              <lgl>          
    #>  1      1          23            1 myconvo       2011-11-04 06:53:06 TRUE           
    #>  2      2           1            1 myconvo       2011-09-20 14:19:38 FALSE          
    #>  3      3           1            2 myconvo       2011-09-16 15:46:25 FALSE          
    #>  4      4          11            2 myconvo       2011-09-20 04:03:38 TRUE           
    #>  5      5          14            3 myconvo       2011-09-17 01:59:51 TRUE           
    #>  6      6          16            3 myconvo       2011-09-17 18:19:01 FALSE          
    #>  7      9          20            5 myconvo       2011-09-20 14:42:17 TRUE           
    #>  8     10           1            5 myconvo       2011-11-07 01:36:40 FALSE          
    #>  9     11          11            6 myconvo       2011-09-22 14:18:00 TRUE           
    #> 10     12           1            6 myconvo       2011-09-22 14:33:52 FALSE          
    #> # … with 8,777 more rows, and 6 more variables: map_user_banned <lgl>,
    #> #   map_has_unread <lgl>, map_is_starter <lgl>, map_left_time <int>,
    #> #   map_ignore_notification <lgl>, map_last_topic_reply <dttm>
    #> 
    #> $core_message_topics
    #> # A tibble: 4,475 x 12
    #>    mt_id mt_date             mt_title mt_starter_id mt_start_time      
    #>    <int> <dttm>              <chr>            <int> <dttm>             
    #>  1     1 2011-09-16 03:49:58 Introdu…             1 2011-09-16 03:49:58
    #>  2     2 2011-09-16 11:54:08 Our hos…            11 2011-09-16 11:54:07
    #>  3     3 2011-09-17 01:43:49 Re: Nov…            16 2011-09-17 01:43:49
    #>  4     5 2011-09-20 14:20:14 Introdu…             1 2011-09-20 14:20:14
    #>  5     6 2011-09-22 14:12:17 msn                  1 2011-09-22 14:12:17
    #>  6     8 2011-09-22 21:21:22 Do you …             2 2011-09-22 21:21:22
    #>  7    10 2011-09-23 20:44:56 Introdu…             1 2011-09-23 20:44:56
    #>  8    11 2011-09-24 09:40:39 Introdu…             1 2011-09-24 09:40:39
    #>  9    12 2011-09-25 17:18:50 Welcome…            14 2011-09-25 17:18:50
    #> 10    13 2011-09-26 01:05:50 Could I…             2 2011-09-26 01:05:49
    #> # … with 4,465 more rows, and 7 more variables: mt_last_post_time <dttm>,
    #> #   mt_to_count <int>, mt_to_member_id <int>, mt_replies <int>, mt_first_msg_id <int>,
    #> #   mt_is_draft <lgl>, mt_is_deleted <lgl>
    #> 
    #> $core_moderator_logs
    #> # A tibble: 32,547 x 13
    #>             id member_id ctime               note  ip_address appcomponent module
    #>          <dbl>     <int> <dttm>              <chr> <chr>      <chr>        <chr> 
    #>  1 Inf.Nae-324         0 2011-09-12 17:13:41  <NA> 178.140.1… core         task  
    #>  2 Inf.Nae-324         1 2011-09-12 18:14:50 "{\"… 178.140.1… forums       <NA>  
    #>  3   1.50e-323         1 2011-09-12 18:14:50 "{\"… 178.140.1… forums       <NA>  
    #>  4   2.00e-323         1 2011-09-12 21:42:16 "{\"… 178.140.1… forums       <NA>  
    #>  5   2.50e-323         0 2011-09-12 22:05:07  <NA> 178.140.1… core         task  
    #>  6   3.00e-323         1 2011-09-13 08:52:25 "{\"… 178.140.1… forums       <NA>  
    #>  7   3.50e-323         1 2011-09-13 09:13:02 "{\"… 178.140.1… forums       <NA>  
    #>  8   4.00e-323         1 2011-09-13 09:47:48 "{\"… 178.140.1… forums       <NA>  
    #>  9   4.50e-323         1 2011-09-13 09:52:23 "{\"… 178.140.1… forums       <NA>  
    #> 10   5.00e-323         1 2011-09-13 09:55:16 "{\"… 178.140.1… forums       <NA>  
    #> # … with 32,537 more rows, and 6 more variables: controller <chr>, do <chr>,
    #> #   lang_key <chr>, class <chr>, item_id <int>, member_name <chr>
    #> 
    #> $core_moderators
    #> # A tibble: 3 x 3
    #>          id perms                                                                  updated
    #>       <dbl> <chr>                                                                    <int>
    #> 1 2.00e-323 "*"                                                                     1.46e9
    #> 2 3.00e-323 "{\"can_manage_sidebar\":false,\"can_use_ip_tools\":true,\"can_edit…    1.50e9
    #> 3 5.00e-323 "{\"can_manage_sidebar\":false,\"can_use_ip_tools\":true,\"can_edit…    1.50e9
    #> 
    #> $core_modules
    #> # A tibble: 41 x 8
    #>    sys_module_id sys_module_appl… sys_module_key sys_module_prot… sys_module_posi…
    #>            <int> <chr>            <chr>          <lgl>                       <int>
    #>  1             1 core             overview       FALSE                           1
    #>  2             2 core             system         TRUE                            2
    #>  3             3 core             applications   FALSE                           3
    #>  4             4 core             settings       FALSE                           4
    #>  5             5 core             members        FALSE                           5
    #>  6             6 core             membersettings FALSE                           6
    #>  7             7 core             staff          FALSE                           7
    #>  8             8 core             customization  FALSE                           8
    #>  9             9 core             languages      FALSE                           9
    #> 10            10 core             editor         FALSE                          10
    #> # … with 31 more rows, and 3 more variables: sys_module_area <chr>,
    #> #   sys_module_default <lgl>, sys_module_default_controller <chr>
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
    #>           id member notification_key item_class   item_id member_data sent_time read_time
    #>        <dbl>  <int> <chr>            <chr>          <dbl> <chr>           <int>     <int>
    #>  1 1.03e-318  14201 new_likes        "IPS\\for… 1.00e-318  <NA>          1.51e9    1.51e9
    #>  2 1.03e-318  14852 new_comment      "IPS\\for… 2.06e-321 "{\"follow…    1.51e9    1.51e9
    #>  3 1.02e-318  14041 new_likes        "IPS\\for… 9.84e-319  <NA>          1.50e9    1.51e9
    #>  4 1.02e-318  14127 new_likes        "IPS\\for… 1.00e-318  <NA>          1.50e9    1.51e9
    #>  5 1.04e-318  14404 new_likes        "IPS\\for… 1.00e-318  <NA>          1.51e9    1.51e9
    #>  6 1.04e-318   9668 new_likes        "IPS\\for… 1.00e-318  <NA>          1.51e9    1.51e9
    #>  7 1.03e-318  14450 new_comment      "IPS\\for… 2.83e-320 "{\"follow…    1.51e9   NA     
    #>  8 1.03e-318  13839 new_likes        "IPS\\for… 9.80e-319  <NA>          1.51e9    1.51e9
    #>  9 1.03e-318  14102 new_comment      "IPS\\for… 4.11e-320 "{\"follow…    1.51e9   NA     
    #> 10 1.03e-318  14450 new_comment      "IPS\\for… 4.11e-320 "{\"follow…    1.51e9   NA     
    #> # … with 34,792 more rows, and 5 more variables: notification_app <chr>,
    #> #   updated_time <int>, item_sub_class <chr>, item_sub_id <dbl>, extra <chr>
    #> 
    #> $core_permission_index
    #> # A tibble: 202 x 10
    #>    perm_id app    perm_type  perm_type_id perm_view perm_2 perm_3 perm_4 perm_6 owner_only
    #>      <int> <chr>  <chr>             <int> <chr>     <chr>  <chr>  <chr>  <chr>  <lgl>     
    #>  1       1 membe… profile_v…            1 2,3,4,6,… <NA>   <NA>   <NA>   <NA>   FALSE     
    #>  2       2 core   help                  1 2,3,4,6,… <NA>   <NA>   <NA>   <NA>   FALSE     
    #>  3       3 forums forum                 1 2,13,4,6… <NA>   <NA>   <NA>   <NA>   FALSE     
    #>  4     125 forums forum                 2 6,10,13,… 6,10,… 4      6,10,… <NA>   FALSE     
    #>  5     110 forums forum                92 4,2,13,6… 4,2,1… 4,13,… 4,13,… <NA>   FALSE     
    #>  6       7 forums forum                 5 4,2,13,6… 4,2,1… 4,13,… 4,13,… 4,6,10 FALSE     
    #>  7     118 forums forum               100 4,2,13,6… 4,2,1… 4,13,… 4,13,… <NA>   FALSE     
    #>  8       9 forums forum                 7 4,2,13,6… <NA>   <NA>   <NA>   <NA>   TRUE      
    #>  9     109 forums forum                91 4,2,13,6… 4,2,1… 4,13,… 4,13,… <NA>   FALSE     
    #> 10     108 forums forum                90 4,2,13,6… 4,2,1… 4,13,… 4,13,… <NA>   FALSE     
    #> # … with 192 more rows
    #> 
    #> $core_pfields_content
    #> # A tibble: 1,208 x 8
    #>    member_id field_3   field_5  field_6  field_7      field_11     field_12       field_13
    #>        <int> <chr>     <chr>    <chr>    <chr>        <chr>        <chr>          <chr>   
    #>  1         1 <NA>      Male     Third R… <NA>         FASCISM       <NA>          <NA>    
    #>  2         2 <NA>      Male     <NA>     <NA>         Out of cont…  <NA>          <NA>    
    #>  3         3 <NA>      Male     Dixie    Muay Thai, … ≠             <NA>          <NA>    
    #>  4         4 http://b… Male     Babylon  You          Theonomy     "\n<p>\n\tDef… <NA>    
    #>  5         5 <NA>      Male     Great B… Politics, h… Republican …  <NA>          <NA>    
    #>  6         7 <NA>      Male     United … <NA>         Post-Irony    <NA>          <NA>    
    #>  7         8 <NA>      Male     <NA>     <NA>         Syndicalist… "<p>\n\tEarly… <NA>    
    #>  8         9 <NA>      Female   AWOL     <NA>         Classic Fas…  <NA>          <NA>    
    #>  9        11 <NA>      Male     Ireland  <NA>         Fascist-esq…  <NA>          <NA>    
    #> 10        12 <NA>      Not Tel… <NA>     <NA>         Integralism   <NA>          <NA>    
    #> # … with 1,198 more rows
    #> 
    #> $core_pfields_data
    #> # A tibble: 7 x 9
    #>   pf_id pf_content pf_type pf_not_null pf_position pf_show_on_reg pf_format pf_group_id
    #>   <int> <chr>      <chr>   <lgl>             <int> <lgl>          <chr>           <int>
    #> 1     3 "null"     Url     FALSE                 0 FALSE           <NA>               1
    #> 2     5 "[\"Not T… Select  TRUE                  2 TRUE            <NA>               2
    #> 3     6 "null"     Text    TRUE                  3 TRUE           "<span c…           2
    #> 4     7 "null"     TextAr… FALSE                 4 FALSE           <NA>               2
    #> 5    13 "null"     Url     FALSE                 5 FALSE           <NA>               1
    #> 6    11 "null"     Text    TRUE                  1 TRUE           "<span c…           2
    #> 7    12 "null"     Editor  FALSE                 0 FALSE           <NA>               3
    #> # … with 1 more variable: pf_search_type <chr>
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
    #>      pid start_date          choices     starter_id votes poll_question   poll_view_voters
    #>    <int> <dttm>              <chr>            <int> <int> <chr>           <lgl>           
    #>  1     1 2011-12-13 15:25:38 "{\"1\":{\…          4    13 <NA>            FALSE           
    #>  2     3 2012-02-14 00:03:33 "{\"1\":{\…          4    27 THERE WAS A HU… FALSE           
    #>  3     4 2012-03-06 16:28:36 "{\"1\":{\…         14    41 Answer the Que… TRUE            
    #>  4     6 2012-05-11 01:31:58 "{\"1\":{\…          0    40 Do you have in… FALSE           
    #>  5    11 2012-09-06 04:27:51 "{\"1\":{\…        274    20 How would peer… FALSE           
    #>  6    18 2013-08-10 01:03:42 "{\"1\":{\…       6201    25 How Gay is the… TRUE            
    #>  7    20 2013-08-19 20:44:13 "{\"1\":{\…          0    23 Mexican or Mus… FALSE           
    #>  8    23 2013-10-22 13:27:17 "{\"1\":{\…         35    53 Where do you l… FALSE           
    #>  9    24 2014-03-15 05:34:15 "{\"1\":{\…       6122    22 <NA>            FALSE           
    #> 10    25 2014-04-30 20:33:11 "{\"1\":{\…          0    28 Climate Change  TRUE            
    #> # … with 30 more rows
    #> 
    #> $core_profile_steps
    #> # A tibble: 2 x 5
    #>       step_id step_completion_… step_required step_extension  step_subcompletion_act      
    #>         <dbl> <chr>             <list>        <chr>           <chr>                       
    #> 1 Inf.Nae-324 profile_fields    <raw [1]>     core_ProfileFi… "[\"core_pfield_11\",\"core…
    #> 2 Inf.Nae-324 basic_profile     <raw [1]>     core_Core       "[\"photo\"]"               
    #> 
    #> $core_question_and_answer
    #> # A tibble: 4 x 2
    #>   qa_id qa_answers                                                                        
    #>   <int> <chr>                                                                             
    #> 1    17 "[\"JEWISH QUESTION\",\"THE JEWISH QUESTION\"]"                                   
    #> 2    16 "[\"FASCIST ALMA MATER\"]"                                                        
    #> 3    15 "[\"GAS THE KIKES RACE WAR NOW 1488 BOOTS ON THE GROUND\",\"GAS THE KIKES RACE WA…
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
    #>       id   rid comment              comment_by comment_date        author_name  ip_address
    #>    <int> <int> <chr>                     <int> <dttm>              <chr>        <chr>     
    #>  1     1     1 "This is an anti-fa…          9 2011-12-24 09:57:56 Woman in Bl… 88.147.17…
    #>  2    13    10 "done"                       49 2012-12-27 20:38:44 Владимир_Бо… 72.78.105…
    #>  3    26    74 "<p>Don't report pe…          4 2014-01-02 11:51:34 Mierce       82.25.135…
    #>  4    30    89 "<p>No.</p>\n"                1 2015-05-13 16:30:24 Александр С… 5.228.66.…
    #>  5    31    89 "<p>I'll need a tra…       2170 2015-05-13 20:18:43 Zeiger       69.70.181…
    #>  6    32    89 "<p>this is just to…       9475 2015-05-13 21:47:00 mengligiray… 95.142.13…
    #>  7    33    89 "<p>&gt;Puts someth…       2220 2015-05-15 02:16:03 Kulturkampf  122.128.1…
    #>  8    34    90 "Who are you again?"       2170 2015-05-21 06:36:39 Zeiger       66.102.6.…
    #>  9    35    90 "<p>He's the guy th…       9475 2015-05-21 06:57:15 mengligiray… 95.142.13…
    #> 10    36    90 "<p>Oh yeah, sure &…          1 2015-05-21 07:40:49 Александр С… 5.228.66.…
    #> # … with 43 more rows
    #> 
    #> $core_rc_index
    #> # A tibble: 99 x 10
    #>             id class content_id   perm_id num_reports num_comments first_report_by
    #>          <dbl> <chr>      <dbl>     <dbl>       <int>        <int>           <int>
    #>  1 Inf.Nae-324 "IPS…  2.99e-320 5.15e-322           1            1              11
    #>  2   5.00e-323 "IPS…  2.30e-319 5.85e-322           1            1            2099
    #>  3   7.00e-323 "IPS…  2.54e-319 5.30e-322           1            0               2
    #>  4   2.90e-322 "IPS…  3.11e-319 0.                  1            0            6174
    #>  5   3.30e-322 "IPS…  3.23e-319 5.30e-322           1            0            6173
    #>  6   3.45e-322 "IPS…  3.40e-319 9.65e-322           1            0               2
    #>  7   3.50e-322 "IPS…  3.40e-319 5.30e-322           1            0               2
    #>  8   3.70e-322 "IPS…  3.56e-319 5.25e-322           1            1               0
    #>  9   4.45e-322 "IPS…  4.30e-319 1.60e-322           1            4               0
    #> 10   4.50e-322 "IPS…  5.59e-319 6.25e-322           1            5               0
    #> # … with 89 more rows, and 3 more variables: first_report_date <dttm>,
    #> #   last_updated <dttm>, author <int>
    #> 
    #> $core_rc_reports
    #> # A tibble: 106 x 6
    #>       id   rid report                                   report_by date_reported ip_address
    #>    <int> <int> <chr>                                        <int>         <int> <chr>     
    #>  1     1     1 "\n<blockquote data-ipsquote=\"\" class…        11    1324684384 <NA>      
    #>  2    10    10 "\n<blockquote data-ipsquote=\"\" class…      2099    1356640292 <NA>      
    #>  3    14    14 "\n<blockquote data-ipsquote=\"\" class…         2    1361245960 <NA>      
    #>  4    59    55 "<p>spam profile</p>"                         1209    1366310513 <NA>      
    #>  5    60    56 "<p>more spam profile's</p>"                  1209    1366310573 <NA>      
    #>  6    62    58 "\n<blockquote data-ipsquote=\"\" class…      6174    1374646450 <NA>      
    #>  7    71    66 "\n<blockquote data-ipsquote=\"\" class…      6173    1377089209 <NA>      
    #>  8    74    69 "\n<blockquote data-ipsquote=\"\" class…         2    1380356286 <NA>      
    #>  9    75    70 "\n<blockquote data-ipsquote=\"\" class…         2    1380356292 <NA>      
    #> 10    79    74 "\n<blockquote data-ipsquote=\"\" class…         0    1388660127 <NA>      
    #> # … with 96 more rows
    #> 
    #> $core_reputation_index
    #> # A tibble: 272,129 x 10
    #>             id member_id app   type  type_id rep_date            member_received rep_class
    #>          <dbl>     <int> <chr> <chr>   <int> <dttm>                        <int> <chr>    
    #>  1 Inf.Nae-324        14 foru… pid         4 2011-09-13 23:02:39               1 "IPS\\fo…
    #>  2   1.50e-323        14 foru… pid       124 2011-09-14 20:30:25              13 "IPS\\fo…
    #>  3   2.00e-323        13 foru… pid       119 2011-09-14 21:57:39               9 "IPS\\fo…
    #>  4   2.50e-323         9 foru… pid       180 2011-09-15 16:49:00               3 "IPS\\fo…
    #>  5   6.31e-321        11 foru… pid      8457 2012-01-28 19:41:56               7 "IPS\\fo…
    #>  6   3.50e-323         3 foru… pid       182 2011-09-15 23:40:19               9 "IPS\\fo…
    #>  7   4.00e-323         3 foru… pid       213 2011-09-16 03:46:29               7 "IPS\\fo…
    #>  8   4.50e-323         9 foru… pid       227 2011-09-16 07:07:43              16 "IPS\\fo…
    #>  9   5.50e-323        13 foru… pid       293 2011-09-16 22:35:02              14 "IPS\\fo…
    #> 10   6.00e-323         9 foru… pid       345 2011-09-17 13:06:42               1 "IPS\\fo…
    #> # … with 272,119 more rows, and 2 more variables: item_id <int>, class_type_id_hash <chr>
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
    #>    index_class    index_id index_object_id index_item_id index_container… index_content
    #>    <chr>             <dbl>           <int>         <int>            <int> <chr>        
    #>  1 "IPS\\core… Inf.Nae-324            3053          3053             9446 "Congrats on…
    #>  2 "IPS\\core… Inf.Nae-324            3051          3051             9622 "I approve o…
    #>  3 "IPS\\core…   1.50e-323            3050          3050            14382 "I have more…
    #>  4 "IPS\\core…   2.00e-323            3049          3049             9872 "Hi Rostisla…
    #>  5 "IPS\\core…   2.50e-323            3048          3048            14568 "How to kill…
    #>  6 "IPS\\core…   3.00e-323            3047          3047            14568 "knöcheltief…
    #>  7 "IPS\\core…   3.50e-323            3045          3045                7 "Clear out y…
    #>  8 "IPS\\core…   4.00e-323            3044          3044             8232 "&gt;tfw you…
    #>  9 "IPS\\core…   4.50e-323            3043          3043             7986 "Ethiopia be…
    #> 10 "IPS\\core…   5.00e-323            3042          3042            14450 "Iron March …
    #> # … with 196,032 more rows, and 11 more variables: index_permissions <chr>,
    #> #   index_author <int>, index_title <chr>, index_date_created <dttm>,
    #> #   index_date_updated <dttm>, index_hidden <int>, index_item_index_id <dbl>,
    #> #   index_item_author <int>, index_is_last_comment <lgl>, index_class_type_id_hash <chr>,
    #> #   index_container_class <chr>
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
    #>    id    member_name seo_name member_id ip_address browser running_time login_type
    #>    <chr> <chr>       <chr>        <int> <chr>      <chr>          <int>      <int>
    #>  1 0     <NA>        <NA>            NA <NA>       <NA>              NA          0
    #>  2 31hi… <NA>        <NA>            NA 162.158.7… Mozill…   1511236789          3
    #>  3 97b1… <NA>        <NA>            NA 108.162.2… Mozill…   1511237308          3
    #>  4 lkec… <NA>        <NA>            NA 162.158.7… Mozill…   1511236955          3
    #>  5 mfpd… <NA>        <NA>            NA 162.158.1… Mozill…   1511236584          3
    #>  6 sga7… <NA>        <NA>            NA 108.162.2… Mozill…   1511235889          3
    #>  7 261f… <NA>        <NA>            NA 108.162.2… Mozill…   1511236691          3
    #>  8 6ad8… <NA>        <NA>            NA 108.162.2… Mozill…   1511237780          3
    #>  9 oiba… <NA>        <NA>            NA 108.162.2… Mozill…   1511237452          3
    #> 10 gpbb… <NA>        <NA>            NA 108.162.2… Mozill…   1511237664          3
    #> # … with 512 more rows, and 13 more variables: member_group <int>,
    #> #   current_appcomponent <chr>, current_module <chr>, uagent_key <chr>,
    #> #   uagent_version <chr>, uagent_type <chr>, current_controller <chr>,
    #> #   location_url <chr>, location_lang <chr>, location_data <chr>,
    #> #   location_permissions <chr>, current_id <int>, data <list>
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
    #>    data                                            updated sitemap                 last_id
    #>    <chr>                                             <int> <chr>                     <dbl>
    #>  1 "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\…    1.51e9 sitemap_content_cale… 0.       
    #>  2 "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\…    1.51e9 sitemap_content_foru… 1.29e-320
    #>  3 "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\…    1.51e9 sitemap_content_foru… 9.11e-321
    #>  4 "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\…    1.51e9 sitemap_content_foru… 6.07e-321
    #>  5 "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\…    1.51e9 sitemap_content_cale… 1.44e-321
    #>  6 "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\…    1.51e9 sitemap_content_foru… 3.16e-321
    #>  7 "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\…    1.51e9 sitemap_content_foru… 0.       
    #>  8 "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\…    1.51e9 sitemap_content_core… 1.49e-320
    #>  9 "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\…    1.51e9 sitemap_content_foru… 1.66e-320
    #> 10  <NA>                                            1.51e9 sitemap_profiles_1    0.       
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
    #>    sdl_id sdl_obj_id sdl_obj_key  sdl_obj_member_… sdl_obj_date        sdl_obj_reason     
    #>     <int>      <int> <chr>                   <int> <dttm>              <chr>              
    #>  1     21       3202 topic                       1 2014-06-30 02:31:55 " Pending verifica…
    #>  2     22        795 topic                       1 2014-06-30 02:32:22 " Pending verifica…
    #>  3     25       3202 topic                       1 2014-09-07 19:20:25  <NA>              
    #>  4     27       4652 topic                     132 2015-01-06 17:42:21  <NA>              
    #>  5     33       5647 topic                       1 2015-11-17 17:11:20  <NA>              
    #>  6    959       3023 status_stat…                1 2017-02-18 04:56:01  <NA>              
    #>  7    958       4991 topic                       1 2016-12-06 10:18:27  <NA>              
    #>  8     36       6281 topic                       1 2016-04-07 22:48:09  <NA>              
    #>  9     38       6483 topic                       1 2016-05-18 19:13:13  <NA>              
    #> 10     39     153418 post                        1 2016-06-09 06:51:02  <NA>              
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
    #>             id classes containers read  follow position member date_type date_relative_d…
    #>          <dbl> <chr>   <chr>      <chr> <chr>     <int>  <int> <chr>                <int>
    #>  1 Inf.Nae-324  <NA>    <NA>      unre… all           1     NA all                     NA
    #>  2 Inf.Nae-324  <NA>    <NA>      all   all           2     NA all                     NA
    #>  3   1.50e-323  <NA>    <NA>      all   follo…        3     NA all                     NA
    #>  4   2.00e-323  <NA>    <NA>      all   follo…        4     NA all                     NA
    #>  5   2.50e-323  <NA>    <NA>      all   all           5     NA all                     NA
    #>  6   3.00e-323 "IPS\\…  <NA>      all   all           1   9620 all                      7
    #>  7   3.50e-323 "IPS\\…  <NA>      all   all           2   9620 all                      7
    #>  8   4.50e-323 "IPS\\… "{\"IPS\\… unre… all           2   9217 all                      7
    #>  9   5.00e-323 "IPS\\…  <NA>      unre… all           1   2170 relative                 7
    #> 10   5.50e-323  <NA>    <NA>      all   all           1   6113 all                      7
    #> 11   7.00e-323 "IPS\\…  <NA>      unre… all           1   9510 all                      7
    #> 12   6.50e-323 "IPS\\… "{\"IPS\\… all   all           4   9217 all                      7
    #> 13   7.50e-323 "IPS\\…  <NA>      unre… all           2   9510 all                      7
    #> 14   8.00e-323 "IPS\\…  <NA>      unre… all           1   9694 all                      7
    #> 15   8.50e-323  <NA>    <NA>      unre… all           1     53 all                      7
    #> 16   9.00e-323  <NA>    <NA>      all   all           3   9510 relative               999
    #> 17   9.50e-323  <NA>    <NA>      unre… all           2   9694 relative                 3
    #> # … with 5 more variables: followed_types <chr>, ownership <chr>, include_comments <lgl>,
    #> #   title <chr>, default <lgl>
    #> 
    #> $core_sys_conf_settings
    #> # A tibble: 371 x 6
    #>    conf_id conf_key     conf_value                     conf_default conf_keywords conf_app
    #>      <int> <chr>        <chr>                          <chr>        <chr>         <chr>   
    #>  1      15 gl_title     "Iron March Forum Charter and… <NA>         <NA>          <NA>    
    #>  2      16 gl_link       <NA>                          <NA>         <NA>          <NA>    
    #>  3      20 site_offlin… "\n<p style=\"text-align:cent… <NA>         <NA>          <NA>    
    #>  4     533 file_log_pr… "90"                           90           <NA>          core    
    #>  5     534 google_maps…  <NA>                          <NA>         <NA>          core    
    #>  6      21 use_coppa    "0"                            0            <NA>          <NA>    
    #>  7      22 coppa_fax     <NA>                          <NA>         <NA>          <NA>    
    #>  8      23 coppa_addre…  <NA>                          <NA>         <NA>          <NA>    
    #>  9      24 coppa_conse…  <NA>                          <NA>         <NA>          <NA>    
    #> 10      25 ipb_copy_nu…  <NA>                          <NA>         <NA>          <NA>    
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
    #>    word_id lang_id word_app word_key word_default word_custom word_default_ve…
    #>      <int>   <int> <chr>    <chr>    <chr>        <chr>       <chr>           
    #>  1   38289       4 core     core_em… Nazi Memeti… <NA>        <NA>            
    #>  2       2       1 core     core_gr… Validating   Validating  NULL            
    #>  3       3       1 core     core_gr… Visitors     Visitors    NULL            
    #>  4       4       1 core     core_gr… Newcomer     Newcomer    NULL            
    #>  5       5       1 core     core_gr… The Adminsh… The Admins… NULL            
    #>  6       6       1 core     core_gr… Gassed       Gassed      NULL            
    #>  7       7       1 core     core_gr… Black Corps  Black Corps NULL            
    #>  8       8       1 core     core_gr… Prisoner     Prisoner    NULL            
    #>  9       9       1 core     core_gr… Black Corps… Black Corp… NULL            
    #> 10      10       1 core     core_gr… Members      Members     NULL            
    #> # … with 26,108 more rows, and 4 more variables: word_custom_version <chr>,
    #> #   word_js <lgl>, word_export <lgl>, word_theme <int>
    #> 
    #> $core_sys_login
    #> # A tibble: 4 x 2
    #>   sys_login_id sys_cookie                                                                 
    #>          <int> <chr>                                                                      
    #> 1            2 "a:1:{s:12:\"memberFilter\";a:0:{}}"                                       
    #> 2            9 "a:1:{s:12:\"memberFilter\";a:19:{s:15:\"c_member_status\";s:3:\"all\";s:1…
    #> 3            1 "a:1:{s:12:\"memberFilter\";a:0:{}}"                                       
    #> 4            7 "a:1:{s:12:\"memberFilter\";a:0:{}}"                                       
    #> 
    #> $core_sys_settings_titles
    #> # A tibble: 37 x 8
    #>    conf_title_id conf_title_title conf_title_desc conf_title_count conf_title_nosh…
    #>            <int> <chr>            <chr>                      <int> <lgl>           
    #>  1             1 Ad Code Integra… These settings…               13 FALSE           
    #>  2             2 Community Guide… This section a…                7 FALSE           
    #>  3             3 Community Offli… Use this setti…                2 FALSE           
    #>  4             4 COPPA Set-up     This section a…                4 FALSE           
    #>  5             5 Copyright Remov… This section a…                2 TRUE            
    #>  6             6 CPU Saving &amp… This section a…               22 FALSE           
    #>  7             7 Date, Time and … This section c…               12 FALSE           
    #>  8             8 Email Set-up     This section w…               11 FALSE           
    #>  9             9 General Configu… These settings…               16 FALSE           
    #> 10            10 IP.Board Extern… <NA>                           1 TRUE            
    #> # … with 27 more rows, and 3 more variables: conf_title_keyword <chr>,
    #> #   conf_title_app <chr>, conf_title_tab <chr>
    #> 
    #> $core_tags
    #> # A tibble: 5,053 x 11
    #>         tag_id tag_aai_lookup tag_aap_lookup tag_meta_app tag_meta_area tag_meta_id
    #>          <dbl> <chr>          <chr>          <chr>        <chr>               <int>
    #>  1 Inf.Nae-324 811c8c75196b3… 956ad2d293909… forums       forums                111
    #>  2 Inf.Nae-324 811c8c75196b3… 956ad2d293909… forums       forums                111
    #>  3   1.50e-323 811c8c75196b3… 956ad2d293909… forums       forums                111
    #>  4   2.00e-323 811c8c75196b3… 956ad2d293909… forums       forums                111
    #>  5   2.50e-323 811c8c75196b3… 956ad2d293909… forums       forums                111
    #>  6   3.00e-323 811c8c75196b3… 956ad2d293909… forums       forums                111
    #>  7   3.50e-323 811c8c75196b3… 956ad2d293909… forums       forums                111
    #>  8   4.00e-323 811c8c75196b3… 956ad2d293909… forums       forums                111
    #>  9   4.50e-323 811c8c75196b3… 956ad2d293909… forums       forums                111
    #> 10   5.00e-323 811c8c75196b3… 956ad2d293909… forums       forums                111
    #> # … with 5,043 more rows, and 5 more variables: tag_meta_parent_id <int>,
    #> #   tag_member_id <int>, tag_added <dttm>, tag_prefix <lgl>, tag_text <chr>
    #> 
    #> $core_tags_cache
    #> # A tibble: 6,919 x 3
    #>    tag_cache_key          tag_cache_text                               tag_cache_date     
    #>    <chr>                  <chr>                                        <dttm>             
    #>  1 811c8c75196b3ff83dad0… "{\"tags\":[\"father charles coughlin\",\"f… 2015-05-11 15:09:03
    #>  2 8bda5c23a73f4a53e664b… "{\"tags\":[\"political compass\"],\"prefix… 2015-05-11 15:09:03
    #>  3 c81c72e023eedaf1085a9… "{\"tags\":[\"actual idealism\",\"giovanni … 2015-05-11 15:09:09
    #>  4 1b15ddd5286635d6004b2… "{\"tags\":[],\"prefix\":\"\"}"              2015-05-11 15:09:16
    #>  5 49f0aabee7caac9fd601b… "{\"tags\":[\"Monarchy\",\"Britain\"],\"pre… 2015-05-11 15:09:09
    #>  6 127c73f84b3ff08e0a804… "{\"tags\":[],\"prefix\":\"\"}"              2015-05-11 15:09:03
    #>  7 ef9c553b27602531af9b1… "{\"tags\":[\"Introduction\"],\"prefix\":\"… 2015-05-11 15:09:13
    #>  8 43ac6adba8bf95da38476… "{\"tags\":[\"Religion\"],\"prefix\":\"\"}"  2015-05-11 15:09:13
    #>  9 462c5b3fb75a8e34d3f98… "{\"tags\":[],\"prefix\":\"\"}"              2015-05-11 15:09:52
    #> 10 a81354916f466c0b3f0cd… "{\"tags\":[\"Iron Will\",\"greetings\",\"h… 2015-05-11 15:09:13
    #> # … with 6,909 more rows
    #> 
    #> $core_tags_perms
    #> # A tibble: 3,311 x 4
    #>    tag_perm_aai_lookup          tag_perm_aap_lookup         tag_perm_text tag_perm_visible
    #>    <chr>                        <chr>                       <chr>         <lgl>           
    #>  1 811c8c75196b3ff83dad05695a6… d63cdc08d52e02e1b82fc40e83… 4,2,3,6,8,1   TRUE            
    #>  2 8bda5c23a73f4a53e664b0a644f… 85aa9178b923fa1878ad86a0aa… 4,2,3,6,1     TRUE            
    #>  3 c81c72e023eedaf1085a9f10bfa… 51deea4867472642fba67a586d… 4,2,3,6,1     TRUE            
    #>  4 74188d2b121682dfe30279ebad1… e8b9aa1927d352c4af04738164… 4,2,3,6,1     TRUE            
    #>  5 49f0aabee7caac9fd601bd3333c… a8ec894f1cd7456aede97242cb… 4,2,3,6,1     TRUE            
    #>  6 ef9c553b27602531af9b1a29418… f723ce15197189561d1a05725f… 4,5,2,3,6,7,1 TRUE            
    #>  7 43ac6adba8bf95da38476118dd2… f723ce15197189561d1a05725f… 4,5,2,3,6,7,1 TRUE            
    #>  8 afd1964ed1a568511941a2599f2… 1d7b8a34d35bb07bc2f38523d9… 4,2,3,6,1     TRUE            
    #>  9 a81354916f466c0b3f0cdff453e… f723ce15197189561d1a05725f… 4,5,2,3,6,7,1 TRUE            
    #> 10 a22a57b42eb6dd2fa966ce45dcc… f723ce15197189561d1a05725f… 4,5,2,3,6,7,1 TRUE            
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
    #>    content_id content_type content_app content_location content_path content_name
    #>         <int> <chr>        <chr>       <chr>            <chr>        <chr>       
    #>  1          1 template     core        admin            forms        message     
    #>  2          2 template     core        admin            support      whitespace  
    #>  3          3 template     core        front            forms        message     
    #>  4          4 template     core        front            forms        template    
    #>  5          5 template     core        front            global       breadcrumb  
    #>  6          6 template     core        front            global       error       
    #>  7          7 template     core        front            global       footer      
    #>  8          8 template     core        front            global       globalTempl…
    #>  9          9 template     core        front            global       ipsfocus_ba…
    #> 10         10 template     core        front            global       ipsfocus_co…
    #> # … with 88 more rows, and 4 more variables: content_data <chr>, content_content <chr>,
    #> #   content_long_version <int>, content_date <int>
    #> 
    #> $core_theme_css
    #> # A tibble: 146 x 12
    #>    css_id css_set_id css_updated css_location css_content css_added_to css_app css_path
    #>     <int>      <int>       <int> <chr>        <chr>              <int> <chr>   <chr>   
    #>  1    577          0  1504115595 global       "#ipsLayou…            0 core    framewo…
    #>  2    578          0  1504115595 global       "/* Lightb…            0 core    framewo…
    #>  3    673          0  1504115606 front        "\n\n/*.ip…            0 forums  .       
    #>  4    674          0  1504115610 front        "/* BOTH *…            0 calend… .       
    #>  5    675          0  1504115610 front        ".cCalenda…            0 calend… .       
    #>  6    676          0  1504115610 front        ".ipsRichE…            0 calend… .       
    #>  7    677          0  1504115610 front        ".cCalenda…            0 calend… .       
    #>  8    667          0  1504115595 admin        "/*.cMenuM…            0 core    system  
    #>  9    663          0  1504115595 admin        "#acpPageH…            0 core    system  
    #> 10    664          0  1504115595 admin        "table.dif…            0 core    system  
    #> # … with 136 more rows, and 4 more variables: css_name <chr>, css_version <chr>,
    #> #   css_user_edited <int>, css_unique_key <chr>
    #> 
    #> $core_theme_settings_fields
    #> # A tibble: 308 x 12
    #>    sc_id sc_set_id sc_key sc_type sc_content sc_updated sc_default sc_tab_key
    #>    <int>     <int> <chr>  <chr>   <chr>           <int> <chr>      <chr>     
    #>  1     1         1 ajax_… YesNo   "[{\"key\… 1458844927 1          custom    
    #>  2     2         1 alter… Color   "[{\"key\… 1458844927 #3e4148    buttoncol…
    #>  3     3         1 alter… Color   "[]"       1458844927 #ffffff    buttoncol…
    #>  4     4         1 area_… Color   "[]"       1458844927 #e6e8eb    frontendc…
    #>  5     5         1 area_… Color   "[]"       1458844927 #353c41    frontendc…
    #>  6     6         1 area_… Color   "[]"       1458844927 #f8f8f8    frontendc…
    #>  7     7         1 area_… Color   "[]"       1458844927 #ffffff    frontendc…
    #>  8     8         1 butto… Color   "[]"       1458844927 #ffffff    buttoncol…
    #>  9     9         1 enabl… YesNo   "[{\"key\… 1458844927 0          custom    
    #> 10    10         1 fluid… Number  "[]"       1458844927 95         custom    
    #> # … with 298 more rows, and 4 more variables: sc_show_in_vse <lgl>, sc_title <chr>,
    #> #   sc_order <int>, sc_condition <chr>
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
    #>    template_id template_set_id template_group template_content template_name template_data
    #>          <int>           <int> <chr>          <chr>            <chr>         <chr>        
    #>  1        3646               7 global         "{{if !\\IPS\\C… reactionBlurb $content     
    #>  2        3644               7 global         "{{if \\IPS\\IP… reputation    $content, $e…
    #>  3        3645               7 global         "{{$allowRep = … reputationMi… $content, $a…
    #>  4        3641               0 widgets        "<h3 class='ips… recentReviews $reviews, $o…
    #>  5        3642               0 widgets        "<h3 class='ips… todaysBirthd… $members, $c…
    #>  6        3643               0 widgets        "<h3 class='ips… upcomingEven… $events, $to…
    #>  7        3640               0 view           "\n{{if $club =… view          $event, $com…
    #>  8        3639               0 view           "<!-- Don't use… rsvpControls  $event, $att…
    #>  9        3634               0 view           "{{$coverPhoto … eventStreamB… $event, $dat…
    #> 10        3635               0 view           "<div data-cont… reminder      $event, $rem…
    #> # … with 804 more rows, and 8 more variables: template_updated <int>,
    #> #   template_removable <lgl>, template_added_to <int>, template_user_edited <int>,
    #> #   template_app <chr>, template_version <chr>, template_location <chr>,
    #> #   template_unique_key <chr>
    #> 
    #> $core_themes
    #> # A tibble: 3 x 18
    #>   set_id set_name set_key set_parent_array set_child_array set_permissions set_is_default
    #>    <int> <chr>    <chr>   <chr>            <chr>           <chr>           <lgl>         
    #> 1      1 Default  default <NA>             <NA>            <NA>            FALSE         
    #> 2      5 <NA>     <NA>    []               []              <NA>            FALSE         
    #> 3      7 Carbon … <NA>    []               []              4               TRUE          
    #> # … with 11 more variables: set_author_name <chr>, set_author_url <chr>,
    #> #   set_emo_dir <chr>, set_order <int>, set_template_settings <chr>, set_logo_data <chr>,
    #> #   set_long_version <int>, set_css_map <chr>, set_resource_map <chr>,
    #> #   set_is_acp_default <lgl>, set_cache_key <chr>
    #> 
    #> $core_upgrade_history
    #> # A tibble: 83 x 6
    #>    upgrade_id upgrade_version… upgrade_version… upgrade_date        upgrade_mid
    #>         <int>            <int> <chr>            <dttm>              <lgl>      
    #>  1          1            32005 3.2.2            NA                  FALSE      
    #>  2          2            32005 3.2.2            NA                  FALSE      
    #>  3          3            32005 3.2.2            NA                  FALSE      
    #>  4          4            32006 3.2.3            2013-07-20 14:15:55 FALSE      
    #>  5          5            33000 3.3.0 Alpha 1    2013-07-20 14:16:45 FALSE      
    #>  6          6            33006 3.3.0 Alpha 2    2013-07-20 14:16:47 FALSE      
    #>  7          7            33007 3.3.0 Beta 1     2013-07-20 14:16:50 FALSE      
    #>  8          8            33008 3.3.0 Beta 2     2013-07-20 14:16:53 FALSE      
    #>  9          9            33009 3.3.0 Beta 3     2013-07-20 14:16:57 FALSE      
    #> 10         10            33010 3.3.0 Beta 4     2013-07-20 14:17:02 FALSE      
    #> # … with 73 more rows, and 1 more variable: upgrade_app <chr>
    #> 
    #> $core_validating
    #> # A tibble: 7 x 8
    #>   vid     member_id entry_date          new_reg email_chg ip_address prev_email email_sent
    #>   <chr>       <int> <dttm>              <lgl>   <lgl>     <chr>      <chr>           <int>
    #> 1 aa642e…     14926 2017-09-20 02:21:44 FALSE   TRUE      172.104.1… ggleenzzb… 1505874104
    #> 2 1bc617…     15217 2017-11-20 21:41:40 TRUE    FALSE     162.158.2… 0          1511214100
    #> 3 f0994a…     15218 2017-11-20 22:08:23 TRUE    FALSE     108.162.2… 0          1511215703
    #> 4 dc22d0…     13881 2017-11-19 05:57:23 FALSE   TRUE      108.162.2… fnzles@gm… 1511071043
    #> 5 7c6de8…     13780 2017-11-19 06:39:02 FALSE   TRUE      162.158.7… patrick.w… 1511204816
    #> 6 09e572…      9861 2017-11-03 11:18:11 FALSE   TRUE      162.158.2… svartskjo… 1510139461
    #> 7 cfb40c…     15012 2017-11-10 14:45:01 FALSE   TRUE      162.158.1… 0          1510325101
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
    #>            id widgets                                       app    module controller area 
    #>         <dbl> <chr>                                         <chr>  <chr>  <chr>      <chr>
    #> 1 Inf.Nae-324 "[]"                                          core   system register   head…
    #> 2 Inf.Nae-324 "[]"                                          core   system register   foot…
    #> 3   4.95e-322 "[{\"app\":\"core\",\"key\":\"whosOnline\",\… forums forums index      foot…
    #> 4   5.05e-322 "[{\"app\":\"calendar\",\"key\":\"upcomingEv… forums forums index      side…
    #> 5   4.90e-322 "[{\"app\":\"core\",\"key\":\"announcements\… forums forums index      head…
    #> 6   4.40e-322 "[{\"app\":\"core\",\"key\":\"activeUsers\",… forums forums topic      foot…
    #> 7   4.45e-322 "[{\"app\":\"core\",\"key\":\"activeUsers\",… forums forums forums     foot…
    #> 
    #> $core_widgets
    #> # A tibble: 19 x 9
    #>             id key    app    class  caches    restrict default_area allow_reuse menu_style
    #>          <dbl> <chr>  <chr>  <chr>  <chr>     <chr>    <chr>        <lgl>       <chr>     
    #>  1 Inf.Nae-324 activ… core   "\\IP…  <NA>     "[]"     <NA>         FALSE       menu      
    #>  2 Inf.Nae-324 annou… core   "\\IP…  <NA>     "[\"sid… header       FALSE       menu      
    #>  3   1.50e-323 stats  core   "\\IP… "{\"widg… "[]"     <NA>         FALSE       menu      
    #>  4   2.00e-323 relat… core   "\\IP…  <NA>     "[]"     <NA>         FALSE       menu      
    #>  5   2.50e-323 recen… core   "\\IP…  <NA>     "[]"     <NA>         FALSE       menu      
    #>  6   3.00e-323 topCo… core   "\\IP…  <NA>     "[]"     <NA>         FALSE       menu      
    #>  7   3.50e-323 whosO… core   "\\IP…  <NA>     "[]"     <NA>         FALSE       menu      
    #>  8   4.00e-323 membe… core   "\\IP… "{\"widg… "[\"sid… <NA>         TRUE        modal     
    #>  9   4.50e-323 forum… forums "\\IP… "{\"widg… "[]"     <NA>         FALSE       menu      
    #> 10   5.00e-323 hotTo… forums "\\IP…  <NA>     "[]"     <NA>         FALSE       menu      
    #> 11   5.50e-323 topic… forums "\\IP… "{\"widg… "[]"     <NA>         TRUE        modal     
    #> 12   6.00e-323 postF… forums "\\IP…  <NA>     "[]"     <NA>         TRUE        modal     
    #> 13   6.50e-323 poll   forums "\\IP…  <NA>     "[\"sid… <NA>         TRUE        modal     
    #> 14   7.00e-323 today… calen… "\\IP…  <NA>     "[]"     <NA>         FALSE       menu      
    #> 15   7.50e-323 upcom… calen… "\\IP… "{\"widg… "[]"     <NA>         FALSE       menu      
    #> 16   8.00e-323 recen… calen… "\\IP…  <NA>     "[]"     <NA>         FALSE       menu      
    #> 17   8.50e-323 guest… core   "\\IP…  <NA>     "[\"sid… <NA>         FALSE       modal     
    #> 18   9.00e-323 promo… core   "\\IP…  <NA>     "[\"sid… <NA>         FALSE       menu      
    #> 19   9.50e-323 clubs  core   "\\IP…  <NA>     "[\"sid… <NA>         TRUE        modal

### `orig_*`

``` r
im_orig_dfs
```

    #> $orig_admin_login_logs
    #> # A tibble: 45 x 6
    #>    admin_id admin_ip_address admin_username admin_time          admin_success
    #>       <int> <chr>            <chr>          <dttm>              <lgl>        
    #>  1     5447 5.228.77.158     Alexander Sla… 2016-03-01 06:09:38 TRUE         
    #>  2     5446 5.228.77.158     Alexander Sla… 2016-02-29 22:17:57 TRUE         
    #>  3     5445 5.228.77.158     Alexander Sla… 2016-02-29 21:33:12 TRUE         
    #>  4     5444 5.228.77.158     Alexander Sla… 2016-02-29 20:57:19 TRUE         
    #>  5     5443 5.228.77.158     Alexander Sla… 2016-02-27 22:36:39 TRUE         
    #>  6     5420 5.228.77.158     Alexander Sla… 2016-01-28 16:04:07 TRUE         
    #>  7     5421 5.228.77.158     Alexander Sla… 2016-01-29 06:22:19 TRUE         
    #>  8     5422 5.228.77.158     Alexander Sla… 2016-02-01 17:35:57 TRUE         
    #>  9     5423 5.228.77.158     Alexander Sla… 2016-02-01 20:23:29 TRUE         
    #> 10     5424 5.228.77.158     Alexander Sla… 2016-02-01 22:26:30 TRUE         
    #> # … with 35 more rows, and 1 more variable: admin_post_details <chr>
    #> 
    #> $orig_admin_logs
    #> # A tibble: 7,836 x 9
    #>             id member_id ctime               note  ip_address appcomponent module section
    #>          <dbl>     <int> <dttm>              <chr> <chr>      <chr>        <chr>  <chr>  
    #>  1 Inf.Nae-324         1 2011-09-12 16:05:48 Cate… 178.140.1… forums       forums forums 
    #>  2 Inf.Nae-324         1 2011-09-12 16:07:59 Foru… 178.140.1… forums       forums forums 
    #>  3   1.50e-323         1 2011-09-12 16:08:15 Foru… 178.140.1… forums       forums forums 
    #>  4   2.00e-323         1 2011-09-12 16:11:38 Foru… 178.140.1… forums       forums forums 
    #>  5   2.50e-323         1 2011-09-12 16:15:13 Edit… 178.140.1… members      groups groups 
    #>  6   3.00e-323         1 2011-09-12 16:15:53 Edit… 178.140.1… members      groups groups 
    #>  7   3.50e-323         1 2011-09-12 16:16:06 Edit… 178.140.1… members      groups groups 
    #>  8   4.00e-323         1 2011-09-12 16:16:28 Edit… 178.140.1… members      groups groups 
    #>  9   4.50e-323         1 2011-09-12 16:20:31 Adde… 178.140.1… members      groups groups 
    #> 10   5.00e-323         1 2011-09-12 17:54:03 Foru… 178.140.1… forums       forums forums 
    #> # … with 7,826 more rows, and 1 more variable: do <chr>
    #> 
    #> $orig_attachments
    #> # A tibble: 101 x 15
    #>    attach_id attach_ext attach_file attach_location attach_thumb_lo… attach_is_image
    #>        <int> <chr>      <chr>       <chr>           <chr>            <lgl>          
    #>  1       338 jpg        461022_456… monthly_03_201… monthly_03_2013… TRUE           
    #>  2         2 jpg        1056.jpg    monthly_09_201… monthly_09_2011… TRUE           
    #>  3         3 jpg        1057.jpg    monthly_09_201… monthly_09_2011… TRUE           
    #>  4         4 jpg        1091.jpg    monthly_09_201… monthly_09_2011… TRUE           
    #>  5         5 jpg        1108.jpg    monthly_09_201… monthly_09_2011… TRUE           
    #>  6         6 jpg        FASCIST UN… monthly_09_201… monthly_09_2011… TRUE           
    #>  7         7 jpg        post-2711-… monthly_09_201… monthly_09_2011… TRUE           
    #>  8         8 jpg        post-2842-… monthly_09_201… monthly_09_2011… TRUE           
    #>  9         9 jpg        1029.jpg    monthly_09_201… monthly_09_2011… TRUE           
    #> 10        10 jpg        1030.jpg    monthly_09_201… monthly_09_2011… TRUE           
    #> # … with 91 more rows, and 9 more variables: attach_hits <int>, attach_date <dttm>,
    #> #   attach_post_key <chr>, attach_member_id <int>, attach_filesize <int>,
    #> #   attach_rel_id <int>, attach_img_width <int>, attach_img_height <int>,
    #> #   attach_parent_id <int>
    #> 
    #> $orig_attachments_type
    #> # A tibble: 31 x 5
    #>    atype_id atype_extension atype_mimetype         atype_post atype_img                   
    #>       <int> <chr>           <chr>                  <lgl>      <chr>                       
    #>  1        1 aiff            audio/x-aiff           TRUE       style_extra/mime_types/quic…
    #>  2        2 bmp             image/x-MS-bmp         TRUE       style_extra/mime_types/gif.…
    #>  3        3 css             unknown/unknown        TRUE       style_extra/mime_types/scri…
    #>  4        4 doc             application/msword     TRUE       style_extra/mime_types/doc.…
    #>  5        5 gif             image/gif              TRUE       style_extra/mime_types/gif.…
    #>  6        6 gz              application/x-gzip     TRUE       style_extra/mime_types/zip.…
    #>  7        7 hqx             application/mac-binhe… TRUE       style_extra/mime_types/stuf…
    #>  8        8 htm             unknown/unknown        TRUE       style_extra/mime_types/html…
    #>  9        9 html            unknown/unknown        TRUE       style_extra/mime_types/html…
    #> 10       10 ico             image/ico              TRUE       style_extra/mime_types/gif.…
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
    #> 10     10 ip       115.249.239.138             2011-12-19 10:52:08 Spammer - commercial a…
    #> # … with 42 more rows
    #> 
    #> $orig_bbcode_mediatag
    #> # A tibble: 9 x 4
    #>   mediatag_id mediatag_name  mediatag_match               mediatag_replace                
    #>         <int> <chr>          <chr>                        <chr>                           
    #> 1           1 YouTube        "http(?:s)?://(www.)?youtub… "<iframe id=\"ytplayer\" class=…
    #> 2           9 GameTrailers   "http://www.gametrailers.co… "<embed src=\"http://media.mtvn…
    #> 3           2 Flash Movie/G… "{1}.swf"                    "<embed src=\"$1.swf\" play=\"t…
    #> 4           3 Google Video   "http://video.google.com/vi… "<embed style=\"width:400px; he…
    #> 5           4 MySpace Video  "http://www.myspace.com/vid… "<object width=\"425px\" height…
    #> 6          10 YouTu.be       "http://(www.)?youtu.be/([\… "<iframe id=\"ytplayer\" class=…
    #> 7           6 Flickr Image … "http://www.flickr.com/phot… "<iframe align=\"center\" src=\…
    #> 8           7 MP3            "{1}.mp3"                    "<object type=\"application/x-s…
    #> 9           8 Vimeo          "http{1}://vimeo.com/{2}"    "<iframe src=\"http$1://player.…
    #> 
    #> $orig_cache_store
    #> # A tibble: 49 x 4
    #>    cs_key     cs_value                                                 cs_array cs_updated
    #>    <chr>      <chr>                                                    <lgl>         <int>
    #>  1 bbcode     "a:34:{s:7:\"acronym\";a:21:{s:9:\"bbcode_id\";s:1:\"8\… TRUE     1414352133
    #>  2 moderators "a:0:{}"                                                 TRUE     1458514682
    #>  3 multimod   "a:0:{}"                                                 TRUE     1414352127
    #>  4 banfilters "a:35:{i:0;s:13:\"62.97.238.198\";i:1;s:13:\"80.202.110… TRUE     1456812672
    #>  5 attachtyp… "a:30:{s:4:\"aiff\";a:4:{s:15:\"atype_extension\";s:4:\… TRUE     1414352127
    #>  6 emoticons  "a:98:{i:0;a:4:{s:5:\"typed\";s:2:\":)\";s:5:\"image\";… TRUE     1455876496
    #>  7 badwords   "a:0:{}"                                                 TRUE     1414352133
    #>  8 systemvars "a:5:{s:10:\"mail_queue\";i:0;s:13:\"task_next_run\";s:… TRUE     1458844081
    #>  9 adminnotes "You can use this section to keep notes for all members… FALSE    1315842847
    #> 10 ranks      "a:0:{}"                                                 TRUE     1414352133
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
    #>    event_id event_member_id event_content event_title event_smilies event_perms
    #>       <int>           <int> <chr>         <chr>       <lgl>         <chr>      
    #>  1        1               1 "[url=\"http… Joseph Goe… FALSE         6,10,5,13,…
    #>  2        2               1 "[url=\"http… NiccolÃ² M… FALSE         *          
    #>  3        3               1 "[url=\"http… Oswald Spe… FALSE         *          
    #>  4        4               1 "[url=\"http… Oswald Spe… FALSE         *          
    #>  5        5               1 "[url=\"http… Julius Evo… FALSE         *          
    #>  6        6               1 "NiccolÃ² Ma… NiccolÃ² M… FALSE         *          
    #>  7        7               1 "[url=\"http… Summer Sol… FALSE         *          
    #>  8        8               1 "[url=\"http… Martin Bor… TRUE          *          
    #>  9        9               1 "[url=\"http… FidÃ©l PÃ¡… FALSE         *          
    #> 10       10               1 "[url=\"http… Baldur von… FALSE         *          
    #> # … with 98 more rows, and 11 more variables: event_saved <dttm>,
    #> #   event_lastupdated <dttm>, event_recurring <int>, event_start_date <dttm>,
    #> #   event_end_date <dttm>, event_title_seo <chr>, event_rating_total <int>,
    #> #   event_rating_hits <lgl>, event_rating_avg <int>, event_post_key <chr>,
    #> #   event_sequence <lgl>
    #> 
    #> $orig_content_cache_posts
    #> # A tibble: 39,103 x 3
    #>    cache_content_id cache_content                                      cache_updated      
    #>               <int> <chr>                                              <dttm>             
    #>  1            25733 "<blockquote class='ipsBlockquote' data-author=\"… 2016-03-18 03:51:34
    #>  2            25732 "<blockquote class='ipsBlockquote' data-author=\"… 2016-03-18 03:51:34
    #>  3            25730 "<blockquote class='ipsBlockquote' data-author=\"… 2016-03-18 03:51:34
    #>  4           147440 "<div><iframe id=\"ytplayer\" class=\"EmbeddedVid… 2016-03-20 17:34:03
    #>  5           147691 "<p><a href='http://www.breitbart.com/2016-presid… 2016-03-17 15:32:16
    #>  6           141523 "<p>Where can I find the adult swim pilot?</p>\n"  2016-03-17 19:20:35
    #>  7           141525 "<blockquote  class=\"ipsBlockquote\" data-author… 2016-03-17 19:20:35
    #>  8            96938 "<p>Remove the term class entirely. It's nothing … 2016-03-17 03:59:43
    #>  9            96951 "Volksgemeinschaft - <a href='http://ironmarch.or… 2016-03-17 03:59:43
    #> 10            96956 "<blockquote  class=\"ipsBlockquote\" data-author… 2016-03-17 03:59:43
    #> # … with 39,093 more rows
    #> 
    #> $orig_content_cache_sigs
    #> # A tibble: 280 x 3
    #>    cache_content_id cache_content                                      cache_updated      
    #>               <int> <chr>                                              <dttm>             
    #>  1              805 "<p><span>â€œNeither let us be slandered from our… 2015-11-15 19:30:28
    #>  2              364 "<p>\"Either write something worth reading or do … 2015-11-15 19:30:28
    #>  3              287 "<p><em>Speak softly, and carry a big stick.</em>… 2016-03-19 06:43:48
    #>  4               16 "<span rel='lightbox'><img class='bbc_img' src='h… 2016-03-15 22:35:44
    #>  5                8 "&quot;We want less liberal verbiage and more res… 2015-11-23 17:14:25
    #>  6              161 "<p class='bbc_center'><em class='bbc'><strong cl… 2016-02-25 18:03:49
    #>  7             6120 "<p><span rel='lightbox'><img class='bbc_img' src… 2015-10-12 23:36:32
    #>  8              255 "<strong class='bbc'>\t&quot;Bereiten Sie sich au… 2016-02-07 05:56:41
    #>  9              130 "<p><span style=\"font-size:10px;\">\"For I could… 2016-02-25 18:03:49
    #> 10             7760 "<p><span style=\"font-size:10px;\"><span style=\… 2016-03-19 06:43:48
    #> # … with 270 more rows
    #> 
    #> $orig_core_applications
    #> # A tibble: 4 x 14
    #>   app_id app_title app_public_title app_description app_author app_version
    #>    <int> <chr>     <chr>            <chr>           <chr>      <chr>      
    #> 1      1 System    Help Files       Manage global … Invision … 3.4.7      
    #> 2      2 Members   Members          Manage members… Invision … 3.4.7      
    #> 3      3 Forums    Forums           Manage forums … Invision … 3.4.7      
    #> 4      4 Fascist … Fascist Calendar <NA>            <NA>       <NA>       
    #> # … with 8 more variables: app_long_version <int>, app_directory <chr>, app_added <dttm>,
    #> #   app_position <int>, app_protected <lgl>, app_location <chr>, app_website <chr>,
    #> #   app_update_check <chr>
    #> 
    #> $orig_core_hooks
    #> # A tibble: 8 x 15
    #>   hook_id hook_enabled hook_name hook_desc hook_author hook_email hook_website
    #>     <int> <lgl>        <chr>     <chr>     <chr>       <chr>      <chr>       
    #> 1       1 TRUE         Ad Code … Displays… Invision P… <NA>       http://www.…
    #> 2       2 FALSE        Status U… Displays… Invision P… <NA>       http://www.…
    #> 3       3 TRUE         Recent T… Adds a l… Invision P… <NA>       www.invisio…
    #> 4       4 FALSE        Facebook… Displays… Invision P… <NA>       http://www.…
    #> 5       5 FALSE        Tags Sid… Adds a l… Invision P… <NA>       <NA>        
    #> 6       9 FALSE        Calendar  Displays… Invision P… <NA>       http://www.…
    #> 7      10 TRUE         Upcoming… Shows up… Invision P… support@i… http://invi…
    #> 8      11 TRUE         Upcoming… Shows up… Invision P… support@i… http://invi…
    #> # … with 8 more variables: hook_requirements <chr>, hook_version_human <chr>,
    #> #   hook_version_long <chr>, hook_installed <dttm>, hook_updated <dttm>,
    #> #   hook_position <int>, hook_extra_data <chr>, hook_key <chr>
    #> 
    #> $orig_core_hooks_files
    #> # A tibble: 8 x 7
    #>   hook_file_id hook_hook_id hook_file_stored hook_file_real hook_classname hook_data
    #>          <int>        <int> <chr>            <chr>          <chr>          <chr>    
    #> 1           39            1 boardIndexSideB… boardIndexSid… boardIndexSid… "a:7:{s:…
    #> 2           43            2 boardIndexStatu… boardIndexSta… boardIndexSta… "a:8:{s:…
    #> 3           40            3 boardIndexRecen… boardIndexRec… boardIndexRec… "a:6:{s:…
    #> 4           41            4 boardIndexFaceb… boardIndexFac… boardIndexFac… "a:7:{s:…
    #> 5           42            5 boardIndexTags_… boardIndexTag… boardIndexTags "a:8:{s:…
    #> 6           44            9 boardIndexCalen… boardIndexCal… boardIndexCal… "a:8:{s:…
    #> 7           45           10 calendarUpcomin… calendarUpcom… calendarUpcom… "a:8:{s:…
    #> 8           46           11 calendarUpcomin… calendarUpcom… calendarUpcom… "a:8:{s:…
    #> # … with 1 more variable: hooks_source <chr>
    #> 
    #> $orig_core_item_markers
    #> # A tibble: 4,622 x 9
    #>    item_key item_member_id item_app item_last_update item_last_saved     item_unread_cou…
    #>    <chr>             <int> <chr>               <int> <dttm>                         <int>
    #>  1 f802c0c…              1 forums         1458516124 2016-03-20 23:22:04                0
    #>  2 66931e5…              1 forums         1458550878 2016-03-21 09:01:18                0
    #>  3 1d45d85…              1 forums         1458550876 2016-03-21 09:01:16                0
    #>  4 9b51b6f…           9555 forums         1458397436 2016-03-19 14:23:56                1
    #>  5 427cd62…           7543 forums         1456516956 2016-02-26 20:02:36                5
    #>  6 66931e5…              4 forums         1458142789 2016-03-16 15:39:49                1
    #>  7 e1aac5f…              1 forums         1458550828 2016-03-21 09:00:28                0
    #>  8 068d4d2…           7424 forums         1458544359 2016-03-21 07:12:39                0
    #>  9 068d4d2…           1558 forums         1458547314 2016-03-21 08:01:54                1
    #> 10 f802c0c…             25 forums         1458435302 2016-03-20 00:55:02                1
    #> # … with 4,612 more rows, and 3 more variables: item_read_array <chr>,
    #> #   item_global_reset <int>, item_app_key_1 <int>
    #> 
    #> $orig_core_item_markers_storage
    #> # A tibble: 16 x 3
    #>    item_member_id item_markers                                         item_last_saved    
    #>             <int> <chr>                                                <dttm>             
    #>  1              2 "a:2:{s:4:\"core\";a:1:{s:32:\"d86530f90ffffe3b6972… 2013-07-20 12:30:09
    #>  2           6134 "a:1:{s:6:\"forums\";a:25:{s:32:\"e579e6f5c915ee714… 2013-07-20 12:37:56
    #>  3              1 "a:2:{s:4:\"core\";a:1:{s:32:\"d86530f90ffffe3b6972… 2013-07-20 13:42:10
    #>  4           6171 "a:1:{s:6:\"forums\";a:62:{s:32:\"2d63352170754e06f… 2013-07-20 13:57:47
    #>  5             53 "a:1:{s:6:\"forums\";a:40:{s:32:\"66931e5c90c88e9b5… 2013-07-20 12:52:07
    #>  6            100 "a:1:{s:6:\"forums\";a:53:{s:32:\"19c7cdf2c28bc3943… 2013-07-20 12:53:50
    #>  7            333 "a:1:{s:6:\"forums\";a:62:{s:32:\"063bc0b035563ace0… 2013-07-20 13:46:10
    #>  8            158 "a:1:{s:6:\"forums\";a:64:{s:32:\"e579e6f5c915ee714… 2013-07-20 13:52:03
    #>  9           6173 "a:1:{s:6:\"forums\";a:2:{s:32:\"a0a92a50db2fd304aa… 2013-07-20 13:26:20
    #> 10           1558 "a:1:{s:6:\"forums\";a:52:{s:32:\"a27da7ded3a0abefa… 2013-07-20 13:29:02
    #> 11            326 "a:1:{s:6:\"forums\";a:64:{s:32:\"e179fb6036a5b492e… 2013-07-20 13:56:21
    #> 12             67 "a:1:{s:6:\"forums\";a:64:{s:32:\"02334ce0f7bbb53da… 2013-07-20 13:59:35
    #> 13             16 "a:2:{s:4:\"core\";a:1:{s:32:\"d86530f90ffffe3b6972… 2013-07-20 12:29:24
    #> 14           2306 "a:1:{s:6:\"forums\";a:68:{s:32:\"e579e6f5c915ee714… 2013-07-20 13:05:14
    #> 15           6122 "a:1:{s:6:\"forums\";a:36:{s:32:\"a27da7ded3a0abefa… 2013-07-20 13:20:49
    #> 16            861 "a:1:{s:6:\"forums\";a:56:{s:32:\"14e846e5abdbefa85… 2013-07-20 13:30:53
    #> 
    #> $orig_core_like
    #> # A tibble: 3,706 x 14
    #>    like_id like_lookup_id like_lookup_area like_app like_area like_rel_id like_member_id
    #>    <chr>   <chr>          <chr>            <chr>    <chr>           <dbl>          <int>
    #>  1 566ef5… 3caa34857a82b… 5bfcef749155abe… forums   topics      1.80e-322             12
    #>  2 b1d0c5… 62cff97fc731b… 5bfcef749155abe… forums   topics      3.10e-322             12
    #>  3 20be4f… 931c090caa276… 5bfcef749155abe… forums   topics      2.35e-322             12
    #>  4 1434a9… 6f4697434da82… 5bfcef749155abe… forums   topics      2.20e-322             12
    #>  5 d44c69… 3c56c2b66d924… 5bfcef749155abe… forums   topics      3.25e-322             12
    #>  6 419626… 69ba2d75c9f6b… 5bfcef749155abe… forums   topics      3.70e-322             12
    #>  7 ac34f2… f7bc87f248ac8… 5bfcef749155abe… forums   topics      3.75e-322             12
    #>  8 4ae380… 7c140e71cf209… 5bfcef749155abe… forums   topics      3.65e-322             12
    #>  9 61f9d6… ff09767e2af56… 146d17a150010d5… forums   topics      6.15e-321             67
    #> 10 c67159… 5569f85f692c4… 5bfcef749155abe… forums   topics      2.25e-322             12
    #> # … with 3,696 more rows, and 7 more variables: like_is_anon <lgl>, like_added <int>,
    #> #   like_notify_do <lgl>, like_notify_meta <chr>, like_notify_freq <chr>,
    #> #   like_notify_sent <int>, like_visible <lgl>
    #> 
    #> $orig_core_like_cache
    #> # A tibble: 5,304 x 6
    #>    like_cache_id like_cache_app like_cache_area like_cache_rel_… like_cache_data
    #>    <chr>         <chr>          <chr>                      <dbl> <chr>          
    #>  1 321571a7b843… forums         forums                 1.50e-322 "a:3:{s:7:\"me…
    #>  2 5b1fb15ebe04… forums         topics                 1.81e-320 "a:3:{s:7:\"me…
    #>  3 4ed3d61094ba… forums         topics                 1.81e-320 "a:3:{s:7:\"me…
    #>  4 b5067d6b91ca… forums         topics                 7.95e-322 "a:3:{s:7:\"me…
    #>  5 81d82ffa5b6d… forums         forums                 6.50e-323 "a:3:{s:7:\"me…
    #>  6 d9409ca5f0c5… forums         topics                 2.54e-320 "a:3:{s:7:\"me…
    #>  7 296567d2dffd… forums         topics                 2.70e-320 "a:3:{s:7:\"me…
    #>  8 6ee661dd69ab… forums         topics                 2.67e-320 "a:3:{s:7:\"me…
    #>  9 98ca3d02b4a1… forums         topics                 2.60e-320 "a:3:{s:7:\"me…
    #> 10 a7aac8b0f1a9… forums         topics                 1.50e-323 "a:3:{s:7:\"me…
    #> # … with 5,294 more rows, and 1 more variable: like_cache_expire <int>
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
    #>    log_id log_date            log_member_id log_url log_title log_share_key log_ip_address
    #>     <int> <dttm>                      <int> <chr>   <chr>     <chr>         <chr>         
    #>  1      1 2011-10-07 06:30:51             0 http:/… Women in… stumble       63.249.110.243
    #>  2      2 2011-10-10 15:30:45             0 http:/… Germany … stumble       209.249.53.40 
    #>  3      3 2011-10-10 16:03:20             0 http:/… Germany … delicious     209.249.53.40 
    #>  4      4 2011-10-10 16:17:08             0 http:/… Germany … email         209.249.53.40 
    #>  5      5 2011-10-10 18:19:39             0 http:/… Germany … twitter       209.249.53.40 
    #>  6      6 2011-10-10 18:45:46             0 http:/… Germany … print         209.249.53.40 
    #>  7      7 2011-10-10 20:23:55             0 http:/… Germany … digg          209.249.53.40 
    #>  8      8 2011-10-10 22:19:18             0 http:/… Germany … facebook      209.249.53.40 
    #>  9      9 2011-10-11 00:42:53             0 http:/… Germany … reddit        209.249.53.40 
    #> 10     10 2011-10-11 01:27:17             0 http:/… Germany … download      209.249.53.40 
    #> # … with 83,850 more rows
    #> 
    #> $orig_core_soft_delete_log
    #> # A tibble: 7 x 5
    #>   sdl_id sdl_obj_id sdl_obj_member_id sdl_obj_date        sdl_obj_reason                  
    #>    <int>      <int>             <int> <dttm>              <chr>                           
    #> 1     21       3202                 1 2014-06-30 02:31:55 " Pending verification that Vla…
    #> 2     22        795                 1 2014-06-30 02:32:22 " Pending verification that Vla…
    #> 3     25       3202                 1 2014-09-07 19:20:25  <NA>                           
    #> 4     27       4652               132 2015-01-06 17:42:21  <NA>                           
    #> 5     33       5647                 1 2015-11-17 17:11:20  <NA>                           
    #> 6     34       4991                 1 2015-11-17 17:11:57  <NA>                           
    #> 7     35       4991                 1 2015-11-17 19:08:55  <NA>                           
    #> 
    #> $orig_core_sys_conf_settings
    #> # A tibble: 357 x 14
    #>    conf_id conf_title conf_description conf_group conf_type conf_key conf_value
    #>      <int> <chr>      <chr>                 <int> <chr>     <chr>    <chr>     
    #>  1       1 Enable Ad… This setting wi…          1 yes_no    ad_code… <NA>      
    #>  2       2 Groups ex… Any groups that…          1 multi     ad_code… <NA>      
    #>  3       3 Header Co… This code will …          1 textarea  ad_code… <NA>      
    #>  4       4 Footer Co… This code will …          1 textarea  ad_code… <NA>      
    #>  5       5 Override … Using this sett…          1 textarea  ad_code… <NA>      
    #>  6       6 Override … Using this sett…          1 textarea  ad_code… <NA>      
    #>  7       7 Sidebar C… This code will …          1 textarea  ad_code… <NA>      
    #>  8       8 Override … Using this sett…          1 textarea  ad_code… <NA>      
    #>  9       9 Override … Using this sett…          1 textarea  ad_code… <NA>      
    #> 10      10 Code to d… This ad code wi…          1 textarea  ad_code… <NA>      
    #> # … with 347 more rows, and 7 more variables: conf_default <chr>, conf_extra <chr>,
    #> #   conf_evalphp <chr>, conf_position <int>, conf_start_group <chr>,
    #> #   conf_add_cache <lgl>, conf_keywords <chr>
    #> 
    #> $orig_core_sys_lang_words
    #> # A tibble: 10,603 x 7
    #>    word_id word_app word_pack  word_key        word_default     word_default_vers… word_js
    #>      <int> <chr>    <chr>      <chr>           <chr>            <chr>              <lgl>  
    #>  1       1 core     admin_ajax ls_groups       "Groups Form"    32005              FALSE  
    #>  2       2 core     admin_ajax ls_view_more_g… "View more grou… 32005              FALSE  
    #>  3       3 core     admin_ajax ls_grouptitles  "Groups"         32005              FALSE  
    #>  4       4 core     admin_ajax ls_view_more_m… "View more memb… 32005              FALSE  
    #>  5       5 core     admin_ajax ls_members      "Members"        32005              FALSE  
    #>  6       6 core     admin_ajax lsnoresults     "No results"     32005              FALSE  
    #>  7       7 core     admin_ajax livesearchmemid "ID: "           32005              FALSE  
    #>  8       8 core     admin_ajax ls_help         "Help Files"     32005              FALSE  
    #>  9       9 core     admin_ajax ls_acppages     "ACP Pages"      32005              FALSE  
    #> 10      10 core     admin_ajax ls_settings     "Settings"       32005              FALSE  
    #> # … with 10,593 more rows
    #> 
    #> $orig_core_sys_login
    #> # A tibble: 4 x 2
    #>   sys_login_id sys_cookie                                                                 
    #>          <int> <chr>                                                                      
    #> 1            2 "a:1:{s:12:\"memberFilter\";a:0:{}}"                                       
    #> 2            9 "a:1:{s:12:\"memberFilter\";a:19:{s:15:\"c_member_status\";s:3:\"all\";s:1…
    #> 3            1 "a:1:{s:12:\"memberFilter\";a:0:{}}"                                       
    #> 4            7 "a:1:{s:12:\"memberFilter\";a:0:{}}"                                       
    #> 
    #> $orig_core_sys_module
    #> # A tibble: 41 x 9
    #>    sys_module_id sys_module_title sys_module_appl… sys_module_key sys_module_desc…
    #>            <int> <chr>            <chr>            <chr>          <chr>           
    #>  1             1 Global           core             global         Global function…
    #>  2             2 User CP          core             usercp         The user&#39;s …
    #>  3             3 Task Manager     core             task           Runs the tasks  
    #>  4             4 Attachments      core             attach         Attachments han…
    #>  5             5 Logs             core             logs           Various IP.Boar…
    #>  6             6 Look &amp; Feel  core             templates      Manage your tem…
    #>  7             7 My Control Panel core             mycp           View your tasks…
    #>  8             8 Diagnostics      core             diagnostics    <NA>            
    #>  9             9 System Settings  core             settings       Manage your sys…
    #> 10            10 Post Content     core             posts          Manage BBCode, …
    #> # … with 31 more rows, and 4 more variables: sys_module_version <chr>,
    #> #   sys_module_protected <lgl>, sys_module_position <int>, sys_module_admin <lgl>
    #> 
    #> $orig_core_sys_settings_titles
    #> # A tibble: 37 x 8
    #>    conf_title_id conf_title_title conf_title_desc conf_title_count conf_title_nosh…
    #>            <int> <chr>            <chr>                      <int> <lgl>           
    #>  1             1 Ad Code Integra… These settings…               13 FALSE           
    #>  2             2 Community Guide… This section a…                7 FALSE           
    #>  3             3 Community Offli… Use this setti…                2 FALSE           
    #>  4             4 COPPA Set-up     This section a…                4 FALSE           
    #>  5             5 Copyright Remov… This section a…                2 TRUE            
    #>  6             6 CPU Saving &amp… This section a…               22 FALSE           
    #>  7             7 Date, Time and … This section c…               12 FALSE           
    #>  8             8 Email Set-up     This section w…               11 FALSE           
    #>  9             9 General Configu… These settings…               16 FALSE           
    #> 10            10 IP.Board Extern… <NA>                           1 TRUE            
    #> # … with 27 more rows, and 3 more variables: conf_title_keyword <chr>,
    #> #   conf_title_app <chr>, conf_title_tab <chr>
    #> 
    #> $orig_core_tags
    #> # A tibble: 3,129 x 8
    #>         tag_id tag_aai_lookup tag_aap_lookup tag_meta_id tag_meta_parent… tag_member_id
    #>          <dbl> <chr>          <chr>                <int>            <int>         <int>
    #>  1 Inf.Nae-324 2cd36a5d4c630… 956ad2d293909…         111               75             2
    #>  2 Inf.Nae-324 2cd36a5d4c630… 956ad2d293909…         111               75             2
    #>  3   1.50e-323 2cd36a5d4c630… 956ad2d293909…         111               75             2
    #>  4   2.00e-323 2cd36a5d4c630… 956ad2d293909…         111               75             2
    #>  5   2.50e-323 2cd36a5d4c630… 956ad2d293909…         111               75             2
    #>  6   3.00e-323 2cd36a5d4c630… 956ad2d293909…         111               75             2
    #>  7   3.50e-323 2cd36a5d4c630… 956ad2d293909…         111               75             2
    #>  8   4.00e-323 2cd36a5d4c630… 956ad2d293909…         111               75             2
    #>  9   4.50e-323 2cd36a5d4c630… 956ad2d293909…         111               75             2
    #> 10   5.00e-323 2cd36a5d4c630… 956ad2d293909…         111               75             2
    #> # … with 3,119 more rows, and 2 more variables: tag_added <dttm>, tag_text <chr>
    #> 
    #> $orig_core_tags_cache
    #> # A tibble: 4,499 x 3
    #>    tag_cache_key          tag_cache_text                               tag_cache_date     
    #>    <chr>                  <chr>                                        <dttm>             
    #>  1 2cd36a5d4c630ce3802cb… "a:2:{s:4:\"tags\";a:10:{i:0;s:23:\"father … 2015-05-11 15:09:03
    #>  2 4ce4adba46f760c9b88d2… "a:2:{s:4:\"tags\";a:1:{i:0;s:17:\"politica… 2015-05-11 15:09:03
    #>  3 b3b80a1bea32e7e8a6cb2… "a:2:{s:4:\"tags\";a:4:{i:0;s:15:\"actual i… 2015-05-11 15:09:09
    #>  4 1b15ddd5286635d6004b2… "a:2:{s:4:\"tags\";a:0:{}s:6:\"prefix\";s:0… 2015-05-11 15:09:16
    #>  5 efee20aa641a2fa36717f… "a:2:{s:4:\"tags\";a:2:{i:0;s:8:\"Monarchy\… 2015-05-11 15:09:09
    #>  6 127c73f84b3ff08e0a804… "a:2:{s:4:\"tags\";a:0:{}s:6:\"prefix\";s:0… 2015-05-11 15:09:03
    #>  7 43ca3f67301b77f135a3c… "a:2:{s:4:\"tags\";a:1:{i:0;s:12:\"Introduc… 2015-05-11 15:09:13
    #>  8 d9eb242b0c991f1e1e704… "a:2:{s:4:\"tags\";a:1:{i:0;s:8:\"Religion\… 2015-05-11 15:09:13
    #>  9 462c5b3fb75a8e34d3f98… "a:2:{s:4:\"tags\";a:0:{}s:6:\"prefix\";s:0… 2015-05-11 15:09:52
    #> 10 679dbd12c814a0ed5e4c7… "a:2:{s:4:\"tags\";a:5:{i:0;s:9:\"Iron Will… 2015-05-11 15:09:13
    #> # … with 4,489 more rows
    #> 
    #> $orig_core_tags_perms
    #> # A tibble: 891 x 4
    #>    tag_perm_aai_lookup          tag_perm_aap_lookup         tag_perm_text tag_perm_visible
    #>    <chr>                        <chr>                       <chr>         <lgl>           
    #>  1 2cd36a5d4c630ce3802cb8c7a09… d63cdc08d52e02e1b82fc40e83… 4,2,3,6,8,1   TRUE            
    #>  2 4ce4adba46f760c9b88d2138752… 85aa9178b923fa1878ad86a0aa… 4,2,3,6,1     TRUE            
    #>  3 b3b80a1bea32e7e8a6cb28da73a… 51deea4867472642fba67a586d… 4,2,3,6,1     TRUE            
    #>  4 74188d2b121682dfe30279ebad1… e8b9aa1927d352c4af04738164… 4,2,3,6,1     TRUE            
    #>  5 efee20aa641a2fa36717fdebf11… a8ec894f1cd7456aede97242cb… 4,2,3,6,1     TRUE            
    #>  6 43ca3f67301b77f135a3c7f5bc1… f723ce15197189561d1a05725f… 4,5,2,3,6,7,1 TRUE            
    #>  7 d9eb242b0c991f1e1e7041149b0… f723ce15197189561d1a05725f… 4,5,2,3,6,7,1 TRUE            
    #>  8 8aee0d7062abe55f54920a64ad2… 1d7b8a34d35bb07bc2f38523d9… 4,2,3,6,1     TRUE            
    #>  9 679dbd12c814a0ed5e4c74ba735… f723ce15197189561d1a05725f… 4,5,2,3,6,7,1 TRUE            
    #> 10 a9152cee70f17ba6f23da0ba4b1… f723ce15197189561d1a05725f… 4,5,2,3,6,7,1 TRUE            
    #> # … with 881 more rows
    #> 
    #> $orig_core_uagents
    #> # A tibble: 59 x 8
    #>    uagent_id uagent_key uagent_name uagent_regex uagent_regex_ca… uagent_type
    #>        <int> <chr>      <chr>       <chr>                   <int> <chr>      
    #>  1       215 lotus      Lotus Notes "Lotus[ \\-…                1 browser    
    #>  2       214 firefox    Firefox     "Firefox/([…                1 browser    
    #>  3       213 firebird   Firebird    "Firebird/(…                1 browser    
    #>  4       212 curl       Curl        "curl[ /]([…                1 browser    
    #>  5        15 msnbot     MSN/Bing    "msnbot[ /]…                1 search     
    #>  6       211 chrome     Chrome      "Chrome/([0…                1 browser    
    #>  7       210 chimera    Chimera     "chimera/([…                1 browser    
    #>  8       209 camino     Camino      "camino/([0…                1 browser    
    #>  9       208 aol        AOL         "aol[ /\\-]…                1 browser    
    #> 10       207 amaya      Amaya       "amaya/([0-…                1 browser    
    #> # … with 49 more rows, and 2 more variables: uagent_position <int>,
    #> #   uagent_default_regex <chr>
    #> 
    #> $orig_custom_bbcode
    #> # A tibble: 34 x 16
    #>    bbcode_id bbcode_title bbcode_desc bbcode_tag bbcode_replace bbcode_useoption
    #>        <int> <chr>        <chr>       <chr>      <chr>          <lgl>           
    #>  1         1 Post Snap B… This tag d… snapback    <NA>          FALSE           
    #>  2         2 Right        Aligns con… right      "<p class='bb… FALSE           
    #>  3         3 Left         Aligns con… left       "<p class='bb… FALSE           
    #>  4         4 Center       Aligns con… center     "<p class='bb… FALSE           
    #>  5         5 Topic Link   This tag p… topic      "<a href='{ba… TRUE            
    #>  6         6 Post Link    This tag p… post       "<a href='{ba… TRUE            
    #>  7         7 Spoiler      Spoiler tag spoiler    "<div class='… FALSE           
    #>  8         8 Acronym      Allows you… acronym    "<acronym tit… TRUE            
    #>  9         9 Bold Text    Makes text… b          "<strong clas… FALSE           
    #> 10        10 Italic Text  Makes the … i          "<em class='b… FALSE           
    #> # … with 24 more rows, and 10 more variables: bbcode_example <chr>,
    #> #   bbcode_menu_option_text <chr>, bbcode_menu_content_text <chr>,
    #> #   bbcode_single_tag <lgl>, bbcode_php_plugin <chr>, bbcode_no_parsing <lgl>,
    #> #   bbcode_protected <lgl>, bbcode_aliases <chr>, bbcode_optional_option <lgl>,
    #> #   bbcode_image <chr>
    #> 
    #> $orig_dnames_change
    #> # A tibble: 500 x 7
    #>    dname_id dname_member_id dname_date dname_ip_address dname_previous dname_current
    #>       <int>           <int>      <int> <chr>            <chr>          <chr>        
    #>  1        1              16 1315978438 152.33.17.196    Talleyrand     The Normish  
    #>  2        2              16 1315979034 152.33.17.196    The Normish    Talleyrand   
    #>  3        3               8 1316033859 98.198.24.90     Mr. Elegy      Elegos       
    #>  4        4              17 1316047013 97.119.6.169     social_justice American Fed…
    #>  5       55             164 1349431769 134.88.170.184   Yorick         Y11          
    #>  6        6              11 1317754326 109.77.91.235    Four Suited J… F.S.J. Zero …
    #>  7        8             114 1327013527 79.67.83.218     Stork          Alabama Crim…
    #>  8        9             114 1327173999 79.67.83.218     Alabama Crims… Flash &amp; …
    #>  9       10             160 1329977515 188.95.153.254   Cricket        Richard the …
    #> 10       11             140 1330461934 24.229.117.252   SchwarzFrontU… AutNatUSA    
    #> # … with 490 more rows, and 1 more variable: dname_discount <lgl>
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
    #>    log_id log_member log_date            log_error log_error_code log_ip_address
    #>     <int>      <int> <dttm>              <chr>     <chr>          <chr>         
    #>  1 103794          0 2016-03-01 00:26:16 "You are… 1001           173.245.203.69
    #>  2 103793          0 2016-03-01 00:26:10 "You are… 1001           173.245.203.69
    #>  3 103792          0 2016-03-01 00:25:58 "You are… 1001           173.245.203.69
    #>  4 103791          0 2016-03-01 00:25:54 "You are… 1001           173.245.203.69
    #>  5 103790          0 2016-03-01 00:24:12 "You are… 1001           173.245.203.69
    #>  6 103789          0 2016-03-01 00:24:08 "You are… 1001           173.245.203.69
    #>  7 103788          0 2016-03-01 00:23:38 "You are… 1001           173.245.203.69
    #>  8 103787          0 2016-03-01 00:23:06 "You are… 1001           173.245.203.69
    #>  9 103786          0 2016-03-01 00:22:45 "You are… 1001           173.245.203.69
    #> 10 103785          0 2016-03-01 00:21:05 "You are… 1001           173.245.203.69
    #> # … with 51 more rows, and 1 more variable: log_request_uri <chr>
    #> 
    #> $orig_faq
    #> # A tibble: 10 x 6
    #>       id title     text                       description                   position app  
    #>    <int> <chr>     <chr>                      <chr>                            <int> <chr>
    #>  1     1 Searching "The search feature can b… How to use the search featur…        8 core 
    #>  2     2 Your Set… "<p>\n\tYou can access yo… Editing contact information,…        3 core 
    #>  3     3 How to R… "To be able to enjoy all … How to register and the adde…        1 core 
    #>  4     4 Logging … "&lt;strong&gt;Logging In… How to log in and out from t…        2 core 
    #>  5     5 Contacti… "If you need to contact a… Where to find a list of the …       10 core 
    #>  6     6 Personal… "The personal messenger c… How to send personal message…        6 memb…
    #>  7     7 Members   "&lt;strong&gt;Member Lis… A guide to the member list a…        7 memb…
    #>  8     8 Posting   "<!-- isHtml:1 --><!-- is… A guide to the features avai…        5 foru…
    #>  9     9 Topics a… "<p>\n\t<em><b>Viewing Th… A guide to forums, topics, p…        4 foru…
    #> 10    10 Calendar  "The calendar can be used… More information on the boar…       11 cale…
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
    #>       id topics posts last_post           last_poster_id last_poster_name name 
    #>    <int>  <int> <int> <dttm>                       <int> <chr>            <chr>
    #>  1     1      0     0 NA                               0  <NA>            Iron…
    #>  2    92     25   517 2016-02-07 18:26:19           9503 "HermannTheGerm… Acti…
    #>  3     2     14   307 2016-02-19 08:35:50           2820 "ZHICA"          Admi…
    #>  4    10      0     0 NA                               0  <NA>            The …
    #>  5     5     33  1382 2016-03-18 12:26:14              1 "Ð\u0090Ð»ÐµÐºÑ… The …
    #>  6     7      0     0 NA                               0  <NA>            The …
    #>  7    97     51  1101 2016-03-13 17:16:33           9510 "TheDrifter"     Movi…
    #>  8    90     19   561 2016-03-21 07:07:09           9521 "Unity"          Spor…
    #>  9    12    105  3997 2016-03-20 22:56:42           9149 "Oskar Dirlewan… Gene…
    #> 10    11    937 18143 2016-03-21 08:37:42           9950 "Schmiss"        Intr…
    #> # … with 122 more rows, and 29 more variables: description <chr>, position <int>,
    #> #   use_ibc <lgl>, last_title <chr>, last_id <int>, sort_key <chr>, sort_order <chr>,
    #> #   prune <int>, topicfilter <chr>, show_rules <lgl>, allow_poll <lgl>,
    #> #   allow_pollbump <lgl>, inc_postcount <lgl>, skin_id <lgl>, parent_id <int>,
    #> #   notify_modq_emails <chr>, sub_can_post <lgl>, permission_showtopic <lgl>,
    #> #   forum_allow_rating <lgl>, forum_last_deletion <int>, newest_title <chr>,
    #> #   newest_id <int>, can_view_others <lgl>, name_seo <chr>, seo_last_title <chr>,
    #> #   seo_last_name <chr>, last_x_topic_ids <chr>, deleted_topics <lgl>, viglink <lgl>
    #> 
    #> $orig_groups
    #> # A tibble: 9 x 47
    #>    g_id g_view_board g_mem_info g_other_topics g_use_search g_edit_profile
    #>   <int> <lgl>        <lgl>      <lgl>          <lgl>        <lgl>         
    #> 1     1 TRUE         TRUE       TRUE           TRUE         FALSE         
    #> 2     2 TRUE         TRUE       TRUE           TRUE         FALSE         
    #> 3     3 TRUE         TRUE       TRUE           TRUE         TRUE          
    #> 4     4 TRUE         TRUE       TRUE           TRUE         TRUE          
    #> 5     5 FALSE        FALSE      FALSE          FALSE        FALSE         
    #> 6     6 TRUE         TRUE       TRUE           TRUE         TRUE          
    #> 7     7 TRUE         TRUE       TRUE           TRUE         TRUE          
    #> 8    10 TRUE         TRUE       TRUE           TRUE         TRUE          
    #> 9    13 TRUE         TRUE       TRUE           TRUE         TRUE          
    #> # … with 41 more variables: g_post_new_topics <lgl>, g_reply_own_topics <lgl>,
    #> #   g_reply_other_topics <lgl>, g_edit_posts <lgl>, g_delete_own_posts <lgl>,
    #> #   g_open_close_posts <lgl>, g_delete_own_topics <lgl>, g_post_polls <lgl>,
    #> #   g_vote_polls <lgl>, g_use_pm <lgl>, g_is_supmod <lgl>, g_access_cp <lgl>,
    #> #   g_title <chr>, g_append_edit <lgl>, g_access_offline <lgl>, g_avoid_q <lgl>,
    #> #   g_avoid_flood <lgl>, g_icon <chr>, g_attach_max <dbl>, prefix <chr>, suffix <chr>,
    #> #   g_max_mass_pm <int>, g_search_flood <int>, g_edit_cutoff <int>, g_promotion <chr>,
    #> #   g_hide_from_list <lgl>, g_post_closed <lgl>, g_perm_id <chr>, g_photo_max_vars <chr>,
    #> #   g_dohtml <lgl>, g_edit_topic <lgl>, g_bypass_badwords <lgl>, g_can_msg_attach <lgl>,
    #> #   g_topic_rate_setting <int>, g_dname_changes <int>, g_dname_date <int>,
    #> #   g_rep_max_positive <int>, g_rep_max_negative <int>, g_signature_limits <chr>,
    #> #   g_can_add_friends <lgl>, g_bitoptions <int>
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
    #>    notify_id notify_to_id notify_sent         notify_read notify_title notify_text
    #>        <int>        <int> <dttm>                    <int> <chr>        <chr>      
    #>  1    344972         9217 2016-01-12 03:58:13           1 <a href='ht… "Hello!\n\…
    #>  2    344973         6155 2016-01-12 03:59:14           1 <a href='ht… "Hello!\n\…
    #>  3    344971         9679 2016-01-12 03:56:20           1 <a href='ht… "Vinokura,…
    #>  4    345399         7424 2016-01-12 23:28:12           1 <a href='ht… "Bear,\n\n…
    #>  5    344817         8232 2016-01-11 21:35:06           1 <a href='ht… "Raven,\n\…
    #>  6    335396         7903 2015-12-28 17:43:16           1 <a href='ht… "TripleKMa…
    #>  7    335397         1109 2015-12-28 17:43:16           0 <a href='ht… "Leonidas,…
    #>  8    335398           67 2015-12-28 17:43:16           0 <a href='ht… "Ã‰tat de …
    #>  9    335399          131 2015-12-28 17:43:16           1 <a href='ht… "Confedera…
    #> 10    350561         8310 2016-01-20 03:59:57           1 <a href='ht… "Commonwea…
    #> # … with 47,056 more rows, and 7 more variables: notify_from_id <int>,
    #> #   notify_type_key <chr>, notify_url <chr>, notify_meta_app <chr>,
    #> #   notify_meta_area <chr>, notify_meta_id <int>, notify_meta_key <chr>
    #> 
    #> $orig_login_methods
    #> # A tibble: 3 x 8
    #>   login_id login_title login_descripti… login_folder_na… login_settings login_enabled
    #>      <int> <chr>       <chr>            <chr>            <lgl>          <lgl>        
    #> 1        1 IPB Intern… The standard me… internal         FALSE          TRUE         
    #> 2        2 LDAP Authe… LDAP / Active D… ldap             TRUE           FALSE        
    #> 3        3 External D… Authentication … external         FALSE          FALSE        
    #> # … with 2 more variables: login_safemode <lgl>, login_order <int>
    #> 
    #> $orig_member_status_actions
    #> # A tibble: 927 x 7
    #>    action_id action_status_id action_reply_id action_member_id action_date action_key
    #>        <int>            <int>           <int>            <int>       <int> <chr>     
    #>  1         1                1               0               22  1316098429 new       
    #>  2         2                2               0               14  1316397519 new       
    #>  3         6                6               0               35  1319211330 new       
    #>  4         7                7               0               35  1319935567 new       
    #>  5         8                8               0               35  1319935570 new       
    #>  6        10               11               0               35  1321967601 new       
    #>  7        11               12               0               89  1324039690 new       
    #>  8        12                2               1               35  1324554161 reply     
    #>  9        17                2               2              132  1328301526 reply     
    #> 10        19               19               0              143  1328730328 new       
    #> # … with 917 more rows, and 1 more variable: action_status_owner <int>
    #> 
    #> $orig_member_status_replies
    #> # A tibble: 475 x 5
    #>    reply_id reply_status_id reply_member_id reply_date reply_content                      
    #>       <int>           <int>           <int>      <int> <chr>                              
    #>  1        1               2              35 1324554161 Try living in Indiana.             
    #>  2        2               2             132 1328301526 Try living in Finland. -25 celsius…
    #>  3        3              23             143 1330034455 Omg, blocked.                      
    #>  4        5              27             164 1332465964 Yeah it&#39;s so annoying dealing …
    #>  5        6              26             191 1333131553 And I&#39;m a country girl         
    #>  6        7              29             132 1333328200 *hmm...slavsicles...*              
    #>  7        8              29             130 1333757777 lolgenocide                        
    #>  8        9              29             130 1333758050 I didn&#39;t even know you could c…
    #>  9       10              26              84 1335455835 I thank God for that too&#33; ;)   
    #> 10       11              49             246 1338862771 I prefer the &quot;counter-revolut…
    #> # … with 465 more rows
    #> 
    #> $orig_member_status_updates
    #> # A tibble: 560 x 12
    #>    status_id status_member_id status_date status_content status_replies status_last_ids
    #>        <int>            <int>       <int> <chr>                   <int> <chr>          
    #>  1         1               22  1316098429 Testing                     0 "a:0:{}"       
    #>  2         2               14  1316397519 Cold... *brrr*              3 "a:3:{i:132455…
    #>  3         6               35  1319211330 I am so fucki…              0 "a:0:{}"       
    #>  4         7               35  1319935567 Queensryche                 0 "a:0:{}"       
    #>  5         8               35  1319935570 Queensryche                 0 "a:0:{}"       
    #>  6        11               35  1321967601 Getting into …              0 "a:0:{}"       
    #>  7        12               89  1324039690 National Soci…              0 "a:0:{}"       
    #>  8        28              143  1332804371 Ahaha, gnat s…              0 "a:0:{}"       
    #>  9        29              130  1332911151 Dreams of Sta…              3 "a:3:{i:133332…
    #> 10        19              143  1328730328 Numbess of bo…              0 "a:0:{}"       
    #> # … with 550 more rows, and 6 more variables: status_is_latest <lgl>,
    #> #   status_is_locked <int>, status_hash <chr>, status_author_id <int>,
    #> #   status_author_ip <chr>, status_approved <lgl>
    #> 
    #> $orig_members
    #> # A tibble: 763 x 51
    #>    member_id name  member_group_id email joined              ip_address posts title
    #>        <int> <chr>           <int> <chr> <dttm>              <chr>      <int> <chr>
    #>  1         1 Alex…               4 slav… 2011-09-12 15:46:59 178.140.1…  5613 My s…
    #>  2         2 Kacen              13 illu… 2011-09-12 15:52:30 68.37.21.…  1267 THE …
    #>  3         3 Bloo…              13 rene… 2011-09-12 18:10:11 68.10.255…   487 14/8…
    #>  4         4 Mier…              13 homi… 2011-09-12 20:27:35 82.29.169…  1704 Mult…
    #>  5         5 Will…               5 tash… 2011-09-12 20:58:17 90.214.15…   463 A fox
    #>  6         6 Inte…              13 mich… 2011-09-12 21:14:03 86.7.229.…     9 <NA> 
    #>  7         7 Benj…               4 benj… 2011-09-13 01:22:58 81.141.31…  3127 2 Mi…
    #>  8         8 Mr. …              13 elei… 2011-09-13 04:24:07 98.198.24…   167 <NA> 
    #>  9         9 Woma…               5 sol.… 2011-09-13 10:27:52 88.147.27…   997 <NA> 
    #> 10        10 Dene…              13 8056… 2011-09-13 12:13:09 72.76.138…    96 <NA> 
    #> # … with 753 more rows, and 43 more variables: allow_admin_mails <lgl>,
    #> #   time_offset <chr>, skin <int>, warn_level <int>, warn_lastwarn <int>,
    #> #   last_post <dttm>, restrict_post <chr>, view_sigs <lgl>, bday_day <int>,
    #> #   bday_month <int>, bday_year <int>, msg_count_new <int>, msg_count_total <int>,
    #> #   msg_count_reset <lgl>, msg_show_notification <lgl>, last_visit <dttm>,
    #> #   last_activity <dttm>, dst_in_use <lgl>, mod_posts <chr>, auto_track <chr>,
    #> #   temp_ban <chr>, login_anonymous <chr>, ignored_users <chr>, mgroup_others <chr>,
    #> #   org_perm_id <chr>, member_login_key <chr>, member_login_key_expire <dttm>,
    #> #   members_auto_dst <lgl>, members_display_name <chr>, members_seo_name <chr>,
    #> #   members_cache <chr>, members_disable_pm <int>, members_l_display_name <chr>,
    #> #   members_l_username <chr>, failed_logins <chr>, members_profile_views <int>,
    #> #   members_pass_hash <chr>, members_pass_salt <chr>, member_banned <lgl>,
    #> #   member_uploader <chr>, members_bitoptions <int>, members_day_posts <chr>,
    #> #   notification_cnt <int>
    #> 
    #> $orig_members_warn_logs
    #> # A tibble: 163 x 20
    #>    wl_id wl_member wl_moderator wl_date             wl_reason wl_points wl_note_member
    #>    <int>     <int>        <int> <dttm>                  <int>     <int> <chr>         
    #>  1     1        33            9 2011-09-21 11:32:21         0         1 <NA>          
    #>  2     2        40            4 2011-10-27 23:38:28         0         1 <NA>          
    #>  3     3        40            4 2011-10-27 23:39:35         0         0 <NA>          
    #>  4     4        40            4 2011-12-04 00:16:19         0         0 <NA>          
    #>  5     5        89            7 2011-12-17 22:04:47         0         1 <NA>          
    #>  6     6        49           14 2011-12-17 22:07:40         0         1 <NA>          
    #>  7     7        40           14 2011-12-23 20:27:50         0         0 <NA>          
    #>  8     8        40           14 2011-12-25 14:33:04         0         0 <NA>          
    #>  9     9        40            4 2012-01-01 19:56:58         0         0 <NA>          
    #> 10    10        40            4 2012-01-28 21:05:49         0         0 <NA>          
    #> # … with 153 more rows, and 13 more variables: wl_note_mods <chr>, wl_mq <int>,
    #> #   wl_mq_unit <chr>, wl_rpa <int>, wl_rpa_unit <chr>, wl_suspend <int>,
    #> #   wl_suspend_unit <chr>, wl_ban_group <int>, wl_expire <int>, wl_expire_unit <chr>,
    #> #   wl_content_app <chr>, wl_content_id1 <chr>, wl_expire_date <lgl>
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
    #>    msg_id msg_topic_id msg_date            msg_post msg_post_key msg_author_id
    #>     <int>        <int> <dttm>              <chr>    <chr>                <int>
    #>  1      1            1 2011-09-16 03:49:58 "The be… 3320f7f06c4…             1
    #>  2      2            2 2011-09-16 11:54:08 "Who ar… 9204e488332…            11
    #>  3      3            2 2011-09-16 14:39:59 "Crisis… 12fd0309239…             1
    #>  4      4            2 2011-09-16 15:29:01 "Thank … 0658c6f99ac…            11
    #>  5      5            2 2011-09-16 15:32:58 "If you… 570257864e3…             1
    #>  6      6            2 2011-09-16 15:44:51 "The fu… aabeacc8f4c…            11
    #>  7      7            3 2011-09-17 01:43:49 "I don'… a36f67c0d72…            16
    #>  8      8            3 2011-09-17 01:59:50 "[quote… 327b933d818…            14
    #>  9     12            5 2011-09-20 14:20:14 "The be… 0667258c387…             1
    #> 10     13            5 2011-09-20 14:42:17 "Done a… de1d7fd2737…            20
    #> # … with 13,331 more rows, and 2 more variables: msg_ip_address <chr>,
    #> #   msg_is_first_post <lgl>
    #> 
    #> $orig_message_topic_user_map
    #> # A tibble: 6,025 x 11
    #>    map_id map_user_id map_topic_id map_folder_id map_read_time       map_user_active
    #>     <int>       <int>        <int> <chr>         <dttm>              <lgl>          
    #>  1      1          23            1 myconvo       2011-11-04 06:53:06 TRUE           
    #>  2      2           1            1 myconvo       2011-09-20 14:19:38 FALSE          
    #>  3      3           1            2 myconvo       2011-09-16 15:46:25 FALSE          
    #>  4      4          11            2 myconvo       2011-09-20 04:03:38 TRUE           
    #>  5      5          14            3 myconvo       2011-09-17 01:59:51 TRUE           
    #>  6      6          16            3 myconvo       2011-09-17 18:19:01 FALSE          
    #>  7      9          20            5 myconvo       2011-09-20 14:42:17 TRUE           
    #>  8     10           1            5 myconvo       2011-11-07 01:36:40 FALSE          
    #>  9     11          11            6 myconvo       2011-09-22 14:18:00 TRUE           
    #> 10     12           1            6 myconvo       2011-09-22 14:33:52 FALSE          
    #> # … with 6,015 more rows, and 5 more variables: map_user_banned <lgl>,
    #> #   map_has_unread <lgl>, map_is_starter <lgl>, map_ignore_notification <lgl>,
    #> #   map_last_topic_reply <dttm>
    #> 
    #> $orig_message_topics
    #> # A tibble: 3,101 x 14
    #>    mt_id mt_date             mt_title mt_starter_id mt_start_time      
    #>    <int> <dttm>              <chr>            <int> <dttm>             
    #>  1     1 2011-09-16 03:49:58 Introdu…             1 2011-09-16 03:49:58
    #>  2     2 2011-09-16 11:54:08 Our hos…            11 2011-09-16 11:54:07
    #>  3     3 2011-09-17 01:43:49 Re: Nov…            16 2011-09-17 01:43:49
    #>  4     5 2011-09-20 14:20:14 Introdu…             1 2011-09-20 14:20:14
    #>  5     6 2011-09-22 14:12:17 msn                  1 2011-09-22 14:12:17
    #>  6     8 2011-09-22 21:21:22 Do you …             2 2011-09-22 21:21:22
    #>  7    10 2011-09-23 20:44:56 Introdu…             1 2011-09-23 20:44:56
    #>  8    11 2011-09-24 09:40:39 Introdu…             1 2011-09-24 09:40:39
    #>  9    12 2011-09-25 17:18:50 Welcome…            14 2011-09-25 17:18:50
    #> 10    13 2011-09-26 01:05:50 Could I…             2 2011-09-26 01:05:49
    #> # … with 3,091 more rows, and 9 more variables: mt_last_post_time <dttm>,
    #> #   mt_invited_members <chr>, mt_to_count <int>, mt_to_member_id <int>, mt_replies <int>,
    #> #   mt_last_msg_id <int>, mt_first_msg_id <int>, mt_is_draft <lgl>, mt_is_deleted <lgl>
    #> 
    #> $orig_moderator_logs
    #> # A tibble: 11,937 x 12
    #>       id forum_id topic_id post_id member_id member_name ip_address http_referer
    #>    <int>    <int>    <int>   <int>     <int> <chr>       <chr>      <chr>       
    #>  1     1        0        0       0         0 Guest       178.140.1… http://iron…
    #>  2     2        2        1       0         1 Alexander … 178.140.1… http://iron…
    #>  3     3        0        0       0         1 Alexander … 178.140.1… http://iron…
    #>  4     4        4        0       0         1 Alexander … 178.140.1… http://iron…
    #>  5     5        0        0       0         0 Guest       178.140.1… http://iron…
    #>  6     6       53        0       0         1 Alexander … 178.140.1… http://iron…
    #>  7     7        5        0       0         1 Alexander … 178.140.1… http://iron…
    #>  8     8       61        0       0         1 Alexander … 178.140.1… http://iron…
    #>  9     9        8        0       0         1 Alexander … 178.140.1… http://iron…
    #> 10    10        9        0       0         1 Alexander … 178.140.1… http://iron…
    #> # … with 11,927 more rows, and 4 more variables: ctime <dttm>, topic_title <chr>,
    #> #   action <chr>, query_string <chr>
    #> 
    #> $orig_permission_index
    #> # A tibble: 135 x 12
    #>    perm_id app   perm_type perm_type_id perm_view perm_2 perm_3 perm_4 perm_5 perm_6
    #>      <int> <chr> <chr>            <int> <chr>     <chr>  <chr>  <chr>  <chr>  <chr> 
    #>  1       1 memb… profile_…            1 *         <NA>   <NA>   <NA>   <NA>   <NA>  
    #>  2       2 core  help                 1 *         <NA>   <NA>   <NA>   <NA>   <NA>  
    #>  3       3 foru… forum                1 ,1,2,3,4… ,6,    ,6,    ,6,    ,,     ,,    
    #>  4     125 foru… forum                2 ,4,2,3,6… ,4,2,… ,4,3,… ,4,6,  ,,     ,,    
    #>  5     110 foru… forum               92 ,4,2,3,6… ,4,2,… ,4,3,… ,4,3,… ,,     ,,    
    #>  6       7 foru… forum                5 ,4,2,3,6… ,4,2,… ,4,3,… ,4,3,… ,6,    ,4,6, 
    #>  7     118 foru… forum              100 ,4,2,3,6… ,4,2,… ,4,3,… ,4,3,… ,,     ,,    
    #>  8       9 foru… forum                7 ,4,2,3,6… ,,     ,,     ,,     ,,     ,,    
    #>  9     109 foru… forum               91 ,4,2,3,6… ,4,2,… ,4,3,… ,4,3,… ,,     ,,    
    #> 10     108 foru… forum               90 ,4,2,3,6… ,4,2,… ,4,3,… ,4,3,… ,,     ,,    
    #> # … with 125 more rows, and 2 more variables: perm_7 <chr>, owner_only <lgl>
    #> 
    #> $orig_pfields_content
    #> # A tibble: 764 x 12
    #>    member_id field_1 field_2 field_3 field_4 field_5 field_6 field_7 field_8 field_9
    #>        <int> <chr>   <chr>   <chr>   <chr>   <chr>   <chr>   <chr>   <chr>   <chr>  
    #>  1         1 <NA>    <NA>    <NA>    <NA>    m       Third …  <NA>   <NA>    <NA>   
    #>  2         2 <NA>    <NA>    <NA>    <NA>    m       <NA>     <NA>   <NA>    <NA>   
    #>  3      9882 <NA>    <NA>    <NA>    <NA>    <NA>    <NA>     <NA>   <NA>    <NA>   
    #>  4         3 <NA>    <NA>    <NA>    <NA>    m       Dixie   "Worki… <NA>    <NA>   
    #>  5         4 <NA>    <NA>    http:/… <NA>    m       Babylon "You"   <NA>    <NA>   
    #>  6         5 <NA>    <NA>    <NA>    <NA>    m       Great … "Polit… <NA>    <NA>   
    #>  7         6 <NA>    <NA>    <NA>    <NA>    m       United…  <NA>   <NA>    <NA>   
    #>  8         7 <NA>    <NA>    <NA>    <NA>    m       United… "http:… <NA>    <NA>   
    #>  9         8 <NA>    <NA>    <NA>    <NA>    m       <NA>     <NA>   <NA>    <NA>   
    #> 10         9 <NA>    <NA>    <NA>    <NA>    f       AWOL     <NA>   <NA>    <NA>   
    #> # … with 754 more rows, and 2 more variables: field_10 <chr>, field_11 <chr>
    #> 
    #> $orig_pfields_data
    #> # A tibble: 11 x 12
    #>    pf_id pf_title pf_content pf_type pf_not_null pf_position pf_show_on_reg
    #>    <int> <chr>    <chr>      <chr>   <lgl>             <int> <lgl>         
    #>  1     1 AIM      <NA>       input   FALSE                 0 FALSE         
    #>  2     2 MSN      <NA>       input   FALSE                 0 FALSE         
    #>  3     3 Website… <NA>       input   FALSE                 0 FALSE         
    #>  4     4 ICQ      <NA>       input   FALSE                 0 FALSE         
    #>  5     5 Gender   u=Not Tel… drop    FALSE                 2 FALSE         
    #>  6     6 Locatio… <NA>       input   FALSE                 3 FALSE         
    #>  7     7 Interes… <NA>       textar… FALSE                 4 FALSE         
    #>  8     8 Yahoo    <NA>       input   FALSE                 0 FALSE         
    #>  9     9 Jabber   <NA>       input   FALSE                 0 FALSE         
    #> 10    10 Skype    <NA>       input   FALSE                 0 FALSE         
    #> 11    11 Ideology <NA>       input   TRUE                  1 TRUE          
    #> # … with 5 more variables: pf_topic_format <chr>, pf_group_id <int>, pf_icon <chr>,
    #> #   pf_key <chr>, pf_search_type <chr>
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
    #>      pid   tid start_date          choices starter_id votes forum_id poll_question
    #>    <int> <int> <dttm>              <chr>        <int> <int>    <int> <chr>        
    #>  1     1   370 2011-12-13 15:25:38 "a:1:{…          4    13       88 <NA>         
    #>  2     3   599 2012-02-14 00:03:33 "a:1:{…          4    12       13 THERE WAS A …
    #>  3     4   682 2012-03-06 16:28:36 "a:1:{…         14    41       99 Answer the Q…
    #>  4     6   939 2012-05-11 01:31:58 "a:1:{…          0    39       99 Do you have …
    #>  5    11  1422 2012-09-06 04:27:51 "a:1:{…        274    20       24 How would pe…
    #>  6    18  2784 2013-08-10 01:03:42 "a:1:{…       6201    22       99 How Gay is t…
    #>  7    20  2830 2013-08-19 20:44:13 "a:1:{…          0    25       78 Mexican or M…
    #>  8    23  3136 2013-10-22 13:27:17 "a:1:{…         35    52       45 Where do you…
    #>  9    24  3731 2014-03-15 05:34:15 "a:1:{…       6122    22       88 <NA>         
    #> 10    25  3897 2014-04-30 20:33:11 "a:1:{…       6306    23       26 Climate Chan…
    #> # … with 14 more rows, and 1 more variable: poll_view_voters <lgl>
    #> 
    #> $orig_posts
    #> # A tibble: 139,068 x 17
    #>       pid append_edit edit_time           author_id author_name use_sig use_emo ip_address
    #>     <int> <lgl>       <dttm>                  <int> <chr>       <lgl>   <lgl>   <chr>     
    #>  1    202 FALSE       NA                          7 MoonmanKKK  TRUE    TRUE    81.141.31…
    #>  2    203 FALSE       NA                         16 Talleyrand  TRUE    TRUE    152.33.58…
    #>  3    532 FALSE       2011-09-19 23:14:09         5 Will to Po… TRUE    TRUE    90.219.24…
    #>  4 114067 FALSE       NA                       7508 RIGHT WING… TRUE    TRUE    80.212.44…
    #>  5 114068 FALSE       2015-05-16 18:07:42      9486 Nihonjin M… TRUE    TRUE    73.222.21…
    #>  6 114069 FALSE       2015-05-16 19:12:42      7481 Â¡VIVA LA … TRUE    TRUE    86.181.21…
    #>  7 114070 FALSE       NA                       9144 Neizbezhno… TRUE    TRUE    121.215.1…
    #>  8 114071 FALSE       NA                       6321 Culius Jae… TRUE    TRUE    65.28.106…
    #>  9      4 FALSE       NA                          1 Alexander … TRUE    TRUE    178.140.1…
    #> 10     83 FALSE       NA                         16 Talleyrand  TRUE    TRUE    152.33.17…
    #> # … with 139,058 more rows, and 9 more variables: post_date <dttm>, post <chr>,
    #> #   queued <int>, topic_id <int>, new_topic <lgl>, edit_name <chr>, post_key <chr>,
    #> #   post_edit_reason <chr>, pdelete_time <dttm>
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
    #>    pp_member_id pp_last_visitors pp_rating_hits pp_rating_value pp_rating_real
    #>           <int> <chr>                     <int>           <int>          <int>
    #>  1            1 a:6:{i:14585562…             30             136              5
    #>  2         9659 a:1:{i:14429407…              1               1              1
    #>  3         6180 a:6:{i:13927958…              0               0              0
    #>  4            2 a:6:{i:14559000…             10              45              5
    #>  5            3 a:6:{i:14571305…              3              14              5
    #>  6            4 a:6:{i:14571393…              7              31              4
    #>  7            5 a:6:{i:13747911…              2               2              1
    #>  8            6 a:6:{i:14343615…              0               0              0
    #>  9            7 a:6:{i:14585121…             24             108              5
    #> 10            8 a:6:{i:14551305…              2              10              5
    #> # … with 754 more rows, and 18 more variables: pp_main_photo <chr>, pp_main_width <int>,
    #> #   pp_main_height <int>, pp_thumb_photo <chr>, pp_thumb_width <int>,
    #> #   pp_thumb_height <int>, pp_setting_moderate_comments <lgl>,
    #> #   pp_setting_moderate_friends <lgl>, pp_setting_count_friends <lgl>,
    #> #   pp_setting_count_comments <lgl>, pp_setting_count_visitors <lgl>, pp_about_me <chr>,
    #> #   pp_reputation_points <int>, pp_gravatar <chr>, pp_photo_type <chr>, signature <chr>,
    #> #   pp_customization <chr>, pp_profile_update <dttm>
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
    #>   qa_id qa_question                               qa_answers                              
    #>   <int> <chr>                                     <chr>                                   
    #> 1    17 Name the specialized subforum from the S… "JEWISH QUESTION\r\nTHE JEWISH QUESTION"
    #> 2    16 Input the second key term listed in the … "FASCIST ALMA MATER"                    
    #> 3    15 The Slogan of IronMarch is (answer in al… "GAS THE KIKES RACE WAR NOW 1488 BOOTS …
    #> 4    18 The place where you will end up if you f… "CONCENTRATION CAMP\r\nTHE CONCENTRATIO…
    #> 
    #> $orig_rc_classes
    #> # A tibble: 5 x 8
    #>   com_id class_title  class_desc my_class group_can_report mod_group_perm extra_data app  
    #>    <int> <chr>        <chr>      <chr>    <chr>            <chr>          <chr>      <chr>
    #> 1      1 Simple Plug… Plugin th… default  ,3,4,6,7,8,9,10… ,4,6,10,       "a:5:{s:1… core 
    #> 2      2 Forum Plugin This is t… post     ,1,2,3,4,6,7,8,… ,4,6,10,       "a:1:{s:1… foru…
    #> 3      3 Private Mes… This plug… messages ,1,2,3,4,6,7,8,… ,4,6,10,       "a:1:{s:1… memb…
    #> 4      4 Member Prof… Allows yo… profiles ,1,2,3,4,6,7,8,… ,4,6,10,       "N;"       memb…
    #> 5      5 Calendar Pl… Allows ca… calendar ,1,2,3,4,6,      ,4,6,          "N;"       cale…
    #> 
    #> $orig_rc_comments
    #> # A tibble: 21 x 7
    #>       id   rid comment           comment_by comment_date        author_name     ip_address
    #>    <int> <int> <chr>                  <int> <dttm>              <chr>           <chr>     
    #>  1     1     1 "This is an anti…          9 2011-12-24 09:57:56 "Woman in Blac… 88.147.17…
    #>  2    13    10 "done"                    49 2012-12-27 20:38:44 "Ð’Ð»Ð°Ð´Ð¸Ð¼Ð… 72.78.105…
    #>  3    26    74 "<p>Don't report…          4 2014-01-02 11:51:34 "Mierce"        82.25.135…
    #>  4    30    89 "<p>No.</p>\n"             1 2015-05-13 16:30:24 "Ð\u0090Ð»ÐµÐº… 5.228.66.…
    #>  5    31    89 "<p>I'll need a …       2170 2015-05-13 20:18:43 "Zeiger"        69.70.181…
    #>  6    32    89 "<p>this is just…       9475 2015-05-13 21:47:00 "mengligiraykh… 95.142.13…
    #>  7    33    89 "<p>&gt;Puts som…       2220 2015-05-15 02:16:03 "Kulturkampf"   122.128.1…
    #>  8    34    90 "Who are you aga…       2170 2015-05-21 06:36:39 "Zeiger"        66.102.6.…
    #>  9    35    90 "<p>He's the guy…       9475 2015-05-21 06:57:15 "mengligiraykh… 95.142.13…
    #> 10    36    90 "<p>Oh yeah, sur…          1 2015-05-21 07:40:49 "Ð\u0090Ð»ÐµÐº… 5.228.66.…
    #> # … with 11 more rows
    #> 
    #> $orig_rc_modpref
    #> # A tibble: 21 x 3
    #>    mem_id rss_key                 rss_cache                                               
    #>     <int> <chr>                   <chr>                                                   
    #>  1      1 a31e419a0c3ec13258bcf3…  <NA>                                                   
    #>  2      4 570882a0ed9e1c0b83c8c1…  <NA>                                                   
    #>  3     14 40cf3bd33995c06ae9639b…  <NA>                                                   
    #>  4      0 <NA>                    "<?xml version=\"1.0\" encoding=\"UTF-8\" ?>\n<rss vers…
    #>  5      7 d8a331ee70aba8ad92f8be…  <NA>                                                   
    #>  6      9 1c0febd1e77291c90b0575…  <NA>                                                   
    #>  7    132 2c47a8124da7d34842c658…  <NA>                                                   
    #>  8     13 2b4ae5b7d09b495defbc2a…  <NA>                                                   
    #>  9     35 ce51ea7ca7936a0bfd8718…  <NA>                                                   
    #> 10      2 aa6ce80b32ecf268295630…  <NA>                                                   
    #> # … with 11 more rows
    #> 
    #> $orig_rc_reports
    #> # A tibble: 25 x 5
    #>       id   rid report                                              report_by date_reported
    #>    <int> <int> <chr>                                                   <int>         <int>
    #>  1     1     1 "[quote name='Frost Hammer']Before I start, I'd li…        11    1324684384
    #>  2    10    10 "[quote name='Sir Barza']Please, delete this.[/quo…      2099    1356640292
    #>  3    14    14 "[quote name='AlbertSakas']Ð¡ÐµÐ±Ñ\u008f Ð½Ð¸Ñ‡ÐµÐ…         2    1361245960
    #>  4    59    55 "spam profile"                                           1209    1366310513
    #>  5    60    56 "more spam profile&#39;s"                                1209    1366310573
    #>  6    62    58 "<blockquote  class=\"ipsBlockquote\" data-author=…      6174    1374646450
    #>  7    71    66 "<blockquote  class=\"ipsBlockquote\" data-author=…      6173    1377089209
    #>  8    74    69 "<blockquote  class=\"ipsBlockquote\" data-author=…         2    1380356286
    #>  9    75    70 "<blockquote  class=\"ipsBlockquote\" data-author=…         2    1380356292
    #> 10    79    74 "<blockquote  class=\"ipsBlockquote\" data-author=…         0    1388660127
    #> # … with 15 more rows
    #> 
    #> $orig_rc_reports_index
    #> # A tibble: 23 x 14
    #>       id uid   title url   rc_class updated_by date_updated date_created exdat1 exdat2
    #>    <int> <chr> <chr> <chr>    <int>      <int>        <int>        <int>  <int>  <int>
    #>  1     1 0b3a… Why … /ind…        2          9   1324720676   1324684384     57    422
    #>  2    10 d94e… Worl… /ind…        2          4   1356645256   1356640292     22   1827
    #>  3    14 4007… Oper… /ind…        2          1   1361248006   1361245960      4   1751
    #>  4    58 264d… IRA … /ind…        2          1   1374646833   1374646450      9   2688
    #>  5    66 cd32… Jews… /ind…        2          4   1377095062   1377089209      8   2842
    #>  6    69 933f… Belg… /ind…        2         16   1380356859   1380356286      8   3021
    #>  7    70 3a36… Belg… /ind…        2         16   1380356859   1380356292      8   3020
    #>  8    74 9ca0… Gabo… /ind…        2          4   1388663494   1388660127      9   3182
    #>  9    89 7b4b… Libe… /ind…        2       2170   1431658980   1431533699     30   3751
    #> 10    90 f557… Iron… /ind…        2       2170   1432309218   1432177523      2   5130
    #> # … with 13 more rows, and 4 more variables: exdat3 <int>, num_comments <int>,
    #> #   seoname <chr>, seotemplate <chr>
    #> 
    #> $orig_rc_status
    #> # A tibble: 3 x 8
    #>   status title      points_per_report minutes_to_apoi… is_new is_complete is_active rorder
    #>    <int> <chr>      <lgl>                        <dbl> <lgl>  <lgl>       <lgl>      <int>
    #> 1      1 New Report TRUE                             5 TRUE   FALSE       TRUE           1
    #> 2      2 Under Rev… TRUE                             5 FALSE  FALSE       TRUE           2
    #> 3      3 Complete   FALSE                            0 FALSE  TRUE        FALSE          3
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
    #>           id type_id rep_points rep_like_cache                         cache_date         
    #>        <dbl>   <int>      <int> <chr>                                  <dttm>             
    #>  1 2.81e-317  117582          0 "a:2:{s:10:\"cache_data\";a:0:{}s:12:… 2016-03-23 07:28:57
    #>  2 2.81e-317  117681          0 "a:2:{s:10:\"cache_data\";a:0:{}s:12:… 2016-03-23 07:28:57
    #>  3 2.81e-317  117682          0 "a:2:{s:10:\"cache_data\";a:0:{}s:12:… 2016-03-23 07:28:57
    #>  4 2.81e-317  117695          0 "a:2:{s:10:\"cache_data\";a:0:{}s:12:… 2016-03-23 07:28:57
    #>  5 2.81e-317  117702          0 "a:2:{s:10:\"cache_data\";a:0:{}s:12:… 2016-03-23 07:28:57
    #>  6 2.49e-317  117573          2 "a:2:{s:10:\"cache_data\";a:6:{s:3:\"… 2016-03-23 07:28:57
    #>  7 2.81e-317  117578          1 "a:2:{s:10:\"cache_data\";a:6:{s:3:\"… 2016-03-23 07:28:57
    #>  8 2.81e-317  117577          2 "a:2:{s:10:\"cache_data\";a:6:{s:3:\"… 2016-03-23 07:28:57
    #>  9 2.81e-317  117576          0 "a:2:{s:10:\"cache_data\";a:0:{}s:12:… 2016-03-23 07:28:57
    #> 10 3.84e-317  147832          0 "a:2:{s:10:\"cache_data\";a:0:{}s:12:… 2016-03-22 06:24:36
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
    #>    keyword                                                                           count
    #>    <chr>                                                                             <int>
    #>  1 #jesuiscouteau ironmarch.org                                                          1
    #>  2 #rekt gif                                                                             1
    #>  3 #shrekt                                                                               1
    #>  4 &#036;hre.kersan.photo                                                                1
    #>  5 &#39;craig fraser&#39; sigurd                                                         1
    #>  6 &#39;elementos - urkultur                                                             1
    #>  7 &#39;Hammer of the Patriot A handbook By Charles Chapel.                              1
    #>  8 &#39;the whole of National Socialism [the Nazi political philosophy] is based on…     1
    #>  9 &gt;I am a fierce goddess warrior who embraces the human spirit fully. I believe…     1
    #> 10 &quot; central Asian albinos&quot;                                                    1
    #> # … with 20,069 more rows
    #> 
    #> $orig_search_sessions
    #> # A tibble: 1,274 x 5
    #>    session_id   session_created     session_updated     session_member_… session_data     
    #>    <chr>        <dttm>              <dttm>                         <int> <chr>            
    #>  1 6e420afb24d… 2016-03-21 01:39:32 2016-03-21 01:39:32                0 "a:1:{s:18:\"sea…
    #>  2 d7f949091d1… 2016-03-21 03:59:10 2016-03-21 03:59:10                0 "a:1:{s:18:\"sea…
    #>  3 8e9e710abf3… 2016-03-21 00:30:03 2016-03-21 00:30:03                0 "a:1:{s:18:\"sea…
    #>  4 9271fa2f10b… 2016-03-21 00:30:39 2016-03-21 00:30:40             6113 "a:1:{s:18:\"sea…
    #>  5 42c32a7f77b… 2016-03-21 02:52:17 2016-03-21 02:52:17                0 "a:1:{s:18:\"sea…
    #>  6 51255c28171… 2016-03-20 14:13:22 2016-03-20 14:13:23                0 "a:1:{s:18:\"sea…
    #>  7 c82c6c8102f… 2016-03-20 15:38:41 2016-03-20 15:38:41                0 "a:1:{s:18:\"sea…
    #>  8 8d8a8540981… 2016-03-20 15:40:02 2016-03-20 15:40:02                0 "a:1:{s:18:\"sea…
    #>  9 ee348f4d0aa… 2016-03-21 06:46:55 2016-03-21 06:46:55                0 "a:1:{s:18:\"sea…
    #> 10 e181d0d6387… 2016-03-20 21:21:33 2016-03-20 21:21:36                0 "a:1:{s:18:\"sea…
    #> # … with 1,264 more rows
    #> 
    #> $orig_search_visitors
    #> # A tibble: 696 x 6
    #>       id member date                engine keywords             url                       
    #>    <int>  <int> <dttm>              <chr>  <chr>                <chr>                     
    #>  1 42351      0 2016-02-18 17:59:40 Google file:///porn/288/pu… showuser=288&tab=reputati…
    #>  2 42352      0 2016-02-18 19:28:31 Bing   evola yuga           showuser=7508&tab=reputat…
    #>  3 42353      0 2016-02-18 19:28:32 Bing   evola yuga           showuser=7508&tab=reputat…
    #>  4 42354      0 2016-02-18 20:08:43 Bing   pros and cons of au… showtopic=2869            
    #>  5 42355      0 2016-02-18 20:55:28 Google fascist authors      showtopic=92              
    #>  6 42356      0 2016-02-18 21:15:31 Google Light skin vs shits… showtopic=5378            
    #>  7 42357      0 2016-02-18 21:27:47 Google sigurd legion        showtopic=4447            
    #>  8 42358      0 2016-02-19 00:17:57 Bing   were there any repo… showtopic=2064            
    #>  9 42359      0 2016-02-19 03:05:49 Google kike on a stick      app=core&module=search&do…
    #> 10 42360      0 2016-02-19 06:37:51 Google Ironmarch chinese i… showtopic=206             
    #> # … with 686 more rows
    #> 
    #> $orig_sessions
    #> # A tibble: 240 x 19
    #>    id    member_name seo_name member_id ip_address browser running_time login_type
    #>    <chr> <chr>       <chr>        <int> <chr>      <chr>          <int> <lgl>     
    #>  1 60f2… <NA>        <NA>             0 166.137.1… Mozill…   1458838967 FALSE     
    #>  2 ca7c… <NA>        <NA>             0 180.76.15… Mozill…   1458840813 FALSE     
    #>  3 b6a6… Goeth       goeth         9363 99.92.244… Mozill…   1458838996 FALSE     
    #>  4 828d… GladiumSpi… gladium…      9634 45.21.34.… Mozill…   1458839012 FALSE     
    #>  5 d356… <NA>        <NA>             0 180.76.15… Mozill…   1458843698 FALSE     
    #>  6 5451… <NA>        <NA>             0 213.205.2… Mozill…   1458843368 FALSE     
    #>  7 869d… <NA>        <NA>             0 97.67.240… Mozill…   1458842942 FALSE     
    #>  8 afd3… <NA>        <NA>             0 86.3.91.23 Mozill…   1458842308 FALSE     
    #>  9 2cc2… <NA>        <NA>             0 91.144.13… Wget/1…   1458837947 FALSE     
    #> 10 7082… <NA>        <NA>             0 212.21.66… Mozill…   1458839341 FALSE     
    #> # … with 230 more rows, and 11 more variables: member_group <int>, location_1_type <chr>,
    #> #   location_1_id <int>, location_2_type <chr>, location_2_id <int>,
    #> #   current_appcomponent <chr>, current_module <chr>, current_section <chr>,
    #> #   uagent_key <chr>, uagent_version <chr>, uagent_type <chr>
    #> 
    #> $orig_skin_cache
    #> # A tibble: 350 x 17
    #>    cache_id cache_updated       cache_type cache_set_id cache_key_1 cache_value_1
    #>       <int> <dttm>              <chr>             <int> <chr>       <chr>        
    #>  1     3022 2014-10-26 19:34:17 replaceme…            0 <NA>        <NA>         
    #>  2     3023 2014-10-26 19:35:36 phptempla…            1 group       skin_boards  
    #>  3     3028 2014-10-26 19:35:36 phptempla…            1 group       skin_global_…
    #>  4     3024 2014-10-26 19:35:36 phptempla…            1 group       skin_editors 
    #>  5     3026 2014-10-26 19:35:36 phptempla…            1 group       skin_forum   
    #>  6     3027 2014-10-26 19:35:36 phptempla…            1 group       skin_global  
    #>  7     3025 2014-10-26 19:35:36 phptempla…            1 group       skin_emails  
    #>  8     3030 2014-10-26 19:35:36 phptempla…            1 group       skin_help    
    #>  9     3033 2014-10-26 19:35:36 phptempla…            1 group       skin_messagi…
    #> 10     3031 2014-10-26 19:35:36 phptempla…            1 group       skin_legends 
    #> # … with 340 more rows, and 11 more variables: cache_key_2 <chr>, cache_value_2 <chr>,
    #> #   cache_value_3 <chr>, cache_content <chr>, cache_key_3 <chr>, cache_key_4 <chr>,
    #> #   cache_value_4 <chr>, cache_key_5 <chr>, cache_value_5 <chr>, cache_key_6 <chr>,
    #> #   cache_value_6 <chr>
    #> 
    #> $orig_skin_collections
    #> # A tibble: 4 x 15
    #>   set_id set_name set_key set_is_default set_author_name set_author_url set_image_dir
    #>    <int> <chr>    <chr>   <lgl>          <chr>           <chr>          <chr>        
    #> 1      1 IP.Board default FALSE          Invision Power… http://www.in… master       
    #> 2      2 IP.Boar… mobile  FALSE          Invision Power… http://www.in… mobile       
    #> 3      6 IP.Boar… xmlskin FALSE          Invision Power… http://www.in… master       
    #> 4      9 ironmar… ipbfsC… TRUE           <NA>            <NA>           ironmarch345 
    #> # … with 8 more variables: set_css_groups <chr>, set_added <int>,
    #> #   set_output_format <chr>, set_locked_uagent <chr>, set_hide_from_list <lgl>,
    #> #   set_minify <lgl>, set_master_key <chr>, set_order <int>
    #> 
    #> $orig_skin_css
    #> # A tibble: 50 x 11
    #>    css_id css_set_id css_updated css_group css_content css_position css_app css_app_hide
    #>     <int>      <int>       <int> <chr>     <chr>              <int> <chr>   <lgl>       
    #>  1    195          0  1414352049 ipb_ucp   "/********…            1 core    TRUE        
    #>  2    186          0  1414352049 ipb_cked… "/********…            1 core    TRUE        
    #>  3    187          0  1414352049 ipb_comm… "/********…            1 core    FALSE       
    #>  4    188          0  1414352049 ipb_edit… "/********…            1 core    TRUE        
    #>  5    189          0  1414352049 ipb_help  "/********…            0 core    FALSE       
    #>  6    190          0  1414352049 ipb_ie    "/********…            0 core    FALSE       
    #>  7    191          0  1414352049 ipb_logi… "/********…            1 core    TRUE        
    #>  8    192          0  1414352049 ipb_print "* {\n\tfo…            1 core    FALSE       
    #>  9    193          0  1414352049 ipb_sear… "/********…            2 core    TRUE        
    #> 10    194          0  1414352049 ipb_styl… "/********…            1 core    FALSE       
    #> # … with 40 more rows, and 3 more variables: css_attributes <chr>, css_modules <chr>,
    #> #   css_master_key <chr>
    #> 
    #> $orig_skin_css_previous
    #> # A tibble: 35 x 7
    #>    p_css_id p_css_group p_css_content p_css_app p_css_attributes p_css_modules
    #>       <int> <chr>       <chr>         <chr>     <chr>            <chr>        
    #>  1        1 ipb_ucp     "/**********… core      "title=\"Main\"… usercp       
    #>  2        2 ipb_ckedit… "/**********… core      "title=\"Main\"… <NA>         
    #>  3        3 ipb_common  "/**********… core      "title=\"Main\"… <NA>         
    #>  4        4 ipb_editor  "/**********… core      "title=\"Main\"… <NA>         
    #>  5        5 ipb_help    "/**********… core      "title=\"Main\"… help         
    #>  6        6 ipb_ie      "/**********… core       <NA>            <NA>         
    #>  7        7 ipb_login_… "/**********… core      "title=\"Main\"… global       
    #>  8        8 ipb_print   "* {\n\tfont… core      "media=\"print\… <NA>         
    #>  9        9 ipb_search  "/**********… core      "title=\"Main\"… search       
    #> 10       10 ipb_styles  "/**********… core      "title=\"Main\"… <NA>         
    #> # … with 25 more rows, and 1 more variable: p_css_master_key <chr>
    #> 
    #> $orig_skin_replacements
    #> # A tibble: 201 x 6
    #>    replacement_id replacement_key replacement_con… replacement_set… replacement_add…
    #>             <int> <chr>           <chr>                       <int>            <int>
    #>  1              1 add_folder      <img src='{styl…                0                0
    #>  2              2 add_friend      <img src='{styl…                0                0
    #>  3              3 add_poll_choice <img src='{styl…                0                0
    #>  4              4 add_poll_quest… <img src='{styl…                0                0
    #>  5              5 blog_add_entry  <img src='{styl…                0                0
    #>  6              6 blog_banish     <img src='{styl…                0                0
    #>  7              7 blog_blocks     <img src='{styl…                0                0
    #>  8              8 blog_blog       <img src='{styl…                0                0
    #>  9              9 blog_category   <img src='{styl…                0                0
    #> 10             10 blog_comments   <img src='{styl…                0                0
    #> # … with 191 more rows, and 1 more variable: replacement_master_key <chr>
    #> 
    #> $orig_skin_templates
    #> # A tibble: 1,002 x 12
    #>    template_id template_set_id template_group template_content template_name template_data
    #>          <int>           <int> <chr>          <chr>            <chr>         <chr>        
    #>  1        3389               0 skin_stats     "<h1 class='ips… top_posters   "$rows"      
    #>  2        3388               0 skin_stats     "<if test=\"has… group_strip   "$group=\"\"…
    #>  3        3385               0 skin_search    "<div class='re… searchRowGen… "$r, $result…
    #>  4        3386               0 skin_search    "<if test=\"whi… topicPostSea… "$data, $res…
    #>  5        3387               0 skin_search    "<php>\n\t$date… userPostsView "$results, $…
    #>  6        3384               0 skin_search    "<input type='h… searchResult… "$results, $…
    #>  7        3382               0 skin_search    "{parse stripin… searchResults "$results, $…
    #>  8        3383               0 skin_search    "{parse js_modu… searchResult… "$results, $…
    #>  9        3381               0 skin_search    "<style type='t… searchAdvanc… "$filters=''…
    #> 10        3377               0 skin_search    "<php>\n$st = I… helpSearchRe… "$r, $result…
    #> # … with 992 more rows, and 6 more variables: template_updated <int>,
    #> #   template_removable <lgl>, template_added_to <int>, template_user_added <lgl>,
    #> #   template_user_edited <lgl>, template_master_key <chr>
    #> 
    #> $orig_skin_templates_previous
    #> # A tibble: 786 x 6
    #>    p_template_id p_template_group p_template_cont… p_template_name p_template_data
    #>            <int> <chr>            <chr>            <chr>           <chr>          
    #>  1             1 skin_stats       "<h1 class='ips… top_posters     "$rows"        
    #>  2             2 skin_stats       "<if test=\"has… group_strip     "$group=\"\", …
    #>  3             3 skin_search      "<div class='re… searchRowGener… "$r, $resultAs…
    #>  4             4 skin_search      "<if test=\"whi… topicPostSearc… "$data, $resul…
    #>  5             5 skin_search      "<php>\n\t$date… userPostsView   "$results, $pa…
    #>  6             6 skin_search      "<input type='h… searchResultsW… "$results, $so…
    #>  7             7 skin_search      "{parse stripin… searchResults   "$results, $ti…
    #>  8             8 skin_search      "{parse js_modu… searchResultsA… "$results, $ti…
    #>  9             9 skin_search      "<style type='t… searchAdvanced… "$filters='', …
    #> 10            10 skin_search      "<span class='i… memberSearchRe… "$r, $resultAs…
    #> # … with 776 more rows, and 1 more variable: p_template_master_key <chr>
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
    #>    log_id log_title            log_date            log_ip     log_desc                    
    #>     <int> <chr>                <dttm>              <chr>      <chr>                       
    #>  1 551033 Archiver             2016-01-28 09:18:11 82.145.20… 0 items archived            
    #>  2 551034 Daily Topic &amp; F… 2016-01-28 09:22:36 72.169.96… Daily Topic & Forum Digest …
    #>  3 551032 RSS Import Update    2016-01-28 09:09:13 174.4.165… RSS Import completed (0)    
    #>  4 551031 Archiver             2016-01-28 09:03:25 69.143.99… 0 items archived            
    #>  5 551030 Daily Topic &amp; F… 2016-01-28 09:02:25 101.173.1… Daily Topic & Forum Digest …
    #>  6 551029 Clean Up MySQL       2016-01-28 09:02:16 104.238.1… Cleaned up sleeping mysql p…
    #>  7 551028 Hourly Clean Out     2016-01-28 08:54:08 46.177.17… Old reg_images, sessions an…
    #>  8 551027 Archiver             2016-01-28 08:48:05 212.93.21… 0 items archived            
    #>  9 551026 Daily Topic &amp; F… 2016-01-28 08:42:06 195.156.2… Daily Topic & Forum Digest …
    #> 10 551025 RSS Import Update    2016-01-28 08:38:16 46.177.17… RSS Import completed (0)    
    #> # … with 18,230 more rows
    #> 
    #> $orig_task_manager
    #> # A tibble: 28 x 15
    #>    task_id task_title task_file task_next_run task_week_day task_month_day task_hour
    #>      <int> <chr>      <chr>             <int>         <int>          <int>     <int>
    #>  1       1 Hourly Cl… cleanout…    1458844680            -1             -1        -1
    #>  2       2 Content C… contentc…    1458874800            -1             -1         3
    #>  3       3 Item Mark… itemmark…    1458864000            -1             -1         0
    #>  4       4 Prune Logs logprune…    1459058400            -1             27         6
    #>  5       5 Clean Up … mysqlcle…    1458845400            -1             -1        -1
    #>  6      24 Archiver   archive.…    1458844560            -1             -1        -1
    #>  7       7 Optimize … optimize…    1458878400            -1             -1         4
    #>  8       8 POP3 Inco… pop3emai…    1315842488            -1             -1        -1
    #>  9       9 Daily Sta… rebuilds…    1458864000            -1             -1         0
    #> 10      10 Send Bulk… bulkmail…    1374129660            -1             -1        -1
    #> # … with 18 more rows, and 8 more variables: task_minute <int>, task_cronkey <chr>,
    #> #   task_log <lgl>, task_description <chr>, task_enabled <lgl>, task_key <chr>,
    #> #   task_safemode <lgl>, task_application <chr>
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
    #>      tid title state posts starter_id start_date          last_poster_id
    #>    <int> <chr> <chr> <int>      <int> <dttm>                       <int>
    #>  1  5182 "Hei… clos…     8       9491 2015-05-20 07:29:54           7504
    #>  2     3 "The… clos…    50          1 2011-09-13 01:06:06             16
    #>  3  3674 "â€œ… open     11       7346 2014-03-01 23:36:53             49
    #>  4     7 "Sup… clos…     0          1 2011-09-13 09:47:48              1
    #>  5     8 "Wha… clos…     0          1 2011-09-13 09:52:23              1
    #>  6     9 "Wha… clos…     0          1 2011-09-13 09:55:16              1
    #>  7  5167 "The… open     13       6321 2015-05-16 18:16:41           6269
    #>  8  5168 "Chi… open     19       7508 2015-05-16 22:42:30           7508
    #>  9    11 "Rag… open    752          1 2011-09-13 10:23:27           9571
    #> 10  4306 "Vol… open      2          1 2014-09-22 19:22:56              1
    #> # … with 5,063 more rows, and 20 more variables: last_post <dttm>, icon_id <lgl>,
    #> #   starter_name <chr>, last_poster_name <chr>, poll_state <chr>, last_vote <int>,
    #> #   views <int>, forum_id <int>, approved <int>, author_mode <lgl>, pinned <lgl>,
    #> #   topic_hasattach <int>, topic_firstpost <int>, topic_rating_total <int>,
    #> #   topic_rating_hits <int>, title_seo <chr>, seo_last_name <chr>, seo_first_name <chr>,
    #> #   tdelete_time <int>, last_real_post <dttm>
    #> 
    #> $orig_upgrade_history
    #> # A tibble: 68 x 6
    #>    upgrade_id upgrade_version… upgrade_version… upgrade_date        upgrade_mid
    #>         <int>            <int> <chr>            <dttm>              <lgl>      
    #>  1          1            32005 3.2.2            NA                  FALSE      
    #>  2          2            32005 3.2.2            NA                  FALSE      
    #>  3          3            32005 3.2.2            NA                  FALSE      
    #>  4          4            32006 3.2.3            2013-07-20 14:15:55 FALSE      
    #>  5          5            33000 3.3.0 Alpha 1    2013-07-20 14:16:45 FALSE      
    #>  6          6            33006 3.3.0 Alpha 2    2013-07-20 14:16:47 FALSE      
    #>  7          7            33007 3.3.0 Beta 1     2013-07-20 14:16:50 FALSE      
    #>  8          8            33008 3.3.0 Beta 2     2013-07-20 14:16:53 FALSE      
    #>  9          9            33009 3.3.0 Beta 3     2013-07-20 14:16:57 FALSE      
    #> 10         10            33010 3.3.0 Beta 4     2013-07-20 14:17:02 FALSE      
    #> # … with 58 more rows, and 1 more variable: upgrade_app <chr>
    #> 
    #> $orig_validating
    #> # A tibble: 19 x 9
    #>    vid   member_id real_group temp_group entry_date          lost_pass new_reg ip_address
    #>    <chr>     <int>      <int>      <int> <dttm>              <lgl>     <lgl>   <chr>     
    #>  1 2132…      9571         13         13 2016-02-08 02:38:29 TRUE      FALSE   108.219.1…
    #>  2 28f2…      9955          3          1 2016-03-16 20:13:58 FALSE     TRUE    91.159.11…
    #>  3 77b9…      6208         13         13 2016-01-26 04:01:15 TRUE      FALSE   68.6.168.…
    #>  4 6cf7…      9800         13         13 2016-03-21 15:56:10 TRUE      FALSE   93.138.98…
    #>  5 f601…      9780         13         13 2016-03-23 21:14:46 TRUE      FALSE   73.52.78.…
    #>  6 3a07…      9211         13         13 2016-02-04 14:11:54 TRUE      FALSE   176.23.4.…
    #>  7 f013…      9112         13         13 2016-03-18 20:58:14 TRUE      FALSE   66.211.24…
    #>  8 bd80…      9916          3          3 2016-03-02 03:06:15 TRUE      FALSE   24.150.20…
    #>  9 fa74…      9303         13         13 2016-03-04 21:59:12 TRUE      FALSE   154.20.14…
    #> 10 e4db…      9666         13         13 2016-03-05 15:09:55 TRUE      FALSE   71.38.121…
    #> 11 63be…      9954          3          1 2016-03-15 22:04:25 FALSE     TRUE    107.15.20…
    #> 12 b6d3…      9952          3          1 2016-03-15 00:00:14 FALSE     TRUE    209.240.6…
    #> 13 ea85…      9953          3          1 2016-03-15 02:31:59 FALSE     TRUE    184.57.9.…
    #> 14 87ab…      9956          3          1 2016-03-17 18:36:53 FALSE     TRUE    104.176.7…
    #> 15 0530…      9957          3          1 2016-03-18 18:48:49 FALSE     TRUE    178.162.2…
    #> 16 85ca…      9958          3          1 2016-03-19 00:45:15 FALSE     TRUE    69.120.9.…
    #> 17 60c7…      9959          3          1 2016-03-19 08:48:44 FALSE     TRUE    96.41.6.72
    #> 18 cc41…      9959          0          1 2016-03-19 08:54:03 TRUE      FALSE   96.41.6.72
    #> 19 bbd0…      9960          3          1 2016-03-19 19:11:43 FALSE     TRUE    24.61.214…
    #> # … with 1 more variable: user_verified <lgl>
    #> 
    #> $orig_voters
    #> # A tibble: 789 x 7
    #>      vid ip_address       vote_date   tid member_id forum_id member_choices               
    #>    <int> <chr>                <int> <int>     <int>    <int> <chr>                        
    #>  1     1 77.249.103.246  1323790101   370        13       88 "a:1:{i:1;a:1:{i:0;s:1:\"2\"…
    #>  2     2 86.21.53.46     1323790499   370         4       88 "a:1:{i:1;a:1:{i:0;s:1:\"1\"…
    #>  3     3 108.13.155.97   1323791995   370        29       88 "a:1:{i:1;a:1:{i:0;s:1:\"1\"…
    #>  4     4 86.7.229.239    1323800768   370         6       88 "a:1:{i:1;a:1:{i:0;s:1:\"1\"…
    #>  5     5 31.220.211.18   1323801140   370         7       88 "a:1:{i:1;a:1:{i:0;s:1:\"1\"…
    #>  6     6 152.33.21.65    1323805321   370        16       88 "a:1:{i:1;a:1:{i:0;s:1:\"1\"…
    #>  7     7 192.101.250.250 1323822724   370        68       88 "a:1:{i:1;a:1:{i:0;s:1:\"1\"…
    #>  8     8 71.185.163.249  1323843605   370        49       88 "a:1:{i:1;a:1:{i:0;s:1:\"1\"…
    #>  9     9 131.181.251.22  1323871708   370        65       88 "a:1:{i:1;a:1:{i:0;s:1:\"2\"…
    #> 10    27 201.236.119.199 1324958167   370        44       88 "a:1:{i:1;a:1:{i:0;s:1:\"1\"…
    #> # … with 779 more rows
    #> 
    #> $orig_warn_logs
    #> # A tibble: 64 x 8
    #>    wlog_id wlog_mid wlog_notes wlog_contact wlog_contact_co… wlog_date wlog_type
    #>      <int>    <int> <chr>      <chr>        <chr>                <int> <chr>    
    #>  1       1       33 "a:15:{s:… none         <NA>                1.32e9 neg      
    #>  2       2       40 "a:15:{s:… none         <NA>                1.32e9 neg      
    #>  3       3       40 "a:15:{s:… none         <NA>                1.32e9 custom   
    #>  4       4       40 "a:15:{s:… none         <NA>                1.32e9 custom   
    #>  5       5       89 "a:15:{s:… none         <NA>                1.32e9 neg      
    #>  6       6       49 "a:15:{s:… none         <NA>                1.32e9 neg      
    #>  7       7       40 "a:15:{s:… none         <NA>                1.32e9 nochan   
    #>  8       8       40 "a:15:{s:… none         <NA>                1.32e9 custom   
    #>  9      14       40 "a:15:{s:… none         <NA>                1.33e9 custom   
    #> 10      11       40 "a:15:{s:… none         <NA>                1.33e9 nochan   
    #> # … with 54 more rows, and 1 more variable: wlog_addedby <int>

### `forums_*`

``` r
im_forums_dfs
```

    #> $forums_forums
    #> # A tibble: 144 x 39
    #>       id topics posts last_post           last_poster_id last_poster_name position use_ibc
    #>    <int>  <int> <int> <dttm>                       <int> <chr>               <int> <lgl>  
    #>  1     1      0     0 NA                               0 <NA>                    1 FALSE  
    #>  2    92     36   676 2017-10-26 21:13:19           9549 Riftbolt                2 TRUE   
    #>  3     2     18   475 2017-10-06 06:39:51              1 Александр Славр…        1 TRUE   
    #>  4    10      0     0 NA                               0 <NA>                   10 TRUE   
    #>  5     5     39  1680 2017-11-20 21:48:41           9288 Змајевит                2 TRUE   
    #>  6     7      0     0 NA                               0 <NA>                    7 FALSE  
    #>  7    97     72  1409 2017-08-17 00:45:31          14542 Hank Hill               3 TRUE   
    #>  8    90     31   762 2017-10-27 01:03:10          13771 BloodEagle              9 TRUE   
    #>  9    12    150  5596 2017-11-10 03:40:21          12999 Stribog                 3 TRUE   
    #> 10    11   1740 33616 2017-11-21 02:58:31           9668 MOONLORD                2 TRUE   
    #> # … with 134 more rows, and 31 more variables: use_html <lgl>, last_title <chr>,
    #> #   last_id <int>, sort_order <chr>, prune <int>, topicfilter <chr>, show_rules <lgl>,
    #> #   allow_poll <lgl>, allow_pollbump <lgl>, inc_postcount <lgl>, skin_id <lgl>,
    #> #   parent_id <int>, notify_modq_emails <chr>, sub_can_post <lgl>,
    #> #   permission_showtopic <lgl>, forum_allow_rating <lgl>, forum_last_deletion <int>,
    #> #   newest_title <chr>, newest_id <int>, can_view_others <lgl>, name_seo <chr>,
    #> #   seo_last_title <chr>, seo_last_name <chr>, last_x_topic_ids <chr>,
    #> #   forums_bitoptions <int>, disable_sharelinks <lgl>, deleted_topics <lgl>,
    #> #   viglink <lgl>, qa_rate_questions <chr>, qa_rate_answers <chr>, icon <chr>
    #> 
    #> $forums_posts
    #> # A tibble: 195,128 x 15
    #>       pid append_edit edit_time           author_id author_name ip_address
    #>     <int> <lgl>       <dttm>                  <int> <chr>       <chr>     
    #>  1    202 FALSE       NA                          7 MoonmanKKK  81.141.31…
    #>  2    203 FALSE       NA                         16 Talleyrand  152.33.58…
    #>  3    532 FALSE       2011-09-19 23:14:09         5 Will to Po… 90.219.24…
    #>  4 114067 FALSE       NA                       7508 RIGHT WING… 80.212.44…
    #>  5 114068 FALSE       2015-05-16 18:07:42         0 Nihonjin M… 73.222.21…
    #>  6 114069 FALSE       2015-05-16 19:12:42      7481 ¡VIVA LA R… 86.181.21…
    #>  7 114070 FALSE       NA                       9144 Neizbezhno… 121.215.1…
    #>  8 114071 FALSE       NA                       6321 Culius Jae… 65.28.106…
    #>  9      4 FALSE       NA                          1 Alexander … 178.140.1…
    #> 10     83 FALSE       NA                         16 Talleyrand  152.33.17…
    #> # … with 195,118 more rows, and 9 more variables: post_date <dttm>, post <chr>,
    #> #   queued <int>, topic_id <int>, new_topic <lgl>, edit_name <chr>, post_key <chr>,
    #> #   post_edit_reason <chr>, pdelete_time <dttm>
    #> 
    #> $forums_topics
    #> # A tibble: 7,168 x 25
    #>      tid title state posts starter_id start_date          last_poster_id
    #>    <int> <chr> <chr> <int>      <int> <dttm>                       <int>
    #>  1  5182 Heil… clos…     9          0 2015-05-20 07:29:54           7504
    #>  2     3 The … clos…    51          1 2011-09-13 01:06:06             16
    #>  3  3674 “Non… open     12       7346 2014-03-01 23:36:53             49
    #>  4     7 Supp… clos…     1          1 2011-09-13 09:47:48              1
    #>  5     8 What… clos…     1          1 2011-09-13 09:52:23              1
    #>  6     9 What… clos…     1          1 2011-09-13 09:55:16              1
    #>  7  5167 The … open     14       6321 2015-05-16 18:16:41           6269
    #>  8  5168 Chin… open     20       7508 2015-05-16 22:42:30           7508
    #>  9    11 Rage… open    833          1 2011-09-13 10:23:27          14238
    #> 10  4306 Volg… open      3          1 2014-09-22 19:22:56              1
    #> # … with 7,158 more rows, and 18 more variables: last_post <dttm>, icon_id <lgl>,
    #> #   starter_name <chr>, last_poster_name <chr>, poll_state <chr>, last_vote <int>,
    #> #   views <int>, forum_id <int>, approved <int>, author_mode <lgl>, pinned <lgl>,
    #> #   topic_firstpost <int>, topic_rating_total <int>, topic_rating_hits <int>,
    #> #   title_seo <chr>, last_real_post <dttm>, popular_time <int>, topic_hiddenposts <int>

### Other

``` r
im_other_dfs
```

    #> $bbcode_mediatag
    #> # A tibble: 9 x 4
    #>   mediatag_id mediatag_name  mediatag_match               mediatag_replace                
    #>         <int> <chr>          <chr>                        <chr>                           
    #> 1           1 YouTube        "http(?:s)?://(www.)?youtub… "<iframe id=\"ytplayer\" class=…
    #> 2           9 GameTrailers   "http://www.gametrailers.co… "<embed src=\"http://media.mtvn…
    #> 3           2 Flash Movie/G… "{1}.swf"                    "<embed src=\"$1.swf\" play=\"t…
    #> 4           3 Google Video   "http://video.google.com/vi… "<embed style=\"width:400px; he…
    #> 5           4 MySpace Video  "http://www.myspace.com/vid… "<object width=\"425px\" height…
    #> 6          10 YouTu.be       "http://(www.)?youtu.be/([\… "<iframe id=\"ytplayer\" class=…
    #> 7           6 Flickr Image … "http://www.flickr.com/phot… "<iframe align=\"center\" src=\…
    #> 8           7 MP3            "{1}.mp3"                    "<object type=\"application/x-s…
    #> 9           8 Vimeo          "http{1}://vimeo.com/{2}"    "<iframe src=\"http$1://player.…
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
    #>    comment_id comment_eid comment_mid comment_date        comment_text comment_append_…
    #>         <int>       <int>       <int> <dttm>              <chr>        <lgl>           
    #>  1          1         150        7636 2016-03-30 12:25:46 "<p>\n\tArr… FALSE           
    #>  2          2         150        7508 2016-04-01 19:17:45 "<p>\n\tIt'… FALSE           
    #>  3          3         150           0 2016-04-01 21:15:34 "<p>\n\tHav… FALSE           
    #>  4          4         154        7636 2016-04-17 13:36:49 "<p>\n\tRes… FALSE           
    #>  5          5         147        9876 2016-04-20 05:24:10 "\n<p>\n\tI… FALSE           
    #>  6          6         147        9621 2016-04-20 06:37:56 "\n<p>\n\t<… FALSE           
    #>  7          7         147        4873 2016-04-20 07:02:33 "\n<p>\n\tH… FALSE           
    #>  8          8         147        9679 2016-04-20 07:09:12 "<p>\n\twha… FALSE           
    #>  9          9         147        9510 2016-04-20 14:22:09 "\n<blockqu… FALSE           
    #> 10         10         147        9519 2016-04-20 17:10:30 "<p>\n\tRIP… FALSE           
    #> # … with 160 more rows, and 4 more variables: comment_edit_time <int>,
    #> #   comment_edit_name <chr>, comment_ip_address <chr>, comment_author <chr>
    #> 
    #> $calendar_events
    #> # A tibble: 277 x 28
    #>    event_id event_calendar_… event_member_id event_content event_title event_comments
    #>       <int>            <int>           <int> <chr>         <chr>                <int>
    #>  1        1                7               1 "\n<p>\n\t<a… Joseph Goe…              1
    #>  2        2                1               1 "\n<p>\n\t<a… Niccolò Ma…              0
    #>  3        3                7               1 "\n<p>\n\t<a… Oswald Spe…              0
    #>  4        4                7               1 "\n<p>\n\t<a… Oswald Spe…              1
    #>  5        5                1               1 "\n<p>\n\t<a… Julius Evo…              0
    #>  6        6                1               1 "\n<p>\n\tNi… Niccolò Ma…              0
    #>  7        7                9               1 "\n<p>\n\t<a… Summer Sol…              0
    #>  8        8                7               1 "\n<p>\n\t<a… Martin Bor…              0
    #>  9        9                9               1 "\n<p>\n\t<a… Fidél Pálf…              0
    #> 10       10                7               1 "\n<p>\n\t<a… Baldur von…              0
    #> # … with 267 more rows, and 22 more variables: event_approved <lgl>, event_saved <dttm>,
    #> #   event_lastupdated <dttm>, event_recurring <chr>, event_start_date <dttm>,
    #> #   event_end_date <dttm>, event_title_seo <chr>, event_rating <int>,
    #> #   event_post_key <chr>, event_sequence <lgl>, event_all_day <lgl>,
    #> #   event_ip_address <chr>, event_last_comment <dttm>, event_last_review <dttm>,
    #> #   event_approved_by <dbl>, event_approved_on <dttm>, event_location <chr>,
    #> #   event_rsvp_limit <int>, event_cover_photo <chr>, event_cover_offset <int>,
    #> #   event_unapproved_reviews <lgl>, event_hidden_reviews <lgl>
    #> 
    #> $custom_bbcode
    #> # A tibble: 34 x 16
    #>    bbcode_id bbcode_title bbcode_desc bbcode_tag bbcode_replace bbcode_useoption
    #>        <int> <chr>        <chr>       <chr>      <chr>          <lgl>           
    #>  1         1 Post Snap B… This tag d… snapback    <NA>          FALSE           
    #>  2         2 Right        Aligns con… right      "<p class='bb… FALSE           
    #>  3         3 Left         Aligns con… left       "<p class='bb… FALSE           
    #>  4         4 Center       Aligns con… center     "<p class='bb… FALSE           
    #>  5         5 Topic Link   This tag p… topic      "<a href='{ba… TRUE            
    #>  6         6 Post Link    This tag p… post       "<a href='{ba… TRUE            
    #>  7         7 Spoiler      Spoiler tag spoiler    "<div class='… FALSE           
    #>  8         8 Acronym      Allows you… acronym    "<acronym tit… TRUE            
    #>  9         9 Bold Text    Makes text… b          "<strong clas… FALSE           
    #> 10        10 Italic Text  Makes the … i          "<em class='b… FALSE           
    #> # … with 24 more rows, and 10 more variables: bbcode_example <chr>,
    #> #   bbcode_menu_option_text <chr>, bbcode_menu_content_text <chr>,
    #> #   bbcode_single_tag <lgl>, bbcode_php_plugin <chr>, bbcode_no_parsing <lgl>,
    #> #   bbcode_protected <lgl>, bbcode_aliases <chr>, bbcode_optional_option <lgl>,
    #> #   bbcode_image <chr>
    #> 
    #> $rc_reports_index
    #> # A tibble: 23 x 14
    #>       id uid   title url   rc_class updated_by date_updated date_created exdat1 exdat2
    #>    <int> <chr> <chr> <chr>    <int>      <int>        <int>        <int>  <int>  <int>
    #>  1     1 0b3a… Why … /ind…        2          9   1324720676   1324684384     57    422
    #>  2    10 d94e… Worl… /ind…        2          4   1356645256   1356640292     22   1827
    #>  3    14 4007… Oper… /ind…        2          1   1361248006   1361245960      4   1751
    #>  4    58 264d… IRA … /ind…        2          1   1374646833   1374646450      9   2688
    #>  5    66 cd32… Jews… /ind…        2          4   1377095062   1377089209      8   2842
    #>  6    69 933f… Belg… /ind…        2         16   1380356859   1380356286      8   3021
    #>  7    70 3a36… Belg… /ind…        2         16   1380356859   1380356292      8   3020
    #>  8    74 9ca0… Gabo… /ind…        2          4   1388663494   1388660127      9   3182
    #>  9    89 7b4b… Libe… /ind…        2       2170   1431658980   1431533699     30   3751
    #> 10    90 f557… Iron… /ind…        2       2170   1432309218   1432177523      2   5130
    #> # … with 13 more rows, and 4 more variables: exdat3 <int>, num_comments <int>,
    #> #   seoname <chr>, seotemplate <chr>
    #> 
    #> $x_utf_convert_session_tables
    #> # A tibble: 152 x 2
    #>    table_name          table_schema                                                       
    #>    <chr>               <chr>                                                              
    #>  1 admin_login_logs    "{\"name\":\"admin_login_logs\",\"definition\":{\"name\":\"admin_l…
    #>  2 admin_logs          "{\"name\":\"admin_logs\",\"definition\":{\"name\":\"admin_logs\",…
    #>  3 admin_permission_r… "{\"name\":\"admin_permission_rows\",\"definition\":{\"name\":\"ad…
    #>  4 announcements       "{\"name\":\"announcements\",\"definition\":{\"name\":\"announceme…
    #>  5 api_log             "{\"name\":\"api_log\",\"definition\":{\"name\":\"api_log\",\"colu…
    #>  6 api_users           "{\"name\":\"api_users\",\"definition\":{\"name\":\"api_users\",\"…
    #>  7 attachments         "{\"name\":\"attachments\",\"definition\":{\"name\":\"attachments\…
    #>  8 attachments_type    "{\"name\":\"attachments_type\",\"definition\":{\"name\":\"attachm…
    #>  9 backup_log          "{\"name\":\"backup_log\",\"definition\":{\"name\":\"backup_log\",…
    #> 10 backup_queue        "{\"name\":\"backup_queue\",\"definition\":{\"name\":\"backup_queu…
    #> # … with 142 more rows
