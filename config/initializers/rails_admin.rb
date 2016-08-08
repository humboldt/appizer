if Object.const_defined?("RailsAdmin")
RailsAdmin.config do |config|
  config.main_app_name = ["Dashboard", ""]

  config.browser_validations = false

  config.compact_show_view = false

  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  config.current_user_method(&:current_user)

  config.authorize_with do
    if user?
      authenticate_admin!
    else
      session[:referer] = request.url
      redirect_to main_app.new_user_session_path
    end
  end

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  config.audit_with :paper_trail, 'User', 'PaperTrail::Version'

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar true

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  config.included_models = Naming::Nice::Viewable.admin_models + Naming::Nice::Form.admin_models + %w[
    Admin::Nice::UniqueKey
    Admin::Setting
    Rich::RichFile
    Admin::User
    Admin::Account
    Admin::AccountUser
  ]

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new do
      except Naming::Nice::Viewable.admin_models + Naming::Nice::Form.admin_models + %w[
        Admin::Nice::UniqueKey
        Admin::Setting
        Rich::RichFile
      ]
    end
    export do
      except Naming::Nice::Viewable.admin_models + Naming::Nice::Form.admin_structure_models + %w[
        Admin::Nice::UniqueKey
      ]
    end
    bulk_delete do
      except Naming::Nice::Viewable.admin_models + Naming::Nice::Form.admin_structure_models + %w[
        Admin::Nice::UniqueKey
        Admin::Setting
      ]
    end
    show do
      except Naming::Nice::Viewable.admin_models + Naming::Nice::Form.admin_structure_models + %w[
        Admin::Nice::UniqueKey
      ]
    end
    edit do
      except %w[
        Admin::Nice::UniqueKey
        Admin::User
      ]
    end
    delete do
      except Naming::Nice::Form.admin_structure_models + %w[
        Admin::Nice::UniqueKey
        Admin::Setting
      ]
    end
    show_in_app

    ## With an audit adapter, you can add:
    history_index
    history_show
  end

  config.model 'Rich::RichFile' do
    navigation_label I18n.t('rich.file.navigation')
    label I18n.t('rich.file.one')
    label_plural I18n.t('rich.file.other')

    object_label_method do
      :name
    end

    configure :rich_file, :jcrop

    list do
      field :rich_file
      field :rich_file_file_name
      field :simplified_type
      field :owner_type
    end

    show do
      field :rich_file
      field :owner_type
    end

    edit do
      field :rich_file do
        fit_image true
      end
      field :owner_type, :enum do
        enum do
          ['nice']
        end
      end
    end
  end
end
end
