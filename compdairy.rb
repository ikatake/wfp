require 'yaml'
require 'json'
require 'pp'
require './wfp_setting'

def readYaml(src)
  data = open(src, 'r') do |io|
    YAML.load(io)
  end
end

def readJson(src)
  json_data = open(src, 'r') do |io|
    JSON.load(io)
  end
  return json_data
end

#dairy_rssのうち、追加読み込みが必要なデータを判定。
#上から読み込んで、読み込みが必要なデータ数を返す
def getTail(dairy, store)
  if store == nil
    return dairy.size
  end
  r = 0
  dairy.each do |d|
    if store[0]["uri"] == d["uri"]
      return r
    else
      r += 1
    end
  end
  return r
end

def rewriteDairy(src, dairy)
  io = open(src, 'w')
  YAML.dump(dairy, io)
  io.close
end

# compare yaml , json
dairy_rss = readYaml(getYamlFileName)
slot_used = readJson("wfp.json")
num_dairy = getTail(dairy_rss, slot_used)
pp num_dairy;

# rewrite yaml
rewriteDairy(getYamlFileName, dairy_rss[0, num_dairy])


