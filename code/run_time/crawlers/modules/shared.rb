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

  def select_model_set_up(id, value)
    @last_element, @last_value = id, (value =~ /index=/i)? value : value.split("|")[0]
    @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => now's selected option element: [#{@last_element}] with label value: [#{@last_value}]"}

    begin
      page_select(@last_element, "label=#{@last_value}")
    rescue Exception => ex
      case value.split("|").size
        when 1
          raise ex
        else
          @last_value = "label=#{value.split("|")[1]}"
          page_select @last_element, "#{@last_value}"
          @logger.warn("#{__FILE__} => #{method_name}") {"#{@kte.company} => First Model or Set-up not matched! Using secondary regex value"}
      end
    end
  end

end
