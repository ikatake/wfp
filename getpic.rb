require 'pp'
require './wfp_setting'
require './wfp_common'
require 'open-uri'
require 'fileutils'

def getPicSaveFile(uri)
  if %r|http://(.*)/wzm/(.*)$| =~ uri
    #Hatena fotolife
    return "./pic/" + $2
  elsif %r|https://instagram.com/p/(.*)/media/(.*)$| =~ uri
    #instagram
    return "./pic/" + $1 + ".jpg"
  else
    return nil
  end
end

def downloadPic(uri, local)
  src = open(uri)
  dst = open(local, 'wb')
  dst.write(src.read())
  src.close
  dst.close
end

# getPics
dairy = readYaml(getYamlFileName)
dairy.each do |d|
  pu = d["pic_uri"]
  dst = getPicSaveFile(pu)
  if(pu && dst)
    dir, base = File.split(dst)
    FileUtils.mkdir_p(dir)
    downloadPic(pu, dst)
  end
  d["pic_uri"] = dst
end

# rewrite yaml
rewriteDairy(getYamlFileName, dairy)


# add json

# json length

