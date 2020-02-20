class SignUpController < ApplicationController
  
  def index
  end

  def information_first
    @user=User.new
  end

  def information_second
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:password_confirmation] = user_params[:password_confirmation]
    @user=User.new(
      nickname: session[:nickname], # sessionに保存された値をインスタンスに渡す
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation]
      
    )
    render '/sign_up/information_first' unless @user.valid_columns?(:nickname, :email, :password, :password_confirmation)
  end

  def information_third
    
    session[:last_name] = user_params[:last_name]
    session[:first_name] = user_params[:first_name]
    session[:last_name_kana] = user_params[:last_name_kana]
    session[:first_name_kana] = user_params[:first_name_kana]
    session[:birthdate_year] = user_params[:birthdate_year]
    session[:birthdate_mouth] = user_params[:birthdate_mouth]
    session[:birthdate_day] = user_params[:birthdate_day]
    @user = User.new(
      nickname: session[:nickname], # sessionに保存された値をインスタンスに渡す
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      last_name: session[:last_name], 
      first_name: session[:first_name], 
      last_name_kana: session[:last_name_kana], 
      first_name_kana: session[:first_name_kana], 
      birthdate_year: session[:birthdate_year],
      birthdate_mouth: session[:birthdate_mouth],
      birthdate_day: session[:birthdate_day],
    )
    # 仮で作成したインスタンスのバリデーションチェックを行う
    

      render '/sign_up/information_second' unless @user.valid_columns?(:last_name, :first_name, :last_name_kana, :first_name_kana, :birthdate_year, :birthdate_mouth, :birthdate_day)
  end

  def new
  end

  def create
    @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      last_name: session[:last_name], 
      first_name: session[:first_name], 
      last_name_kana: session[:last_name_kana],
      first_name_kana: session[:first_name_kana],
      birthdate_year: session[:birthdate_year],
      birthdate_mouth: session[:birthdate_mouth],
      birthdate_day: session[:birthdate_day],
      postal_code: user_params[:postal_code],
      building_name: user_params[:building_name],
      prefectures: user_params[:prefectures],
      city: user_params[:city],
      house_number: user_params[:house_number],
      building_name: user_params[:building_name],
      address_last_name: user_params[:address_last_name],
      address_first_name: user_params[:address_first_name],
      address_last_name_kana: user_params[:address_last_name_kana],
      address_first_name_kana: user_params[:address_first_name_kana],
    )
    if @user.save
      session[:id] = @user.id
      sign_in(:user, @user)
      redirect_to done_sign_up_index_path
    else
      render :information_third
    end
  end
  
  def done
    sign_in User.find(:id) unless user_signed_in?
  end

  private
    def user_params
      params.require(:user).permit(
        :nickname,
        :email,
        :password,
        :password_confirmation,
        :last_name,
        :first_name,
        :last_name_kana, 
        :first_name_kana, 
        :birthdate_year,
        :birthdate_mouth,
        :birthdate_day,
        :postal_code,
        :prefectures,
        :city,
        :house_number,
        :building_name,
        :address_last_name,
        :address_first_name,
        :address_last_name_kana,
        :address_first_name_kana,
      )
    end
  end

