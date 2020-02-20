class User < ApplicationRecord
  require 'valid_columns'
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_KATAKANA_REGEX = /\A[\p{katakana}\p{blank}ー－]+\z/
  
  

  validates :nickname,                presence: true, length: {maximum: 12}                                                                       
  validates :email, {presence: true,format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}}
  validates :password,                presence: true, length: {minimum: 7, maximum: 12}                                               
  validates :password_confirmation,   presence: true, length: {minimum: 7, maximum: 12}                                               


  validates :last_name,               presence: true, format: /\A[一-龥ぁ-ん]\z/                                                
  validates :first_name,              presence: true, format: /\A[一-龥ぁ-ん]\z/                                  
  validates :last_name_kana,          presence: true, format: /\A[ァ-ヶー－]+\z/                                                
  validates :first_name_kana,         presence: true, format: /\A[ァ-ヶー－]+\z/                                    
  validates :birthdate_year,          presence: true                                                                                                                    
  validates :birthdate_mouth,         presence: true                                                                                                                     
  validates :birthdate_day,           presence: true                                                                                                                     

  validates :postal_code,             presence: true, format: /\A^\d{3}-\d{4}$\z/                                                                                                             
  validates :prefectures,             presence: true                                                       
  validates :city,                    presence: true                                                   
  validates :house_number,            presence: true                                                       
  validates :address_last_name,       presence: true, format: /\A[一-龥ぁ-ん]/                              
  validates :address_first_name,      presence: true, format: /\A[一-龥ぁ-ん]/                              
  validates :address_last_name_kana,  presence: true, format: /\A[ァ-ヶー－]+/                             
  validates :address_first_name_kana, presence: true, format: /\A[ァ-ヶー－]+/                            
  has_many :cards
  has_many :products
  has_many :comments
end