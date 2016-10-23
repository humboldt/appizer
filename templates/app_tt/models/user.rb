class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
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
