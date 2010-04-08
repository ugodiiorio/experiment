# To change this template, choose Tools | Templates
# and open the template in the editor.

module Shared

  PROVIDER1 = "provider_1"
  PROVIDER2 = "provider_2"

  def select_preparation

    case @kte.provider

    when PROVIDER1
      kw = "#{get("@kw")} KW"
      type_keys("preparations", get("@set_up"))
      sleep @sleep*2
      @last_element, @last_value = "//span/ul/li", "#{kw}"
      unless is_present?(@last_element)
        get("@set_up").size.times { |i| page.key_press("preparations","\\8" ) }
        type_keys("preparations", @last_value)
      end
      click_button_item "//span/ul/li"

    when PROVIDER2
      cv_kw = "#{get("@cv")} CV - #{get("@kw")} KW"
      type_keys("preparations", get("@set_up"))
      sleep @sleep*2
      @last_element, @last_value = "//span/ul/li", "#{cv_kw}"
      unless is_present?(@last_element)
        get("@set_up").size.times { |i| page.key_press("preparations","\\8" ) }
        type_keys("preparations", @last_value)
        sleep @sleep
      end
      click_button_item "//span/ul/li"

    else
      nil
    end

  end

end
