require 'pry'
Dusttrak::App.controllers  do
  get :index do
    render 'index/index'
  end

  get :all do
    @historical = Historical.all

    render 'historical/all'
  end

  get :grouped do
  end

  get :threshold do
  end

  get :below do
  end
end
