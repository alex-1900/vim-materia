#!sh

# check git command
type git || {
  echo 'Please install git or update your path to include the git executable!'
  exit 1
}
echo ""

install_path="$HOME/.vim"
vimrc_file="$HOME/.vimrc"

if [ -e "$install_path" ]; then
    mv $install_path "$HOME/.vim_back"
fi

if [ ! -f "$vimrc_file" ]; then
    mv $vimrc_file "$HOME/.vimrc_back"
fi

# make vimfile dir and fetch automemories
echo "Begin fetching automemories..."
git clone --depth=1 --branch stable https://github.com/speed-sonic/automemories-vim.git "$install_path"
echo "Done."
echo ""

# install dein into .vim/
curl -sSL https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh | bash -s "$install_path/bundles"

cp "$install_path/init.vim" $vimrc_file

system_name="$(uname -s)"

# Download font
echo "Download font"
echo ""

function downloadPowerFont() {
    cd "$1"
    curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf
    echo "Droid Sans Mono for Powerline Nerd Font is in $1"
}

if [[ $system_name =~ "Darwin" ]]; then
    downloadPowerFont('~/Library/Fonts')
else
    mkdir -p ~/.local/share/fonts
    downloadPowerFont('~/.local/share/fonts')
fi
