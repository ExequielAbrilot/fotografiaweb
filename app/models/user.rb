class User < ActiveRecord::Base
  has_many :compromisso 
  has_many :authentications, :dependent => :delete_all  	
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:omniauthable,:timeoutable

  validates :primer_nombre, presence: { message: " No puede estar en blanco"}, confirmation: true
  validates :segundo_nombre, presence: { message: " No puede estar en blanco"}, confirmation: true
  validates :apellido, presence: { message: " No puede estar en blanco"}, confirmation: true
  validates_inclusion_of :is_female, :in => %w(Mujer Hombre),:message => " No puede estar en blanco"


  
end
