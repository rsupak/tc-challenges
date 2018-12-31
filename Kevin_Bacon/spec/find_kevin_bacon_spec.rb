require '../find_kevin_bacon'

RSpec.describe FindKevinBacon, type: Class do

  let (:kevin_bacon) { Node.new("Kevin Bacon") }
  let (:lori_singer) { Node.new("Lori Singer") }
  let (:john_lithgow) { Node.new("John Lithgow") }
  let (:chris_penn) { Node.new("Chris Penn") }
  let (:matthew_mcconaughey) { Node.new("Matthew McConaughey") }
  let (:anne_hathaway) { Node.new("Anne Hathaway") }
  let (:zoe_saldanas) { Node.new("Zoe Saldanas") }
  let (:bill_paxton) { Node.new("Bill Paxton") }
  let (:tom_hanks) { Node.new("Tom Hanks") }
  let (:jeff_bridges) { Node.new("Jeff Bridges") }
  let (:julianne_moore) { Node.new("Julianne Moore") }
  let (:vin_diesel) { Node.new("Vin Diesel") }
  let (:matt_damon) { Node.new("Matt Damon") }
  let (:paul_giamatti) { Node.new("Paul Giamatti") }
  let (:ted_danson) { Node.new("Ted Danson") }
  let (:tim_roth) { Node.new("Tim Roth") }
  let (:al_pacino) { Node.new("Al Pacino") }
  let (:johnny_depp) { Node.new("Johnny Depp") }
  let (:joe_cross) { Node.new("Joe Cross") }
  let (:amy_badberg) { Node.new("Amy Badberg") }
  let (:merv_cross) { Node.new("Merv Cross") }
  let (:alec_baldwin) { Node.new("Alec Baldwin") }
  let (:kevin_spacey) { Node.new("Kevin Spacey") }
  let (:elizabeth_mcgovern) { Node.new("Elizabeth Mcgovern")}

  let (:graph) {FindKevinBacon.new(kevin_bacon)}

  before (:each) do
    kevin_bacon.film_actor_hash["FootLoose"] = [lori_singer, john_lithgow, chris_penn]
    bill_paxton.film_actor_hash["Apollo 13"] = [kevin_bacon, tom_hanks]
    tom_hanks.film_actor_hash["Saving Private Ryan"] = [paul_giamatti, ted_danson, matt_damon]
    john_lithgow.film_actor_hash["Interstellar"] = [matthew_mcconaughey, anne_hathaway, lori_singer]
    paul_giamatti.film_actor_hash["Donnie Brasco"] = [al_pacino, johnny_depp]
    joe_cross.film_actor_hash["Fat, Sick and nearly dead"] = [amy_badberg, merv_cross]
    al_pacino.film_actor_hash["Glengarry Glen Ross"] = [alec_baldwin, kevin_spacey]
    alec_baldwin.film_actor_hash["She's Having a Baby"] = [kevin_bacon, elizabeth_mcgovern]
  end

  describe "testing the node" do
    it "test node to read property" do
      expect(kevin_bacon.name).to eq("Kevin Bacon")
    end

    it "finds kevin back if he is in a movie - one degree" do
      expect{(graph.find_kevin_bacon(bill_paxton))}.to output("You found Kevin Bacon. Here's the list [\"Apollo 13\"]\n").to_stdout
    end

    it "finds kevin if he is associated with an actor in another film paul_giamatti => al_pacino => alec_baldwin => kevin_bacon" do
      expect{(graph.find_kevin_bacon(paul_giamatti))}.to output("You found Kevin Bacon. Here's the list [\"Donnie Brasco\", \"Glengarry Glen Ross\", \"She's Having a Baby\"]\n").to_stdout
    end

    it "has no relation to Kevin Bacon" do
      expect{(graph.find_kevin_bacon(joe_cross))}.to output("No relation to Kevin Bacon\n").to_stdout
    end
  end
end
