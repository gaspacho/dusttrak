# Helper methods defined here can be accessed in any controller or view in the application

Dusttrak::App.helpers do
  # Devolver todos los grd_id
  def grd
    Historical.select('grd_id, concat(grd_id, " (", count(*), ")") as name').group('grd_id')
  end
end
