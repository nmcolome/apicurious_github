class Following
  attr_reader :login,
              :avatar_url,
              :url

  def initialize(attrs)
    @attrs = attrs
    @avatar_url = attrs[:avatar_url]
    @login = attrs[:login]
    @bio = attrs[:url]
  end

  private
    attr_reader :attrs
end