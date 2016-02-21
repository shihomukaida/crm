class Company < ActiveRecord::Base
  has_many :customers
  /複数形であることに注意/
end
