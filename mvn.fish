#!fish
# Maven fish auto completion
#
#
# Install file by copying to ~/.config/fish/completions/mvn.fish


# Default lifecycle
complete -c mvn -f -a 'pre-clean clean post-clean validate initialize generate-sources process-sources generate-resources process-resources compile process-classes generate-test-sources process-test-sources generate-test-resources process-test-resources test-compile process-test-classes testprepare-package package pre-integration-test integration-test post-integration-test verify install deploy pre-site site post-site site-deploy'

# All options form git --help
complete -c mvn -f -o am -l also-make                        -d "If project list is specified, also build projects required by the list"
complete -c mvn -f -o amd -l also-make-dependents            -d "If project list is specified, also build projects that depend on projects on the list"
complete -c mvn -f -o B -l batch-mode                        -d "Run in non-interactive (batch) mode"
complete -c mvn -r -f -o b -l builder                      -d "The id of the build strategy to use."
complete -c mvn -f -o C -l strict-checksums                  -d "Fail the build if checksums don't match"
complete -c mvn -f -o c -l lax-checksums                     -d "Warn if checksums don't match"
complete -c mvn -f -o cpu -l check-plugin-updates            -d "Ineffective, only kept for backward compatibility"
complete -c mvn -f -o D -l define                      -d "Define a system property"
complete -c mvn -f -o e -l errors                            -d "Produce execution error messages"
complete -c mvn -f -o emp -l encrypt-master-password   -d "Encrypt master security password"
complete -c mvn -f -o ep -l encrypt-password           -d "Encrypt server password"
complete -c mvn -r -o f -l file                        -d "Force the use of an alternate POM file (or directory with pom.xml)."
complete -c mvn -f -o fae -l fail-at-end                     -d "Only fail the build afterwards; allow all non-impacted builds to continue"
complete -c mvn -f -o ff -l fail-fast                        -d "Stop at first failure in reactorized builds"
complete -c mvn -f -o fn -l fail-never                       -d "NEVER fail the build, regardless of project result"
complete -c mvn -r -o gs -l global-settings            -d "Alternate path for the global settings file"
complete -c mvn -f -o h -l help                              -d "Display help information"
complete -c mvn -r -o l -l log-file                    -d "Log file to where all build output will go."
complete -c mvn -f -o llr -l legacy-local-repository         -d "Use Maven 2 Legacy Local Repository behaviour, ie no use of _remote.repositories. Can also be activated by using -Dmaven.legacyLocalRepo=true"
complete -c mvn -f -o N -l non-recursive                     -d "Do not recurse into sub-projects"
complete -c mvn -f -o npr -l no-plugin-registry              -d "Ineffective, only kept for backward compatibility"
complete -c mvn -f -o npu -l no-plugin-updates               -d "Ineffective, only kept for backward compatibility"
complete -c mvn -f -o nsu -l no-snapshot-updates             -d "Suppress SNAPSHOT updates"
complete -c mvn -f -o o -l offline                           -d "Work offline"
complete -c mvn -r -f -o pl -l projects                   -d "Comma-delimited list of specified reactor projects to build instead of all projects. A project can be specified by [groupId]:artifactId or by its relative path."
complete -c mvn -f -o q -l quiet                             -d "Quiet output - only show errors"
complete -c mvn -r -f -o rf -l resume-from                -d "Resume reactor from specified project"
complete -c mvn -r -o s -l settings                    -d "Alternate path for the user settings file"
complete -c mvn -r -f -o T -l threads                     -d "Thread count, for instance 2.0C where C is core multiplied"
complete -c mvn -r -o t -l toolchains                  -d "Alternate path for the user toolchains file"
complete -c mvn -f -o U -l update-snapshots                  -d "Forces a check for missing releases and updated snapshots on remote repositories"
complete -c mvn -f -o up -l update-plugins                   -d "Ineffective, only kept for backward compatibility"
complete -c mvn -f -o V -l show-version                      -d "Display version information WITHOUT stopping build"
complete -c mvn -f -o v -l version                           -d "Display version information"
complete -c mvn -f -o X -l debug                             -d "Produce execution debug output"

#
#
# Profiles
#
#
function __fish_mvn_profiles_from_settings
  grep -e "<profile>" -A 1 ~/.m2/settings.xml | grep -e "<id>.*</id>" | sed 's/.*<id>//' | sed 's/<\/id>.*//g'
end

#TODO search pom.xml hierarchy
function __fish_mvn_profiles_from_pom
  [ -e pom.xml ]; and grep -e "<profile>" -A 1 pom.xml | grep -e "<id>.*</id>" | sed 's/.*<id>//' | sed 's/<\/id>.*//g'
end

complete -c mvn -f -r -o P -l activate-profiles -a "(__fish_mvn_profiles_from_pom) (__fish_mvn_profiles_from_settings)"    -d "Comma-delimited list of profiles to activate"


#default properties for some plugins / profiles
complete -c mvn -o DskipTests                             -d "Skipping JUnit Tests"
complete -c mvn -o DbuildInstaller                        -d "Build installer (if profile is available in project)"
complete -c mvn -o DperformRelease                        -d "Use release profile (create javadoc and attach sources)"
complete -c mvn -o Dmaven.surefire.debug                  -d "Run surefire tests with debugging on port 5005"
complete -c mvn -o Dmaven.javadoc.skip                  -d "Skip Javadoc generation"


#
# Plugin configurations
#


# More plugins
complete -c mvn -f -a 'nexus-staging:release jgitflow:release-start jgitflow:release-finish'
complete -c mvn -a "appengine:backends_configure appengine:backends_delete appengine:backends_rollback appengine:backends_start appengine:backends_stop appengine:backends_update appengine:debug appengine:devserver appengine:devserver_start appengine:devserver_stop appengine:endpoints_get_client_lib appengine:endpoints_get_discovery_doc appengine:enhance appengine:rollback appengine:set_default_version appengine:start_module_version appengine:stop_module_version appengine:update appengine:update_cron appengine:update_dos appengine:update_indexes appengine:update_queues appengine:vacuum_indexes"
complete -c mvn -a "android:apk android:apklib android:clean android:deploy android:deploy-dependencies android:dex android:emulator-start android:emulator-stop android:emulator-stop-all android:generate-sources android:help android:instrument android:manifest-update android:pull android:push android:redeploy android:run android:undeploy android:unpack android:version-update android:zipalign android:devices"
complete -c mvn -a "ant:ant ant:clean"
complete -c mvn -a "antrun:run"
complete -c mvn -a "archetype:generate archetype:create-from-project archetype:crawl"
complete -c mvn -a "assembly:single assembly:assembly"
complete -c mvn -a "build-helper:add-resource build-helper:add-source build-helper:add-test-resource build-helper:add-test-source build-helper:attach-artifact build-helper:bsh-property build-helper:cpu-count build-helper:help build-helper:local-ip build-helper:maven-version build-helper:parse-version build-helper:regex-properties build-helper:regex-property build-helper:released-version build-helper:remove-project-artifact build-helper:reserve-network-port build-helper:timestamp-property"
complete -c mvn -a "buildnumber:create buildnumber:create-timestamp buildnumber:help buildnumber:hgchangeset"
complete -c mvn -a "cargo:start cargo:run cargo:stop cargo:deploy cargo:undeploy cargo:help"
complete -c mvn -a "checkstyle:checkstyle checkstyle:check"
complete -c mvn -a "cobertura:cobertura"
complete -c mvn -a "findbugs:findbugs findbugs:gui findbugs:help"
complete -c mvn -a "dependency:analyze dependency:analyze-dep-mgt dependency:analyze-duplicate dependency:analyze-only dependency:analyze-report dependency:build-classpath dependency:copy dependency:copy-dependencies dependency:get dependency:go-offline dependency:help dependency:list dependency:list-repositories dependency:properties dependency:purge-local-repository dependency:resolve dependency:resolve-plugins dependency:sources dependency:tree dependency:unpack dependency:unpack-dependencies"
complete -c mvn -a "deploy:deploy-file"
complete -c mvn -a "ear:ear ear:generate-application-xml"
complete -c mvn -a "eclipse:clean eclipse:eclipse"
complete -c mvn -a "ejb:ejb"
complete -c mvn -a "enforcer:enforce enforcer:display-info"
complete -c mvn -a "exec:exec exec:java"
complete -c mvn -a "failsafe:integration-test failsafe:verify"
complete -c mvn -a "flyway:clean flyway:history flyway:init flyway:migrate flyway:status flyway:validate"
complete -c mvn -a "gpg:sign gpg:sign-and-deploy-file"
complete -c mvn -a "grails:clean grails:config-directories grails:console grails:create-controller grails:create-domain-class grails:create-integration-test grails:create-pom grails:create-script grails:create-service grails:create-tag-lib grails:create-unit-test grails:exec grails:generate-all grails:generate-controller grails:generate-views grails:help grails:init grails:init-plugin grails:install-templates grails:list-plugins grails:maven-clean grails:maven-compile grails:maven-functional-test grails:maven-grails-app-war grails:maven-test grails:maven-war grails:package grails:package-plugin grails:run-app grails:run-app-https grails:run-war grails:set-version grails:test-app grails:upgrade grails:validate grails:validate-plugin grails:war"
complete -c mvn -a "gwt:browser gwt:clean gwt:compile gwt:compile-report gwt:css gwt:debug gwt:eclipse gwt:eclipseTest gwt:generateAsync gwt:help gwt:i18n gwt:mergewebxml gwt:resources gwt:run gwt:run-codeserver gwt:sdkInstall gwt:source-jar gwt:soyc gwt:test"
complete -c mvn -a "help:active-profiles help:all-profiles help:describe help:effective-pom help:effective-settings help:evaluate help:expressions help:help help:system"
complete -c mvn -a "hibernate3:hbm2ddl hibernate3:help"
complete -c mvn -a "idea:clean idea:idea"
complete -c mvn -a "install:install-file"
complete -c mvn -a "jacoco:check jacoco:dump jacoco:help jacoco:instrument jacoco:merge jacoco:prepare-agent jacoco:prepare-agent-integration jacoco:report jacoco:report-integration jacoco:restore-instrumented-classes"
complete -c mvn -a "javadoc:javadoc javadoc:jar javadoc:aggregate"
complete -c mvn -a "jboss:start jboss:stop jboss:deploy jboss:undeploy jboss:redeploy"
complete -c mvn -a "jboss-as:add-resource jboss-as:deploy jboss-as:deploy-only jboss-as:deploy-artifact jboss-as:redeploy jboss-as:redeploy-only jboss-as:undeploy jboss-as:undeploy-artifact jboss-as:run jboss-as:start jboss-as:shutdown jboss-as:execute-commands"
complete -c mvn -a "jetty:run jetty:run-exploded"
complete -c mvn -a "jxr:jxr"
complete -c mvn -a "license:format license:check"
complete -c mvn -a "liquibase:changelogSync liquibase:changelogSyncSQL liquibase:clearCheckSums liquibase:dbDoc liquibase:diff liquibase:dropAll liquibase:help liquibase:migrate liquibase:listLocks liquibase:migrateSQL liquibase:releaseLocks liquibase:rollback liquibase:rollbackSQL liquibase:status liquibase:tag liquibase:update liquibase:updateSQL liquibase:updateTestingRollback"
complete -c mvn -a "nexus-staging:close nexus-staging:deploy nexus-staging:deploy-staged nexus-staging:deploy-staged-repository nexus-staging:drop nexus-staging:help nexus-staging:promote nexus-staging:rc-close nexus-staging:rc-drop nexus-staging:rc-list nexus-staging:rc-list-profiles nexus-staging:rc-promote nexus-staging:rc-release nexus-staging:release"
complete -c mvn -a "pmd:pmd pmd:cpd pmd:check pmd:cpd-check"
complete -c mvn -a "release:clean release:prepare release:rollback release:perform release:stage release:branch release:update-versions"
complete -c mvn -a "repository:bundle-create repository:bundle-pack repository:help"
complete -c mvn -a "scm:add scm:checkin scm:checkout scm:update scm:status"
complete -c mvn -a "site:site site:deploy site:run site:stage site:stage-deploy"
complete -c mvn -a "sonar:sonar sonar:help"
complete -c mvn -a "source:aggregate source:jar source:jar-no-fork"
complete -c mvn -a "surefire:test"
complete -c mvn -a "tomcat6:help tomcat6:run tomcat6:run-war tomcat6:run-war-only tomcat6:stop tomcat6:deploy tomcat6:undeploy"
complete -c mvn -a "tomcat7:help tomcat7:run tomcat7:run-war tomcat7:run-war-only tomcat7:deploy"
complete -c mvn -a "tomcat:help tomcat:start tomcat:stop tomcat:deploy tomcat:undeploy"
complete -c mvn -a "liberty:create-server liberty:start-server liberty:stop-server liberty:run-server liberty:deploy liberty:undeploy liberty:java-dump-server liberty:dump-server liberty:package-server"
complete -c mvn -a "versions:display-dependency-updates versions:display-plugin-updates versions:display-property-updates versions:update-parent versions:update-properties versions:update-child-modules versions:lock-snapshots versions:unlock-snapshots versions:resolve-ranges versions:set versions:use-releases versions:use-next-releases versions:use-latest-releases versions:use-next-snapshots versions:use-latest-snapshots versions:use-next-versions versions:use-latest-versions versions:commit versions:revert"
complete -c mvn -a "vertx:init vertx:runMod vertx:pullInDeps vertx:fatJar"
complete -c mvn -a "war:war war:exploded war:inplace war:manifest"
complete -c mvn -a "spring-boot:run spring-boot:repackage"
complete -c mvn -a "jgitflow:feature-start jgitflow:feature-finish jgitflow:release-start jgitflow:release-finish jgitflow:hotfix-start jgitflow:hotfix-finish jgitflow:build-number"
complete -c mvn -a "wildfly:add-resource wildfly:deploy wildfly:deploy-only wildfly:deploy-artifact wildfly:redeploy wildfly:redeploy-only wildfly:undeploy wildfly:undeploy-artifact wildfly:run wildfly:start wildfly:shutdown wildfly:execute-commands"

