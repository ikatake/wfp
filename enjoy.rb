require 'yaml'
require 'json'
require 'pp'
require './wfp_setting'

def readYaml(src)
  data = open(src, 'r') do |io|
    YAML.load(io)
  end
end

# getpics

# add json

# json length

