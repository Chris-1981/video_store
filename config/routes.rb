Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :customers, :movies, :purchases, :invoices
    end
  end
end
