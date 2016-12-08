class OrderDecorator < Draper::Decorator
  # delegate_all

  def paying_methods
    object.class.paying_methods.hash.keys.map(&:humanize)
  end
end
