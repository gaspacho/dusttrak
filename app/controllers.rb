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
# Agrupar cada 15 minutos
# http://forums.mysql.com/read.php?10,174757,176666#msg-176666
# Dividimos los minutos de cada hora por el valor de agrupación para
# poder parametrizarlo.  Se asume que la multiplicación por tres lleva
# esta relación con la respuesta original (cada 20 minutos).
    @every = Configuracion.where(:atributo => 'grouped').limit(1)
    @every = @every.last.valor.to_f
    @historical = Historical.group("(60/#{@every}) * hour(`timestamp`) + floor(minute(`timestamp`) / #{@every})")

    render 'historical/all'
  end

  get :threshold do
  end

  get :below do
  end
end
