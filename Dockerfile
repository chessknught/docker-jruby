FROM java:7
MAINTAINER Ted Neustaedter <ted.neustaedter@gmail.com>

ENV JRUBY_VERSION       jruby-1.7.15
ENV JRUBY_HOME          /usr/local/jruby
ENV PATH                $JRUBY_HOME/bin:$PATH

ENV DEBIAN_FRONTEND     noninteractive
ENV RUBY_CONFIGURE_OPTS --disable-install-doc
ENV TMPDIR              /tmp

WORKDIR /tmp
RUN apt-get update
RUN apt-get install -q -y --no-install-recommends git curl ca-certificates build-essential libssl-dev vim
RUN git clone https://github.com/sstephenson/ruby-build.git
RUN PREFIX=/tmp/rubybuild ./ruby-build/install.sh
RUN PATH=/tmp/rubybuild/bin:$PATH ruby-build $JRUBY_VERSION /usr/local/jruby
RUN gem install bundler --no-rdoc --no-ri
RUN echo 'gem: --no-document' > /etc/gemrc 
RUN echo 'gem: --no-document' > /.gemrc
RUN apt-get autoremove -y
RUN apt-get autoclean -y
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /opt/rubybuild

ADD test/ /tmp/test
RUN ruby /tmp/test/tc_word_count.rb 
RUN rm -rf test
