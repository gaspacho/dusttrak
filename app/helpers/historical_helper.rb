# Helper methods defined here can be accessed in any controller or view in the application

Dusttrak::App.helpers do
  # Devolver todos los grd_id
  def grd
    Historical.select('grd_id, concat(grd_id, " (", count(*), ")") as name').group('grd_id')
  end

  def render_all(historical)
    if params[:xls].present?
      file = write_xls(@historical)

      if not file == false
        send_file file, type: 'application/vnd.ms-excel', filename: File.basename(file)
      end
    else
      @historical = @historical.paginate(page: params[:page])
      @grd = grd

      render 'historical/all', :locals => {
        :bootstrap => BootstrapPagination::Sinatra
      }
    end
  end

  # Escribe una planilla y devuelve el nombre de archivo
  def write_xls(historical)

    # TODO mover a filtro_to_s o algo asi para usar en todos lados
    name = "Dusttrak"
    name << " #{params[:grd_id]}" if params[:grd_id].present?
    name << " #{DateTime.parse(params[:desde]).strftime("%Y-%m-%d 00:00:00")}" if params[:desde].present?
    name << " - #{DateTime.parse(params[:hasta]).strftime("%Y-%m-%d 23:59:59")}" if params[:hasta].present?

    file = "public/files/#{Time.now} - #{name}.xls"

    begin
      archive = WriteExcel.new(file)
      sheet   = archive.add_worksheet

      sheet.write(0, 0, "Siafa")
      sheet.write(1, 0, "Dusttrak")

      sheet.write(3, 0, "Filtro: #{name}")

      header = historical[0].attributes.keys
      sheet.write(4, 0, header)

      matriz = historical.collect { |row| row.attributes.values }
      sheet.write(5, 0, matriz.transpose)

      archive.close
    rescue
      return false
    end

    # Devolver el nombre de archivo
    file

  end
end
