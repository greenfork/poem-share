module Transform
  class Poem
    # https://stackoverflow.com/q/417142/8598954
    #
    # Maximum url length compatible with all browsers is about 2047
    # characters, 47 characters are reserved for the url base and 2000
    # for hash. Base64 encoding has an efficiency of 75%, so the
    # maximum number of bytes stored in 2000 base64 encoded symbols
    # equals to 1500. In ASCII every character is 1 byte, limit of
    # 1500 is acceptable. However if other character sets are used,
    # then it will exceed the limit of 2000 base64 symbols, which is
    # fine because who cares about IE and Edge, only these browsers
    # can't support more than 2k characters in the address bar.
    SIZE_LIMIT = 1500

    def self.encode(s)
      Base64.urlsafe_encode64(s)
    end

    def self.decode(s)
      Base64.urlsafe_decode64(s)
    end
  end
end
