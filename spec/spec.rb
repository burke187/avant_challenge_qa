require_relative 'spec_helper'

describe "submitting form", type: :feature do
	include SpecHelper

	scenario "Successfully submit form" do
		visit_page
		submit_data
		click_button('Agree and Get Your Rates')
	end
end