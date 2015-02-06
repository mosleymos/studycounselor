# Base Presenter for the application. All presenter inherits from this class
# A Presenter needs to initialize with the model for which it contains the logic for and the view template where it will be used
class BasePresenter
  # Initialization of the Presenter
  def initialize(object, template)
    @object = object
    @template = template
  end

  # This method permits to create a new method. Thus we can call @user and it will return @object
  def self.presents(name)
    define_method(name) do
      @object
    end
  end

  # Convention for Presenter. The method h returns the template. It is useful when we want to use View method
  def h
    @template
  end

  # If a method is missing try to delegate it top the template. We can nearly suppress the H method then
  def method_missing(*args, &block)
    @template.send(*args, &block)
  end
end