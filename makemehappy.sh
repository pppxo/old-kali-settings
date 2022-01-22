#!/bin/bash

my_bashrc="# ~/.bashrc: executed by bash(1) for non-login shells.\n# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)\n# for examples\n\n# If not running interactively, don't do anything\ncase \$- in\n*i*) ;;\n*) return;;\nesac\n\n# don't put duplicate lines or lines starting with space in the history.\n# See bash(1) for more options\nHISTCONTROL=ignoreboth\n\n# append to the history file, don't overwrite it\nshopt -s histappend\n\n# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)\nHISTSIZE=1000\nHISTFILESIZE=2000\n\n# check the window size after each command and, if necessary,\n# update the values of LINES and COLUMNS.\nshopt -s checkwinsize\n# If set, the pattern \"**\" used in a pathname expansion context will\n# match all files and zero or more directories and subdirectories.\n#shopt -s globstar\n\n# make less more friendly for non-text input files, see lesspipe(1)\n#[ -x /usr/bin/lesspipe ] && eval \"\$(SHELL=/bin/sh lesspipe)\"\n\n# set variable identifying the chroot you work in (used in the prompt below)\nif [ -z \"\${debian_chroot:-}\" ] && [ -r /etc/debian_chroot ]; then\ndebian_chroot=\$(cat /etc/debian_chroot)\nfi\n\n# set a fancy prompt (non-color, unless we know we \"want\" color)\ncase \"\$TERM\" in\nxterm-color) color_prompt=yes;;\nesac\n\n# uncomment for a colored prompt, if the terminal has the capability; turned\n# off by default to not distract the user: the focus in a terminal window\n# should be on the output of commands, not on the prompt\nforce_color_prompt=yes\nif [ -n \"\$force_color_prompt\" ]; then\nif [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then\n# We have color support; assume it's compliant with Ecma-48\n# (ISO/IEC-6429). (Lack of such support is extremely rare, and such\n# a case would tend to support setf rather than setaf.)\ncolor_prompt=yes\nelse\ncolor_prompt=\nfi\nfi\n\nif [ \"\$color_prompt\" = yes ]; then\nPS1='\${debian_chroot:+(\$debian_chroot)}\[\\\033[01;31m\\\]\\\u@\\\h\\\[\\\033[00m\\\]:\\\[\\\033[01;34m\\\]\w\\\[\\\033[00m\\\]\\$ '\nelse\nPS1='\${debian_chroot:+(\$debian_chroot)}\\\u@\\\h:\\\w\\$ '\nfi\nunset color_prompt force_color_prompt\n\n# If this is an xterm set the title to user@host:dir\ncase \"\$TERM\" in\nxterm*|rxvt*)\nPS1=\"\\\[\\\e]0;\${debian_chroot:+(\$debian_chroot)}\\\u@\\\h: \\\w\\\a\\\]\$PS1\"\n;;\n*)\n;;\nesac\n\n# enable color support of ls and also add handy aliases\nif [ -x /usr/bin/dircolors ]; then\ntest -r ~/.dircolors && eval \"\$(dircolors -b ~/.dircolors)\" || eval \"\$(dircolors -b)\"\nalias ls='ls --color=auto'\n#alias dir='dir --color=auto'\n#alias vdir='vdir --color=auto'\n\n#alias grep='grep --color=auto'\n#alias fgrep='fgrep --color=auto'\n#alias egrep='egrep --color=auto'\nfi\n\n# some more ls aliases\n#alias ll='ls -l'\n#alias la='ls -A'\n#alias l='ls -CF'\n\n# Alias definitions.\n# You may want to put all your additions into a separate file like\n# ~/.bash_aliases, instead of adding them here directly.\n# See /usr/share/doc/bash-doc/examples in the bash-doc package.\nif [ -f ~/.bash_aliases ]; then\n. ~/.bash_aliases\nfi\n\n# enable programmable completion features (you don't need to enable\n# this, if it's already enabled in /etc/bash.bashrc and /etc/profile\n# sources /etc/bash.bashrc).\nif ! shopt -oq posix; then\nif [ -f /usr/share/bash-completion/bash_completion ]; then\n. /usr/share/bash-completion/bash_completion\nelif [ -f /etc/bash_completion ]; then\n. /etc/bash_completion\nfi\nfi"

# update the repository
sudo apt update && upgrade 

# install gnome, root login
sudo apt install kali-desktop-gnome kali-root-login -y 


# remove all the other desktops
sudo apt purge kali-desktop-xfce xfce* lightdm* -y
sudo apt autoremove -y

#change the default shell from the stupid zsh to the bash
sudo chsh -s /bin/bash kali
sudo chsh -s /bin/bash root

#make root:toor
LINE="\$6\$xyz\$BDmP0jwgcE7rJupmgiDusNIop8zGY0BnFJCoLJUX/YXp6ldB7vwCcrfg/BFvDORz3JL0GmjzQkzUXWUlN9Ebq/"
sudo usermod -p $LINE root

# change the .bashrc to the old one like a pro
sudo rm /home/kali/.bashrc /root/.bashrc
sudo echo -e $my_bashrc > /home/kali/.bashrc
sudo echo -e $my_bashrc > /root/.bashrc

reboot
