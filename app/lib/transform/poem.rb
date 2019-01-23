module Transform
  class Poem
    def self.encode(s)
      Base64.urlsafe_encode64(s)
    end

    def self.decode(s)
      Base64.urlsafe_decode64(s)
    end
  end
end
