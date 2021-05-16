# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/thepenguin/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"
#ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git sudo)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
export EDITOR='nvim'
alias :q=exit
alias q=exit
alias vim=nvim
alias formel='sw zathura ~/Documents/Skolsaker\ Gymnasie/år\ 3/matte/formelsamling.pdf'
alias micro='sw zathura ~/Documents/micro.pdf'
alias mb='matlab -nodesktop -nosplash'
alias emacs='emacsclient -nw -c -a ""'
alias ja='java --module-path /home/thepenguin/.javafx/lib --add-modules javafx.base,javafx.controls,javafx.fxml,javafx.graphics,javafx.media'
alias jc='javac --module-path /home/thepenguin/.javafx/lib --add-modules javafx.base,javafx.controls,javafx.fxml,javafx.graphics,javafx.media'
alias ls='lsd'
alias ll='lsd -alF'
alias yt='ytfzf -t'
alias mine="nuxhashd"
alias mutt="neomutt"
alias tf="mkdir transcoded; for i in *.mp4; do ffmpeg -i '$i' -vcodec mjpeg -q:v 2 -acodec pcm_s16be -q:a 0 -f mov 'transcoded/${i%.*}.mov'; done"

zstyle ':completion:*' list-colors "no=00:fi=00:di=01;34:ln=01;36:\ 
  pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:\ 
  or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:\ 
  *.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:\ 
  *.z=01;31:*.Z=01;31:*.gz=01;31:*.deb=01;31:\ 
  *.jpg=01;35:*.gif=01;35:*.bmp=01;35:*.ppm=01;35:\ 
  *.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:\ 
  *.mpg=01;37:*.avi=01;37:*.gl=01;37:*.dl=01;37:"


export ANDROID_HOME=/home/thepenguin/.android-sdk
export PATH=$ANDROID_HOME/platform-tools:$PATH
export PATH=$ANDROID_HOME/tools:$PATH
export PATH=$PATH:/home/thepenguin/.scripts
export PATH=$PATH:/home/thepenguin/.local/bin
export PATH=$PATH:/home/thepenguin/.cargo/bin
export PATH=$PATH:/home/thepenguin/.emacs.d/bin
export BROWSER=/usr/bin/firefox-beta
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


