require 'pry'

def dictionary
    {"hello" => "hi",
    "to, two, too" => "2", 
    "for, four" => "4",
    "be" => "b",
    "you" => "u",
    "at" => "@",
    "and" => "&"
    }
end

def word_substituter(tweet)
    
    cleaned_dictionary = {}
    dictionary.map do |key, value|
        if key.include? ", "
            new_keys = key.split(", ")
            new_keys.each do |new_key|
                cleaned_dictionary[new_key] = value
            end
        else 
            cleaned_dictionary[key] = value
        end
    end
    
    words_to_replace = cleaned_dictionary.keys
    
    tweet_array = tweet.split
    new_tweet = tweet_array.map do |tweet_word|
        if words_to_replace.include?(tweet_word.downcase)
            tweet_word = cleaned_dictionary[tweet_word.downcase]
        else
            tweet_word
        end
    end
    short_tweet = new_tweet.join(" ")
    short_tweet
end

def bulk_tweet_shortener(array_of_tweets)
    array_of_tweets.map do |tweet|
       puts word_substituter(tweet)
    end
end

def selective_tweet_shortener(tweet)
    if tweet.length < 140
        return tweet
    else 
        word_substituter(tweet)
    end
end

def shortened_tweet_truncator(tweet)
    shortened_tweet = selective_tweet_shortener(tweet)
    if shortened_tweet.length > 140
        return shortened_tweet[0...137].concat("...") 
    end
    return shortened_tweet
end