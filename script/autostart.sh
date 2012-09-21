#!/bin/bash

# for f in `ls /srv`
# do
#   su -l rosa -c "cd /srv/$f/current && bundle exec unicorn -l /tmp/$f_unicorn.sock -E production -c config/unicorn.rb -D"
# done

su -l rosa -c "cd /srv/rosa_file_store/current && bundle exec unicorn -l /tmp/rosa_file_store_unicorn.sock -E production -c config/unicorn.rb -D"
