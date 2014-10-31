if [ -f ~/.bashrc ]; then
       source ~/.bashrc
fi
export PATH="/opt/chef/embedded/bin:$PATH"
eval "$(rbenv init -)"
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export ANDROID_HOME=/usr/local/opt/android-sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/build-tools
export BYOBU_PREFIX=$(brew --prefix)

eval "$(hub alias -s)"
