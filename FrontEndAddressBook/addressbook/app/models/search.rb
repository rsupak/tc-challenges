class Search < ApplicationRecord
  def search_entries
    entries = Entry.all

    entries = entries.where(['firstname LIKE ?', "%#{firstname}%"]) if firstname.present?
    entries = entries.where(['lastname LIKE ?', "%#{lastname}%"]) if lastname.present?
    entries = entries.where(['phone LIKE ?', "%#{phone}%"]) if phone.present?
    entries = entries.where(['email LIKE ?', "%#{email}%"]) if email.present?

    entries
  end
end
