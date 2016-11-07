class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :confirmable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :encryptable

  rails_admin do
    object_label_method do
      :email
    end

    edit do
      field :email
      field :password
    end

    export do
      fields :id, :email, :created_at, :updated_at
    end
  end
end
