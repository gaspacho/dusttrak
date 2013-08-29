Dusttrak::App.controllers  do
  get :index do
    render 'index/index'
  end

  get :all do
    @historical = Historical.mas_concentracion

    render 'historical/all'
  end

  # Agrupar cada 15 minutos
  get :grouped do
    @historical = Historical.mas_concentracion.cada(Configuracion.grouped)

    render 'historical/all'
  end

  get :threshold do
  end

  get :below do
  end
end
