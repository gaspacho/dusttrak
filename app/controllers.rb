Dusttrak::App.controllers  do
  get :index do
    render 'index/index'
  end

  get :all do
    @historical = Historical.mas_concentracion

    # TODO DRY!
    if not params[:desde].to_s.empty?
      @historical = @historical.desde(params[:desde])
    end

    if not params[:hasta].to_s.empty?
      @historical = @historical.hasta(params[:hasta])
    end

    render 'historical/all'
  end

  # Agrupar cada 15 minutos
  get :grouped do
    @historical = Historical.mas_concentracion.cada(Configuracion.grouped)

    if not params[:desde].to_s.empty?
      @historical = @historical.desde(params[:desde])
    end

    if not params[:hasta].to_s.empty?
      @historical = @historical.hasta(params[:hasta])
    end

    render 'historical/all'
  end

  get :threshold do
  end

  get :below do
  end
end
