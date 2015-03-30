require 'capybara/rspec'
require 'faker'

Capybara.run_server = false
Capybara.current_driver = :selenium
Capybara.app_host = "http://demo.avantcredit.com"

module SpecHelper

	def visit_page
		visit "/"
		click_link('apply-now-link')
	end

	def submit_data
		select_fields = [:customer_address_state, :person_date_of_birth_month, :person_date_of_birth_day, :person_date_of_birth_year, :income_income_type]
		form_data.each do |field, val|
			if select_fields.include? (field)
				select val, from: field
			else
				fill_in field, with: val
			end
		end
		# check :customer_consent_il_consumer_information if :customer_address_state == "IL"
		check :customer_electronic_communications_consent
	end

	def form_data
		@form_data = {
			person_first_name: Faker::Name.first_name,
			person_last_name: Faker::Name.last_name,
			customer_address_address_1: Faker::Address.street_address,
			customer_address_address_2: Faker::Address.building_number,
			customer_address_city: Faker::Address.city,
			customer_address_state: Faker::Address.state_abbr,
			customer_address_zip: Faker::Address.zip,
			person_date_of_birth_month: "Oct",
			person_date_of_birth_day: "25",
			person_date_of_birth_year: "1987",
			person_home_phone: Faker::PhoneNumber.phone_number,
			customer_email: Faker::Internet.email,
			customer_password: "secret123",
			customer_password_confirmation: "secret123",
			income_income_type: "Employed (Non-Military)",
			person_ssn: Faker::Number.number(9),
			income_monthly_net_income: "5000.00"
		}
	end

end