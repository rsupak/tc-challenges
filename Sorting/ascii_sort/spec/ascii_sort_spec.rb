require './lib/ascii_sort'

describe "#ascii_sort" do
  it "moves the largest ascii value to the end of the array" do
    expect( ascii_sort(["James","Kenny","Christine","Abby","Alexis","kenny"]) ).to end_with "kenny"
  end

  it "moves the smallest ascii value to the front of the array" do
    expect( ascii_sort(["James","Kenny","Christine","Abby","Alexis","$$$"]) ).to start_with "$$$"
  end

  it "handles an empty array" do
    expect( ascii_sort([]) ).to eq []
  end

  it "handles an array of length one" do
    expect( ascii_sort(["Kenny"]) ).to eq ["Kenny"]
  end

  let (:sorted_array) { ["#$#","$$$","Abby","Alexis","Christine","James","Kenny","kenny"] }
  let (:shuffled_array) { sorted_array.shuffle }

  it "sorts the array from lowest ASCII to greatest" do
    expect( ascii_sort(["James","Kenny","Christine","Abby","Alexis","kenny","$$$","#$#"]) ).to eq ["#$#","$$$","Abby","Alexis","Christine","James","Kenny","kenny"]
    expect( ascii_sort(shuffled_array) ).to eq sorted_array
  end
end 
