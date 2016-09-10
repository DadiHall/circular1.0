class AddFieldsToProfile < ActiveRecord::Migration
  def change
  	add_column :profiles, :user_id, :integer
    	add_column :profiles, :company_name, :string
    	add_column :profiles, :address, :string
    	add_column :profiles, :city, :string
    	add_column :profiles, :postalcode, :integer
    	add_column :profiles, :permit_publisher, :string
    	add_column :profiles, :permit_monitor, :string
    	add_column :profiles, :contact_person, :string
    	add_column :profiles, :contact_email, :string
    	add_column :profiles, :phone_number, :integer
    	add_column :profiles, :buisness_type, :string
    	add_column :profiles, :board_member, :text
    	add_column :profiles, :description, :text
    	add_column :profiles, :permit_duration, :datetime
  end
end
