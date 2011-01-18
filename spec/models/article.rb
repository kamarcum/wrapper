class Article
  attr_accessor :title, :description

  def initialize(attributes = {})
    attributes.each do |attribute_name, value|
      self.send("#{attribute_name}=", value)
    end
  end

  private
  def a_private_method
    "Fancy stuff!"
  end
end
