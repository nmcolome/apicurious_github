class Org
  attr_reader :avatar_url,
              :html_url

  def initialize(attrs)
    @attrs = attrs
    @avatar_url = attrs[:avatar_url]
    @html_url = attrs[:html_url]
  end

  private
    attr_reader :attrs
end