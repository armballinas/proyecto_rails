class EventosController < ApplicationController
  before_action :set_evento, only: [:show, :edit, :update, :destroy]
  before_action :usuario_iniciado, only: [:edit, :update]
  before_action :usuario_admin, only: [:destroy, :edit, :update]
  # GET /eventos
  # GET /eventos.json
  
  def index
    @eventos = Evento.all
  end

  # GET /eventos/1
  # GET /eventos/1.json
  def show
    @comentarios = ComentariosEvento.where("id_evento = ?",@evento.id)
    @imagenes = ImagenNombre.where("id_evento = ?",@evento.id)
  end

  # GET /eventos/new
  def new
    @evento = Evento.new
  end

  # GET /eventos/1/edit
  def edit
  end

  # POST /eventos
  # POST /eventos.json
  def create
    @evento = Evento.new(evento_params)

    respond_to do |format|
      if @evento.save
        format.html { redirect_to @evento, notice: 'El evento fue creado.' }
        format.json { render :show, status: :created, location: @evento }
      else
        format.html { render :new }
        format.json { render json: @evento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /eventos/1
  # PATCH/PUT /eventos/1.json
  def update
    respond_to do |format|
      if @evento.update(evento_params)
        format.html { redirect_to @evento, notice: 'El evento fue editado.' }
        format.json { render :show, status: :ok, location: @evento }
      else
        format.html { render :edit }
        format.json { render json: @evento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /eventos/1
  # DELETE /eventos/1.json
  def destroy
    @evento.destroy
    respond_to do |format|
      format.html { redirect_to eventos_url, notice: 'El evento fue destruido.' }
      format.json { head :no_content }
    end
  end

  def crear_comentario
    if request.post?
      comentarios = (params[:comentarios])
      id = (params[:id])
      ComentariosEvento.create(:comentario=>comentarios,:id_evento=>id)
      redirect_to "/eventos/"+id
    end
  end
    
  def eliminar_comentario
    ComentariosEvento.find(params[:id]).destroy
    redirect_to "/eventos/"+(params[:evento_id])
    #redirect_to "/home/index"
  end

  def subir_imagen
    if request.post?
     archivo = params[:upload]
     nombre_archivo = archivo['datafile'].original_filename  if  (archivo['datafile'] !='')
     id = (params[:id])
     tipo_archivo = nombre_archivo.split('.').last
     if ["png","jpg","jpeg"].include? tipo_archivo
      nombre_imagen = Time.now.to_i
      archivo = archivo['datafile'].read
      nombre_imagen_tipo = "#{nombre_imagen}." + tipo_archivo
      ImagenNombre.create(:nombre_imagen=>nombre_imagen_tipo, :id_evento => id)
      dir = (Rails.root.to_s)<<"/app/assets/images/eventos/"
      File.open(dir + nombre_imagen_tipo, "wb")  do |f|  
          f.write(archivo) 
      end
      redirect_to "/eventos/"+id
     else
      redirect_to "/eventos/"+id,notice: "el archivo no tiene el formato correcto"
     end
     
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_evento
      @evento = Evento.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def evento_params
      params.require(:evento).permit(:nombre, :descripcion, :fecha)
    end
end
