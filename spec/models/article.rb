require 'active_model'

class Article
  include ActiveModel::Serializers::JSON

  attr_accessor :title, :description

  def initialize(attributes = {})
    attributes.each do |attribute_name, value|
      self.send("#{attribute_name}=", value)
    end
  end

  def attributes
    %w[title description].inject({}) do |hash, name|
      hash[name] = send(name)
      hash
    end
  end

  private
  def a_private_method
    "Fancy stuff!"
  end
end
