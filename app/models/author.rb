class Author < ActiveRecord::Base

  has_many :books, dependent: :destroy

  validates :full_name, presence: {:message => "khong duoc bo trong"},
                        length: { within: 6..50, :too_short => "ngan qua", :too_long => "qua dai" }

  validates :birthday,  presence: {:message => "khong duoc bo trong"},
                        timeliness: {type: :datetime}

  validates :email, presence: {:message => "khong duoc bo trong"},
                    :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, :message => "khong hop le" }

  validates :phone, presence: {:message => "khong duoc bo trong"},
                    length: {within: 6..20, :too_short => "ngan qua", :too_long => "qua dai"},
                    :numericality => {:message => "khong phai so"}

  scope :status, -> { where(status: true) }


end
