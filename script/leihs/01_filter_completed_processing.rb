#!/usr/bin/ruby
#
# output:
# Processing FrontendController#index (for 174.129.174.183 at 2010-08-11 02:37:47) [GET]
# Completed in 21ms (DB: 3) | 302 Found [http://leihs.zhdk.ch/]

while( line = gets ) do
  if line =~ /^Processing/ or line =~ /^Completed/
    puts line
  end
end

