require 'pry'
Dusttrak::App.controllers  do
  get :index do
  end

  get :all do
    @historical = Historical.all

    render 'historical/all'
  end
end
