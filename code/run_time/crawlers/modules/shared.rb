# To change this template, choose Tools | Templates
# and open the template in the editor.

module Shared

  PROVIDER1 = "provider_1"
  PROVIDER2 = "provider_2"

  def select_preparation

    @alternate_car = false
    case @kte.provider

    when PROVIDER1, PROVIDER2
#      click_button_item "contentSubView:vehicleForm:chooseAuto:downbox_f"
      kw = "#{get("@kw")}"
      kw ? type_keys("preparations", kw) : click_button_item("contentSubView:vehicleForm:chooseAuto:downbox_f")
      sleep @sleep*2
      @last_element, @last_value = "preparations", get("@set_up").gsub("regexpi:","")
      page.focus(@last_element)

      item = "//span/ul/li"
      @last_value.split("|").each do |regex|
        model_set_up = find_array_element(item, regex, 1)
        @last_value = regex
        @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => now's clicked item element: [#{item}]"} if @matched
        click_button_item(model_set_up, @last_value) if @matched
        break if @matched
        @alternate_car = true
        @logger.warn("#{__FILE__} => #{method_name}") {"#{@kte.company} => First Model or Set-up not matched for profile [#{@kte.profile}] and record [#{@record}]! Using secondary regex value [#{@last_value}]"}
      end
      @matched ? @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => element value: [#{page.get_value("preparations")} with [#{@last_value}]"} : assert(page.get_value(id) =~ /#{@last_value}/i, page.get_value("preparations").inspect)
      
#      kw = "#{get("@kw")} KW"
#      type_keys("preparations", get("@set_up"))
#      sleep @sleep*2
#      @last_element, @last_value = "//span/ul/li", "#{kw}"
#      unless is_present?(@last_element)
#        get("@set_up").size.times { |i| page.key_press("preparations","\\8" ) }
#        type_keys("preparations", @last_value)
#      end
#      click_button_item "//span/ul/li"
#      type_keys(@last_element, " ")

    else
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

    end

    ensure
      store_parameter(:preparation, page.get_value("preparations")) if @store_params

  end

  def select_model_set_up(id, value)
    @last_element, @last_value = id, (value =~ /index=/i)? value : value.split("|")[0]
    @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => now's selected option element: [#{@last_element}] with label value: [#{@last_value}]"}

    @alternate_car = false
    begin
      page_select(@last_element, "label=#{@last_value}")
    rescue Exception => ex
      case value.split("|").size
        when 1
          raise ex
        else
          @last_value = "label=#{value.split("|")[1]}"
          page_select @last_element, @last_value
          @alternate_car = true
          @logger.warn("#{__FILE__} => #{method_name}") {"#{@kte.company} => First Model or Set-up not matched for profile [#{@kte.profile}] and record [#{@record}]! Using secondary regex value [#{@last_value}] with selected label [#{page.get_selected_label(@last_element)}]"}
      end
    end
  end

  def select_max(id, value)
    @last_element, @last_value = id, (value =~ /index=/i)? value : "label=#{value}"
    @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => now's selected option element: [#{@last_element}] with label value: [#{@last_value}]"}

    begin
      page_select(@last_element, "label=#{@last_value}")
      assert_equal page.get_selected_label(@last_element), value unless value =~ /regexpi/i unless value =~ /index=/i
    rescue Exception => ex
      loc_array  = []
      loc_array = page.get_select_options(@last_element)
      page_select @last_element, "index=#{loc_array.size - 1}"
      @logger.warn("#{__FILE__} => #{method_name}") {"#{@kte.company} => Indemnity limit not matched for profile [#{@kte.profile}] and record [#{@record}]! Using max available value [index=#{loc_array.size - 1}] with selected label #{page.get_selected_label(@last_element)}"}
    end
  end

  def store_parameter(parameter, value)

    case value
      when nil
        @logger.warn("#{__FILE__} => #{method_name}") {"#{@kte.company} => rate parameter: [#{parameter}] has a nil value: [#{value}]"}
      else
        case parameter
          when :make
            @kte.car_make = value
          when :model
            @alternate_car ? @kte.car_model = "@ALTERNATE CAR MODEL@ - #{value}" : @kte.car_model = value
          when :preparation
            @alternate_car ? @kte.car_preparation = "@ALTERNATE CAR PREPARATION@ - #{value}" : @kte.car_preparation = value
          when :job
            @kte.job = value
          else
        end
    end
  end

  def find_array_element(e, regex, base)

    i = base
    item = "#{e}[#{i}]"
    while page.is_element_present(item) == true
      text = page.get_text(item)
      @matched = true if text =~ /#{regex}/i
      break if text =~ /#{regex}/i
      i += 1
      item = "#{e}[#{i}]"
    end
    return item

  end

  def find_span_element(e, regex, base)

    i = base
    item = "#{e.gsub('?',i.to_s)}"
    while page.is_element_present(item) == true
      text = page.get_text(item)
      @matched = true if text =~ /#{regex}/i
      break if text =~ /#{regex}/i
      i += 1
      item = "#{e.gsub('?',i.to_s)}"
    end
    return item

  end

  def fix_zip_code(zip_code)

    zip_code_hash = {}
    zip_code_hash = {
      '15121' => '15100',
      '29121' => '29100',
      '38121' => '38100',
      '41121' => '41100',
      '42121' => '42100',
      '43121' => '43100',
      '44121' => '44100',
      '47121' => '47100',
      '47521' => '47023',
      '47921' => '47900',
      '48121' => '48100',
      '61121' => '61100',
      '71121' => '71100',
      '74121' => '74100',
      }

    zip_code_hash[zip_code]? fixed_zip_code = zip_code_hash[zip_code] : fixed_zip_code = zip_code
    return fixed_zip_code

  end

end
