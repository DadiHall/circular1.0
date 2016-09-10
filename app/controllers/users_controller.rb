class UsersController < ApplicationController

  
  

	def index
		@users = User.all
    @users = User.order('created_at DESC').paginate(page: params[:page], per_page: 30)

    
	end

    def create
   
    end


	def show
   # @user = current_user
		@user = User.find(params[:id])
	  @users = User.order('created_at DESC').paginate(page: params[:page], per_page: 30)
    #@electro_total = current_user.electros.sum(:electricity_kwst) 
    #@paper = current_user.papers.build
    #@electro = current_user.electros.build
    #@hwater = current_user.hwaters.build
    #@cleaning = current_user.cleanings.build
    #@transport = current_user.transports.build

    #@papers = current_user.papers
    

	end

	def compare
		if current_user.profile
		#@user = User.find(params[:id])
		#@#users = User.friendships.friend(params[:id])
    @user = User.find_by(id: params[:to].to_i) if params[:to]

		@paper_weight_total_user = @user.papers.sum(:paper_weight) 
		@paper_weight_per_capita_user = @user.papers.sum(:paper_weight) / (@user.profile.staff) 
		@env_paper_weight_user = @user.papers.sum(:env_paper_weight)
		@env_paper_ratio_user = (@env_paper_weight_user / @paper_weight_total_user) * 100	

		@paper_tree_ratio_user = (@user.papers.sum(:paper_weight) / 1000) *15 
    	@paper_tree_co2_rescue_user = @paper_tree_ratio_user * (0.492)

    	#Rafmagn  
    	   @electro_total_user = @user.electros.sum(:electricity_kwst)
           @electro_total_per_capita_user = @user.electros.sum(:electricity_kwst) / @user.profile.staff 
           @electro_total_per_m2_user = @user.electros.sum(:electricity_kwst) / @user.profile.building_size
        #HotWater    
          @hwater_total_m3_user = @user.hwaters.sum(:hot_water_cubic_meter) 
           @hwater_total_m3_per_capita_user = @user.hwaters.sum(:hot_water_cubic_meter) /@user.profile.staff
           @hwater_m3_m2_ratio_user = @user.hwaters.sum(:hot_water_cubic_meter) / @user.profile.building_size   

        #Ræsting
           @cleaning_total_user = @user.cleanings.sum(:cleaning_liter)
           @cleaning_staff_ratio_user = @user.cleanings.sum(:cleaning_liter) / @user.profile.staff
           @cleaning_building_ratio_user = @user.cleanings.sum(:cleaning_liter) / @user.profile.building_size   

        #Ferðalog-bilar
           @transport_co2_km_user = @user.transports.sum(:transport_km) * (0.1404)
           @transport_co2_km_staff_ratio_user = @user.transports.sum(:transport_km) * (0.1404) / @user.profile.staff
           @transport_km_staff_ratio_user = @user.transports.sum(:transport_km) / @user.profile.staff
           @transport_km_user = @user.transports.sum(:transport_km)
        #Ferðalog-flug
          @transport_flight_co2_user = @user.transports.sum(:transport_flight_km) * (0.1722)   
          @transport_flight_co2_staff_ratio_user = @user.transports.sum(:transport_flight_km) * (0.1722) / @user.profile.staff
          @transport_flight_km_user = @user.transports.sum(:transport_flight_km) 
          @transport_flight_km_staff_ratio_user = @user.transports.sum(:transport_flight_km) / @user.profile.staff

        #Co2 vegna ferðalaga
          @co2_due_to_transport_user = (@transport_flight_co2 + @transport_co2_km) / 1000

          @tree_count_rescue_user = @co2_due_to_transport * 492    
	else
		redirect_to user_path
	end
	end

 


end