class Profile < ActiveRecord::Base
	belongs_to :user

		BUISNESS_TYPES = [['Orkuiðnaður'], ['Framleiðsla og vinnsla málma'], ['Jarðefnaiðnaður'], ['Efnaiðnaður'], ['Úrgangsstarfsemi'], ['Verslun/þjónusta'], ['Önnur starfsemi'], ['Annað']]

	
end
