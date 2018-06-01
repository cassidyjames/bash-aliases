# File navigating and whatnot
alias ..='cd ..'
alias cd..='cd ..'
alias mkdir='mkdir -pv'

# elementary things
alias emake='rm -rf build; mkdir build; cd build && cmake -DCMAKE_INSTALL_PREFIX=/usr .. && make && sudo make install && cd .. && echo "Built and installed!"'
alias vala-lint='io.elementary.vala-lint'
alias eninja='rm -rf build; meson build --prefix=/usr; cd build && ninja && sudo ninja install; cd ..'
alias emeson='eninja'
alias code='nohup io.elementary.code . &>/dev/null &'
alias files='nohup io.elementary.files . &>/dev/null &'

# Make grep better
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# Use multiple jobs for make by default
alias make='make -j'

# Make a random but sane password
alias generate-password='< /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c${1:-32};echo;'

# Make cloning from GitHub better
function github-clone {
  IFS='/' read -ra GITSTRING <<< "$@";
  owner="${GITSTRING[0]}";
  repo="${GITSTRING[1]}";
  mkdir -pv "$HOME/Projects/$owner";
  cd "$HOME/Projects/$owner";
  git clone git@github.com:"$@".git;
  cd "$repo";
}
alias ghc='github-clone'

# From https://gist.github.com/rajeshg/712300
function mkcd {
  last=$(eval "echo \$$#")
  if [ ! -n "$last" ]; then
    echo "Enter a directory name"
  elif [ -d $last ]; then
    echo "\`$last' already exists"
  else
    mkdir $@ && cd $last
  fi
}
