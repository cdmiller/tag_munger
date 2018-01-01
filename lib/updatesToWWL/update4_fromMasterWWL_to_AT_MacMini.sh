# copy from DharaWWL silver 1gb portable HD to VMC's mac minis in AT rooms
#    useful options to correct mistakes
#    --dry-run
#    --delete --delete-after --delete-excluded --exclude=.DS_Store
#
# make a local copy called SonosLibrary on DharaWWL silver 1gb portable HD, making slight rearrangements
PORTABLE='/Volumes/DharaWWL'
WWL_FOLDER='WWL_2017/WWL_mp3'
VMC_ADDITIONAL='VMC_Additional_Files'

LOCALSHAREDFOLDER='/Users/Shared'
MP3_FOLDER='MP3 Library'

# make MP3_FOLDER and VMC_ADDITIONAL 
mkdir -v "${LOCALSHAREDFOLDER}/${MP3_FOLDER}"
mkdir -v "${LOCALSHAREDFOLDER}/${MP3_FOLDER}/${VMC_ADDITIONAL}"

# temporarily move VMC_ADDITIONAL out of MP3_FOLDER to avoid being deleted in next step)
mv "${LOCALSHAREDFOLDER}/${MP3_FOLDER}/${VMC_ADDITIONAL}" "${LOCALSHAREDFOLDER}/${VMC_ADDITIONAL}"

# sync VMC_Additional_Files and delete old stuff
echo "Copying from: ${PORTABLE}/${VMC_ADDITIONAL}/*   to   ${LOCALSHAREDFOLDER}/${VMC_ADDITIONAL}"
rsync -avz --delete --exclude=.DS_Store --exclude=._* "${PORTABLE}/${VMC_ADDITIONAL}"/* "${LOCALSHAREDFOLDER}/${VMC_ADDITIONAL}"

# sync MP3_FOLDER and delete old stuff
echo "Copying from: ${PORTABLE}/${WWL_FOLDER}/*   to   ${LOCALSHAREDFOLDER}/${MP3_FOLDER}"
rsync -avz --delete --exclude=.DS_Store --exclude=._* "${PORTABLE}/${WWL_FOLDER}"/* "${LOCALSHAREDFOLDER}/${MP3_FOLDER}"

echo "moving VMC_Additional_Files back into MP3_FOLDER"
mv "${LOCALSHAREDFOLDER}/${VMC_ADDITIONAL}" "${LOCALSHAREDFOLDER}/${MP3_FOLDER}/${VMC_ADDITIONAL}"

# make files read-only for AT user
chmod -R go-w "${LOCALSHAREDFOLDER}/${MP3_FOLDER}"

echo 'Now ALL ORIGINAL FILES should be on local HD'
echo 'Done.  Log in as AT and verify files are readable but not changeable.'