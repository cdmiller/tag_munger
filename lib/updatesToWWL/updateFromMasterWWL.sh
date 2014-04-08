# copy from TrueCrypt encrypted master to Dhara AV3 portable HD
#    useful options to correct mistakes
#    --dry-run
#    --delete --delete-after --delete-excluded --exclude=.DS_Store
#
rsync -avz /Volumes/NO\ NAME/* /Volumes/DharaWWL/
#
# Minimal Rearrangement to get rid of weird stuff
mv /Volumes/DharaWWL/WWL_HDD_2013/Worker\'s\ Metta/Workers\ Metta\ 2005/ ..  # move 'Workers Metta 2005' to top level
rmdir /Volumes/DharaWWL/WWL_HDD_2013/Worker\'s\ Metta # remove now empty dir

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

#TO DO FOR 2014 -- save a copy of the file 'Sonos Customizations/VMC gong/gong_sonos_alarm.mp3'
# because it was created by hawley from a file from barry and is not in the audio library.