module ApplicationHelper
  def yes_or_no(test)
    test.nil? ? "" : test ? "Y" : "N"
  end

  def price(price)
    "$%d" % [price]
  end

  def extra_prices(prices={})
    pieces = []
    prices.keys.sort.each do |key|
      val = prices[key]
      pieces << price(val) + key.to_s if val
    end

    pieces.size > 0 ? " (%s)" % [pieces.join('/')] : ""
  end

  def pet_price(model, pet)
    flag = model.send(pet)

    yes_or_no(flag) + if flag
      deposit = model.send(pet.to_s + "_deposit")
      rent = model.send(pet.to_s + "_rent")
      " " + extra_prices(:dep => deposit, :rent => rent)
    else
      ""
    end
  end

  def amenity_price(model, amenity)
    flag = model.send(amenity)

    yes_or_no(flag) + if flag
      " " + extra_prices(:dep => model.send(amenity.to_s + "_rent"))
    else
      ""
    end
  end

  def google_maps_link(text, location)
    url = "http://maps.google.com/?q=" + CGI.escape(location)
    link_to text, url unless text.blank?
  end
end
