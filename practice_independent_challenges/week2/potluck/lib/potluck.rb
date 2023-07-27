class Potluck
  attr_reader :date, :dishes

  def initialize(date)
    @date = date
    @dishes = []
  end

  def add_dish(dish)
    @dishes.push(dish)
  end

  def get_all_from_category(category)
    @dishes.select do |dish|
      dish.category == category
    end
  end

  def menu
    app_array = get_all_from_category(:appetizer).map do |dish|
      dish.name
    end.sort

    entries_array = get_all_from_category(:entre).map do |dish|
      dish.name
    end.sort

    desserts_array = get_all_from_category(:dessert).map do |dish|
      dish.name
    end.sort

    {
      appetizers: app_array,
      entres: entries_array,
      desserts: desserts_array
    }
  end

  def ratio(category)
    (get_all_from_category(category).size.to_f / @dishes.size) * 100
  end
end