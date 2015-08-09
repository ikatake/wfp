require 'time'
require 'yaml'
require 'json'

def getYamlFileName
  t = Time.now
  r = "wfp" + t.strftime("%Y%m%d") + ".yaml"
end

def getJsonFileName
  f = FILE_JSON
  return f;
end

def rewriteDairy(src, dairy)
  io = open(src, 'w')
  YAML.dump(dairy, io)
  io.close
end

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
