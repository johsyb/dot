GREEN=`tput setaf 2`
BRIGHTGREEN=`tput bold; tput setaf 2`
YELLOW=`tput setaf 3`
BRIGHTYELLOW=`tput bold; tput setaf 3`
BLACK=`tput setaf 0`
RED=`tput setaf 1`
BRIGHTRED=`tput bold; tput setaf 1`
BLUE=`tput setaf 4`
MAGENTA=`tput setaf 5`
CYAN=`tput setaf 6`
WHITE=`tput bold; tput setaf 7`
NORM=`tput sgr0`

#__GL_SYNC_TO_VBLANK

bindkey "^[[1~" beginning-of-line
bindkey "^[[4~" end-of-line 
bindkey "^[[3~" delete-char
bindkey " " magic-space

case $TERM in 
	(aterm|xterm|rxvt|rxvt-unicode|xterm-256color|screen)
	bindkey "^[[7~" beginning-of-line
	bindkey "^[[8~" end-of-line
	bindkey "^[[3~" delete-char
	;;
esac

#export LANG="pl_PL.ISO-8859-2"
#export LC_ALL="pl_PL.ISO-8859-2"
#export MANPAGER="col -b | vim -R -c 'set fileencoding=iso-8859-2 ft=man nomod nolist' -"
#export LANG="pl_PL.utf8"
#export LC_ALL="pl_PL.utf8"
#export LINGUAS="pl"

export NNTPSERVER="news.tpi.pl"
export CCACHE_DIR="/home/ccache"
setopt auto_menu
setopt auto_list

export HISTSIZE=100
export HISTFILE=${HOME}/.zsh_history
export SAVEHIST=10000
export DIRSTACKSIZE=100

export HISTIGNORE="[   ]*:&:bg:fg:clear"
export COLORFGBG="default;default"
setopt APPEND_HISTORY


autoload -U compinit promptinit
autoload -U incremental-complete-word
zle -N incremental-complete-word
bindkey "^Xi" incremental-complete-word ## C-x-i


compinit
setopt complete_in_word
zstyle ':completion:*' completer _complete _prefix _approximate
zstyle ':completion:*' add-space true
#zstyle ':completion:*:descriptions' format '%B%d%b'
#zstyle ':completion:*:corrections' format '%B%d (błędy: %e)%b'
#zstyle ':completion:*:messages' format '%d'
#zstyle ':completion:*:warnings' format '%BNic nie znaleziono dla: %d%b'
#zstyle ':completion:*' group-name ''
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*:processes' command 'ps xw -o pid,tty,time,args'
zstyle ':completion:*:*:*:*' list-suffixes yes
zstyle ':completion:*' ignore-parents parent pwd
zstyle -e ':completion:*' special-dirs '[[ $PREFIX = (../)#(|.|..) ]] && reply=(..)'
zstyle ':completion:*' separate-sections true
zstyle ':completion:incremental:*' completer _complete _correct


setopt extended_glob
highlights='${PREFIX:+=(#bi)($PREFIX:t)(?)*==31=1;32}':${(s.:.)LS_COLORS}}
zstyle -e ':completion:*' list-colors 'reply=( "'$highlights'" )'
unset highlights
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# Kolorowe dopelnianie w zsh
eval $(dircolors)
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# Wybieranie dopelnienia za pomoca kursora
#setopt menucomplete
zstyle ':completion:*' menu select=long-list  select=1


HOSTNAME=`hostname`

if [ "$HOSTNAME" = "fortytwo.ml" ] ; then
    PS1="%{$MAGENTA%}[%{$MAGENTA%}%n]%{$BRIGHTGREEN%}::%{$BLUE%}[%{$BLUE%}%m]%{$NORM%}%~%(!.#.
%{$CYAN%}<%{$GREEN%}*%{$CYAN%}> )% %{$NORM%}"
else
    PS1="%{$GREEN%}[%{$GREEN%}%n]%{$BRIGHTGREEN%}::%{$BLUE%}[%{$BLUE%}%m]%{$NORM%}%~%(!.#.
%{$CYAN%}<%{$GREEN%}*%{$CYAN%}> )% %{$NORM%}"
fi

alias df="df -h"
alias ls="ls --color"
alias su="su -"
alias free="free -m"
alias halt="sudo /sbin/halt"
alias shutdown="sudo /sbin/shutdown"
alias reboot="sudo /sbin/reboot"
alias mount="sudo /bin/mount"
alias umount="sudo /bin/umount"
alias emerge="sudo /usr/bin/emerge"
#alias mc="mc -b; clear"
alias iso="mkisofs -r -J -D -o"
alias cdr="sudo cdrecord -v speed=48 dev=ATAPI:0,1,0 -tao"
alias cddvd="sudo cdrecord -sao -v speed=8 dev=ATAPI:0,1,0 -tao"
alias cdblank="sudo cdrecord -v dev=ATAPI:0,1,0 blank=fast"
alias kni="ssh kni.kul.lublin.pl"
alias killall="sudo killall"
alias foto="feh -g 640x480"
alias dhcpcd="sudo /sbin/dhcpcd"
#alias startx="/usr/bin/startx 2>/dev/null"
alias startx="startx -- -logverbose 6"
alias etc="sudo etc-update"
alias insmod="sudo /sbin/insmod"
alias modprobe="sudo /sbin/modprobe"
alias rmmod="sudo /sbin/rmmod"

export CVS_RSH="ssh"
export CVSEDITOR="vim"
export SVN_EDITOR="vim"
alias indent="indent -ts 4 -bap -bad -br -bls -c30 -cbi2 -cd30 \
-cdb -cdw -ce -cli4 -di10 -i4 -ip4 -lp -pcs -psl -sbi4 -sc \
-ts4 -nut -saw -sai -saf"
alias ll="ls -al"
alias v="vim"
export QQ="svn://wrzoski.com"

PATH="$PATH:/opt/e17/bin:~/bin:/usr/local/bin"
function vman {
  /usr/bin/man $* | /usr/bin/col -bp | /usr/bin/iconv -c | \
  /usr/bin/view -c "set ft=man nomod nolist so=999 ts=8 wrap\
  titlestring=man\ $1" -
}
# Use gvim as a manpage reader
function wman {
  /usr/bin/man $* | /usr/bin/col -bp | /usr/bin/iconv -c | \
  /usr/bin/gview -c "set ft=man nomod nolist so=999 ts=8 wrap\
  titlestring=man\ $1" -
}



export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/opt/webkit/lib/pkgconfig:/opt/e17/lib/pkgconfig:/usr/lib/pkgconfig



export PROFILE_LOG=/tmp/profile.log
export PROFILE_PIPE=/tmp/profile.pipe
export PROFILE_MAPS=/tmp/profile.maps
alias ctags="ctags -R --c++-kinds=+p --fields=+iaS --extra=+q "
#bindkey `tput kpp` up-history >/dev/null 2>&1
#bindkey `tput knp` end-of-history >/dev/null 2>&1
#bindkey `tput kcuu1` history-beginning-search-backward >/dev/null 2>&1
#bindkey `tput kcud1` history-beginning-search-forward >/dev/null 2>&1
bindkey "^[q" push-line >/dev/null 2>&1
bindkey "^[a" accept-and-hold >/dev/null 2>&1

alias -g G='| grep'
alias -g L="| less"
alias -g NUL=">/dev/null 2>&1"
alias -g make="make -j2"

zmodload zsh/complist
bindkey -M menuselect 'j' down-line-or-history
bindkey -M menuselect 'k' up-line-or-history
bindkey -M menuselect 'h' backward-char
bindkey -M menuselect 'l' forward-char

#set -o vi
#zle-line-init() { zle -K  vicmd; }
#zle -N zle-line-init
. ~/bin/samsung
