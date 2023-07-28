<img style='vertical-align:middle;' src="https://github.com/rayk/wrkateedge/blob/master/doc/atedgeicon.png" width="100px">

# Wrkatedge

An implementation of a simple working-at-the-edge architecture is intended as a reference for a broader implementation. As
a reference implementation, this project/repository does include 'extra file', which are not expected to be found in 
a production implementation. For example, IDE and environment files are included to demonstrate changes to the
development workflow and environment.

As security and integration with external providers is beyond the scope of this reference, the included env files can be
considered free of sensitive information. 

## Rational

We invested work into this reference implementation, to flesh out optimal solutions of the various challenged of
implementing a multi-platform offline client, that does a large amount of data processing on different client devices
and operating systems.

### Goals
_The essence of this reference implementation_

- Demonstrate dataflow from user interface to persistence, which is just a stub of a datastore.
- Demonstrate dependency management and injection.
- Demonstrate the interaction between the user interactions and the edge worker.
- Demonstrate the architectures portability cross various devices.
- Demonstrate testing approaches.
- Developer tooling and workflow.
- Demonstrate the architecture ability to exist in a automated deployment pipeline.

### Non-Goals
_Those things/challenges that we have explicit excluded from this reference implementation for the sake of brevity_

- Beyond data bind to the GUI Widget and dependency management, issues of animations and other UI/UX are non-goals.  
- Persistence and serialisation optimisation are non-goals.

### Assumptions
_Those things/challenges which we have assumed generally accepted solutions shall deliver._

- Mono-repo for all code. ~ [Melos](https://melos.invertase.dev/)
- All libraries declared in the pubspec.yaml are the minimum required to deliver the reference implementation.
- Environment config secrets are handled via a service like Doppler or similar, pushed into variables at build time.
- IDE environment is IntelliJ.
- Gui Localization is handled in the standard flutter way ~ [il18](https://docs.flutter.dev/accessibility-and-localization/internationalization)
- Data Mo

## Documentation

Given the audience of this work are experienced with the applied technology we have opted to leverage code comments 
and a clear terse code style instead of a collection of verbose markdown down files. After setting up the documentation
generator you can build the documentation by running the commands below from the root of the project.

### Documentation Generator Setup

Set it up once if you have not already done so.
```shell
dart pub global activate dartdoc
dart pub global activate dhttpd
```
Build the doc and server it locally for your own consumption.
```shell
dart doc .
dhttpd --path doc/api
```
