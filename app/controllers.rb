Dusttrak::App.controllers  do
  get :index do
    render 'index/index'
  end

  get :all do
    @historical = filtrar(Historical.mas_concentracion)
    render_all(@historical)
  end

  # Agrupar cada 15 minutos
  get :grouped do
    @historical = filtrar(Historical.mas_concentracion_promedio.cada(Configuracion.grouped))
    render_all(@historical)
  end

  get :above do
    @historical = filtrar(Historical.sobre_umbral)
    render_all(@historical)
  end
end
