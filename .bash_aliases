. /usr/share/autojump/autojump.sh

# Aliases
alias update='sudo apt update ; sudo apt upgrade ; sudo apt autoremove ; sudo apt autoclean'
alias c='clear'
alias copy='xclip -sel clip'
alias ls='exa'
alias history='history|rg'
alias man='tldr'

# Git aliases
git() {
    if [[ $1 == "frm" ]]; then
        git restore . ; git fetch upstream ; git checkout master ; git rebase upstream/master ; git push ; git branch

    elif [[ $1 == "s" ]]; then
	    git status

    elif [[ $1 == "b" ]]; then
	    git branch

    elif [[ $1 == "p" ]]; then
	    git push

    elif [[ $1 == "cm" ]]; then
        shift
        git add . ; git commit -m "$@"

    elif [[ $1 == "cmp" ]]; then
        shift
        git add . ; git commit -m "$@" ; git push

    elif [[ $1 == "c" ]]; then
        shift
        git checkout $(git branch | fzf | tr -d "[[:space:]]")

    elif [[ $1 == "ca" ]]; then
        shift
        git checkout $(git branch --all | fzf | tr -d "[[:space:]]")

    elif [[ $1 == "cr" ]]; then
        shift
        git checkout $(git branch --r | fzf | tr -d "[[:space:]]")

    elif [[ $1 == "db" ]]; then
        shift
        git branch -D $(git branch --all | fzf | tr -d "[[:space:]]")

    elif [[ $1 == "cb" ]]; then
        shift
        git branch --all | fzf | copy

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
