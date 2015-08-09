require 'time'

RSS_URI = "http://wzm.hatenablog.com/rss"


def getYamlFileName
  t = Time.now
  r = "wfp" + t.strftime("%Y%m%d") + ".yaml"
end

