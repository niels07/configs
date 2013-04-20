#
# Aliases
#

COPE=/usr/share/perl5/site_perl/auto/share/dist/Cope

for f in $COPE/*
do
    eval "alias $(basename $f)=$f"
done

unset $COPE

alias vi='vim'
alias ncmp='mpd &> /dev/null; sleep 1; ncmpcpp'
alias ls='/bin/ls --color=auto'
alias lp='ls++'
alias dmesg='$HOME/dev/Term::ExtendedColor/bin/colored_dmesg|grep -v TCP'
alias vimtime='/home/scp1/dev/time-spent-in-vim/vim --total'
alias vimsh='vim *.sh'
alias vimpm='vim *.pm'
alias vimpl='vim *.pl'
alias vimc='vim *.{c,h}'

#
# Completion
#
zstyle :compinstall filename '/home/niels/.zshrc'

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=** r:|=** l:|=*'
zstyle ':completion:*' menu select=2
zstyle ':completion:*' original true
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' separate-sections 'yes'
zstyle ':completion:*' list-dirs-first true
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' menu select=200
zstyle ':completion:*' use-perl=1
zstyle ':completion:*' my-accounts='m@japh.se'
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*:cd:*' ignore-parents parent pwd
zstyle ':completion:*:(all-|)files' ignored-patterns '*.un~'
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path ~/etc/cache/$HOST
zstyle ':completion:*:processes' command 'ps -axw'
zstyle ':completion:*:processes-names' command 'ps -awxho command'
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*:functions' ignored-patterns '_*'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:*:mplayer:*' tag-order files
zstyle ':completion:*:*:mplayer:*' file-patterns '*.(rmvb|mkv|mpg|wmv|mpeg|avi|flv|mp3|mp4|flac|ogg):video *:all-files' '*(-/):directories'
zstyle ':completion:*:*:(vim|rview|vimdiff|xxd):*:*files' ignored-patterns '*~|*.(old|bak|zwc|viminfo|rxvt-*|zcompdump)|pm_to_blib|cover_db|blib' file-sort modification
zstyle ':completion:*:*:(vim|rview|vimdiff|xxd):*' file-sort modification
zstyle ':completion:*:*:(vim|rview|vimdiff|xxd):*' tag-order files
zstyle ':completion:*:*:(scp):*' file-sort modification
zstyle ':completion:*:*:(cd):*:*files' ignored-patterns '*~' file-sort access
zstyle ':completion:*:*:(cd):*' file-sort access
zstyle ':completion:*:*:(cd):*' menu select
zstyle ':completion:*:*:(cd):*' completer _history
zstyle ':completion:*:*:perl:*' file-patterns '*'
zstyle ':completion:*:descriptions' format $'%{- \e[38;5;137;1m\e[48;5;234m%}%B%d%b%{\e[m%}'
zstyle ':completion:*:warnings' format $'%{No match for \e[38;5;240;1m%}%d%{\e[m%}'
zstyle ':completion:*:*:apvlv:*' tag-order files
zstyle ':completion:*:*:apvlv:*' file-patterns '*.pdf'
zstyle ':completion:most-accessed-file:*' match-original both
zstyle ':completion:most-accessed-file:*' file-sort access
zstyle ':completion:most-accessed-file:*' file-patterns '*:all\ files'
zstyle ':completion:most-accessed-file:*' hidden all
zstyle ':completion:most-accessed-file:*' completer _files
zstyle ':completion:*:scp:*' group-order  users files all-files hosts-domain hosts-host hosts-ipaddr
zstyle ':completion:*:ssh:*' tag-order users 'hosts:-host hosts:-domain:domain hosts:-ipaddr:IP\ address *'
zstyle ':completion:*:ssh:*' group-order hosts-domain hosts-host users hosts-ipaddr
zstyle '*' single-ignored show


go_prefixes=(5 6 8)
for p in $prefixes; do
  compctl -g "*.${p}" ${p}l
  compctl -g "*.go"   ${p}g
done
compctl -g "*.go" gofmt
compctl -g "*.go" gccgo

#
# Load
#
autoload -U colors && colors
autoload -Uz compinit

compinit

#
# history settings
#
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory 

#
# opts
#
setopt autocd 
setopt extendedglob
setopt nomatch
setopt notify
unsetopt beep
unsetopt cshjunkiequotes

#
# keybindings
#
bindkey "\e[1~" beginning-of-line # Home
bindkey "\e[4~" end-of-line # End
bindkey "\e[5~" beginning-of-history # PageUp
bindkey "\e[6~" end-of-history # PageDown
bindkey "\e[2~" quoted-insert # Ins
bindkey "\e[3~" delete-char # Del
bindkey "\e[5C" forward-word
bindkey "\eOc" emacs-forward-word
bindkey "\e[5D" backward-word
bindkey "\eOd" emacs-backward-word
bindkey "\e\e[C" forward-word
bindkey "\e\e[D" backward-word
bindkey "\e[7~" beginning-of-line # Home
bindkey "\e[8~" end-of-line # End
bindkey "\eOH" beginning-of-line
bindkey "\eOF" end-of-line
bindkey "\e[H" beginning-of-line
bindkey "\e[F" end-of-line
bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward


#
# Functions
#
CMDCOUNT=0
precmd()
{
	case $TERM in
		rxvt-256color | screen-256color ) 
			print -Pn "\e]0;%n@%m: %~\a" ;;
	esac	
}

preexec()
{
	case $TERM in
		rxvt-256color | screen-256color )
			print -Pn "\e]0;$1\a" ;;
	esac
}

mostused()
{
	sed -n 's/^\([a-z]*\) .*/\1/p' $HISTFILE |
	sort |
	uniq -c |
	sort -n -k1 |
	tail -25 |
	tac
}

#export LANG=nl_BE.utf8 USR
#
# Prompt
#
#PROMPT=$(echo "%{$fg[green]%}┌|───| %{$fg[red]%}%n%{$fg[yellow]%}@%{$fg[blue]%}%m%{$fg[green]%} |────| %{$fg[yellow]%}%1~%{$fg[green]%} %{$fg[green]%}|───| %F{4}%y%f%{$fg[green]%} |\n└|─%{$fg[yellow]%}%#%{$fg[green]%}─|▶ %{$reset_color%}")
PROMPT=$(echo "┌| %{$fg[red]%}%n%{$fg[yellow]%}@%{$fg[blue]%}%m%{$fg[green]%} : %{$fg[yellow]%}%1~ %{$fg[white]%}|\n└▶ %{$reset_color%}")

RPROMPT="%{$fg[red]%}%t%{$reset_color%} [%{$fg_no_bold[yellow]%}%?%{$reset_color%}]"

export EDITOR=vim
export LS_COLORS='rs=0:di=01;34:'
eval `dircolors /etc/dir_colors`

