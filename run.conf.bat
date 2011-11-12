rem ### -*- batch file -*- ######################################################
rem #                                                                          ##
rem #  JBoss Bootstrap Script Configuration                                    ##
rem #                                                                          ##
rem #############################################################################

rem # $Id: run.conf.bat 102595 2010-03-18 22:14:39Z rrajesh $

rem #
rem # This batch file is executed by run.bat to initialize the environment 
rem # variables that run.bat uses. It is recommended to use this file to
rem # configure these variables, rather than modifying run.bat itself. 
rem #

if not "x%JAVA_OPTS%" == "x" goto JAVA_OPTS_SET

rem #
rem # Specify the JBoss Profiler configuration file to load.
rem #
rem # Default is to not load a JBoss Profiler configuration file.
rem #
rem set "PROFILER=%JBOSS_HOME%\bin\jboss-profiler.properties"

rem #
rem # Specify the location of the Java home directory (it is recommended that
rem # this always be set). If set, then "%JAVA_HOME%\bin\java" will be used as
rem # the Java VM executable; otherwise, "%JAVA%" will be used (see below).
rem #
rem set "JAVA_HOME=C:\opt\jdk1.6.0_13"

rem #
rem # Specify the exact Java VM executable to use - only used if JAVA_HOME is
rem # not set. Default is "java".
rem #
rem set "JAVA=C:\opt\jdk1.6.0_13\bin\java"

rem #
rem # Specify options to pass to the Java VM. Note, there are some additional
rem # options that are always passed by run.bat.
rem #

rem # JVM memory allocation pool parameters - modify as appropriate.
set "JAVA_OPTS=-Xms128m -Xmx512m -Dsun.rmi.dgc.client.gcInterval=3600000 -Dsun.rmi.dgc.server.gcInterval=3600000 -Dsun.lang.ClassLoader.allowArraySyntax=true"

rem # Sample JPDA settings for remote socket debugging
rem set "JAVA_OPTS=%JAVA_OPTS% -Xrunjdwp:transport=dt_socket,address=8787,server=y,suspend=n"

rem # Sample JPDA settings for shared memory debugging 
rem set "JAVA_OPTS=%JAVA_OPTS% -Xrunjdwp:transport=dt_shmem,address=jboss,server=y,suspend=n"

rem # Enable the jconsole agent locally
set "JAVA_OPTS=%JAVA_OPTS% -Dcom.sun.management.jmxremote"
rem # Tell JBossAS to use the platform MBean server
set "JAVA_OPTS=%JAVA_OPTS% -Djboss.platform.mbeanserver"
rem # Make the platform MBean server able to work with JBossAS MBeans
set "JAVA_OPTS=%JAVA_OPTS% -Djavax.management.builder.initial=org.jboss.system.server.jmx.MBeanServerBuilderImpl"

rem # JMX options
set "JAVA_OPTS=%JAVA_OPTS% -Dcom.sun.management.jmxremote.port=12101"
set "JAVA_OPTS=%JAVA_OPTS% -Dcom.sun.management.jmxremote.ssl=false"
set "JAVA_OPTS=%JAVA_OPTS% -Dcom.sun.management.jmxremote.authenticate=false"

:JAVA_OPTS_SET
