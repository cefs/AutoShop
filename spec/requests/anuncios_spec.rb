#encoding: utf-8

require "spec_helper"
require "capybara/rails"
require "capybara/rspec"

describe "Cadastro de anúncios" do
	context "Preenchendo formulário corretamente" do
		it "deveria criar e exibir o novo anúnico", js: true do
			admin = User.new email: "admin@example.org",
							 password: "12345678",
							 password_confirmation: "12345678"
			admin.role = "admin"
			admin.save!

			visit "/users/sign_in"
			fill_in "Email", with: "admin@example.org"
			fill_in "Password", with: "12345678"
			click_button "Sign in"

			expect(page).to have_content "Signed in successfully"
		end


	end
end