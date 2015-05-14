# Maven fish auto completion
#
# Default lifecycle
complete -c mvn -a 'pre-clean clean post-clean validate initialize generate-sources process-sources generate-resources process-resources compile process-classes generate-test-sources process-test-sources generate-test-resources process-test-resources test-compile process-test-classes testprepare-package package pre-integration-test integration-test post-integration-test verify install deploy pre-site site post-site site-deploy'
# JGitflow/Release related plugins
complete -c mvn -a 'nexus-staging:release jgitflow:release-start jgitflow:release-finish'

# All options form git --help
complete -c mvn -o am -l also-make                        -d "If project list is specified, also build projects required by the list"
complete -c mvn -o amd -l also-make-dependents            -d "If project list is specified, also build projects that depend on projects on the list"
complete -c mvn -o B -l batch-mode                        -d "Run in non-interactive (batch) mode"
complete -c mvn -o b -l builder                      -d "The id of the build strategy to use."
complete -c mvn -o C -l strict-checksums                  -d "Fail the build if checksums don't match"
complete -c mvn -o c -l lax-checksums                     -d "Warn if checksums don't match"
complete -c mvn -o cpu -l check-plugin-updates            -d "Ineffective, only kept for backward compatibility"
complete -c mvn -o D -l define                      -d "Define a system property"
complete -c mvn -o e -l errors                            -d "Produce execution error messages"
complete -c mvn -o emp -l encrypt-master-password   -d "Encrypt master security password"
complete -c mvn -o ep -l encrypt-password           -d "Encrypt server password"
complete -c mvn -o f -l file                        -d "Force the use of an alternate POM file (or directory with pom.xml)."
complete -c mvn -o fae -l fail-at-end                     -d "Only fail the build afterwards; allow all non-impacted builds to continue"
complete -c mvn -o ff -l fail-fast                        -d "Stop at first failure in reactorized builds"
complete -c mvn -o fn -l fail-never                       -d "NEVER fail the build, regardless of project result"
complete -c mvn -o gs -l global-settings            -d "Alternate path for the global settings file"
complete -c mvn -o h -l help                              -d "Display help information"
complete -c mvn -o l -l log-file                    -d "Log file to where all build output will go."
complete -c mvn -o llr -l legacy-local-repository         -d "Use Maven 2 Legacy Local Repository behaviour, ie no use of _remote.repositories. Can also be activated by using -Dmaven.legacyLocalRepo=true"
complete -c mvn -o N -l non-recursive                     -d "Do not recurse into sub-projects"
complete -c mvn -o npr -l no-plugin-registry              -d "Ineffective, only kept for backward compatibility"
complete -c mvn -o npu -l no-plugin-updates               -d "Ineffective, only kept for backward compatibility"
complete -c mvn -o nsu -l no-snapshot-updates             -d "Suppress SNAPSHOT updates"
complete -c mvn -o o -l offline                           -d "Work offline"
complete -c mvn -o P -l activate-profiles           -d "Comma-delimited list of profiles to activate"
complete -c mvn -o pl -l projects                   -d "Comma-delimited list of specified reactor projects to build instead of all projects. A project can be specified by [groupId]:artifactId or by its relative path."
complete -c mvn -o q -l quiet                             -d "Quiet output - only show errors"
complete -c mvn -o rf -l resume-from                -d "Resume reactor from specified project"
complete -c mvn -o s -l settings                    -d "Alternate path for the user settings file"
complete -c mvn -o T -l threads                     -d "Thread count, for instance 2.0C where C is core multiplied"
complete -c mvn -o t -l toolchains                  -d "Alternate path for the user toolchains file"
complete -c mvn -o U -l update-snapshots                  -d "Forces a check for missing releases and updated snapshots on remote repositories"
complete -c mvn -o up -l update-plugins                   -d "Ineffective, only kept for backward compatibility"
complete -c mvn -o V -l show-version                      -d "Display version information WITHOUT stopping build"
complete -c mvn -o v -l version                           -d "Display version information"
complete -c mvn -o X -l debug                             -d "Produce execution debug output"

#default properties for some plugins
complete -c mvn -o DskipTests                             -d "Skipping JUnit Tests"
complete -c mvn -o DbuildInstaller                        -d "Build installer (if profile is available in project)"
