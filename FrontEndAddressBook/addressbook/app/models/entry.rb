class Entry < ApplicationRecord
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Entry.create! row.to_hash
    end
  end

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
