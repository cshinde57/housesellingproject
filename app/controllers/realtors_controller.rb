class RealtorsController < ApplicationController




  def new
    @realtor = Realtor.new
  end

  def edit
    @realtor = Realtor.find(params[:id])
  end


    def create
      if(signup_params["confirm_password"] == signup_params["password"])
        myparams = signup_params
        myparams.delete("confirm_password")
        @realtor = Realtor.new(myparams)
       if @realtor.save
         if (session[:user_type] == "admin")
           redirect_to '/homepage' , notice: 'Realtor was successfully created .'
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
    @realtor = Realtor.find(params[:id])
      if @realtor.update_attributes(update_profile_params)
        if (session[:user_type] == "realtor")
        redirect_to "/homepage", notice: 'Your profile is successfully updated'

        else
          redirect_to "/users/show_all", notice: "The realtor's profile is successfully updated !"
        end

      else
        render action: "edit"
      end

  end

  def show
  end
  def index
    @realtor = Realtor.all

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @realtor }
    end
  end

  def edit_company
  end
  def save_company
    @realtor = Realtor.find_by(id: session[:id])
    puts @realtor.email
    puts params[:company_id]
    puts "1"
    hash = params.require(:company).permit(:company_id)
    @realtor.real_estate_company_id = hash["company_id"]
    if @realtor.save
      redirect_to "/homepage", alert: "Company updated!"
    end

  end

  def destroy
    @realtor = Realtor.find(params[:id])
    if  @realtor.destroy
      respond_to do |format|
        format.html { redirect_to "/users/show_all" , notice: 'Realtor profile was successfully deleted.' }
        format.json { head :no_content }
      end
    else
      redirect_to "/users/show_all" , notice: 'Your request cannot be processed .'
    end
  end

  def show
    @realtor = Realtor.find(params[:id])
    puts @realtor
    puts "aru"
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @realtor }
    end
  end

  private
  def signup_params
    params.require(:realtor).permit(:email,  :password,  :name , :phone , :secret_question , :confirm_password)
  end

  def update_profile_params
    params.require(:realtor).permit(:real_estate_company_id, :name , :phone, :secret_question)
  end
end
