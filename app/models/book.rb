class Book < ActiveRecord::Base
  # 1 - Scopes
  scope :published, -> { where(:published => true) }

  # 2 - Constants

  # 3 - Association
  belongs_to :author

  # 4 - Validation
  validates :title, presence: {:message => "khong duoc bo trong"}
  validates :description, presence: {:message => "khong duoc bo trong"}

  # 5 - Callback
  # 6 - Other macro

end
