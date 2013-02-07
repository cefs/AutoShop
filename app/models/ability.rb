class Ability
	include CanCan::Ability

	def initialize(user)
		if user.role == "admin"
			can [:aprovar], Anuncio
		end
	end
end