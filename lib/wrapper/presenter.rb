# encoding: utf-8

module Wrapper
  module Presenter
    extend ActiveSupport::Concern

    module ClassMethods
      ##
      #
      # Wrap an object as an presenter instance. The wrapped object will be stored and
      # available through +#resource+. If the given object responds to +#map+,
      # each item will be wrapped individually.
      #
      # Returns an instance of your presenter class or a collection of instances.
      #
      def wrap(object)
        if object.respond_to? :map
          object.map { |resource| wrap_instance(resource) }
        else
          wrap_instance(object)
        end
      end

      private
      def wrap_instance(resource)
        new(resource)
      end
    end

    def initialize(resource)
      @resource = resource
    end

    ##
    # Returns the original, wrapped +#resource+.
    #
    def resource
      @resource
    end

    ##
    # Returns the wrapped +#resource+'s class.
    #
    def model
      self.resource.class
    end

    ##
    # Compare +#self+ or +#resource+ against the given +other+.
    #
    def ==(other)
      super || resource == other
    end

    ##
    # Check if an instance method is defined either in the presenter or for on
    # the +#resource+.
    #
    def respond_to?(method)
      super || resource.respond_to?(method)
    end

    private
    def method_missing(method, *args, &block)
      if resource.respond_to?(method)
        resource.send(method, *args, &block)
      else
        super
      end
    end
  end
end
