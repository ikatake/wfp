require 'rss'
require 'pp'

#はてなブログの/rssはRSS2.0を返すとのこと
#

def getPicSrc(description)
  arr = description.split(" ")
  arr.each do |e|
    if /^src="(.*)"/ =~ e
      return $1
    end
  end
  return nil
end


uri = "http://wzm.hatenablog.com/rss"
rss = RSS::Parser.parse(uri)
#p rss
#pp rss
#pp rss.channel.items

rss.channel.items.each do |i|
  puts i.link
  puts i.title
  puts getPicSrc(i.description)
  puts	
end

