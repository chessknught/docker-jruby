# Docker - JRuby

A debian [Docker](http://www.docker.com) container with [JRuby](http://jruby.org) and [Bundler](http://bundler.io) installed.

Version tags are based off the installed [JRuby](http://jruby.org) version

# Usage

##To get the latest existing image in docker hub:
1. docker pull chessknught/jruby

##To build your own image from this project:
1. Click the "Clone or download" button above  (or fork this project if you want to check in your own changes)
2. Click the button to the right of the URL to copy to your clipboard
3. Open a docker window and navigate to your project area
4. Type: git clone <paste-url-here>
5. Modify the Dockerfile if you want to change anything (such as the java version or jruby version being installed)
6. Type: `docker build -t="githubacct/jruby:<version>"` (set version to your own version of this project)
7. Wait for the build to complete.  **BE SURE TO REVIEW THE OUTPUT FOR POTENTIAL ERRORS**
8. Type: `docker run -it --name jruby chessknught/jruby:1.2 /bin/bash' to login to the container and start using it

Then build away!