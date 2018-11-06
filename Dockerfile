from ruby

workdir /tmp
copy Gemfile* /tmp/
run bundle install && gem install --no-ri --no-rdoc foreman
