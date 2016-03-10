class Author < ActiveRecord::Base
  # 1 - Scopes
  scope :active, -> { where(status: true) }

  # 2 - Constants

  # 3 - Association
  has_many :books, dependent: :destroy

  # 4 - Validation
  validates :full_name, presence:     {:message => "khong duoc bo trong"},
                        length:       { within: 6..50, :too_short => "ngan qua", :too_long => "qua dai" }

  validates :birthday,  presence:     {:message => "khong duoc bo trong"},
                        timeliness:   {type: :datetime}

  validates :email, presence:         {:message => "khong duoc bo trong"},
                    :format =>        { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, :message => "khong hop le" }

  validates :phone, presence:         {:message => "khong duoc bo trong"},
                    length:           {within: 6..20, :too_short => "ngan qua", :too_long => "qua dai"},
                    :numericality =>  {:message => "khong phai so"}

  # 5 - Callback
  # 6 - Other macros (devise, ...)

end
