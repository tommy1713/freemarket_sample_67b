class SignUpController < ApplicationController
  before_action :validates_information_first, only: :information_second
  before_action :validates_information_second, only: :create

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
    @user = User.new
  end
    
  def validates_information_first
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:password_confirmation] = user_params[:password_confirmation]
    @user=User.new(
      nickname: session[:nickname], # sessionに保存された値をインスタンスに渡す
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      
    )
    render '/sign_up/information_first' unless @user.valid?
  end



  def validates_information_second
    # step2で入力された値をsessionに保存
    session[:last_name] = user_params[:last_name], 
    session[:first_name] = user_params[:first_name], 
    session[:last_name_kana] = user_params[:last_name_kana], 
    session[:first_name_kana] = user_params[:first_name_kana], 
    session[:birthdate_year] = user_params[:birthdate_year],
    session[:birthdate_mouth] = user_params[:birthdate_mouth],
    session[:birthdate_day] = user_params[:birthdate_day],
    # バリデーション用に、仮でインスタンスを作成する
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
      render '/sign_up/information_second' unless @user.valid?
  end  
  
  def new
    
  end
  def create
    session[:last_name] = user_params[:last_name], 
    session[:first_name] = user_params[:first_name], 
    session[:last_name_kana] = user_params[:last_name_kana], 
    session[:first_name_kana] = user_params[:first_name_kana], 
    session[:birthdate_year] = user_params[:birthdate_year],
    session[:birthdate_mouth] = user_params[:birthdate_mouth],
    session[:birthdate_day] = user_params[:birthdate_day],

    @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      last_name: user_params[:last_name], 
      first_name: session[:first_name], 
      last_name_kana: session[:last_name_kana], 
      first_name_kana: session[:first_name_kana],
      birthdate_year: session[:birthdate_year],
      birthdate_mouth: session[:birthdate_mouth],
      birthdate_day: session[:birthdate_day]
    )
    if @user.save
      session[:id] = @user.id
      redirect_to done_sign_up_index_path
    else
      render :information_first
    end
  end
  def done
    sign_in User.find(1) unless user_signed_in?
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
      )
    end
  end

