class Entry < ApplicationRecord
  validates :firstname, presence: true,
                        length: { minimum: 2, maximum: 20 }
  validates :lastname, presence: true,
                       length: { minimum: 2, maximum: 20 }
  validates :phone, presence: true, 
                    numericality: { only_integer: true },
                    length: { minimum: 10, maximum: 10 }
  validates :email, presence: true,
                    format: { with: URI::MailTo::EMAIL_REGEXP },
                    length: { maximum: 30 }
end
