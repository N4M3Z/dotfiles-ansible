# Detect hostname for host-dependent profiles
hostname=${HOST[(ws:.:)0]}

echo -e "\033[32mSetting up profile for ${hostname} ...\033[0m"
dotzsh-file-load ${ZSH}/profiles/${hostname}.zsh
