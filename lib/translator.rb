# require modules here

require 'yaml'
require 'pry'

# this wasnt too bad but need to work on .find and .select etc 


def load_library(file_destination)
  emoticon_raw = YAML.load_file(file_destination)

  emoticon_format = {"get_meaning" => {}, "get_emoticon" => {}}

  emoticon_raw.each do |meaning, emoticons|
    emoticon_format["get_meaning"] = emoticon_format["get_meaning"].merge({emoticons[1] => meaning})
    emoticon_format["get_emoticon"] = emoticon_format["get_emoticon"].merge({emoticons[0] => emoticons[1]})
  end

  emoticon_format
end

def get_japanese_emoticon(file_destination, emoticon)
  emoticon_format = load_library(file_destination)
  sorry = "Sorry, that emoticon was not found"

  emoticon_format.each do |key, hash| # I dont like these if statments, should be using find
    if key == "get_emoticon"
    hash.each do |k, v|
       if k == emoticon
         return v
       end
    end
    end
  end
return sorry
end


def get_english_meaning(file_destination, emoticon)
  emoticon_format = load_library(file_destination)
  sorry = "Sorry, that emoticon was not found"

  emoticon_format.each do |key, hash|
    if key == "get_meaning"
      hash.each do |k, v|
        if k == emoticon
          return v
        end
      end
    end
  end
  return sorry
end
