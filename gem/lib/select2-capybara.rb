require 'capybara/rspec'

module Capybara
  module Select2
    def select2(value, options = {})
      page.find("#s2id_#{options[:from]}").click

      if options.fetch(:multiple, false)
        find(:xpath, "//body").find(".select2-container-multi .select2-choices .select2-search-field input").set(value)
      else
        find(:xpath, "//body").find(".select2-with-searchbox input.select2-input").set(value)
      end

      page.execute_script(%|$("input.select2-input:visible").keyup();|)
      find(:xpath, "//body").find(".select2-results li", text: value).click
    end
  end
end
