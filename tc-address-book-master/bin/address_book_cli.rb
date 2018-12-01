# frozen_string_literal: true

#
# Copyright (c) 2018 Topcoder, Inc. All rights reserved.
#

require './lib/address_book'

database = AddressBook::Database.new
@menu = AddressBook::Menu.new(database)

loop do
  @menu.select_option
end
