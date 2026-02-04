# Pulumi

- [install pulumi](https://www.pulumi.com/docs/get-started/download-install/) in azure cloudshell 
```bash
curl -fsSL https://get.pulumi.com | sh
```

- clone a repo
- run pulumi Infra as a Code


## set up of the pulumi structure
- preferred sets a gradle app stack
- 
```bash
pulumi new java-gradle

This command will walk you through creating a new Pulumi project.

Enter a value or leave blank to accept the (default), and press <ENTER>.
Press ^C at any time to quit.

Project name (networking-resource-group): azure-enterprise-app-java

A project with the name `azure-enterprise-app-java` already exists. Use 'azure-enterprise-app-java' anyway
Project description (A minimal Java Pulumi program with Gradle builds): creates the required networking configuration to isolate cloud resources and handle costs
Created project 'azure-enterprise-app-java'

Please enter your desired stack name.
To create a stack in an organization, use the format <org-name>/<stack-name> (e.g. `acmecorp/dev`).
Stack name (dev): enterprise-app-networking

Starting a Gradle Daemon, 1 incompatible and 1 stopped Daemons could not be reused, use --status for details
> Task :app:compileJava
> Task :app:processResources NO-SOURCE
> Task :app:classes
> Task :app:jar
> Task :app:startScripts
> Task :app:distTar
> Task :app:distZip
> Task :app:assemble
> Task :app:compileTestJava NO-SOURCE
> Task :app:processTestResources NO-SOURCE
> Task :app:testClasses UP-TO-DATE
> Task :app:test NO-SOURCE
> Task :app:check UP-TO-DATE
> Task :app:build

[Incubating] Problems report is available at: file:///mnt/c/Users/andres.leonrangel/ws/gh-aleon1220/azure-iac-provisioning-patterns/pulumi/azure-enterprise-app-java/networking-resource-group/build/reports/problems/problems-report.html

Deprecated Gradle features were used in this build, making it incompatible with Gradle 10.

You can use '--warning-mode all' to show the individual deprecation warnings and determine if they come from your own scripts or plugins.

For more on this, please refer to https://docs.gradle.org/9.0.0/userguide/command_line_interface.html#sec:command_line_warnings in the Gradle documentation.

BUILD SUCCESSFUL in 1m 6s
5 actionable tasks: 5 executed
Consider enabling configuration cache to speed up this build: https://docs.gradle.org/9.0.0/userguide/configuration_cache_enabling.html
Your new project is ready to go! 

To perform an initial deployment, run `pulumi up`
```

---

- create a stack java maven app
```bash
pulumi new java

Created project 'azure-enterprise-app-java'

Please enter your desired stack name.
To create a stack in an organization, use the format <org-name>/<stack-name> (e.g. `acmecorp/dev`).
Stack name (dev):

WARNING: A restricted method in java.lang.System has been called
WARNING: java.lang.System::load has been called by org.fusesource.jansi.internal.JansiLoader in an unnamed module (file:/home/ale/.sdkman/candidates/maven/current/lib/jansi-2.4.1.jar)
WARNING: Use --enable-native-access=ALL-UNNAMED to avoid a warning for callers in this module
WARNING: Restricted methods will be blocked in a future release unless native access is enabled

WARNING: A terminally deprecated method in sun.misc.Unsafe has been called
WARNING: sun.misc.Unsafe::objectFieldOffset has been called by com.google.common.util.concurrent.AbstractFuture$UnsafeAtomicHelper (file:/home/ale/.sdkman/candidates/maven/current/lib/guava-33.2.1-jre.jar)
WARNING: Please consider reporting this to the maintainers of class com.google.common.util.concurrent.AbstractFuture$UnsafeAtomicHelper        
WARNING: sun.misc.Unsafe::objectFieldOffset will be removed in a future release
[WARNING] Using platform encoding (UTF-8 actually) to copy filtered resources, i.e. build is platform dependent!
Your new project is ready to go! 

To perform an initial deployment, run `pulumi up`
```

# References
- [Pulumi & Java](https://www.pulumi.com/docs/iac/languages-sdks/java/)
- [Java pulumi API SDK](https://www.pulumi.com/docs/reference/pkg/java/)
- [Azure provider](https://www.pulumi.com/docs/iac/clouds/azure/)
- [Azure Native: API Docs](https://www.pulumi.com/registry/packages/azure-native/api-docs/)