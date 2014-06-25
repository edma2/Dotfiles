export LC_CTYPE=en_US.UTF-8
export EDITOR=vim

export BIRDCAGE=$HOME/src/birdcage

export RAILS_ENV='development'
export RUBY_HEAP_MIN_SLOTS=500000
export RUBY_HEAP_SLOTS_INCREMENT=250000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=50000000
export RUBY_HEAP_FREE_MIN=4096

export GOPATH=$HOME

export CC=/usr/bin/gcc-4.2
export PGDATA='/opt/twitter/var/postgres'
export MAVEN_OPTS="-Xmx1024m -XX:MaxPermSize=512m"

PATH=/usr/local/bin:$PATH
PATH=$BIRDCAGE/bin:$BIRDCAGE/.scala/scala-2.9.2/bin:$PATH
PATH=$HOME/src/maven-tools/bin:$PATH
PATH=/opt/twitter/sbin:$HOME:/opt/twitter/bin:${HOME}/.twitools/src/twitter-utilities/sbt:$PATH
PATH=$HOME/bin:$PATH
# MacPorts
PATH=/opt/local/bin:/opt/local/sbin:$PATH
export MANPATH=/opt/local/share/man:$MANPATH

export PATH

export JAVA_HOME=$(/usr/libexec/java_home)

#export SALVO_TEMPLATE_REPO_PATH=/Users/ema/src/salvo-templates

[[ -s /opt/twitter/rvm/scripts/rvm ]] && . /opt/twitter/rvm/scripts/rvm
# dottools: add distribution binary directories to PATH
if [[ -r $HOME/.tools-cache/setup-dottools-path.sh ]]; then
  source $HOME/.tools-cache/setup-dottools-path.sh
fi
