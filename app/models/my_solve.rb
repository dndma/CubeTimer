class MySolve < ApplicationRecord
  validates :time, :scramble, :presence => true
    class << self
    def create_element(number, mail = "stranger")
      create(time: number, scramble: mail)
    end
  end

end
