# install
GRE="\033[0;32m"
YEL="\033[0;33m"
BLU="\033[0;34m"
DEF="\033[0;39m"
RES="\033[0m"

BASH_PROFILE="$HOME/.bash_profile"
BASH_RC="$HOME/.bashrc"
GUT_HOME='$HOME/gut.sh'

install() {
  local dest=$1
  found=$(grep "$GUT_HOME" "$dest")
  if [ ! "$found" ]; then
    echo ""
    echo -e "${BLU}Installing gut in: ${YEL}$dest${DEF}"
    echo "source $GUT_HOME" >> "$dest"

    echo -e "${GRE}Please open a new terminal or re-source the ${DEF}${YEL}${dest} ${DEF}${GRE}with the command below:${DEF}"
    echo ""
    echo -e "    $ source $dest"
    echo ""
  fi
  echo -e "${BLU}Install complete${DEF}"
}

echo -e "${BLU}Installing gut${DEF}"
eval "$(curl -sSL "https://github.com/jareddlc/gut/raw/master/gut-update.sh")" && _gut_update

if [ -e "$BASH_PROFILE" ]; then
  install "$BASH_PROFILE"
elif [ -e "$BASH_RC" ]; then
  install "$BASH_RC"
else
  echo -e "${BLU}Did not find a .bashrc or .bash_profile${DEF}"
  echo -e "${YEL}To use gut, source with the command below:${RES}"
  echo -e "source $GUT_HOME"
fi
