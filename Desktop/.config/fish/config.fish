if status is-interactive
    # Commands to run in interactive sessions can go here
    starship init fish | source
end

set fish_greeting

alias :q 'exit';
alias q 'exit';
alias vim 'nvim';
alias formel 'sw zathura ~/Documents/formelsamling.pdf';
alias micro 'sw zathura ~/Documents/micro.pdf';
alias emacs 'emacsclient -nw -c -a ""';
alias ls 'lsd';
alias ll 'lsd -alF';
alias priv 'fish --private';

set -U fish_user_paths $fish_user_paths $HOME/.local/bin;
set -U fish_user_paths $fish_user_paths $HOME/.cargo/bin;
set -U fish_user_paths $fish_user_paths $HOME/.emacs.d/bin;
set -U fish_user_paths $fish_user_paths $HOME/.ghcup/bin;

export EDITOR='nvim';
export BROWSER=/usr/bin/firefox-beta;
export TEXMFHOME=$HOME/.texmf;
export GRAVEYARD=$HOME/.local/share/Trash;

set -U fish_escape_delay_ms 300
