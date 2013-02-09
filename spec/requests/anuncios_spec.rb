#encoding: utf-8

#require "spec_helper" .spec --require spec_helper
require "capybara/rails"
require "capybara/rspec"

describe "Cadastro de anúncios" do
	context "Preenchendo formulário corretamente" do

		def autentica
			admin = User.new email: "admin@example.org",
			password: "12345678",
			password_confirmation: "12345678"

			admin.role = "admin"
			admin.save!

			visit "/users/sign_in"
			fill_in "Email", with: admin.email
			fill_in "Password", with: admin.password
			click_button "Sign in"
		end

		it "deveria criar e exibir o novo anúnico", js: true do
			autentica
			visit "/"

			page.find_by_id("crie_anuncio").click

			fill_in "Modelo",		with: "Fusca"
			fill_in "Marca", 		with: "Volks"
			fill_in "Descricao",	with: "Carrinho maroto"
			fill_in "Ano",			with: "1972"
			fill_in "Valor",		with: "2000"

			click_button "Create Anuncio"

			expect(page).to have_content "Fusca"
			expect(page).to have_content "Volks"
			expect(page).to have_content "Carrinho maroto"
			expect(page).to have_content "1972"
			expect(page).to have_content "R$ 2.000,00"
		end
	end
end