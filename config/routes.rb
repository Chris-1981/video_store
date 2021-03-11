Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :customers, :movies, :orders, :invoices
    end
  end
end
