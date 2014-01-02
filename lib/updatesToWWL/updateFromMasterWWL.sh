# copy from TrueCrypt encrypted master to Dhara AV3 portable HD
#    useful options to correct mistakes
#    --dry-run
#    --delete --delete-after --delete-excluded --exclude=.DS_Store
#
rsync -avz /Volumes/NO\ NAME/* /Volumes/DharaWWL/

# copy to AV1 NAS
#   --destination folder must already exist
#   -- creating folder with QNAP web interface.  QFinder -> Admin -> Access Rights > Share Folders
#   -- we are using
#	HDA_DATA/VideoLibrary  (holds DharaWWL/MP4_Files/*)
#	HDA_DATA/AudioLibrary  (holds DharaWWL/WWL_HDD_2013/*)
#       HDA_DATA/AudioLibrary/Exceptions (holds DharaWWL/WWL_Exceptions/*)
rsync -avz /Volumes/DharaWWL/MP4_Files/* admin@192.168.1.191:/share/HDA_DATA/VideoLibrary
rsync -avz /Volumes/DharaWWL/WWL_HDD_2013/* admin@192.168.1.191:/share/HDA_DATA/AudioLibrary
# add in alternate tracks to AudioLibrary (creates subfolder AudioLibrary/WWL_Exceptions)
rsync -avz /Volumes/DharaWWL/WWL_Exceptions admin@192.168.1.191:/share/HDA_DATA/AudioLibrary
# add in Sonos Exceptions to AudioLibrary (creates subfolder 'AudioLibrary/Sonos Customizations')
#      (source copied from )
#      rsync -avz --copy-links 'admin@192.168.1.2:/share/HDA_DATA/BarryLibrary/Sonos\ Customizations' /Volumes/DharaWWL
rsync -avz '/Volumes/DharaWWL/Sonos\ Customizations' admin@192.168.1.191:/share/HDA_DATA/AudioLibrary

/share/HDA_DATA] # ls -l BarryLibrary/Sonos\ Customizations/

# ls -l1 /share  # Shared folder names (which are just links)
lrwxrwxrwx    1        17 Dec 14 20:49 10Day_EN -> HDA_DATA/10Day_EN/
lrwxrwxrwx    1        16 Dec 14 20:49 1Day_EN -> HDA_DATA/1Day_EN/
lrwxrwxrwx    1        17 Dec 14 20:49 20Day_EN -> HDA_DATA/20Day_EN/
lrwxrwxrwx    1        17 Dec 14 20:49 30-45Day -> HDA_DATA/30-45Day/
lrwxrwxrwx    1        13 Dec 14 20:49 3Day -> HDA_DATA/3Day/
lrwxrwxrwx    1        16 Dec 14 20:49 9Day_EN -> HDA_DATA/9Day_EN/
lrwxrwxrwx    1        21 Dec 14 20:49 BarryLibrary -> HDA_DATA/BarryLibrary/
lrwxrwxrwx    1        23 Dec 14 20:49 Burmese_EN_10D -> HDA_DATA/Burmese_EN_10D/
lrwxrwxrwx    1        17 Dec 14 20:49 Download -> HDA_DATA/Download/
lrwxrwxrwx    1        21 Dec 14 20:49 Khmer_EN_10D -> HDA_DATA/Khmer_EN_10D/
lrwxrwxrwx    1        45 Dec 14 20:49 LongCourseServers -> HDA_DATA/BarryLibrary/long course server mp3s/
lrwxrwxrwx    1        24 Dec 14 20:49 Mandarin_EN_10D -> HDA_DATA/Mandarin_EN_10D/
lrwxrwxrwx    1        19 Dec 14 20:49 Multimedia -> HDA_DATA/Multimedia/
lrwxrwxrwx    1        28 Dec 14 20:49 Network Recycle Bin 1 -> HDA_DATA/Network Recycle Bin/
lrwxrwxrwx    1        15 Dec 14 20:49 Public -> HDA_DATA/Public/
lrwxrwxrwx    1        19 Dec 14 20:49 Recordings -> HDA_DATA/Recordings/
lrwxrwxrwx    1        19 Dec 14 20:49 Sati-khmer -> HDA_DATA/Sati-khmer/
lrwxrwxrwx    1        21 Dec 14 20:49 Satipatthana -> HDA_DATA/Satipatthana/
lrwxrwxrwx    1        24 Dec 14 20:49 Special10Day_EN -> HDA_DATA/Special10Day_EN/
lrwxrwxrwx    1        13 Dec 14 20:49 Teen -> HDA_DATA/Teen/
lrwxrwxrwx    1        12 Dec 14 20:49 Usb -> HDA_DATA/Usb/
lrwxrwxrwx    1        12 Dec 14 20:49 Web -> HDA_DATA/Web/
lrwxrwxrwx    1        19 Dec 14 20:49 WorkPeriod -> HDA_DATA/WorkPeriod/

# ls -1l /share/HDA_DATA/  # actual folders which have data for matching Windows shares
drwxrwxrwx    2      4096 Nov 21 12:59 10Day_EN/
drwxrwxrwx    2      4096 Sep  8 09:07 1Day_EN/
drwxrwxrwx    2      4096 Jul  7 12:34 20Day_EN/
drwxrwxrwx    2      4096 Feb  9  2013 30-45Day/
drwxrwxrwx    2      4096 Sep 24  2012 3Day/
drwxrwxrwx    2      4096 Jul  7 12:06 9Day_EN/
drwxrwxrwx   25      4096 Jul  7 11:39 BarryLibrary/
drwxrwxrwx    2      4096 Sep 24  2012 BetweenCourses/
drwxrwxrwx    2      4096 Jun 12  2013 Burmese_EN_10D/
drwxrwxrwx    2      4096 Jun 12  2013 Chinese-English-10D/
drwxrwxrwx    2      4096 Jul 28  2012 Download/
drwxrwxrwx    2      4096 Aug 14 11:40 Khmer_EN_10D/
drwxrwxrwx    2      4096 Jan 31  2013 LongCourseServers/
drwxrwxrwx    2      4096 Jun 12  2013 Mandarin_EN_10D/
drwxrwxrwx   13      4096 Sep  9  2012 Multimedia/
drwxrwxrwx    2      4096 Jul 28  2012 Network Recycle Bin/
drwxrwxrwx    2      4096 Sep  9  2012 Public/
drwxrwxrwx    5      4096 Sep 24  2012 Recordings/
drwxrwxrwx    2      4096 Oct  9 17:34 Sati-khmer/
drwxrwxrwx    2      4096 Sep 24  2012 Satipatthana/
drwxrwxrwx    2      4096 Aug 27 17:49 Special10Day_EN/
drwxrwxrwx    2      4096 Sep 21  2012 Teen/
drwxrwxrwx    2      4096 Jul 20 13:09 Test2/
drwxrwxrwx    2      4096 Jul 28  2012 Usb/
drwxrwxrwx    2      4096 Aug 27  2012 Web/
drwxrwxrwx    2      4096 Sep 24  2012 WorkPeriod/
-rw-------    1      6144 Sep 12  2012 aquota.user
drwx------    2     16384 Jul 28  2012 lost+found/

[/share/HDA_DATA] # ls -l BarryLibrary/Sonos\ Customizations/
drwxrwxrwx    2 admin    administ     4096 Jan  9  2013 10 Day Morning Chantings/
drwxr-xr-x    2 admin    administ     4096 Nov 21 13:05 10D_Hindi_PDI/
drwxr-xr-x   14 admin    administ     4096 Jul  7 12:04 9Day_English/
drwxrwxrwx    2 admin    administ     4096 Jan 23  2013 VMC gong/
drwxrwxrwx    2 admin    administ     4096 Jan  9  2013 Workers Metta/

[/share/HDA_DATA] # ls -l BarryLibrary/Sonos\ Customizations/10\ Day\ Morning\ Chantings/
-rw-rw-rw-    1 admin    administ 32396407 Jan 11  2013 D01_0556_Atanatiya_Sutta(short)_10d.mp3
-rw-rw-rw-    1 admin    administ 28707895 Jan 11  2013 D02_0559_Ratana_Sutta_10d.mp3
-rw-rw-rw-    1 admin    administ 29363255 Jan 11  2013 D03_0558_Karaniyametta_Sutta_10d.mp3
-rw-rw-rw-    1 admin    administ 31497772 Jan 11  2013 D04_0557_Jayamangala_Atthagatha_10d.mp3
-rw-rw-rw-    1 admin    administ 38929087 Jan 11  2013 D05_0549_Tikapatthana(short)_10d.mp3
-rw-rw-rw-    1 admin    administ 31333096 Jan 11  2013 D06_0557_Paticcasamuppada_10d.mp3
-rw-rw-rw-    1 admin    administ 31830886 Jan 11  2013 D07_0556_Bojjhanga_Paritta_10d.mp3
-rw-rw-rw-    1 admin    administ 31558376 Jan 11  2013 D08_0557_Mittanisamsa_10d.mp3
-rw-rw-rw-    1 admin    administ 29247898 Jan 11  2013 D09_0559_Mangala_Sutta_10d.mp3
-rw-rw-rw-    1 admin    administ 34174383 Jan 11  2013 D10_0554_Mettabhavana_10d.mp3
-rw-rw-rw-    1 admin    administ 17314162 Jan 11  2013 D11_0450_Morning_Chanting_10d.mp3

[/share/HDA_DATA] # ls -l 10Day_EN/
lrwxrwxrwx    1 admin    administ       53 Feb 27  2013 10 Day Morning Chantings -> /share/BarryLibrary/hjwFubar/10 Day Morning Chantings/
lrwxrwxrwx    1 admin    administ       53 Feb 27  2013 10D English Instructions -> /share/BarryLibrary/hjwFubar/10D English Instructions/
lrwxrwxrwx    1 admin    administ       63 Nov 21 12:59 10D_Hindi_PDI -> /share/HDA_DATA/BarryLibrary/Sonos Customizations/10D_Hindi_PDI/
lrwxrwxrwx    1 admin    administ      107 Sep 24  2012 Discourse_on_Dhamma_Service_English.mp3 -> /share/BarryLibrary/Dhamma Service/Discourse on Dhamma Service v.85/Discourse_on_Dhamma_Service_English.mp3
-rw-r--r--    1 admin    administ      778 Sep 24  2012 README
lrwxrwxrwx    1 admin    administ       64 Sep 23  2012 Tikapatthana-U_Ba_Khin.mp3 -> /share/BarryLibrary/Special Chantings/Tikapatthana-U_Ba_Khin.mp3
lrwxrwxrwx    1 admin    administ       59 Sep 23  2012 WMetta_English.mp3 -> /share/BarryLibrary/Workers Metta v.2005/WMetta_English.mp3
lrwxrwxrwx    1 admin    administ       40 Nov 21 12:42 Workers Metta v.2005 -> /share/BarryLibrary/Workers Metta v.2005/

[/share/HDA_DATA] # ls -l 1Day_EN/
lrwxrwxrwx    1 admin    administ       62 Sep  8 09:01 1D English-only -> /share/HDA_DATA/BarryLibrary/1 Day Course Sets/1D English-only/
lrwxrwxrwx    1 admin    administ       64 Sep  8 09:02 Tikapatthana-U_Ba_Khin.mp3 -> /share/BarryLibrary/Special Chantings/Tikapatthana-U_Ba_Khin.mp3
lrwxrwxrwx    1 admin    administ       59 Sep  8 08:59 WMetta_English.mp3 -> /share/BarryLibrary/Workers Metta v.2005/WMetta_English.mp3

[/share/HDA_DATA] # ls -l 20Day_EN/
lrwxrwxrwx    1 admin    administ       44 Jul  7 12:34 10 Day Morning Chantings -> /share/BarryLibrary/10 Day Morning Chantings/
lrwxrwxrwx    1 admin    administ       78 Jul  7 12:17 20D English Discourses -> /share/BarryLibrary/20 Day Course Sets/20D English-only/20D English Discourses/
lrwxrwxrwx    1 admin    administ       80 Jul  7 12:16 20D English Instructions -> /share/BarryLibrary/20 Day Course Sets/20D English-only/20D English Instructions/
lrwxrwxrwx    1 admin    administ       50 Jul  7 12:22 GSs English-only -> /share/BarryLibrary/Groupsittings/GSs English-only/
lrwxrwxrwx    1 admin    administ       38 Jul  7 12:34 Special Chantings -> /share/BarryLibrary/Special Chantings//
lrwxrwxrwx    1 admin    administ       59 Jul  7 12:16 WMetta_English.mp3 -> /share/BarryLibrary/Workers Metta v.2005/WMetta_English.mp3
lrwxrwxrwx    1 admin    administ       70 Jul  7 12:21 gong_sonos_alarm.mp3 -> /share/BarryLibrary/Sonos Customizations/VMC gong/gong_sonos_alarm.mp3
_Ba_Khin.mp3
lrwxrwxrwx    1 admin    administ       59 Sep 24  2012 WMetta_English.mp3 -> /share/BarryLibrary/Workers Metta v.2005/WMetta_English.mp3

[/share/HDA_DATA] # ls -l 30-45Day/           
lrwxrwxrwx    1 admin    administ       44 Sep 24  2012 10 Day Morning Chantings -> /share/BarryLibrary/10 Day Morning Chantings/
lrwxrwxrwx    1 admin    administ      107 Sep 24  2012 45D English Discourses [10A] -> /share/BarryLibrary/45 Day Course Sets [w.10Ds Anapana]/45D English-only [10A]/45D English Discourses [10A]/
lrwxrwxrwx    1 admin    administ      109 Sep 24  2012 45D English Instructions [10A] -> /share/BarryLibrary/45 Day Course Sets [w.10Ds Anapana]/45D English-only [10A]/45D English Instructions [10A]/
-rw-rw-rw-    1 admin    administ 32710837 Sep 26  2012 D29_0910_Metta_E-Kh_30d[10A].mp3
lrwxrwxrwx    1 admin    administ      107 Sep 24  2012 Discourse_on_Dhamma_Service_English.mp3 -> /share/BarryLibrary/Dhamma Service/Discourse on Dhamma Service v.85/Discourse_on_Dhamma_Service_English.mp3
lrwxrwxrwx    1 admin    administ       50 Jan  9  2013 GSs English-only -> /share/BarryLibrary/Groupsittings/GSs English-only/
lrwxrwxrwx    1 admin    administ       70 Jan  9  2013 Gong_Medium-2_3x.mp3 -> /share/BarryLibrary/Sonos Customizations/VMC gong/Gong_Medium-2_3x.mp3
-rw-r--r--    1 admin    administ     1919 Sep 24  2012 README
lrwxrwxrwx    1 admin    administ       37 Sep 24  2012 Special Chantings -> /share/BarryLibrary/Special Chantings/
lrwxrwxrwx    1 admin    administ       64 Sep 24  2012 Tikapatthana-U_Ba_Khin.mp3 -> /share/BarryLibrary/Special Chantings/Tikapatthana-U_Ba_Khin.mp3
lrwxrwxrwx    1 admin    administ       61 Feb  2  2013 WMetta_E-Burmese.mp3 -> /share/BarryLibrary/Workers Metta v.2005/WMetta_E-Burmese.mp3
lrwxrwxrwx    1 admin    administ       59 Feb  2  2013 WMetta_E-Czech.mp3 -> /share/BarryLibrary/Workers Metta v.2005/WMetta_E-Czech.mp3
lrwxrwxrwx    1 admin    administ       59 Feb  2  2013 WMetta_E-Khmer.mp3 -> /share/BarryLibrary/Workers Metta v.2005/WMetta_E-Khmer.mp3
-rw-rw-rw-    1 admin    administ  9196941 Jan  9  2013 WMetta_E-Russian.mp3
lrwxrwxrwx    1 admin    administ       59 Sep 24  2012 WMetta_English.mp3 -> /share/BarryLibrary/Workers Metta v.2005/WMetta_English.mp3
lrwxrwxrwx    1 admin    administ       59 Feb  2  2013 WMetta_Hindi-E.mp3 -> /share/BarryLibrary/Workers Metta v.2005/WMetta_Hindi-E.mp3
-rw-rw-rw-    1 admin    administ 19066954 Jan 14  2013 gong_sonos_alarm.mp3

[/share/HDA_DATA] # ls -l 3Day/
lrwxrwxrwx    1 admin    administ       44 Sep 24  2012 10 Day Morning Chantings -> /share/BarryLibrary/10 Day Morning Chantings/
lrwxrwxrwx    1 admin    administ       75 Sep 24  2012 3D English Discourses -> /share/BarryLibrary/3 Day Course Sets/3D English-only/3D English Discourses/
lrwxrwxrwx    1 admin    administ       77 Sep 24  2012 3D English Instructions -> /share/BarryLibrary/3 Day Course Sets/3D English-only/3D English Instructions/
lrwxrwxrwx    1 admin    administ      107 Sep 24  2012 Discourse_on_Dhamma_Service_English.mp3 -> /share/BarryLibrary/Dhamma Service/Discourse on Dhamma Service v.85/Discourse_on_Dhamma_Service_English.mp3
-rw-r--r--    1 admin    administ     1158 Sep 24  2012 README
lrwxrwxrwx    1 admin    administ       64 Sep 24  2012 Tikapatthana-U_Ba_Khin.mp3 -> /share/BarryLibrary/Special Chantings/Tikapatthana-U_Ba_Khin.mp3
lrwxrwxrwx    1 admin    administ       59 Sep 24  2012 WMetta_English.mp3 -> /share/BarryLibrary/Workers Metta v.2005/WMetta_English.mp3

[/share/HDA_DATA] # ls -l 9Day_EN/
lrwxrwxrwx    1 admin    administ       53 Jul  7 12:06 9Day_English -> /share/BarryLibrary/Sonos Customizations/9Day_English/
lrwxrwxrwx    1 admin    administ      107 Jul  7 11:43 Discourse_on_Dhamma_Service_English.mp3 -> /share/BarryLibrary/Dhamma Service/Discourse on Dhamma Service v.85/Discourse_on_Dhamma_Service_English.mp3
lrwxrwxrwx    1 admin    administ       64 Jul  7 11:44 Tikapatthana-U_Ba_Khin.mp3 -> /share/BarryLibrary/Special Chantings/Tikapatthana-U_Ba_Khin.mp3
lrwxrwxrwx    1 admin    administ       59 Jul  7 11:44 WMetta_English.mp3 -> /share/BarryLibrary/Workers Metta v.2005/WMetta_English.mp3


[/share/HDA_DATA] # ls -l Burmese_EN_10D/
lrwxrwxrwx    1 admin    administ       53 Jun 12  2013 10 Day Morning Chantings -> /share/BarryLibrary/hjwFubar/10 Day Morning Chantings/
lrwxrwxrwx    1 admin    administ       73 Jun 12  2013 10D Burmese Discourses -> /share/BarryLibrary/10 Day Course Sets/10D Burmese/10D Burmese Discourses/
lrwxrwxrwx    1 admin    administ       77 Jun 12  2013 10D E-Burmese Instructions -> /share/BarryLibrary/10 Day Course Sets/10D Burmese/10D E-Burmese Instructions/
lrwxrwxrwx    1 admin    administ      107 Jun 12  2013 Discourse_on_Dhamma_Service_English.mp3 -> /share/BarryLibrary/Dhamma Service/Discourse on Dhamma Service v.85/Discourse_on_Dhamma_Service_English.mp3
lrwxrwxrwx    1 admin    administ       64 Jun 12  2013 Tikapatthana-U_Ba_Khin.mp3 -> /share/BarryLibrary/Special Chantings/Tikapatthana-U_Ba_Khin.mp3
lrwxrwxrwx    1 admin    administ       61 Jun 12  2013 WMetta_E-Burmese.mp3 -> /share/BarryLibrary/Workers Metta v.2005/WMetta_E-Burmese.mp3
[/share/HDA_DATA] # ls BarryLibrary/     
1 Day Course Sets/                     2 Day Course Sets/                     9_Day_English/                         Pre Course Talks/                      Version 2012.txt
10 Day Course Sets/                    20 Day Course Sets/                    Additional Course Material/            STP Course Sets/                       Workers Metta v.2005/
10 Day Dohas/                          2011Videos/                            AlbumArtSmall.jpg                      Sonos Customizations/                  WorldWideLanguage HDD  25.03.2012.xls
10 Day Executive Course Talk/          3 Day Course Sets/                     Dhamma Service/                        Special Chantings/                     WorldWideLanguage HDD 22.04.2012.xls
10 Day Morning Chantings/              30 Day Course Sets [w.10Ds Anapana]/   Groupsittings/                         Translated Recordings 04.2012.xls      hjwFubar/
10 Day Special Course Sets/            45 Day Course Sets [w.10Ds Anapana]/   Please Read Me.txt                     Translated Recordings 10.2011.xls      long course server mp3s/
[/share/HDA_DATA] # ls
10Day_EN/            3Day/                Burmese_EN_10D/      LongCourseServers/   Public/              Special10Day_EN/     Web/
1Day_EN/             9Day_EN/             Chinese-English-10D/ Mandarin_EN_10D/     Recordings/          Teen/                WorkPeriod/
20Day_EN/            BarryLibrary/        Download/            Multimedia/          Sati-khmer/          Test2/               aquota.user
30-45Day/            BetweenCourses/      Khmer_EN_10D/        Network Recycle Bin/ Satipatthana/        Usb/                 lost+found/

[/share/HDA_DATA] # ls -l BetweenCourses/
lrwxrwxrwx    1 admin    administ       44 Sep 23  2012 10 Day Morning Chantings -> /share/BarryLibrary/10 Day Morning Chantings/
lrwxrwxrwx    1 admin    administ      107 Sep 23  2012 Discourse_on_Dhamma_Service_English.mp3 -> /share/BarryLibrary/Dhamma Service/Discourse on Dhamma Service v.85/Discourse_on_Dhamma_Service_English.mp3
lrwxrwxrwx    1 admin    administ       50 Sep 23  2012 GSs English-only -> /share/BarryLibrary/Groupsittings/GSs English-only/
-rw-r--r--    1 admin    administ      798 Sep 24  2012 README
lrwxrwxrwx    1 admin    administ       37 Sep 23  2012 Special Chantings -> /share/BarryLibrary/Special Chantings/
lrwxrwxrwx    1 admin    administ       59 Sep 23  2012 WMetta_English.mp3 -> /share/BarryLibrary/Workers Metta v.2005/WMetta_English.mp3
[/share/HDA_DATA] # ls -l Chinese-English-10D/
lrwxrwxrwx    1 admin    administ       44 Jun 12  2013 10 Day Morning Chantings -> /share/BarryLibrary/10 Day Morning Chantings/
lrwxrwxrwx    1 admin    administ       80 Jun 12  2013 10D E-Mandarin Instructions -> /share/BarryLibrary/10 Day Course Sets/10D Mandarin/10D E-Mandarin Instructions//
lrwxrwxrwx    1 admin    administ       76 Jun 12  2013 10D Mandarin Discourses -> /share/BarryLibrary/10 Day Course Sets/10D Mandarin/10D Mandarin Discourses//

[/share/HDA_DATA] # ls -l Khmer_EN_10D/
lrwxrwxrwx    1 admin    administ       53 Aug 14 11:13 10 Day Morning Chantings -> /share/BarryLibrary/hjwFubar/10 Day Morning Chantings/
lrwxrwxrwx    1 admin    administ       73 Aug 14 11:20 10D E-Khmer Instructions -> /share/BarryLibrary/10 Day Course Sets/10D Khmer/10D E-Khmer Instructions/
lrwxrwxrwx    1 admin    administ       69 Aug 14 11:18 10D Khmer Discourses -> /share/BarryLibrary/10 Day Course Sets/10D Khmer/10D Khmer Discourses/
lrwxrwxrwx    1 admin    administ      107 Aug 14 11:14 Discourse_on_Dhamma_Service_English.mp3 -> /share/BarryLibrary/Dhamma Service/Discourse on Dhamma Service v.85/Discourse_on_Dhamma_Service_English.mp3
lrwxrwxrwx    1 admin    administ       64 Aug 14 11:15 Tikapatthana-U_Ba_Khin.mp3 -> /share/BarryLibrary/Special Chantings/Tikapatthana-U_Ba_Khin.mp3
lrwxrwxrwx    1 admin    administ       59 Aug 14 11:16 WMetta_E-Khmer.mp3 -> /share/BarryLibrary/Workers Metta v.2005/WMetta_E-Khmer.mp3
lrwxrwxrwx    1 admin    administ       59 Aug 14 11:40 WMetta_English.mp3 -> /share/BarryLibrary/Workers Metta v.2005/WMetta_English.mp3
[/share/HDA_DATA] # ls -l LongCourseServers/
[/share/HDA_DATA] # ls -l Mandarin_EN_10D/  
lrwxrwxrwx    1 admin    administ       53 Jun 12  2013 10 Day Morning Chantings -> /share/BarryLibrary/hjwFubar/10 Day Morning Chantings/
lrwxrwxrwx    1 admin    administ       77 Jun 12  2013 10D Cantonese Discourses -> /share/BarryLibrary/10 Day Course Sets/10D Cantonese/10D Cantonese Discourses/
lrwxrwxrwx    1 admin    administ       79 Jun 12  2013 10D E-Mandarin Instructions -> /share/BarryLibrary/10 Day Course Sets/10D Mandarin/10D E-Mandarin Instructions/
lrwxrwxrwx    1 admin    administ       75 Jun 12  2013 10D Mandarin Discourses -> /share/BarryLibrary/10 Day Course Sets/10D Mandarin/10D Mandarin Discourses/
lrwxrwxrwx    1 admin    administ      107 Jun 12  2013 Discourse_on_Dhamma_Service_English.mp3 -> /share/BarryLibrary/Dhamma Service/Discourse on Dhamma Service v.85/Discourse_on_Dhamma_Service_English.mp3
lrwxrwxrwx    1 admin    administ      108 Jun 12  2013 Discourse_on_Dhamma_Service_Mandarin.mp3 -> /share/BarryLibrary/Dhamma Service/Discourse on Dhamma Service v.85/Discourse_on_Dhamma_Service_Mandarin.mp3
lrwxrwxrwx    1 admin    administ       64 Jun 12  2013 Tikapatthana-U_Ba_Khin.mp3 -> /share/BarryLibrary/Special Chantings/Tikapatthana-U_Ba_Khin.mp3
lrwxrwxrwx    1 admin    administ       63 Jun 12  2013 WMetta_E-Cantonese.mp3 -> /share/BarryLibrary/Workers Metta v.2005/WMetta_E-Cantonese.mp3
lrwxrwxrwx    1 admin    administ       62 Jun 12  2013 WMetta_E-Mandarin.mp3 -> /share/BarryLibrary/Workers Metta v.2005/WMetta_E-Mandarin.mp3
lrwxrwxrwx    1 admin    administ       59 Jun 12  2013 WMetta_English.mp3 -> /share/BarryLibrary/Workers Metta v.2005/WMetta_English.mp3


[/share/HDA_DATA] # ls -l Sati-khmer/
lrwxrwxrwx    1 admin    administ      107 Oct  9 17:31 Discourse_on_Dhamma_Service_English.mp3 -> /share/BarryLibrary/Dhamma Service/Discourse on Dhamma Service v.85/Discourse_on_Dhamma_Service_English.mp3
lrwxrwxrwx    1 admin    administ      105 Oct  9 17:31 Discourse_on_Dhamma_Service_Khmer.mp3 -> /share/BarryLibrary/Dhamma Service/Discourse on Dhamma Service v.85/Discourse_on_Dhamma_Service_Khmer.mp3
lrwxrwxrwx    1 admin    administ       70 Oct  9 17:34 STP E-Khmer Instructions -> /share/BarryLibrary/STP Course Sets/STP Khmer/STP E-Khmer Instructions/
lrwxrwxrwx    1 admin    administ       66 Oct  9 17:34 STP Khmer Discourses -> /share/BarryLibrary/STP Course Sets/STP Khmer/STP Khmer Discourses/
lrwxrwxrwx    1 admin    administ       73 Oct  9 17:30 Satipatthana_Sutta_Jan_1985_wSM.mp3 -> /share/BarryLibrary/Special Chantings/Satipatthana_Sutta_Jan_1985_wSM.mp3
lrwxrwxrwx    1 admin    administ       64 Oct  9 17:30 Tikapatthana-U_Ba_Khin.mp3 -> /share/BarryLibrary/Special Chantings/Tikapatthana-U_Ba_Khin.mp3
lrwxrwxrwx    1 admin    administ       59 Oct  9 17:32 WMetta_E-Khmer.mp3 -> /share/BarryLibrary/Workers Metta v.2005/WMetta_E-Khmer.mp3
lrwxrwxrwx    1 admin    administ       79 Oct  9 17:28 gong_sonos_alarm.mp3 -> /share/HDA_DATA/BarryLibrary/Sonos Customizations/VMC gong/gong_sonos_alarm.mp3

            
[/share/HDA_DATA] # ls -l Satipatthana/
lrwxrwxrwx    1 admin    administ      107 Sep 24  2012 Discourse_on_Dhamma_Service_English.mp3 -> /share/BarryLibrary/Dhamma Service/Discourse on Dhamma Service v.85/Discourse_on_Dhamma_Service_English.mp3
-rw-r--r--    1 admin    administ     1022 Sep 24  2012 README
lrwxrwxrwx    1 admin    administ       77 Sep 24  2012 STP English Instructions -> /share/BarryLibrary/STP Course Sets/STP English-only/STP English Instructions/
lrwxrwxrwx    1 admin    administ       74 Sep 24  2012 Satipatthana_Sutta_Jan_1985_wSM.mp3 -> /share//BarryLibrary/Special Chantings/Satipatthana_Sutta_Jan_1985_wSM.mp3
lrwxrwxrwx    1 admin    administ       64 Sep 24  2012 Tikapatthana-U_Ba_Khin.mp3 -> /share/BarryLibrary/Special Chantings/Tikapatthana-U_Ba_Khin.mp3
lrwxrwxrwx    1 admin    administ       59 Sep 24  2012 WMetta_English.mp3 -> /share/BarryLibrary/Workers Metta v.2005/WMetta_English.mp3
[/share/HDA_DATA] # 
                   
[/share/HDA_DATA] # ls -l Special10Day_EN/
lrwxrwxrwx    1 admin    administ       53 Aug 27 17:46 10 Day Morning Chantings -> /share/BarryLibrary/hjwFubar/10 Day Morning Chantings/
lrwxrwxrwx    1 admin    administ       90 Aug 27 17:48 10D SPL English Discourses -> ../BarryLibrary/10 Day Special Course Sets/10D SPL English-only/10D SPL English Discourses/
lrwxrwxrwx    1 admin    administ       92 Aug 27 17:47 10D SPL English Instructions -> ../BarryLibrary/10 Day Special Course Sets/10D SPL English-only/10D SPL English Instructions/
lrwxrwxrwx    1 admin    administ       64 Aug 27 17:48 Tikapatthana-U_Ba_Khin.mp3 -> /share/BarryLibrary/Special Chantings/Tikapatthana-U_Ba_Khin.mp3
lrwxrwxrwx    1 admin    administ       59 Aug 27 17:49 WMetta_English.mp3 -> /share/BarryLibrary/Workers Metta v.2005/WMetta_English.mp3


[/share/HDA_DATA] # ls -l Teen/
lrwxrwxrwx    1 admin    administ       68 Sep 21  2012 Tikapatthana-U_Ba_Khin.mp3 -> ../BarryLibrary/WWL_HDD/Special Chantings/Tikapatthana-U_Ba_Khin.mp3@
lrwxrwxrwx    1 admin    administ       63 Sep 21  2012 WMetta_English.mp3 -> ../BarryLibrary/WWL_HDD/Workers Metta v.2005/WMetta_English.mp3@
[/share/HDA_DATA] # ls -l WorkPeriod/
lrwxrwxrwx    1 admin    administ       44 Sep 24  2012 10 Day Morning Chantings -> /share/BarryLibrary/10 Day Morning Chantings/
lrwxrwxrwx    1 admin    administ      107 Sep 24  2012 Discourse_on_Dhamma_Service_English.mp3 -> /share/BarryLibrary/Dhamma Service/Discourse on Dhamma Service v.85/Discourse_on_Dhamma_Service_English.mp3
lrwxrwxrwx    1 admin    administ       50 Sep 24  2012 GSs English-only -> /share/BarryLibrary/Groupsittings/GSs English-only/
-rw-r--r--    1 admin    administ      798 Sep 24  2012 README
lrwxrwxrwx    1 admin    administ       37 Sep 24  2012 Special Chantings -> /share/BarryLibrary/Special Chantings/
lrwxrwxrwx    1 admin    administ       59 Sep 24  2012 WMetta_English.mp3 -> /share/BarryLibrary/Workers Metta v.2005/WMetta_English.mp3
[/share/HDA_DATA] # 


Sonos Customizations/10D_Hindi_PDI/D01_2030_Instr_Hindi_10d.mp3 -> /share/HDA_DATA/BarryLibrary/10 Day Course Sets/10D Hindi-only/10D Hindi-only Instructions/D01/D01_2030_Instr_Hindi_10d.mp3
Sonos Customizations/10D_Hindi_PDI/D02_2030_Instr_Hindi_10d.mp3 -> /share/HDA_DATA/BarryLibrary/10 Day Course Sets/10D Hindi-only/10D Hindi-only Instructions/D02/D02_2030_Instr_Hindi_10d.mp3
Sonos Customizations/10D_Hindi_PDI/D03_2030_Instr_Hindi_10d.mp3 -> /share/HDA_DATA/BarryLibrary/10 Day Course Sets/10D Hindi-only/10D Hindi-only Instructions/D03/D03_2030_Instr_Hindi_10d.mp3
Sonos Customizations/10D_Hindi_PDI/D04_2030_Instr_Hindi_10d.mp3 -> /share/HDA_DATA/BarryLibrary/10 Day Course Sets/10D Hindi-only/10D Hindi-only Instructions/D04/D04_2030_Instr_Hindi_10d.mp3
Sonos Customizations/10D_Hindi_PDI/D05_2030_Instr_Hindi_10d.mp3 -> /share/HDA_DATA/BarryLibrary/10 Day Course Sets/10D Hindi-only/10D Hindi-only Instructions/D05/D05_2030_Instr_Hindi_10d.mp3
Sonos Customizations/10D_Hindi_PDI/D06_2030_Instr_Hindi_10d.mp3 -> /share/HDA_DATA/BarryLibrary/10 Day Course Sets/10D Hindi-only/10D Hindi-only Instructions/D06/D06_2030_Instr_Hindi_10d.mp3
Sonos Customizations/10D_Hindi_PDI/D07_2030_Instr_Hindi_10d.mp3 -> /share/HDA_DATA/BarryLibrary/10 Day Course Sets/10D Hindi-only/10D Hindi-only Instructions/D07/D07_2030_Instr_Hindi_10d.mp3
Sonos Customizations/10D_Hindi_PDI/D08_2030_Instr_Hindi_10d.mp3 -> /share/HDA_DATA/BarryLibrary/10 Day Course Sets/10D Hindi-only/10D Hindi-only Instructions/D08/D08_2030_Instr_Hindi_10d.mp3
