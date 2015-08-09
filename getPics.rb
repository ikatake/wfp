require 'yaml'
require 'pp'
require 'time'


def readYaml(src)
  io = open(src, 'r')
  pp io
  data = YAML.load(io)
  pp data
end

readYaml("wfp20150809.yaml")


