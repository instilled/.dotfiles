function with-java() {
  # TODO: the line below should inject ; to execute
  # rhs no matter if lhs terminated successfully or
  # not (it will always as long
  # as one JDK is awailable but will report an error
  # if no matching version is installed and fallback to
  # the next lower version installed). For now
  # invocation of with-java jave to include the ;, e.g.
  #
  # with-java 1.7; echo $JAVA_HOME
  #
  JAVA_HOME="`/usr/libexec/java_home -v $1`" $@[2,$#]
}
