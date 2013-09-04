Dusttrak::App.controllers  do
  get :index do
    render 'index/index'
  end

  get :all do
    @historical = filtrar(Historical.mas_concentracion).paginate(page: params[:page])

    render 'historical/all', :locals => {
      :bootstrap => BootstrapPagination::Sinatra
    }
  end

  # Agrupar cada 15 minutos
  get :grouped do
    @historical = filtrar(Historical.mas_concentracion_promedio.cada(Configuracion.grouped)).paginate(page: params[:page])

    render 'historical/all', :locals => {
      :bootstrap => BootstrapPagination::Sinatra
    }
  end

  get :above do
    @historical = filtrar(Historical.sobre_umbral).paginate(page: params[:page])

    render 'historical/all', :locals => {
      :bootstrap => BootstrapPagination::Sinatra
    }
  end

end

# TODO esto va en helpers
def filtrar(historical)
  historical = historical.desde(params[:desde]) if params[:desde].present?
  historical = historical.hasta(params[:hasta]) if params[:hasta].present?
  historical
end
