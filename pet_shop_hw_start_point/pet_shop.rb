
def pet_shop_name(pet_shop)
  return pet_shop[:name]
end

def total_cash(pet_shop)
  return pet_shop[:admin][:total_cash]
end

def add_or_remove_cash(pet_shop, cash)
  return pet_shop[:admin][:total_cash] += cash
end

def pets_sold(pet_shop)
  return pet_shop[:admin][:pets_sold]
end

def increase_pets_sold(pet_shop, sold)
  return pet_shop[:admin][:pets_sold] += sold
end

def stock_count(pet_shop)
  return pet_shop[:pets].count()
end

def pets_by_breed(pet_shop, breed)
  result = []
  for pet in pet_shop[:pets]
    if pet[:breed] == breed
      result.push(pet[:breed])
    end
  end
  return result
end

  def find_pet_by_name(pet_shop, name)
    for pet in pet_shop[:pets]
      return pet if pet[:name] == name
    end
    nil
  end

  def remove_pet_by_name(pet_shop, name)
    pet = find_pet_by_name(pet_shop, name)
    index = pet_shop[:pets].index(pet)
    pet_shop[:pets].delete_at(index)
    # pet_shop[:pets].delete(find_pet_by_name(pet_shop, name))
  end

  def add_pet_to_stock(pet_shop, new_pet)
    pet_shop[:pets] << new_pet
  end

  def customer_cash(customer)
    return customer[:cash]
  end

  def remove_customer_cash(customer, amount)
    customer[:cash] -= amount
  end

  def customer_pet_count(customer)
    return customer[:pets].count()
  end

  def add_pet_to_customer(customer, new_pet)
    customer[:pets].push(new_pet)
  end

  def customer_can_afford_pet(customer, new_pet)
    if customer[:cash] >= new_pet[:price]
      return true
    end
  false
  end

  def sell_pet_to_customer(pet_shop, pet, customer)
    if pet == nil
      return
    end
    # return nil unless pet 
    if customer_can_afford_pet(customer, pet) == true
      remove_customer_cash(customer, pet[:price])
      add_pet_to_customer(customer, pet)
      add_or_remove_cash(pet_shop, pet[:price])
      remove_pet_by_name(pet_shop, pet[:name])
      increase_pets_sold(pet_shop, 1)
    end
  end
