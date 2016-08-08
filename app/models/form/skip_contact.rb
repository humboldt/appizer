module Form
  class Contact < Nice::FormStatic::Object # < Static::Base
    include Admin::Hidden

    include Nice::FormStatic::Email
    include Nice::FormStatic::Attachment

    # has_attachments :letter, :resume
    has_collections :periods

    attribute :name, :string
    attribute :email, :string
    attribute :periods, :text

    with_options presence: true do
      validates :name
      validates :email, email: true
    end
  end
end
