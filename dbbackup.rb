#!/usr/bin/env ruby
database = ARGV.shift
end_of_iter = ARGV.shift

if end_of_iter.nil?
  backup_file = database + Time.now.strftime("%Y%m%d")
else
  backup_file = database + end_of_iter
end

'.dump #{database} > #{backup_file}.sqlite3'
'gzip #{backup_file}.sqlite3'