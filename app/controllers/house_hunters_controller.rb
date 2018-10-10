class HouseHuntersController < ApplicationController
 def index
    @house_hunters = HouseHunter.all

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @house_hunters }
    end
  end
  


 def new
    @house_hunters = HouseHunter.new
  end
  
  def edit
    @house_hunter = HouseHunter.find(params[:id])
  end

  def create
    if(signup_params["confirm_password"] == signup_params["password"])
      myparams = signup_params
      myparams.delete("confirm_password")
      @house_hunters = HouseHunter.new(myparams)
      puts myparams
      puts @house_hunters
    if @house_hunters.save
      puts "saved"
      if (session[:user_type] == "admin")
        redirect_to '/homepage' , notice: 'House hunter was successfully created .'
      else
        redirect_to  root_path , notice: 'You have successfully signed up. Please login to continue .'
      end
    else
      render 'new'
    end
    else
      redirect_to  '/realtors/new' ,notice: 'Confirm password and new password does not match'
      end
  end
  
  def update
    @house_hunter = HouseHunter.find(params[:id])
    if @house_hunter.update(update_profile_params)
      if (session[:user_type] == "househunter")
      redirect_to "/homepage", notice: 'Your profile is successfully updated'
      else
        redirect_to "/users/show_all", notice: "The house hunter's profile is successfully updated !"
        end
    else
      render 'edit'
    end
  end

 def destroy
   @house_hunter = HouseHunter.find(params[:id])
   if  @house_hunter.destroy
     respond_to do |format|
       format.html { redirect_to "/users/show_all" , notice: 'House hunter profile was successfully deleted.' }
       format.json { head :no_content }
     end
   else
     redirect_to "/users/show_all" , notice: 'Your request cannot be processed .'
   end
 end

 def show
   @house_hunter = HouseHunter.find(params[:id])
   respond_to do |format|
     format.html # show.html.erb
     format.json { render json: @house_hunter }
   end
 end


  private
  def signup_params
    params.require(:house_hunter).permit(:email,  :password,  :name , :phone , :contact_method , :secret_question , :confirm_password)
  end

 def update_profile_params
   params.require(:house_hunter).permit(:contact_method, :name , :secret_question, :phone)
 end
end
