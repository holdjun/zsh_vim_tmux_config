#!/usr/bin/env bash

RED=$(printf '\033[31m')
GREEN=$(printf '\033[32m')
YELLOW=$(printf '\033[33m')
BLUE=$(printf '\033[34m')
BOLD=$(printf '\033[1m')
RESET=$(printf '\033[m')
CARE=$(printf '\033[42m')

# depends
# install latest tmux

echo "${GREEN}\n\nStart install maybe you need\n\n${RESET}"
sudo apt-get install -y git mosh htop vim zsh fonts-powerline automake bison build-essential pkg-config libevent-dev libncurses5-dev

echo "${GREEN}\n\nStart install latest tmux\n\n${RESET}"
rm -fr /tmp/tmux
git clone https://github.com/tmux/tmux.git /tmp/tmux
cd /tmp/tmux
git checkout master
sh autogen.sh
./configure && make
sudo make install
cd -
rm -fr /tmp/tmux
echo "${GREEN}\n\ntmux finish!!!!\n\n${RESET}"

# Oh My Tmux!
echo "${GREEN}\n\nStart install Oh My Tmux!\n\n${RESET}"
cd
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .
cd -
echo "${GREEN}\n\nOh My tmux finish!!!!\n\n${RESET}"

# install vimrc(if you need)
echo "${GREEN}\n\nStart install vimrc\n\n${RESET}"
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh
echo "${GREEN}\n\nvimrc finish!!!!\n\n${RESET}"

# instal gdb-peda
git clone https://github.com/longld/peda.git ~/peda
echo "source ~/peda/peda.py" >> ~/.gdbinit
echo "${GREEN}\nDONE! debug your program with gdb and enjoy\n${RESET}"

# oh my zsh
echo "${CARE}\n\nstart install oh my zsh \n PLEASE EXIT ZSH!!!!!\n\n${RESET}"
echo "${CARE}\n\nremember exit zsh\n\n${RESET}"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
chsh -s $(which zsh)
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
cp myself.zsh-theme ~/.oh-my-zsh/custom/themes
echo "ZSH_THEME=\"myself\"" >> ~/.zshrc
echo "plugins=(git cp z per-directory-history) " >> ~/.zshrc
echo "source \$ZSH/oh-my-zsh.sh" >> ~/.zshrc
echo "source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc
echo "source ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc
echo "${GREEN}\n\nDon't forget to restart your terminal! finish!!!!!\n\n${RESET}"
