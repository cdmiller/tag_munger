# copy from DharaWWL silver 1gb portable HD to VMC's mac minis in AT rooms
#    useful options to correct mistakes
#    --dry-run
#    --delete --delete-after --delete-excluded --exclude=.DS_Store
#
# make a local copy called SonosLibrary on DharaWWL silver 1gb portable HD, making slight rearrangements
PORTABLE='/Volumes/DharaWWL'
WWL_FOLDER='WWL_2017'
VMC_ADDITIONAL ='VMC_Additional_Files'
MP3_FOLDER='/Users/Shared/MP3\ Library'

# copy library and delete old stuff including VMC_ADDTIONAL
mkdir -v $MP3_FOLDER
rsync -avz --delete --exclude=.DS_Store $PORTABLE/$WWL_FOLDER/WWL_mp3/* $MP3_FOLDER

# then add in VMC_ADDITIONAL
mkdir -v $MP3_FOLDER/$VMC_ADDITIONAL
rsync -avz --exclude=.DS_Store $PORTABLE/$VMC_ADDITIONAL/* $MP3_FOLDER/$VMC_ADDITIONAL

# make files read-only for AT user
chmod -R g-w $MP3_FOLDER
chmod -R o-w $MP3_FOLDER

echo 'Now ALL ORIGINAL FILES should be on local HD'
echo 'Done.  Log in as AT and verify files are readable but not changeable.'