require 'rss'

#はてなブログの/rssはRSS2.0を返すとのこと
#


uri = "http://wzm.hatenablog.com/rss"
rss = RSS::Parser.parse(uri)
p rss

