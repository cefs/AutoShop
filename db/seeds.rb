#encoding:utf-8

	#CRIANDO USUÁRIO ADMIN
	user = User.new nome: "Administrador", email: "admin@example.org", password: "admin123"
	user.role = "admin"

	unless user.save
	 	user.errors.full_messages.each do |msg|
	 		puts msg
	 	end
	else
		puts " :::::::::::::::::::::::::::::::::::::::: "
		puts " :: 1 USUÁRIO ADMINSITRADOR DE EXEMPLO :: "
		puts " :::::::::::::::::::::::::::::::::::::::: "

		puts "email: #{user.email} e password: #{user.password}"	
	end


	#CRIANDO 3 MARCAS
	puts " ::::::::::::::::::::::::::::::::::::::: "
	puts " :: 3 MARCAS DE EXEMPLO FORAM CRIADAS :: "
	puts " ::::::::::::::::::::::::::::::::::::::: "


	["Fiat","Ford","Wolks"].each do |item|
		Marca.create nome: "#{item}"
	end


	#CRIANDO 3 ANÚNCIOS
	puts " ::::::::::::::::::::::::::::::::::::::::: "
	puts " :: 3 ANÚNCIOS DE EXEMPLO FORAM CRIADOS :: "
	puts " ::::::::::::::::::::::::::::::::::::::::: "

	i = 0
	["Uno","Focus","Gol"].each do |item|
		i = i+1
		anuncio = Anuncio.new modelo: "#{item}", ano: "2013", valor: 2000, descricao:"Conservado", marca_id: i
		anuncio.aprovado = true
		anuncio.save
	end	

