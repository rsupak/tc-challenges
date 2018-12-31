require_relative 'find_kevin_bacon'

kevin_bacon = Node.new("Kevin Bacon")
lori_singer = Node.new("Lori Singer")
john_lithgow = Node.new("John Lithgow")
chris_penn = Node.new("Chris Penn")
matthew_mcconaughey = Node.new("Matthew McConaughey")
anne_hathaway = Node.new("Anne Hathaway")
zoe_saldanas = Node.new("Zoe Saldanas")
bill_paxton = Node.new("Bill Paxton")
tom_hanks = Node.new("Tom Hanks")
jeff_bridges = Node.new("Jeff Bridges")
julianne_moore = Node.new("Julianne Moore")
vin_diesel = Node.new("Vin Diesel")
matt_damon = Node.new("Matt Damon")
paul_giamatti = Node.new("Paul Giamatti")
ted_danson = Node.new("Ted Danson")
tim_roth = Node.new("Tim Roth")
al_pacino = Node.new("Al Pacino")
johnny_depp = Node.new("Johnny Depp")
joe_cross = Node.new("Joe Cross")
amy_badberg = Node.new("Amy Badberg")
merv_cross = Node.new("Merv Cross")
alec_baldwin = Node.new("Alec Baldwin")
kevin_spacey = Node.new("Kevin Spacey")
elizabeth_mcgovern = Node.new("Elizabeth Mcgovern")


kevin_bacon.film_actor_hash["FootLoose"] = [lori_singer, john_lithgow, chris_penn]
bill_paxton.film_actor_hash["Apollo 13"] = [kevin_bacon, tom_hanks]
tom_hanks.film_actor_hash["Saving Private Ryan"] = [paul_giamatti, ted_danson, matt_damon]
john_lithgow.film_actor_hash["Interstellar"] = [matthew_mcconaughey, anne_hathaway, lori_singer]
paul_giamatti.film_actor_hash["Donnie Brasco"] = [al_pacino, johnny_depp]
joe_cross.film_actor_hash["Fat, Sick and nearly dead"] = [amy_badberg, merv_cross]
al_pacino.film_actor_hash["Glengarry Glen Ross"] = [alec_baldwin, kevin_spacey]
alec_baldwin.film_actor_hash["She's Having a Baby"] = [kevin_bacon, elizabeth_mcgovern]
