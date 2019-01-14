class Entry < ApplicationRecord
  def self.import(file)
    return unless file

    CSV.foreach(file.path, headers: true) do |row|
      entry = Entry.find_by(firstname: row['firstname'], lastname: row['lastname'])
      if entry.present?
        entry.update(row.to_hash)
      else
        Entry.create row.to_hash
      end
    end
  end

  def self.search(search)
    if search
      where(["lastname LIKE ?", "%#{search}%"])
    else
      all
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
