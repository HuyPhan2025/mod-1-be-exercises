require './lib/dish'

RSpec.describe Dish do
  it "exists and have attributes" do
    dish = Dish.new("Couscous Salad", :appetizer)

    expect(dish).to be_an_instance_of(Dish)
    expect(dish.name).to eq("Couscous Salad")
    expect(dish.category).to eq(:appetizer)
  end
end