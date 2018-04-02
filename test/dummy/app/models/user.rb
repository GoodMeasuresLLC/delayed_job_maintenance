class User < ApplicationRecord
  def process!
    self.update_attributes(:processed => true)
  end
end
