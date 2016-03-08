class Book < ActiveRecord::Base
  belongs_to :author

  validates :title, presence: {:message => "khong duoc bo trong"}
  validates :description, presence: {:message => "khong duoc bo trong"}

  scope :published, -> { where(:published => true) }

end
