namespace :shopping_engine do
  namespace :fill do
    desc 'Fill deliveries with default values'
    task deliveries: :environment do
      ShoppingEngine::Delivery.create(title:'Ukr Post', price:'2')
      ShoppingEngine::Delivery.create(title:'Nova Poshta', price:'10')
      ShoppingEngine::Delivery.create(title:'Supermen Post', price:'15')
    end

    desc 'Create coupon'
    task coupons: :environment do
      ShoppingEngine::Coupon.create(code:'SHOPPINGENGINE10', discount:'10')
    end
  end
end