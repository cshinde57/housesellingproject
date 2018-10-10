class InquiriesController < ApplicationController
  def new
    @house_id = params[:id]
    @house_hunter_id = session[:id][0]
    @inquiry = Inquiry.new
  end

  def create
    @inquiry = Inquiry.new(inquiry_params)
    if @inquiry.save
      redirect_to homepage_url , notice: 'Inquiry was successfully sent'
    else
      @house_id = @inquiry["house_id"]
      @house_hunter_id = @inquiry["house_hunter_id"]
      render 'new'
    end
    end


    def new_reply
      @inquiry_id = params[:id]
      @inquiry = Inquiry.find(@inquiry_id)
      @reply = ReplyToInquiry.new

    end

    def create_reply
      @reply = ReplyToInquiry.new(reply_params)
      @inquiry_id = params[:id]
      @reply["inquiry_id"] = @inquiry_id
        if @reply.save
         redirect_to "/inquiries/show_all_for_company" , notice: 'Reply for the inquiry was successfully sent'
        else
          redirect_to '/inquiries/new_reply/'+ @inquiry_id.to_s , notice: 'Please enter the reply !!!'
        end
    end




  def show_all_for_company
    @realtor = Realtor.find_by(id: session[:id] )
    @real_estate_company_id  = (@realtor["real_estate_company_id"]).to_s
    sql = "select * from inquiries where house_id in ( select house_id from houses where real_estate_company_id = "+@real_estate_company_id +" )"
    puts sql
    #Model.connection.select_all('sql').to_hash
    @inquiries = Inquiry.connection.select_all(sql).to_hash
  end


  def index
    @inquiries = Inquiry.all
    puts @inquiries
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @inquiries }
    end
  end

  def current_user_inquiries
    @inquiries = Inquiry.where(house_hunter_id: session[:id][0] ).order(created_at: :desc)
    puts @inquiries
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @inquiries }
    end
  end

  def edit
    @inquiry = Inquiry.find(params[:id])
  end

  def update
    @inquiry = Inquiry.find(params[:id])
    respond_to do |format|
      if @inquiry.update_attributes(inquiry_params)
        format.html { redirect_to @inquiry, notice: 'Inquiry was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @inquiry.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @inquiry = Inquiry.find(params[:id])
    if  @inquiry.destroy
      if(session[:user_type] == "realtor")
      redirect_to '/inquiries/show_all_for_company' , notice: 'Inquiry was successfully deleted.'
      elsif (session[:user_type] == "admin")
        redirect_to '/inquiries/index' , notice: 'Inquiry was successfully deleted.'
      elsif (session[:user_type] == "househunter")
        redirect_to '/inquiries/current_user_inquiries' , notice: 'Inquiry was successfully deleted.'
      end
    else
      redirect_to homepage_url , notice: 'Unable to process your request'
    end
  end

  def show
    @inquiry = Inquiry.find(params[:id])
    if !@inquiry.nil?
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @inquiry }
    end
    end
  end




  private
  def inquiry_params
    params.require(:inquiry).permit(:house_id,  :message_content,  :subject , :house_hunter_id )
  end

    def reply_params
      params.require(:reply).permit(:reply )
    end

  end
