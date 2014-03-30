if executable("./pants")
  set makeprg=./pants\ goal\ $*\ \\\|\ nocolor
endif
