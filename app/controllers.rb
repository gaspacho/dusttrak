Dusttrak::App.controllers  do
  get :index do
    render 'index/index'
  end

  get :all do
    render_all filtrar(Historical)
  end

  # Agrupar cada 15 minutos
  get :grouped do
    render_all filtrar(Historical.mas_concentracion_promedio.cada(Configuracion.grouped))
  end

  get :above do
    render_all filtrar(Historical).select(&:sobre_umbral?)
  end
end
