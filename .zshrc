source /Users/tylerhm/homebrew/opt/spaceship/spaceship.zsh

export PATH="$HOME/homebrew/bin:$HOME/homebrew/sbin:$PATH"
export PATH="$HOME/.me/.bin:$PATH"
eval "$(fnm env --use-on-cd)"

alias ls=exa
alias cat=bat

# added by setup_fb4a.sh
export ANDROID_SDK=/opt/android_sdk
export ANDROID_NDK_REPOSITORY=/opt/android_ndk
export ANDROID_HOME=${ANDROID_SDK}
export PATH=${PATH}:${ANDROID_SDK}/emulator:${ANDROID_SDK}/tools:${ANDROID_SDK}/tools/bin:${ANDROID_SDK}/platform-tools

# java
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk-12.jdk/Contents/Home

# local dev alias
alias big="buck2 install ig4a"
alias fig="arc focus2 --buck-target ig4a --open"
alias stabilize="hg update fbandroid/stable"
alias pull="arc pull"
