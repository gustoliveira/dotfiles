# Colors
export RED='\033[0;31m'
export GREEN='\033[0;32m'
export YELLOW='\033[0;33m'
export BLUE='\033[0;34m'
export BOLD_WHITE='\033[1;97m'
export NC='\033[0m'


if [ -f /usr/share/autojump/autojump.sh ]; then
    . /usr/share/autojump/autojump.sh
fi

is_fzf_installed=$(which fzf >/dev/null && echo true || echo false)

# Aliases
alias go-reshim='asdf reshim golang && export GOROOT="$(asdf where golang)/go/"'
alias update='sudo apt update ; sudo apt upgrade ; sudo apt autoremove ; sudo apt autoclean'
alias c='clear'
alias lsa='ls -la'
if which xclip >/dev/null; then alias copy='xclip -sel clip'; fi
if which exa >/dev/null; then alias ls='exa'; fi
if which tldr >/dev/null; then alias man='tldr'; fi
if $is_fzf_installed; then alias cdf='cd $(ls -d .?*/ */ | fzf)'; fi


if [ -f "$HOME/.asdf/asdf.sh" ] && [ -f "$HOME/.asdf/completions/asdf.bash" ]; then
    . "$HOME/.asdf/asdf.sh"
    . "$HOME/.asdf/completions/asdf.bash"
    go-reshim
fi

# Git aliases
git() {
    if [[ ($1 == "c" || $1 == "ca" || $1 == "cr" || $1 == "db" || $1 == "cb") && $is_fzf_installed == false  ]]; then
        echo -e "${RED}You can't use this alias! Please install ${BLUE}fzf${RED} before using it.${NC}"
        return
    fi

    if [[ $1 == "frm" ]]; then
        git restore . ; git fetch upstream ; git checkout master ; git rebase upstream/master ; git push ; git branch

    elif [[ $1 == "cm" ]]; then
        shift
        git add . ; git commit -m "$@"

    elif [[ $1 == "cmp" ]]; then
        shift
        git add . ; git commit -m "$@" ; git push

    elif [[ $1 == "c" && $is_fzf_installed == true ]]; then
        shift
        git checkout $(git branch | fzf | tr -d "[[:space:]]")

    elif [[ $1 == "ca" && $is_fzf_installed == true ]]; then
        shift
        git checkout $(git branch --all | fzf | tr -d "[[:space:]]")

    elif [[ $1 == "cr" && $is_fzf_installed == true ]]; then
        shift
        git checkout $(git branch --r | fzf | tr -d "[[:space:]]")

    elif [[ $1 == "db" && $is_fzf_installed == true ]]; then
        shift
        current_branch=$(git rev-parse --abbrev-ref HEAD)
        git branch -D $(git branch --all | grep -v $current_branch | fzf --multi | tr '\n' ' ')

    elif [[ $1 == "cb" && $is_fzf_installed == true ]]; then
        shift
        git branch --all | fzf | tr -d "[' ', '\n', '*']" | copy

    else
        command git "$@"
    fi
}


# Flutter aliases
flutter() {
    if [[ $1 == "coverage" ]]; then
        echo Running Coverage Tests to ../testes.txt
        meu_loading  "flutter test --coverage" "../testes.txt"

    elif [[ $1 == "coverage_master" ]]; then
        echo Running Coverage Tests of master branch to ../master_testes.txt
        git restore .
        git checkout master
	    git branch
        meu_loading  "flutter test --coverage" "../master_testes.txt"

    else
	    command flutter "$@"
    fi
}


# ANIMATIONS
cronometro() {
    SECONDS=0
    while true; do
        minutos=$((SECONDS / 60))
        segundos=$((SECONDS % 60))
        printf "%02d:%02d\r" $minutos $segundos
        sleep 1
    done
}

loading_animation() {
    local spin='-\|/'
    SECONDS=0

    while true; do
        local temp=${spin#?}
        printf " [%c]  " "$spin\c"

        minutos=$((SECONDS / 600))
        segundos=$((SECONDS % 600))
        printf "%02d:%02d\r" $minutos $segundos

        spin=$temp${spin%"$temp"}
        sleep 0.1
        printf "\b\b\b\b\b\b"
    done
}


meu_loading() {
    (
        local spin='-\|/'
        SECONDS=0

        while true; do
            local temp=${spin#?}
            printf " [%c]  " "$spin\c"

            minutos=$((SECONDS / 60))
            segundos=$((SECONDS % 60))
            printf "%02d:%02d\r" $minutos $segundos

            spin=$temp${spin%"$temp"}
            sleep 0.1
            printf "\b\b\b\b\b\b"
        done &
        trap "kill $!" SIGTERM SIGKILL

        command $1 > $2
        grep -F "[E]" $2 -c > /tmp/count.txt
        result=$(awk '($1 == 10)' /tmp/count.txt)

        if [[ $result == 10 ]]; then
            printf "[\e[32mOK\e[0m]\n"
        else
            printf "\e[1;31mFAILED\e[0m\n"
            grep -F "[E]" $2
        fi

        kill $!
    )
}
