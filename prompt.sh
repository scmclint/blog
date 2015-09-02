#!/usr/bin/env bash

function parse_git_dirty {                                                                                                                                                                                git diff --no-ext-diff --quiet --exit-code &> /dev/null || echo "*"                                                                                                                                   }  

function parse_git_branch {                                                                                                                                                                               git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/(\1$(parse_git_dirty))/"                                                                                                        } 

export PS1="\n\u@\h in $(parse_git_branch) \d \t \[\033[00m\]$?\n: "
#export PS1="\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;36m\]\w\[\033[00m\]\$(parse_git_branch)\$ "
alias lsd="ls -rlt | grep -P '^d' "
unset GEM_HOME
source /home/action/.rvm/scripts/rvm

