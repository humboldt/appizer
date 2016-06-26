Rails.application.routes.draw do
  root to: "home#show", format: false, defaults: { locale: I18n.default_locale }
  localized do
    get 'home' => 'home#show', format: false
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  unless Rails.env.development?
    match '*not_found', via: :all, to: 'application#render_404'
  end
end
