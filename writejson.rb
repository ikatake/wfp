require 'pp'
require './wfp_setting'
require './wfp_common'

def addArray(dairy, json)
  r = Array.new
  if(dairy)
    r = dairy
  end
  if(json)
    r += json
  end
  return r
end 

dairy = readYaml(getYamlFileName)
json = readJson(getJsonFileName)
array = addArray(dairy, json)
new_json = array[0, SIZE_JSON]

open(getJsonFileName, 'w') do |io|
  JSON.dump(new_json, io)
end
